from flask import Flask, render_template, request, redirect, url_for
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField
from wtforms.validators import InputRequired, Length
from flask_sqlalchemy import SQLAlchemy

#this is for classic mysql
# from flaskext.mysql import MySQL

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://scott:tiger@localhost/mydatabase'
database = SQLAlchemy(app)

# this is a secret_key used for cross web form validation
app.config['SECRET_KEY'] = 'secret_key_is_one_two_three'


# this is where i am defining all the user auth

# this is for classic mysql
# app.config['MySQL_HOST'] = 'localhost'
# app.config['MySQL_USER'] = 'root'
# app.config['MySQL_PASSWORD'] = ''
# app.config['MySQL_DB'] = 'flask_bracu_uploads'
# mysql = MySQL(app)

# login form
class LoginForm(FlaskForm):
    username = StringField('username', validators = [InputRequired("please enter your username")])
    password = PasswordField('password', validators = [InputRequired(), Length(min=6, max=20, message='* Must be atleast 6 characters')])


@app.route('/', methods = ['GET', 'POST'])
def index():
    form = LoginForm()

    # if valid form is submitted
    # check if user exists
    if form.validate_on_submit():

        # now lets check if uses exists
        # this is for classic mysql
        # con = mysql.connection.curose()
        # con.execute(''' SELECT student_id FROM student_info''');

        return redirect(url_for('home'));

    return render_template('login.html', form=form)

@app.route('/home')
def home():
    return render_template('home.html');

if __name__ == '__main__':
    app.run(debug = True)
