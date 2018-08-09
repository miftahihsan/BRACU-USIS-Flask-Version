from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField
from wtforms.validators import InputRequired, Length

# login form
class LoginForm(FlaskForm):
    username = StringField('username', validators = [InputRequired("please enter your username")])
    password = PasswordField('password', validators = [InputRequired(), Length(min=6, max=20, message='* Must be atleast 6 characters')])
