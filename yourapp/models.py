# THis is a file that i can not use for now due to mysqldb issues
from app import app, db

class user_info(db.Model):
    __tablename__ = 'student_info'
    student_id = db.Column(db.Integer, primary_key = True)
    student_name = db.Column(db.Unicode)
    student_password = db.Column(db.Unicode)
