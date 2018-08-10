from flask import Flask
# from flask.ext.mysqldb import MySQL
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config.from_pyfile('config.py')

mysql = MySQL(app)

from yourapp.views import *

if __name__ == '__main__':
    app.run()
