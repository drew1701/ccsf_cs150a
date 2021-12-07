-- Q 1
SELECT * FROM academic_session;
SELECT * FROM department;
SELECT * FROM parent_info;
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM faculty;
SELECT * FROM exam_type;
SELECT * FROM exam;
SELECT * FROM exam_result;
SELECT * FROM student_att;
SELECT * FROM student_course;
SELECT * FROM faculty_course;
SELECT * FROM faculty_login;

-- Q 2
SELECT course_id, course_name, dept_name
FROM course JOIN department
    ON course.dept_id = department.dept_id
ORDER BY course_id;

-- Q 3
SELECT course_name, session_name
FROM course JOIN academic_session
    ON course.session_id = academic_session.session_id
WHERE session_name = 'fall session';

-- Q 4
SELECT c.course_name, sc.student_id, d.dept_name
FROM course c
	JOIN student_course sc ON c.course_id = sc.course_id
    JOIN department d ON c.dept_id = d.dept_id
ORDER BY c.course_id;

-- Q 5
SELECT c.course_name, sc.student_id, d.dept_name
FROM course c
    JOIN student_course sc ON c.course_id = sc.course_id
    JOIN department d ON c.dept_id = d.dept_id
WHERE c.dept_id = 20
ORDER BY c.course_id;

-- Q 6
SELECT course_id, course_name, exam_grade, exam_id
FROM course c JOIN exam_grade eg
    ON c.course_id = eg.course_id
WHERE c.course_id IN (190, 191, 192);
