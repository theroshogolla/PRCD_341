from flask import Flask, jsonify, request
from flask_cors import CORS, cross_origin
from flask_mysqldb import MySQL
from datetime import datetime, timezone
from pytz import timezone as tz

from markupsafe import escape

app = Flask(__name__)
#handle CORS requests from a different address (localhost:3000)
CORS(app, resources={r"/*": {"origins": "http://localhost:3000"}})
mysql = MySQL(app)

#provide the database config to the backend to enable access
app.config['MYSQL_USER'] = 'admin'
app.config['MYSQL_PASSWORD'] = 'prcd'
app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_DB'] = 'PRCD'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

eastern = tz('US/Eastern')

#handle search queries
@app.route('/search/')
@cross_origin(origin='localhost')
def handle_search():
    #a different SQL query for each item table
    #partial matching is allowed via LIKE
    search_inventory = "SELECT * FROM Inventory WHERE type LIKE %s OR vendor LIKE %s"
    search_food = "SELECT * FROM Food WHERE category LIKE %s OR vendor LIKE %s OR accommodations LIKE %s"
    search_recipes = "SELECT name, webLink FROM Recipe WHERE name LIKE %s"

    #get the user's search query and split into keywords
    query = request.args.get('query')
    keywords = query.split()

    results = {'inventory': [], 'food': [], 'recipes': []}

    #use each keyword to query all character attributes
    #in Inventory, Food, and Recipe.
    for word in keywords:
        pattern = f'%{word}%'

        cur = mysql.connection.cursor()
        cur.execute(search_inventory, (pattern, pattern))
        out = cur.fetchall()
        results['inventory'].extend(out)

        cur = mysql.connection.cursor()
        cur.execute(search_food, (pattern, pattern, pattern))
        out = cur.fetchall()
        results['food'].extend(out)

        cur = mysql.connection.cursor()
        cur.execute(search_recipes, (pattern,))
        out = cur.fetchall()
        results['recipes'].extend(out)

    return results

#get all shifts on a particular date
@app.route('/shifts/')
@cross_origin(orgin='localhost')
def query_shifts():
    #convert string query to datetime object
    query_date = request.args.get('date')
    dt_obj = datetime.strptime(query_date, '%Y-%m-%d')

    cur = mysql.connection.cursor()
    cur.execute('SELECT shift_time FROM Shifts where shift_date = %s AND capacity > 0', (query_date,))
    results = cur.fetchall()
    #Since for some reason flask_mysqldb interprets the SQL TIME data type
    #as a duration and not an absolute time, create an absolute time and
    #localize to Eastern Time
    for result in results:
        shift_timedelta = result['shift_time']
        new_dt = (datetime.min + shift_timedelta).replace(year=dt_obj.year, month=dt_obj.month, day=dt_obj.day, tzinfo=None)
        result['shift_time'] = eastern.localize(new_dt)
    print(results)
    return jsonify(results)

#handle a shift signup by a volunteer
@app.route('/signup/', methods=['POST'])
@cross_origin(origin='localhost')
def populate_data():
    data = request.json

    #disaggregate the shift datetime into a date and localized time
    request_dt = data['shiftTime']
    request_datetime = datetime.strptime(request_dt, '%a, %d %b %Y %H:%M:%S %Z')
    request_datetime = request_datetime.replace(tzinfo=timezone.utc)
    local_request = request_datetime.astimezone(eastern)
    shift_date = local_request.strftime('%Y-%m-%d')
    shift_time = local_request.strftime('%H:%M')

    update_volunteer(data)
    update_signup(data['caseID'], shift_date, shift_time)
    update_shift(shift_date, shift_time)

    return data

def update_shift(shift_date, shift_time):
    cur = mysql.connection.cursor()
    cur.execute('SELECT capacity FROM SHIFTS WHERE shift_date = %s AND shift_time = %s', (shift_date, f'{shift_time}:00'))
    result = cur.fetchone()

    #when a shift is chosen by a volunteer, decrease its capacity by 1
    cur = mysql.connection.cursor()
    if result['capacity'] == 0:
        pass #TODO: Implement error handling
    else:
        cur.execute('UPDATE Shifts SET capacity = capacity - 1 WHERE shift_date = %s AND shift_time = %s', (shift_date, f'{shift_time}:00'))
        mysql.connection.commit()

#add volunteer info
def update_volunteer(volunteer_info):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM Volunteers WHERE case_ID = %s AND name = %s', (volunteer_info['caseID'], volunteer_info['name']))

    cur1 = mysql.connection.cursor()
    if cur.rowcount == 0: #new volunteer?
        if volunteer_info['email'] == '' and volunteer_info['cell'] == '':
            cur1.execute('INSERT INTO Volunteers VALUES(%s, %s, NULL, NULL, %s, 1)', (volunteer_info['caseID'], volunteer_info['name'], volunteer_info['type']))
            mysql.connection.commit()
        elif volunteer_info['email'] == '':
            cur1.execute('INSERT INTO Volunteers VALUES(%s, %s, %s, NULL, %s, 1)', (volunteer_info['caseID'], volunteer_info['name'], volunteer_info['cell'], volunteer_info['type']))
            mysql.connection.commit()
        elif volunteer_info['cell'] == '':
            cur1.execute('INSERT INTO Volunteers VALUES(%s, %s, NULL, %s, %s, 1)', (volunteer_info['caseID'], volunteer_info['name'], volunteer_info['email'], volunteer_info['type']))
            mysql.connection.commit()
        else:
            cur1.execute('INSERT INTO Volunteers VALUES(%s, %s, %s, %s, %s, 1)', (volunteer_info['caseID'], volunteer_info['name'], volunteer_info['cell'], volunteer_info['email'], volunteer_info['type']))
            mysql.connection.commit()
    else: #if we already have the volunteer's info, just update the hours
        cur1.execute('UPDATE Volunteers SET hours = hours + 1 WHERE case_ID = %s AND name = %s', (volunteer_info['caseID'], volunteer_info['name']))
        mysql.connection.commit()

#update the SignUp table to maintain the relationship
#between Volunteers and Shifts
def update_signup(case_id, shift_date, shift_time):
    cur = mysql.connection.cursor()
    cur.execute('INSERT INTO SignUp VALUES(%s, %s, %s)', (case_id, shift_date, shift_time))
    mysql.connection.commit()
