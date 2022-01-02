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
-- making test case
-- INSERT INTO exam_result VALUES(720,199,500,42);

SELECT c.course_id, course_name, exam_grade, exam_id
FROM course c JOIN exam_result er
    ON c.course_id = er.course_id
WHERE c.course_id IN (190, 191, 192)
ORDER BY c.course_id;

-- Q 7
SELECT student_id, exam_grade, er.course_id, course_name
FROM exam_result er LEFT JOIN course c
    ON er.course_id = c.course_id
ORDER BY student_id, er.course_id;
    
-- Q 8
SELECT exam_id, exam_grade,
       CONCAT_WS(' ', first_name, last_name) AS 'Student Name'
FROM exam_result er JOIN student s
    ON er.student_id = s.student_id
ORDER BY exam_id, exam_grade DESC;

-- Q 9
SELECT student_id, num_work_days, exam_eligibility
FROM student_att
WHERE exam_eligibility = 'y'
ORDER BY student_id;

-- Q10
SELECT student_id, course_id, exam_id,
       exam_grade - 5 AS 'corrected grade'
FROM exam_result;


