from flask import render_template, request, redirect, url_for, session, request, g
from app import app
from yourapp.sqlQueries import QueryClass
from yourapp.forms import LoginForm
from yourapp.forms import AddTeacherForm
# this impor should be moved to sql queries
from yourapp.models import student_info


# this takes you to login page
@app.route('/user_login', methods = ['GET', 'POST'])
def loginPage():
    form = LoginForm()
    if form.validate_on_submit():

        return redirect(url_for('subscribedRoom'))

    return render_template('login.html', form=form)


# this takes you to subscribedPage page
@app.route('/subscribedRoom')
def subscribedRoom():
    return render_template('subscribedRoom.html');




# these are the admin routes not needed for out project
# but only needed for demonstration purposes
@app.route('/adminPanel')
def adminPanel():
    return render_template('adminScripts/adminPanel.html');

# adding the teacher route here
@app.route('/addTeacher', methods = ['GET', 'POST'])
def addTeacher():
    form = AddTeacherForm()

    if form.validate_on_submit():

        QueryClass.AddTeacher()

        return form.teacher_name.data

    return render_template('adminScripts/addTeacher.html', form = form)
