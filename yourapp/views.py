from flask import render_template, request, redirect, url_for, session, request, g
from app import app
from yourapp.sqlQueries import QueryClass
from yourapp.forms import LoginForm , AddTeacherForm, AddStudentForm
# this impor should be moved to sql queries
# from yourapp.models import student_info

# ================================================================User Side========================================================================

# DECLEARING THE QUERY here
query = QueryClass()

# this takes you to login page
@app.route('/user_login', methods = ['GET', 'POST'])
def user_login():

    form = LoginForm()
    if form.validate_on_submit():

        user_exists, user_identity, user_id = query.UserLogin(form.username.data, form.password.data)

        if user_exists:

            session['user_Identity'] = user_identity
            session['user_id'] = user_id

            if user_identity == "Student":
                return redirect(url_for('subscribedRoom'))
            else:
                return redirect(url_for('user_login'))

    return render_template('login.html', form=form)

# USER LOGOUT
@app.route('/logOut')
def logOut():
    session.clear()
    return redirect(url_for('user_login'))

# this takes you to subscribedPage page
@app.route('/subscribedRoom')
def subscribedRoom():

    if g.user_Identity and g.user_Id:

        room_details = query.FetchSubscribedRoom()

        return render_template('subscribedRoom.html', room_details = room_details);
    else:
        return redirect(url_for('user_login'))

@app.route('/classRoom/<string:id>/<string:code>/<string:details>', methods = ['GET'])
def classRoom(id, code, details):

    if g.user_Identity and g.user_Id:

        return render_template('classRoom.html');
    else:
        return redirect(url_for('user_login'))

@app.before_request
def before_request():
    g.user_Identity = None
    g.user_Id = None
    if "user_Identity" and 'user_id' in session:
        g.user_Identity = session['user_Identity']
        g.user_Id = session['user_id']


# ================================================================Admin Side========================================================================

# these are the admin routes not needed for out project
# but only needed for demonstration purposes
@app.route('/adminPanel')
def adminPanel():
    return render_template('adminScripts/adminPanel.html');

# adding the student route here
@app.route('/addStudent', methods = ['GET', 'POST'])
def addStudent():

    form = AddStudentForm()

    if form.validate_on_submit():

        # query = QueryClass()

        query.AddStudent(form.student_name.data, form.student_email.data, form.student_password.data,
        form.student_phone.data, form.student_department.data, form.student_sem.data)

        return redirect(url_for('user_login'))

    return render_template('adminScripts/addStudent.html', form = form)

# adding the teacher route here
@app.route('/addTeacher', methods = ['GET', 'POST'])
def addTeacher():
    form = AddTeacherForm()

    if form.validate_on_submit():
        # query = QueryClass()

        query.AddTeacher(form.teacher_name.data, form.teacher_consultation.data, form.teacher_email.data,
        form.teacher_password.data, form.teacher_department.data, form.teacher_phone.data,
        form.teacher_room.data)

        return redirect(url_for('user_login'))

    return render_template('adminScripts/addTeacher.html', form = form)
