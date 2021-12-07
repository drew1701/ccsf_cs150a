/*  Project_Part1.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    

CREATE DATABASE IF NOT EXISTS university;
USE university;


/* Drop if pre-existing tables */

DROP TABLE IF EXISTS faculty_login;
DROP TABLE IF EXISTS faculty_course;
DROP TABLE IF EXISTS student_course;
DROP TABLE IF EXISTS student_att;
DROP TABLE IF EXISTS exam_result;
DROP TABLE IF EXISTS exam;
DROP TABLE IF EXISTS exam_type;
DROP TABLE IF EXISTS faculty;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS parent_info;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS academic_session;


/* Create university tables & named constraints */

CREATE TABLE academic_session(
    session_id INT NOT NULL,
    session_name VARCHAR(30) NOT NULL,
    CONSTRAINT academic_session_pk PRIMARY KEY (session_id),
    CONSTRAINT academic_session_session_name_uk UNIQUE (session_name)
) ENGINE = INNODB;

CREATE TABLE department(
    dept_id INT NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    head VARCHAR(50) NOT NULL,
    CONSTRAINT department_pk PRIMARY KEY (dept_id),
    CONSTRAINT department_dept_name_uk UNIQUE (dept_name)
) ENGINE = INNODB;

CREATE TABLE parent_info(
    parent_id INT NOT NULL,
    parent1_fn VARCHAR(30) NOT NULL,
    parent1_ln VARCHAR(50) NOT NULL,
    parent2_fn VARCHAR(30),
    parent2_ln VARCHAR(50),
    CONSTRAINT parent_info_pk PRIMARY KEY (parent_id)
) ENGINE = INNODB;

CREATE TABLE student(
    student_id INT NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    reg_year DATE NOT NULL,
    email VARCHAR(60) NOT NULL,
    parent_id INT NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY (student_id),
    CONSTRAINT student_parent_info_parent_id_fk
        FOREIGN KEY (parent_id) REFERENCES parent_info (parent_id),
    CONSTRAINT student_email_uk UNIQUE (email)
) ENGINE = INNODB;

CREATE TABLE course(
    course_id INT NOT NULL,
    course_name VARCHAR(50) NOT NULL,
    session_id INT NOT NULL,
    dept_id INT NOT NULL,
    logon_id VARCHAR(20),
    password VARCHAR(30),
    building VARCHAR(30),
    room VARCHAR(10),
    date_time VARCHAR(20),
    CONSTRAINT course_pk PRIMARY KEY (course_id),
    CONSTRAINT course_academic_session_session_id_fk
        FOREIGN KEY (session_id) REFERENCES academic_session (session_id),
    CONSTRAINT course_department_dept_id_fk
        FOREIGN KEY (dept_id) REFERENCES department (dept_id),
    CONSTRAINT course_course_name_uk UNIQUE (course_name)
) ENGINE = INNODB;

CREATE TABLE faculty(
    faculty_id INT NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    faculty_email VARCHAR(60) NOT NULL,
    salary INT,
    insurance VARCHAR(50),
    hourly_rate INT,
    dept_id INT NOT NULL,
    CONSTRAINT faculty_pk PRIMARY KEY (faculty_id),
    CONSTRAINT faculty_department_dept_id_fk
        FOREIGN KEY (dept_id) REFERENCES department (dept_id),
    CONSTRAINT faculty_faculty_email_uk UNIQUE (faculty_email)
) ENGINE = INNODB;

CREATE TABLE exam_type(
    exam_type VARCHAR(12) NOT NULL,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(50) NOT NULL,
    CONSTRAINT exam_type_pk PRIMARY KEY (exam_type)
) ENGINE = INNODB;

CREATE TABLE exam(
    exam_id INT NOT NULL,
    start_date DATE NOT NULL,
    exam_type VARCHAR(12) NOT NULL,
    course_id INT NOT NULL,
    CONSTRAINT exam_pk PRIMARY KEY (exam_id),
    CONSTRAINT exam_exam_type_exam_type_fk
        FOREIGN KEY (exam_type) REFERENCES exam_type (exam_type),
    CONSTRAINT exam_course_course_id_fk
        FOREIGN KEY (course_id) REFERENCES course (course_id)
) ENGINE = INNODB;

CREATE TABLE exam_result(
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    exam_id INT NOT NULL,
    exam_grade INT,
    CONSTRAINT exam_result_pk PRIMARY KEY (student_id, course_id, exam_id)
) ENGINE = INNODB;

CREATE TABLE student_att(
    student_id INT NOT NULL,
    session_id INT NOT NULL,
    num_work_days INT,
    num_days_off INT,
    exam_eligibility CHAR(1) NOT NULL,
    CONSTRAINT student_att_pk PRIMARY KEY (student_id, session_id)
) ENGINE = INNODB;

CREATE TABLE student_course(
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade CHAR(1),
    CONSTRAINT student_course_pk PRIMARY KEY (student_id, course_id)
) ENGINE = INNODB;

CREATE TABLE faculty_course(
    faculty_id INT NOT NULL,
    course_id INT NOT NULL,
    contact_hrs VARCHAR(2) NOT NULL,
    CONSTRAINT faculty_course_pk PRIMARY KEY (faculty_id, course_id)
) ENGINE = INNODB;

CREATE TABLE faculty_login(
    faculty_id INT NOT NULL,
    login_date_time DATETIME DEFAULT CURRENT_TIMESTAMP(),
    CONSTRAINT faculty_login_pk PRIMARY KEY (faculty_id, login_date_time)
) ENGINE = INNODB;
