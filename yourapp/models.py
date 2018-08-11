# THis is a file that i can not use for now due to mysqldb issues
from app import app, db

class student_info(db.Model):
    __tablename__ = 'student_info'
    student_id = db.Column(db.Integer, primary_key = True)
    student_name = db.Column(db.Unicode)
    student_email = db.Column(db.Unicode)
    student_password = db.Column(db.Unicode)
    student_phone_no = db.Column(db.Integer)
    student_profile_pic = db.Column(db.Unicode)
    student_dpt = db.Column(db.Unicode)
    student_sem = db.Column(db.Integer)


class teacher_info(db.Model):
    __tablename__ = 'teacher_info'
    teacher_id = db.Column(db.Integer, primary_key = True)
    teacher_name = db.Column(db.Unicode)
    teacher_password = db.Column(db.Unicode)
    teacher_department = db.Column(db.Unicode)
    teacher_phone = db.Column(db.Integer)
    teacher_room = db.Column(db.Unicode)
    teacher_consultation = db.Column(db.Unicode)
    teacher_profile_pic = db.Column(db.Unicode)
