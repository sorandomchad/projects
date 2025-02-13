/* Team 1 - Chad Callender, Patrick Mitchell

	These are a few queries to showcase some of the insights
	we can gain from the DB
*/

-- 1a. Students enrolled in a particular course code:

SELECT s.studentID, FirstName, LastName
FROM student_t s, enrollment_t e, course_t c
wHERE e.crn = c.crn AND e.studentid = s.studentid  
AND c.coursecode = 2214; 

-- 1b. Students enrolled in a particular coursetitle:

SELECT s.studentID, FirstName, LastName
FROM student_t s, enrollment_t e, course_t c
wHERE e.crn = c.crn AND e.studentid = s.studentid  
AND c.coursetitle = 'Calculus I'; 

-- 2. Courses that have no enrollment:

SELECT crn, coursecode, coursetitle
FROM course_t 
WHERE crn NOT IN 
(SELECT distinct crn FROM enrollment_t);

-- 3. The total time spent in tutor session for a particular course

SELECT studentid, SUM(duration) 'Session Length in minutes'
FROM session_t
WHERE crn IN (select crn from course_t where courseTitle = 'Computer Science I')
group by studentid;


-- 4. Metrics for sessions by department
SELECT department, COUNT(department) 'Number of Sessions' ,
	SUM(s.duration) 'Duration in Minutes',
	SUM(duration) / COUNT(department) 'Average Session Length'
FROM session_t s INNER JOIN course_t c ON s.crn = c.crn
GROUP BY department
ORDER BY SUM(duration) desc;


-- 5. Courses offered at the tutoring center that have students enrolled
SELECT c.crn, tutorID, firstName Tutor, courseTitle
FROM student_t s, tutorcourses_t tc, course_t c
WHERE studentID = tutorID
	AND tc.crn = c.crn
	AND courseTitle NOT IN (select courseTitle from course_t where crn not in (select crn from enrollment_t))
ORDER BY courseTitle;



SELECT c.studentid, s.lastname,   SUM(duration) 
FROM session_t c, student_t s
WHERE s.studentid = c.studentid AND
c.crn IN (select crn from course_t where coursetitle = 'Calculus I')
group by c.studentid;




SELECT e.crn, s.studentID, FirstName, LastName
FROM student_t s, enrollment_t e, course_t c
wHERE e.crn = c.crn AND e.studentid = s.studentid  
AND c.coursetitle = 'College Algebra'
ORDER BY lastname;


SELECT c.studentid, s.lastname,   SUM(duration) 
FROM session_t c, student_t s 
WHERE s.studentid = c.studentid  AND
c.crn IN (select crn from course_t where coursetitle = 'College Algebra')
group by c.studentid
ORDER BY s.lastname;


SELECT c.studentid, s.lastname,   SUM(duration) 
FROM session_t c, student_t s , enrollment_t e
WHERE s.studentid = c.studentid AND e.studentid = s.studentid AND
c.crn IN (select crn from course_t where coursetitle = 'College Algebra')
group by c.studentid;



SELECT crn , studentid, duration
FROM session_t 
WHERE crn = 24352 AND studentid=20244742;

select crn , studentid
from enrollment_t
where crn = 24352 AND studentid=20244742;



SELECT crn 'Math Classes', studentid 
FROM session_t where crn 
In (select crn from course_t where department='math');

