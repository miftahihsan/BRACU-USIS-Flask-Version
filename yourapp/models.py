from app import db

class student_info(db.Model):

    __tablename__ = 'flask_bracu_uploads'
    student_id = db.Column(db.Integer, primary_key = True)
    student_name = db.Column(db.Unicode)
    student_password = db.Column(db.Unicode)
