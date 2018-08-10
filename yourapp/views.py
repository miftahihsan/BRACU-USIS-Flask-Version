from flask import render_template, request, redirect, url_for
from app import app
from yourapp.forms import LoginForm
from yourapp.models import user_info

@app.route('/', methods = ['GET', 'POST'])
def index():
    form = LoginForm()
    if form.validate_on_submit():

        # first_student = user_info.query.first()
        # return first_student.student_name
        # return form.username.data
        return redirect('home')

    return render_template('login.html', form=form)

@app.route('/home')
def home():
    return render_template('home.html');
