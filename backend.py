from flask import Flask, jsonify, request
from flask_cors import CORS, cross_origin
from flask_mysqldb import MySQL
from datetime import datetime
from pytz import timezone

from markupsafe import escape

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "http://localhost:3000"}})
mysql = MySQL(app)

app.config['MYSQL_USER'] = 'admin'
app.config['MYSQL_PASSWORD'] = 'prcd'
app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_DB'] = 'PRCD'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

eastern = timezone('US/Eastern')

@app.route('/search/')
@cross_origin(origin='localhost')
def handle_search():
    search_inventory = "SELECT * FROM Inventory WHERE type LIKE %s OR vendor LIKE %s"
    search_food = "SELECT * FROM Food WHERE category LIKE %s OR vendor LIKE %s OR accommodations LIKE %s"
    search_recipes = "SELECT name, webLink FROM Recipe WHERE name LIKE %s"

    query = request.args.get('query')
    keywords = query.split()

    results = {'inventory': [], 'food': [], 'recipes': []}

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

@app.route('/shifts/')
@cross_origin(orgin='localhost')
def query_shifts():
    query_date = request.args.get('date')
    print(query_date)
    dt_obj = datetime.strptime(query_date, '%Y-%m-%d')
    cur = mysql.connection.cursor()
    cur.execute('SELECT shift_time FROM Shifts where shift_date = %s AND capacity > 0', (query_date,))
    results = cur.fetchall()
    for result in results:
        shift_timedelta = result['shift_time']
        new_dt = (datetime.min + shift_timedelta).replace(year=dt_obj.year, month=dt_obj.month, day=dt_obj.day, tzinfo=None)
        result['shift_time'] = eastern.localize(new_dt)
    print(results)
    return jsonify(results)

@app.route('/signup/', methods=['POST'])
@cross_origin(origin='localhost')
def populate_data():
    data = request.json
    print(data)
    return data
