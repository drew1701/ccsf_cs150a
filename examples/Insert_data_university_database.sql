/* ****************************************************************************/
/*	                                                				          */
/*														                      */
/*	    The university Database                     			              */
/*																		      */
/*	                                            			                  */
/* ****************************************************************************/

/*  Insert data into the tables */

USE university;

INSERT INTO     academic_session VALUES (100, 'spring session');
INSERT INTO     academic_session VALUES (200, 'fall session');
INSERT INTO     academic_session VALUES (300, 'summer session');

INSERT INTO     department VALUES(10, 'accounting', 'mark smith');
INSERT INTO     department VALUES(20, 'biology', 'dave gold');
INSERT INTO     department VALUES(30, 'computer science', 'linda brown');
INSERT INTO     department VALUES(40, 'literature', 'anita taylor');



INSERT INTO     parent_info VALUES(600,'neil', 'smith','doris', 'smith');
INSERT INTO     parent_info VALUES(610,'william', 'ben','nita', 'ben');
INSERT INTO     parent_info VALUES(620,'sean', 'taylor','rhea', 'taylor');
INSERT INTO     parent_info VALUES(630,'dave', 'carmen','cathy', 'carmen');
INSERT INTO     parent_info VALUES(640,'john', 'audry','jane', 'audry');

INSERT INTO     student VALUES(720, 'jack','smith', '2012-01-12','jsmith@school.edu', 600);
INSERT INTO     student VALUES(730, 'noah', 'audry', '2012-01-01','naudry@school.edu', 640);
INSERT INTO     student VALUES(740, 'rhonda','taylor', '2012-09-01','rtaylor@school.edu', 620);
INSERT INTO     student VALUES(750, 'robert','ben', '2012-03-01','rben@school.edu', 610);
INSERT INTO     student VALUES(760, 'jeanne','ben', '2012-03-01','jben@school.edu', 610);
INSERT INTO     student VALUES(770, 'mills','carmen', '2013-04-01','mcarmen@school.edu', 630);

INSERT INTO     course VALUES (190, 'principles of accounting', 100, 10,NULL,NULL,'building a','101','mwf 12-1');
INSERT INTO     course VALUES (191, 'introduction to business law', 100, 10,NULL,NULL,'building b','201','thur 2-4');
INSERT INTO     course VALUES (192, 'cost accounting', 100, 10,NULL,NULL,'building c','301','tues 5-7');
INSERT INTO     course VALUES (193, 'strategic tax planning for business', 100, 10,'tax123','password',NULL,NULL,NULL);
INSERT INTO     course VALUES (194, 'general biology', 200, 20,'bio123','password',NULL,NULL,NULL);
INSERT INTO     course VALUES (195, 'cell biology', 200, 20,NULL,NULL,'building d','401','mwf 9-10');

INSERT INTO     faculty VALUES (800, 'jill', 'miller','jmill@school.edu',10000,'health',NULL,20);
INSERT INTO     faculty VALUES (810, 'james', 'borg','jborg@school.edu',30000,'health,dental',NULL,10);
INSERT INTO     faculty VALUES (820, 'lynn', 'brown','lbrown@school.edu',NULL,NULL,50,30);
INSERT INTO     faculty VALUES (830, 'arthur', 'smith','asmith@school.edu',NULL,NULL,40,10);
INSERT INTO     faculty VALUES (840, 'sally', 'jones','sjones@school.edu',50000,'health,dental,vision',NULL,40);

INSERT INTO     exam_type VALUES('mce','multiple choice exams','choose more than one answer');
INSERT INTO     exam_type VALUES('tf','true and false exams','choose either true or false');
INSERT INTO     exam_type VALUES('fib','fill in the blanks exams','type in the correct answer');
INSERT INTO     exam_type VALUES('ess','essay exams','write paragraphs');
INSERT INTO     exam_type VALUES('sa','short answer exams','write short answers');

INSERT INTO     exam VALUES(500, '2013-09-12','mce',190);
INSERT INTO     exam VALUES(510, '2013-09-15','sa', 191);
INSERT INTO     exam VALUES(520, '2013-09-18','fib', 192);
INSERT INTO     exam VALUES(530, '2014-03-21','ess', 193);
INSERT INTO     exam VALUES(540, '2014-04-02','tf', 194);

INSERT INTO     exam_result VALUES(720,190,500,91);
INSERT INTO     exam_result VALUES(720,193,520,97);
INSERT INTO     exam_result VALUES(730,195,540,87);
INSERT INTO     exam_result VALUES(730,194,530,85);
INSERT INTO     exam_result VALUES(750,192,500,60);
INSERT INTO     exam_result VALUES(750,195,510,97);
INSERT INTO     exam_result VALUES(750,191,520,78);
INSERT INTO     exam_result VALUES(760,192,540,65);
INSERT INTO     exam_result VALUES(760,191,530,60);
INSERT INTO     exam_result VALUES(760,192,510,70);

INSERT INTO     student_att VALUES( 720,100, 180, 21,'y');
INSERT INTO     student_att VALUES( 730,200, 180, 11,'y');
INSERT INTO     student_att VALUES( 740,300, 180, 12,'y');
INSERT INTO     student_att VALUES( 750,100, 180, 14,'y');
INSERT INTO     student_att VALUES( 760,200, 180, 15,'y');
INSERT INTO     student_att VALUES( 770,300, 180, 13,'y');

INSERT INTO     student_course VALUES(720,190,'a');
INSERT INTO     student_course VALUES(720,193,'b');
INSERT INTO     student_course VALUES(730,191,'c');
INSERT INTO     student_course VALUES(740,195,'f');
INSERT INTO     student_course VALUES(750,192,'a');
INSERT INTO     student_course VALUES(760,190,'b');
INSERT INTO     student_course  VALUES(760,192,'c');
INSERT INTO     student_course  VALUES(770,192,'d');
INSERT INTO     student_course VALUES(770,193,'f');
INSERT INTO     student_course  VALUES(770,194,'a');

INSERT INTO     faculty_course VALUES (800, 192,3);
INSERT INTO     faculty_course VALUES (800, 193,4);
INSERT INTO     faculty_course VALUES (800, 190,5);
INSERT INTO     faculty_course VALUES (800, 191,3);
INSERT INTO     faculty_course VALUES (810, 194,4);
INSERT INTO     faculty_course VALUES (810, 195,5);

INSERT INTO     faculty_login VALUES(800,DEFAULT);
INSERT INTO     faculty_login VALUES(810, DEFAULT);
INSERT INTO     faculty_login VALUES(840, DEFAULT);
INSERT INTO     faculty_login VALUES(820, DEFAULT);
INSERT INTO     faculty_login VALUES(830, DEFAULT);


