from flask import render_template, request, redirect, url_for, session, request, g
from app import app
from yourapp.sqlQueries import QueryClass, generate_password_hash, check_password_hash
from yourapp.forms import LoginForm , AddTeacherForm, AddStudentForm
from app import socketio, emit

# ================================================================User Side========================================================================

# DECLEARING THE QUERY here
query = QueryClass()

# this takes you to login page
@app.route('/user_login', methods = ['GET', 'POST'])
def user_login():

    if g.user_Identity and g.user_Id:
        return redirect(url_for('subscribedRoom'))

    form = LoginForm()
    if form.validate_on_submit():

        user_exists, user_identity, user_id = query.UserLogin(form.username.data, form.password.data)

        if user_exists:

            session['user_Identity'] = user_identity
            session['user_id'] = user_id

            if user_identity == "Student":
                return redirect(url_for('subscribedRoom'))
            else:
                return redirect(url_for('teacherChannels'))

    return render_template('login.html', form=form)


@app.route("/teacherChannels")
def teacherChannels():

    return render_template('teacherChannels.html')

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

        # hashing the teacers_id but taking the pbkdf2:sha256: out of it
        # to prevent the user from knowing knoing the algorithm
        # teacher_hashed_id = [None] * len(room_details)

        return render_template('subscribedRoom.html', room_details = room_details);

    else:

        return redirect(url_for('user_login'))

@app.route('/classRoom/<string:teacher_id>/<int:section>/<string:code>/<string:details>', methods = ['GET'])
def classRoom(teacher_id, section, code, details):

    # Checking if the sessions are still up
    if g.user_Identity and g.user_Id:

        # return str(session["user_id"])
        # checking if user wants to access other classrooms
        # buy chaning the url
        # may be this is not even needed
        # check later
        is_authorized, availability = query.CheckAuthorization(teacher_id, section, code, details)

        # if authorized only then show classRoom
        if is_authorized:

            session['channelOwnerId'] = teacher_id;

            teacher_name = query.TeacherName(teacher_id)

            return render_template('classRoom.html', teacher_id = teacher_id, section = section,
             code = code, details = details, teacher_name = teacher_name, availability = availability);

        # else return him back to his subscribed room
        return redirect(url_for('subscribedRoom'))

    else:

        # if session has been cleared logout user
        return redirect(url_for('user_login'))

@app.before_request
def before_request():
    g.user_Identity = None
    g.user_Id = None
    if "user_Identity" and 'user_id' in session:
        g.user_Identity = session['user_Identity']
        g.user_Id = session['user_id']

# ================================================================Socket side code========================================================================

@socketio.on('teacherLogOutRequest')
def teacherLogOutRequest(loged_out, teacher_id):

    query.TeacherAvailability(loged_out, teacher_id)

    emit('ShowAvailability', {'availability' : 0, 'teacherID' : teacher_id}, broadcast = True)

@socketio.on('availabilityRequest')
def handleAvailability(available, teacher_id):

    query.TeacherAvailability(available, teacher_id)

    # print("hello")

    emit('ShowAvailability', {'availability' : available, 'teacherID' : teacher_id}, broadcast = True)

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

        query.AddStudent(form.student_name.data, form.student_email.data, form.student_password.data,
        form.student_phone.data, form.student_department.data, form.student_sem.data)

        return redirect(url_for('user_login'))

    return render_template('adminScripts/addStudent.html', form = form)

# adding the teacher route here
@app.route('/addTeacher', methods = ['GET', 'POST'])
def addTeacher():
    form = AddTeacherForm()

    if form.validate_on_submit():

        query.AddTeacher(form.teacher_name.data, form.teacher_consultation.data, form.teacher_email.data,
        form.teacher_password.data, form.teacher_department.data, form.teacher_phone.data,
        form.teacher_room.data)

        return redirect(url_for('user_login'))

    return render_template('adminScripts/addTeacher.html', form = form)
