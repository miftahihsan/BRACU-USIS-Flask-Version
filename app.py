from flask import Flask, render_template
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField
from wtforms.validators import InputRequired, Length

app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret_key_is_one_two_three'

class LoginForm(FlaskForm):
    username = StringField('username', validators = [InputRequired("please enter your username")])
    password = PasswordField('password', validators = [InputRequired(), Length(min=6, max=20, message='Must be atleast 6 characters')])


@app.route('/', methods = ['GET', 'POST'])
def index():
    form = LoginForm()
    return render_template('login.html', form=form)

@app.route('/home')
def home():
    return render_template('home.html');

if __name__ == '__main__':
    app.run(debug = True)
