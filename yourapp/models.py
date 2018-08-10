# THis is a file that i can not use for now due to mysqldb issues
from app import mysql, app

class login():

    def userLogin():
        cur = mysql.connection.cursor()
        cur.execute('''SELECT * FROM student_info''')
        rv = cur.fetchall()
        return str(rv)
