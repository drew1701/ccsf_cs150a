CREATE TABLE exam_result (
    student_id INT,
    course_id INT,
    exam_id INT,
    exam_grade INT NOT NULL,
    CONSTRAINT exam_result_pk PRIMARY KEY (student_id , course_id , exam_id),
    CONSTRAINT exam_result_fk1 FOREIGN KEY (student_id)
        REFERENCES student (student_id),
    CONSTRAINT exam_result_fk2 FOREIGN KEY (course_id)
        REFERENCES course (course_id),
    CONSTRAINT exam_result_fk3 FOREIGN KEY (exam_id)
        REFERENCES exam (exam_id)
);
CREATE TABLE student_att (
    student_id INT,
    session_id INT,
    num_work_days INT NOT NULL,
    num_days_off INT NOT NULL,
    exam_eligibility VARCHAR(20),
    CONSTRAINT student_attendance_pk PRIMARY KEY (student_id , session_id),
    CONSTRAINT student_attendance_fk1 FOREIGN KEY (student_id)
        REFERENCES student (student_id),
    CONSTRAINT student_attendance_fk2 FOREIGN KEY (session_id)
        REFERENCES academic_session (session_id)
);



CREATE TABLE student_course(
    student_id INT,
    course_id INT,
    grade VARCHAR(2) NOT NULL,
    CONSTRAINT student_course_pk PRIMARY KEY (student_id , course_id),
    CONSTRAINT student_course_fk1 FOREIGN KEY (student_id)
        REFERENCES student (student_id),
    CONSTRAINT student_course_fk2 FOREIGN KEY (course_id)
        REFERENCES course (course_id)
);


CREATE TABLE faculty_course (
    faculty_id INT,
    course_id INT,
    contact_hrs INT NOT NULL,
    CONSTRAINT faculty_course_pk PRIMARY KEY (faculty_id , course_id),
    CONSTRAINT faculty_course_fk1 FOREIGN KEY (faculty_id)
        REFERENCES faculty (faculty_id),
    CONSTRAINT faculty_course_fk2 FOREIGN KEY (course_id)
        REFERENCES course (course_id)
);