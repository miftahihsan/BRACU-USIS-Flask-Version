from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SelectField, IntegerField
from wtforms.validators import InputRequired, Length, NumberRange
from wtforms.fields.html5 import EmailField

# login form
class LoginForm(FlaskForm):
    username = StringField('username', validators = [InputRequired("please enter your username")])
    password = PasswordField('password', validators = [InputRequired(), Length(min=6, max=20, message='* Must be atleast 6 characters!')])

# Admin panel forms not needed for the project
class AddTeacherForm(FlaskForm):
    list_of_departments = [('', 'Department'), ('CSE','CSE'),
                                 ('EEE', 'EEE'), ('ECO', 'ECO'),
                                  ('LAW', 'LAW'), ('BBS', 'BBS')]
    teacher_name = StringField('name', validators = [InputRequired()])
    teacher_consultation = StringField('consultaion', validators = [InputRequired()])
    teacher_email = EmailField('email', validators = [InputRequired()])
    teacher_password = PasswordField('password', validators = [InputRequired(), Length(min = 6, max = 50, message = "* Must be atleast 6 characters!")])
    teacher_department = SelectField(u'department', choices = list_of_departments ,validators = [InputRequired()])
    teacher_phone = StringField('phone', validators = [InputRequired(), Length(min = 7, max = 11, message = "* Must be 7 or 11 characters long!")])
    teacher_room = StringField('room', validators = [InputRequired()])

class AddStudentForm(FlaskForm):
    list_of_departments = [('', 'Department'), ('CSE','CSE'),
                                 ('CS', 'CS'), ('EEE', 'EEE'),
                                 ('ECE', 'ECE'), ('ECO', 'ECO'),
                                  ('LAW', 'LAW'), ('BBS', 'BBS')]

    student_name = StringField('name', validators = [InputRequired()])
    student_email = EmailField('email', validators = [InputRequired()])
    student_password = PasswordField('password', validators = [InputRequired(), Length(min = 6, max = 50, message = "* Must be atleast 6 characters!")])
    student_phone = StringField('phone', validators = [InputRequired(), Length(min = 7, max = 11, message = "* Must be 7 or 11 characters long!")])
    student_department = SelectField(u'department', choices = list_of_departments ,validators = [InputRequired()])
    student_sem = IntegerField('consultaion', validators = [InputRequired()])
