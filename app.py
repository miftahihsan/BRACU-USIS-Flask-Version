from flask import Flask, session, request, g
from flask_sqlalchemy import SQLAlchemy
from flask_socketio import SocketIO, emit
# from flask.ext.mysqldb import MySQL
# from flask_mysqldb import MySQL

app = Flask(__name__)
socketio = SocketIO(app)

app.config.from_pyfile('config.py')

db = SQLAlchemy(app)

# mysql = MySQL(app)

from yourapp.views import *

if __name__ == '__main__':
    # app.run()
    socketio.run(app)
