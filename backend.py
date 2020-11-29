from flask import Flask
from flask_cors import CORS, cross_origin

from markupsafe import escape

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "http://localhost:3000"}})


@app.route('/shifts/<date>')
@cross_origin(orgin='localhost')
def query_shifts(date):
    return escape(date)
