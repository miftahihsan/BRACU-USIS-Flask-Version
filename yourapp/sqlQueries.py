from app import db
import re
from yourapp.views import session
from werkzeug.security import generate_password_hash, check_password_hash
from yourapp.models import *
# from yourapp.models import teacher_availability

class QueryClass:

    # def UserLogin(self, username, password):
    def UserLogin(self, user_name, password):

        # Simple regex for checking if string has an @
        # if needed a real mail validator can be used
        is_email = re.match(r"[^@]+@[^@]+\.[^@]+", user_name)

        if is_email:

            Teacher_details = teacher_info.query.filter_by(teacher_email = user_name).first()

            if Teacher_details:

                password_matched = check_password_hash(Teacher_details.teacher_password, password)

                if password_matched:

                    return True, "Teacher", Teacher_details.teacher_id

                else:

                    return False, "None", "None"
            else:

                return False, 'None', 'None'

        else:

            Student_details = student_info.query.filter_by(student_id = user_name).first()

            if Student_details:

                password_matched = check_password_hash(Student_details.student_password, password)

                if password_matched:

                    return True, "Student", Student_details.student_id

                else:

                    return False, "None", "None"

            else:

                return False, 'None', 'None'


    def TeacherName(self, teacher_id):

        teacher_name = teacher_info.query.filter_by(teacher_id = teacher_id).first()

        return teacher_name.teacher_name

    # returns all the reoom details
    def FetchSubscribedRoom(self):

         subscribed_room_details = db.session.query(student_info, belongs_to, class_room, course, teacher_info, course_info).join(belongs_to).filter(belongs_to.student_id == session["user_id"]).join(class_room).filter(class_room.class_room_id == belongs_to.class_room_id).join(course).filter(course.class_room_id == class_room.class_room_id).join(teacher_info).filter(course.teacher_id == teacher_info.teacher_id).join(course_info).filter(course_info.course_code == course.course_code).all()

         return subscribed_room_details


    # may be this is not needed after all
    # check back later
    def CheckAuthorization(self,teacher_id, course_section, course_code):
        __tablename__ = 'HAH'

        returnedValue = db.session.query(teacher_info, course, class_room, belongs_to, student_info).join(course).filter(teacher_info.teacher_id == teacher_id).join(class_room).filter(class_room.class_room_id == course.class_room_id).join(belongs_to).filter(belongs_to.class_room_id == class_room.class_room_id).join(student_info).filter(student_info.student_id == session["user_id"]).first()

        if returnedValue:
            if str(returnedValue.teacher_info.teacher_id) == teacher_id and str(returnedValue.course.course_section) ==course_section and str(returnedValue.course.course_section) == course_code:
                return True
            return returnedValue.course.teacher_id
        else:
            return False

        # return False


    # ===================================================================ADMIN SIDE======================================================================

    # Admin Scripts
    def AddTeacher(self, teacher_name, teacher_consultation, teacher_email,
     teacher_password, teacher_department, teacher_phone,
     teacher_room):

        __tablename__ = 'teacher_info'
        hashedPassword = generate_password_hash(teacher_password)

        # sqlCommand = teacher_info()

        add_to_teachers_info = teacher_info(teacher_name = teacher_name, teacher_password = hashedPassword, teacher_department = teacher_department,
        teacher_phone = teacher_phone, teacher_room = teacher_room, teacher_consultation = teacher_consultation,
        teacher_profile_pic = 'default.jpg', teacher_email = teacher_email)

        db.session.add(add_to_teachers_info)
        db.session.commit()

        # now add teachersAvailability to the added teacher
        registered_teacher = teacher_info.query.filter_by(teacher_email = teacher_email).first()

        self.AddTeacherAvailability(registered_teacher.teacher_id, '0')


    def AddTeacherAvailability(self, teacher_id, availability):
        __tablename__ = 'teacher_availability'

        add_to_teachers_availability = teacher_availability(teacher_id, availability)

        db.session.add(add_to_teachers_availability)
        db.session.commit()


    def AddStudent(self, student_name, student_email, student_password,
    student_phone, student_dpt, student_sem):

        __tablename__ = 'student_info'
        hashedPassword = generate_password_hash(student_password)

        add_to_student_info = student_info(student_name = student_name, student_email = student_email, student_password = hashedPassword,
        student_phone = student_phone, student_profile_pic = 'student_default.jpg', student_department = student_dpt,
        student_sem = student_sem)

        db.session.add(add_to_student_info)
        db.session.commit()
