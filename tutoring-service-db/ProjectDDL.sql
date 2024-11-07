/* Team 1 - Tutoring Service Application
	Chad Callender, Patrick Mitchell
*/

DROP TABLE Student_t;
DROP TABLE Course_t;
DROP TABLE Enrollment_t; 
DROP TABLE Faculty_t;
DROP TABLE CourseListing_t;
DROP TABLE TutorCourses_t;
DROP TABLE Session_t;
DROP VIEW Tutor_v;

-- Student table: Contains student information (ID, Name, Major, GPA)
CREATE TABLE Student_t(
	StudentID INTEGER NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Major VARCHAR(23),
	Department VARCHAR(4),
	GPA DECIMAL(3,2) INVISIBLE,
	IsTutor VARCHAR(10) INVISIBLE,
CONSTRAINT PRIMARY KEY(StudentID));

-- Course table: Contains a catalog of courses offered (CRN, Department, Code, Title)
CREATE TABLE Course_t(
	CRN INTEGER NOT NULL,
	Department VARCHAR(20) NOT NULL,
	CourseCode INTEGER NOT NULL,
	CourseTitle VARCHAR(50),
CONSTRAINT PRIMARY KEY(CRN));

-- Enrollment table: Bridge table between student and course
-- Contains which students are enrolled in which course(s)
CREATE TABLE Enrollment_t (
	CRN INTEGER NOT NULL,
	StudentID INTEGER NOT NULL,
CONSTRAINT PRIMARY KEY(StudentID, CRN),
CONSTRAINT FOREIGN KEY(StudentID) REFERENCES Student_t(StudentID),
CONSTRAINT FOREIGN KEY(CRN) REFERENCES Course_t(CRN));

-- Faculty table: Contains faculty information (ID, Name, Department)
CREATE TABLE Faculty_t (
	FacultyID INTEGER NOT NULL,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	Department VARCHAR(4) NOT NULL,
CONSTRAINT PRIMARY KEY(FacultyID));

-- Course Listing table: Bridge table between faculty and course
-- Contains which faculty teach which course(s)
CREATE TABLE CourseListing_t (
	CRN INTEGER NOT NULL,
	FacultyID INTEGER NOT NULL,
CONSTRAINT PRIMARY KEY(FacultyID, CRN),
CONSTRAINT FOREIGN KEY(FacultyID) REFERENCES Faculty_t(FacultyID),
CONSTRAINT FOREIGN KEY(CRN) REFERENCES Course_t(CRN));

-- Session Table: Bridge table between student, tutor, and course
-- Contains a log of each tutoring session (Student, Tutor, Course, Date, Duration, Session Notes)
CREATE TABLE Session_t (
	SessionID INTEGER NOT NULL AUTO_INCREMENT,
	StudentID INTEGER NOT NULL, 
	TutorID INTEGER NOT NULL,
	CRN INTEGER NOT NULL,
	Date DATE,
	Duration INTEGER CHECK (Duration >= 5),
	Description VARCHAR(50),
CONSTRAINT PRIMARY KEY(SessionID),
CONSTRAINT Session UNIQUE (StudentID, TutorID, CRN, Date),
CONSTRAINT FOREIGN KEY(StudentID) REFERENCES Student_t(StudentID),
CONSTRAINT FOREIGN KEY(TutorID) REFERENCES Student_t(StudentID),
CONSTRAINT FOREIGN KEY(CRN) REFERENCES Course_t(CRN));

-- Tutor Courses table: Bridge table between tutor and course
-- Contains which courses are offered by tutors in tutoring center
CREATE TABLE TutorCourses_t (
	CRN INTEGER NOT NULL,
	TutorID INTEGER NOT NULL,
	Availability VARCHAR(20),
CONSTRAINT PRIMARY KEY(CRN, tutorID),	
CONSTRAINT FOREIGN KEY(CRN) REFERENCES Course_t(CRN),
CONSTRAINT FOREIGN KEY(TutorID) REFERENCES student_t(StudentID));







-- DML

-- STUDENT TABLE
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20233626, 'Nata', 'Fraanchyonok', 'Nursing', 'NURS', 3.21, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20258701, 'Wanids', 'Casin', 'Nursing', 'NURS', 4.0, 'true');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20256828, 'Gerti', 'Steptoe', 'Political Science', 'POLS', 2.77, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20240247, 'Violante', 'Dessent', 'Political Science', 'POLS', 3.04, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20208477, 'Fan', 'Smallcombe', 'Biology', 'BIOL', 3.51, 'true');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20262480, 'Una', 'Cosser', 'Mechanical Engineering', 'MENG', 2.43, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20271293, 'Taffy', 'Hinz', 'Education', 'EDUC', 3.9, 'true');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20258249, 'Madella', 'Thulborn', 'Business Administration', 'BUAD', 2.8, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20267054, 'Jerrylee', 'Kondrachenko', 'Nursing', 'NURS', 2.93, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20298247, 'Charmion', 'Blacklock', 'Nursing', 'NURS', 3.69, 'true');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20269272, 'Gates', 'Ygoe', 'Business Administration', 'BUAD', 2.83, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20259851, 'Ondrea', 'Farington', 'Mechanical Engineering', 'MENG', 2.98, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20293929, 'Chaim', 'Rohan', 'Mechanical Engineering', 'MENG', 3.65, 'true');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20218294, 'Jolyn', 'Zieme', 'Political Science', 'POLS', 2.76, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20233998, 'Fionna', 'Sully', 'Nursing', 'NURS', 2.87, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20280874, 'Justin', 'Olin', 'Education', 'EDUC', 3.64, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20209667, 'Jackelyn', 'Craigg', 'Business Administration', 'BUAD', 3.03, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20299505, 'Zackariah', 'Liddall', 'Mechanical Engineering', 'MENG', 3.19, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20272601, 'Kingston', 'Lambillion', 'Mechanical Engineering', 'MENG', 3.22, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20246928, 'Claude', 'Howsam', 'Business Administration', 'BUAD', 2.45, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20238692, 'Royall', 'Briddle', 'Nursing', 'NURS', 3.2, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20232283, 'Horatio', 'Ineson', 'Nursing', 'NURS', 3.67, 'true');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20299748, 'Aile', 'Carey', 'Computer Science', 'CMPS', 3.8, 'true');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20259813, 'Lela', 'Caslin', 'Nursing', 'NURS', 3.38, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20249826, 'Peggie', 'Crenage', 'Psychology', 'PSYC', 3.33, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20237724, 'Tabby', 'Bertolaccini', 'Psychology', 'PSYC', 3.39, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20270576, 'Ugo', 'Heskey', 'Mass Communication', 'MCOM', 2.97, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20250276, 'Bendick', 'Lorrain', 'Political Science', 'POLS', 3.45, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20228794, 'Rriocard', 'Titley', 'Computer Science', 'CMPS', 2.89, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20288583, 'Jacenta', 'Fisbey', 'Biology', 'BIOL', 3.17, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20282621, 'Colas', 'Ricks', 'Nursing', 'NURS', 3.02, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20225509, 'Tamiko', 'Lewing', 'Computer Science', 'CMPS', 2.05, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20206275, 'Guthrie', 'Dargan', 'Business Administration', 'BUAD', 3.26, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20280780, 'Maxi', 'Randerson', 'Nursing', 'NURS', 3.34, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20249704, 'Rhonda', 'Lethem', 'Computer Science', 'CMPS', 2.64, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20276463, 'Peadar', 'Ure', 'Computer Science', 'CMPS', 3.21, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20270195, 'Ladonna', 'Shyre', 'Computer Science', 'CMPS', 3.15, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20272587, 'Adi', 'Pepys', 'Mechanical Engineering', 'MENG', 3.86, 'true');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20224532, 'Babb', 'Wylder', 'Biology', 'BIOL', 2.63, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20264548, 'Emmalynne', 'Polleye', 'Biology', 'BIOL', 3.56, 'true');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20227594, 'Gregorius', 'Trask', 'Mechanical Engineering', 'MENG', 3.03, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20244742, 'Alexi', 'Cazin', 'Business Administration', 'BUAD', 3.05, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20248747, 'Weider', 'Arnholz', 'Mechanical Engineering', 'MENG', 2.87, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20252611, 'Svend', 'Jephson', 'Biology', 'BIOL', 3.42, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20237106, 'Cacilia', 'McCafferty', 'Business Administration', 'BUAD', 3.11, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20215007, 'Oona', 'Laxen', 'Business Administration', 'BUAD', 3.55, 'true');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20279328, 'Pearce', 'Maggorini', 'Computer Science', 'CMPS', 2.24, 'false');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20230929, 'Katherina', 'Nani', 'Business Administration', 'BUAD', 3.7, 'true');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20230527, 'Teodorico', 'Cranch', 'Business Administration', 'BUAD', 3.51, 'true');
insert into student_t (StudentID, FirstName, LastName, Major, Department, GPA, IsTutor) values (20280052, 'Milly', 'Basini-Gazzi', 'Computer Science', 'CMPS', 2.99, 'false');


-- TUTOR VIEW
CREATE VIEW tutor_v AS (
	SELECT studentID AS 'tutorID'
	FROM student_t
	WHERE isTutor = 'true');


-- COURSE TABLE
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (26567, 'MATH', 2214, 'Calculus I');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (24352, 'MATH', 1563, 'College Algebra');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (28816, 'CMPS', 1283, 'Computer Science I');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (22664, 'ENGL', 1143, 'Intro Crit Read & Acad Writing');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (23890, 'MENG', 1313, 'Intro to Mechanical Engineering');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (24370, 'NURS', 1143, 'Introduction to Nursing');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (23011, 'MATH', 1243, 'Plane Trigonometry');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (25287, 'MATH', 1563, 'College Algebra');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (27764, 'CMPS', 1283, 'Computer Science I');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (24100, 'GEOS', 1243, 'Intro to Rocks and Things');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (26660, 'ENGL', 3313, 'Intro Read & Writ - Literature');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (23503, 'NURS', 2284, 'Mother and Baby');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (29494, 'MENG', 2563, 'Fluid Dynamics');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (26986, 'CHEM', 1213, 'General Chemistry I');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (20169, 'NURS', 1143, 'Introduction to Nursing');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (23142, 'ENGL', 1143, 'Intro Crit Read & Acad Writing');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (26765, 'BUAD', 1313, 'Foundations of Business');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (24077, 'BIOL', 2563, 'Cells II');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (25514, 'CHEM', 3313, 'Physical Chemistry');
insert into course_t (CRN, Department, CourseCode, CourseTitle) values (25313, 'MATH', 2564, 'Calculus II');




-- FACULTY TABLE
insert into faculty_t (FacultyID, FirstName, LastName, Department) values (20060046, 'Thain', 'Tropman', 'MATH');
insert into faculty_t (FacultyID, FirstName, LastName, Department) values (20027880, 'Imogene', 'Le Fleming', 'CMPS');
insert into faculty_t (FacultyID, FirstName, LastName, Department) values (20050031, 'Terry', 'Mayman', 'MENG');
insert into faculty_t (FacultyID, FirstName, LastName, Department) values (20082092, 'Ferne', 'Kunes', 'ENGL');
insert into faculty_t (FacultyID, FirstName, LastName, Department) values (20023140, 'Evanne', 'Iles', 'NURS');
insert into faculty_t (FacultyID, FirstName, LastName, Department) values (20095626, 'Patrice', 'Ruhben', 'CHEM');
insert into faculty_t (FacultyID, FirstName, LastName, Department) values (20028804, 'Ashely', 'McIlmorie', 'BIOL');
insert into faculty_t (FacultyID, FirstName, LastName, Department) values (20089428, 'Eloise', 'Kaine', 'BUAD');
insert into faculty_t (FacultyID, FirstName, LastName, Department) values (20054191, 'Nichol', 'Jacobovitch', 'GEOS');
insert into faculty_t (FacultyID, FirstName, LastName, Department) values (20005093, 'Karil', 'Millthorpe', 'MATH');
insert into faculty_t (FacultyID, FirstName, LastName, Department) values (20078813, 'Kristofer', 'Tatford', 'CMPS');
insert into faculty_t (FacultyID, FirstName, LastName, Department) values (20039236, 'Brig', 'Benion', 'MENG');




-- COURSE LISTING TABLE
insert into courseListing_t (CRN, FacultyID) values (24077, 20028804);
insert into courseListing_t (CRN, FacultyID) values (26765, 20089428);
insert into courseListing_t (CRN, FacultyID) values (25514, 20095626);
insert into courseListing_t (CRN, FacultyID) values (26986, 20095626);
insert into courseListing_t (CRN, FacultyID) values (27764, 20078813);
insert into courseListing_t (CRN, FacultyID) values (28816, 20027880);
insert into courseListing_t (CRN, FacultyID) values (22664, 20082092);
insert into courseListing_t (CRN, FacultyID) values (23142, 20082092);
insert into courseListing_t (CRN, FacultyID) values (26660, 20082092);
insert into courseListing_t (CRN, FacultyID) values (24100, 20054191);
insert into courseListing_t (CRN, FacultyID) values (23011, 20060046);
insert into courseListing_t (CRN, FacultyID) values (24352, 20060046);
insert into courseListing_t (CRN, FacultyID) values (25287, 20005093);
insert into courseListing_t (CRN, FacultyID) values (25313, 20005093);
insert into courseListing_t (CRN, FacultyID) values (26567, 20060046);
insert into courseListing_t (CRN, FacultyID) values (23890, 20050031);
insert into courseListing_t (CRN, FacultyID) values (29494, 20039236);
insert into courseListing_t (CRN, FacultyID) values (20169, 20023140);
insert into courseListing_t (CRN, FacultyID) values (23503, 20023140);
insert into courseListing_t (CRN, FacultyID) values (24370, 20023140);



-- TUTOR COURSES TABLE 
insert into tutorCourses_t (CRN, tutorID, Availability) values (24077, 20264548, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (28816, 20299748, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (24077, 20208477, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (26765, 20215007, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (26765, 20230527, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (23890, 20272587, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (23890, 20293929, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (20169, 20232283, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (20169, 20258701, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (24370, 20298247, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (26567, 20299748, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (26567, 20293929, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (25313, 20272587, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (25287, 20264548, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (23011, 20299748, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (25287, 20293929, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (25287, 20272587, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (26567, 20264548, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (23011, 20272587, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (26660, 20215007, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (23142, 20215007, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (23142, 20208477, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (26986, 20208477, '11-1, 3-5');
insert into tutorCourses_t (CRN, tutorID, Availability) values (26986, 20293929, '11-1, 3-5');



-- ENROLLMENT TABLE
insert into enrollment_t (CRN, studentID) values (24370, 20232283);
insert into enrollment_t (CRN, studentID) values (24370, 20233626);
insert into enrollment_t (CRN, studentID) values (24370, 20233998);
insert into enrollment_t (CRN, studentID) values (24370, 20267054);
insert into enrollment_t (CRN, studentID) values (24370, 20298247);
insert into enrollment_t (CRN, studentID) values (20169, 20258701);
insert into enrollment_t (CRN, studentID) values (20169, 20259813);
insert into enrollment_t (CRN, studentID) values (20169, 20280780);
insert into enrollment_t (CRN, studentID) values (20169, 20282621);
insert into enrollment_t (CRN, studentID) values (20169, 20238692);
insert into enrollment_t (CRN, studentID) values (23503, 20232283);
insert into enrollment_t (CRN, studentID) values (23503, 20233626);
insert into enrollment_t (CRN, studentID) values (23503, 20233998);
insert into enrollment_t (CRN, studentID) values (23503, 20267054);
insert into enrollment_t (CRN, studentID) values (23503, 20298247);
insert into enrollment_t (CRN, studentID) values (23503, 20258701);
insert into enrollment_t (CRN, studentID) values (23503, 20259813);
insert into enrollment_t (CRN, studentID) values (23503, 20280780);
insert into enrollment_t (CRN, studentID) values (23503, 20282621);
insert into enrollment_t (CRN, studentID) values (23503, 20238692);
insert into enrollment_t (CRN, studentID) values (22664, 20232283);
insert into enrollment_t (CRN, studentID) values (22664, 20233626);
insert into enrollment_t (CRN, studentID) values (23142, 20298247);
insert into enrollment_t (CRN, studentID) values (22664, 20258701);
insert into enrollment_t (CRN, studentID) values (23142, 20282621);
insert into enrollment_t (CRN, studentID) values (25287, 20232283);
insert into enrollment_t (CRN, studentID) values (25287, 20233626);
insert into enrollment_t (CRN, studentID) values (24352, 20233998);
insert into enrollment_t (CRN, studentID) values (24352, 20267054);
insert into enrollment_t (CRN, studentID) values (24352, 20258701);
insert into enrollment_t (CRN, studentID) values (25287, 20259813);
insert into enrollment_t (CRN, studentID) values (24352, 20280780);
insert into enrollment_t (CRN, studentID) values (25287, 20238692);
insert into enrollment_t (CRN, studentID) values (24077, 20232283);
insert into enrollment_t (CRN, studentID) values (26986, 20233626);
insert into enrollment_t (CRN, studentID) values (26986, 20233998);
insert into enrollment_t (CRN, studentID) values (26986, 20267054);
insert into enrollment_t (CRN, studentID) values (24077, 20298247);
insert into enrollment_t (CRN, studentID) values (26986, 20258701);
insert into enrollment_t (CRN, studentID) values (24077, 20259813);
insert into enrollment_t (CRN, studentID) values (26986, 20280780);
insert into enrollment_t (CRN, studentID) values (26986, 20282621);
insert into enrollment_t (CRN, studentID) values (24077, 20238692);
insert into enrollment_t (CRN, studentID) values (26986, 20298247);
insert into enrollment_t (CRN, studentID) values (26986, 20232283);
insert into enrollment_t (CRN, studentID) values (25313, 20262480);
insert into enrollment_t (CRN, studentID) values (25313, 20248747);
insert into enrollment_t (CRN, studentID) values (25313, 20259851);
insert into enrollment_t (CRN, studentID) values (25313, 20272587);
insert into enrollment_t (CRN, studentID) values (25313, 20272601);
insert into enrollment_t (CRN, studentID) values (25313, 20293929);
insert into enrollment_t (CRN, studentID) values (22664, 20272587);
insert into enrollment_t (CRN, studentID) values (22664, 20293929);
insert into enrollment_t (CRN, studentID) values (22664, 20227594);
insert into enrollment_t (CRN, studentID) values (22664, 20262480);
insert into enrollment_t (CRN, studentID) values (22664, 20259851);
insert into enrollment_t (CRN, studentID) values (22664, 20248747);
insert into enrollment_t (CRN, studentID) values (23142, 20272587);
insert into enrollment_t (CRN, studentID) values (23142, 20262480);
insert into enrollment_t (CRN, studentID) values (23142, 20227594);
insert into enrollment_t (CRN, studentID) values (24352, 20293929);
insert into enrollment_t (CRN, studentID) values (24352, 20259851);
insert into enrollment_t (CRN, studentID) values (24352, 20272587);
insert into enrollment_t (CRN, studentID) values (24352, 20262480);
insert into enrollment_t (CRN, studentID) values (24352, 20227594);
insert into enrollment_t (CRN, studentID) values (25287, 20272587);
insert into enrollment_t (CRN, studentID) values (25287, 20248747);
insert into enrollment_t (CRN, studentID) values (26986, 20293929);
insert into enrollment_t (CRN, studentID) values (26986, 20272601);
insert into enrollment_t (CRN, studentID) values (26986, 20262480);
insert into enrollment_t (CRN, studentID) values (26986, 20227594);
insert into enrollment_t (CRN, studentID) values (26986, 20272587);
insert into enrollment_t (CRN, studentID) values (23890, 20272601);
insert into enrollment_t (CRN, studentID) values (23890, 20293929);
insert into enrollment_t (CRN, studentID) values (23890, 20272587);
insert into enrollment_t (CRN, studentID) values (23890, 20262480);
insert into enrollment_t (CRN, studentID) values (23890, 20248747);
insert into enrollment_t (CRN, studentID) values (23890, 20227594);
insert into enrollment_t (CRN, studentID) values (27764, 20299505);
insert into enrollment_t (CRN, studentID) values (27764, 20293929);
insert into enrollment_t (CRN, studentID) values (27764, 20259851);
insert into enrollment_t (CRN, studentID) values (28816, 20299505);
insert into enrollment_t (CRN, studentID) values (28816, 20227594);
insert into enrollment_t (CRN, studentID) values (28816, 20262480);
insert into enrollment_t (CRN, studentID) values (28816, 20272601);
insert into enrollment_t (CRN, studentID) values (28816, 20272587);
insert into enrollment_t (CRN, studentID) values (26765, 20215007);
insert into enrollment_t (CRN, studentID) values (26765, 20246928);
insert into enrollment_t (CRN, studentID) values (26765, 20258249);
insert into enrollment_t (CRN, studentID) values (26765, 20230929);
insert into enrollment_t (CRN, studentID) values (26765, 20206275);
insert into enrollment_t (CRN, studentID) values (26765, 20269272);
insert into enrollment_t (CRN, studentID) values (26765, 20244742);
insert into enrollment_t (CRN, studentID) values (22664, 20209667);
insert into enrollment_t (CRN, studentID) values (22664, 20246928);
insert into enrollment_t (CRN, studentID) values (22664, 20244742);
insert into enrollment_t (CRN, studentID) values (22664, 20230527);
insert into enrollment_t (CRN, studentID) values (22664, 20269272);
insert into enrollment_t (CRN, studentID) values (22664, 20215007);
insert into enrollment_t (CRN, studentID) values (23142, 20209667);
insert into enrollment_t (CRN, studentID) values (23142, 20269272);
insert into enrollment_t (CRN, studentID) values (23142, 20230527);
insert into enrollment_t (CRN, studentID) values (27764, 20209667);
insert into enrollment_t (CRN, studentID) values (27764, 20215007);
insert into enrollment_t (CRN, studentID) values (27764, 20258249);
insert into enrollment_t (CRN, studentID) values (27764, 20230527);
insert into enrollment_t (CRN, studentID) values (28816, 20209667);
insert into enrollment_t (CRN, studentID) values (28816, 20206275);
insert into enrollment_t (CRN, studentID) values (28816, 20269272);
insert into enrollment_t (CRN, studentID) values (28816, 20215007);
insert into enrollment_t (CRN, studentID) values (28816, 20230929);
insert into enrollment_t (CRN, studentID) values (24352, 20237106);
insert into enrollment_t (CRN, studentID) values (24352, 20206275);
insert into enrollment_t (CRN, studentID) values (24352, 20258249);
insert into enrollment_t (CRN, studentID) values (24352, 20244742);
insert into enrollment_t (CRN, studentID) values (25287, 20230929);
insert into enrollment_t (CRN, studentID) values (25287, 20209667);
insert into enrollment_t (CRN, studentID) values (25287, 20246928);
insert into enrollment_t (CRN, studentID) values (25287, 20258249);
insert into enrollment_t (CRN, studentID) values (24352, 20252611);
insert into enrollment_t (CRN, studentID) values (24352, 20224532);
insert into enrollment_t (CRN, studentID) values (24352, 20264548);
insert into enrollment_t (CRN, studentID) values (24352, 20208477);
insert into enrollment_t (CRN, studentID) values (25287, 20224532);
insert into enrollment_t (CRN, studentID) values (25287, 20264548);
insert into enrollment_t (CRN, studentID) values (26765, 20264548);
insert into enrollment_t (CRN, studentID) values (26765, 20208477);
insert into enrollment_t (CRN, studentID) values (26765, 20252611);
insert into enrollment_t (CRN, studentID) values (26986, 20288583);
insert into enrollment_t (CRN, studentID) values (26986, 20252611);
insert into enrollment_t (CRN, studentID) values (26986, 20264548);
insert into enrollment_t (CRN, studentID) values (22664, 20224532);
insert into enrollment_t (CRN, studentID) values (22664, 20252611);
insert into enrollment_t (CRN, studentID) values (23142, 20252611);
insert into enrollment_t (CRN, studentID) values (23142, 20208477);
insert into enrollment_t (CRN, studentID) values (23142, 20224532);
insert into enrollment_t (CRN, studentID) values (24077, 20264548);
insert into enrollment_t (CRN, studentID) values (24077, 20224532);
insert into enrollment_t (CRN, studentID) values (22664, 20218294);
insert into enrollment_t (CRN, studentID) values (22664, 20250276);
insert into enrollment_t (CRN, studentID) values (23142, 20218294);
insert into enrollment_t (CRN, studentID) values (23142, 20256828);
insert into enrollment_t (CRN, studentID) values (24352, 20256828);
insert into enrollment_t (CRN, studentID) values (24352, 20250276);
insert into enrollment_t (CRN, studentID) values (25287, 20250276);
insert into enrollment_t (CRN, studentID) values (25287, 20256828);
insert into enrollment_t (CRN, studentID) values (25287, 20218294);
insert into enrollment_t (CRN, studentID) values (26765, 20250276);
insert into enrollment_t (CRN, studentID) values (26765, 20240247);
insert into enrollment_t (CRN, studentID) values (22664, 20299748);
insert into enrollment_t (CRN, studentID) values (22664, 20249704);
insert into enrollment_t (CRN, studentID) values (22664, 20228794);
insert into enrollment_t (CRN, studentID) values (23142, 20228794);
insert into enrollment_t (CRN, studentID) values (23142, 20279328);
insert into enrollment_t (CRN, studentID) values (24352, 20270195);
insert into enrollment_t (CRN, studentID) values (24352, 20276463);
insert into enrollment_t (CRN, studentID) values (24352, 20225509);
insert into enrollment_t (CRN, studentID) values (24352, 20280052);
insert into enrollment_t (CRN, studentID) values (24352, 20299748);
insert into enrollment_t (CRN, studentID) values (25287, 20280052);
insert into enrollment_t (CRN, studentID) values (25287, 20228794);
insert into enrollment_t (CRN, studentID) values (25287, 20279328);
insert into enrollment_t (CRN, studentID) values (25287, 20270195);
insert into enrollment_t (CRN, studentID) values (25287, 20276463);
insert into enrollment_t (CRN, studentID) values (26567, 20228794);
insert into enrollment_t (CRN, studentID) values (26567, 20299748);
insert into enrollment_t (CRN, studentID) values (26567, 20280052);
insert into enrollment_t (CRN, studentID) values (26567, 20270195);
insert into enrollment_t (CRN, studentID) values (26567, 20279328);
insert into enrollment_t (CRN, studentID) values (26567, 20225509);
insert into enrollment_t (CRN, studentID) values (26765, 20225509);
insert into enrollment_t (CRN, studentID) values (26765, 20280052);
insert into enrollment_t (CRN, studentID) values (26765, 20270195);
insert into enrollment_t (CRN, studentID) values (26765, 20249704);
insert into enrollment_t (CRN, studentID) values (26986, 20270195);
insert into enrollment_t (CRN, studentID) values (26986, 20228794);
insert into enrollment_t (CRN, studentID) values (26986, 20280052);
insert into enrollment_t (CRN, studentID) values (27764, 20270195);
insert into enrollment_t (CRN, studentID) values (27764, 20279328);
insert into enrollment_t (CRN, studentID) values (28816, 20276463);
insert into enrollment_t (CRN, studentID) values (28816, 20225509);
insert into enrollment_t (CRN, studentID) values (28816, 20280052);
insert into enrollment_t (CRN, studentID) values (28816, 20228794);
insert into enrollment_t (CRN, studentID) values (28816, 20249704);
insert into enrollment_t (CRN, studentID) values (28816, 20299748);
insert into enrollment_t (CRN, studentID) values (22664, 20249826);
insert into enrollment_t (CRN, studentID) values (23142, 20249826);
insert into enrollment_t (CRN, studentID) values (23142, 20237724);
insert into enrollment_t (CRN, studentID) values (26765, 20249826);
insert into enrollment_t (CRN, studentID) values (22664, 20270576);
insert into enrollment_t (CRN, studentID) values (23142, 20270576);
insert into enrollment_t (CRN, studentID) values (23142, 20280874);
insert into enrollment_t (CRN, studentID) values (24100, 20271293);
insert into enrollment_t (CRN, studentID) values (24100, 20280874);
insert into enrollment_t (CRN, studentID) values (24352, 20280874);
insert into enrollment_t (CRN, studentID) values (24352, 20271293);
insert into enrollment_t (CRN, studentID) values (24352, 20270576);
insert into enrollment_t (CRN, studentID) values (25287, 20271293);
insert into enrollment_t (CRN, studentID) values (25287, 20270576);
insert into enrollment_t (CRN, studentID) values (26765, 20270576);
insert into enrollment_t (CRN, studentID) values (26765, 20280874);
insert into enrollment_t (CRN, studentID) values (26765, 20271293);



-- SESSION TABLE
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233626, 20232283, 20169, '2023-02-12', 35, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233626, 20258701, 20169, '2023-05-18', 30, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20238692, 20232283, 20169, '2023-05-02', 46, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20238692, 20258701, 20169, '2023-02-25', 58, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20267054, 20258701, 20169, '2023-01-18', 17, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20238692, 20232283, 20169, '2023-04-05', 23, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233626, 20232283, 20169, '2023-01-25', 53, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233626, 20232283, 20169, '2023-02-06', 33, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259813, 20258701, 20169, '2023-01-04', 5, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259813, 20232283, 20169, '2023-05-20', 29, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233626, 20258701, 20169, '2023-04-10', 35, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259813, 20232283, 20169, '2023-03-09', 15, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20238692, 20232283, 20169, '2023-03-27', 35, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20238692, 20258701, 20169, '2023-04-29', 36, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233626, 20232283, 20169, '2023-05-18', 50, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20267054, 20258701, 20169, '2023-02-23', 57, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20267054, 20232283, 20169, '2023-04-22', 9, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20267054, 20232283, 20169, '2023-05-01', 30, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259813, 20232283, 20169, '2023-03-06', 28, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259813, 20232283, 20169, '2023-02-28', 32, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259813, 20258701, 20169, '2023-01-10', 15, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259813, 20258701, 20169, '2023-05-06', 58, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233626, 20232283, 20169, '2023-03-03', 37, 'Covered blood types');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20208477, 23142, '2023-03-20', 55, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270576, 20215007, 23142, '2023-01-16', 11, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20218294, 20215007, 23142, '2023-03-16', 43, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270576, 20208477, 23142, '2023-04-30', 30, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20215007, 23142, '2023-02-12', 46, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20208477, 23142, '2023-04-27', 37, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20209667, 20208477, 23142, '2023-03-10', 18, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20256828, 20215007, 23142, '2023-03-17', 17, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20227594, 20215007, 23142, '2023-03-08', 14, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20218294, 20215007, 23142, '2023-05-12', 27, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20262480, 20208477, 23142, '2023-01-16', 34, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20215007, 23142, '2023-03-13', 5, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20282621, 20208477, 23142, '2023-02-26', 24, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20208477, 23142, '2023-03-26', 45, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270576, 20208477, 23142, '2023-05-30', 33, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20279328, 20208477, 23142, '2023-04-11', 43, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20256828, 20208477, 23142, '2023-04-15', 28, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20208477, 23142, '2023-01-01', 59, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20215007, 23142, '2023-04-02', 55, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20262480, 20215007, 23142, '2023-01-26', 53, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20252611, 20215007, 22664, '2023-05-13', 11, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20227594, 20208477, 22664, '2023-04-26', 38, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20215007, 22664, '2023-05-25', 17, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20248747, 20208477, 22664, '2023-04-06', 47, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20227594, 20208477, 22664, '2023-02-12', 11, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20249826, 20215007, 22664, '2023-03-17', 46, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259851, 20208477, 22664, '2023-05-06', 23, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20249826, 20208477, 22664, '2023-04-07', 55, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20215007, 22664, '2023-02-26', 58, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20252611, 20208477, 22664, '2023-01-12', 20, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259851, 20215007, 22664, '2023-01-06', 11, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20252611, 20215007, 22664, '2023-03-11', 47, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20249826, 20208477, 22664, '2023-04-30', 36, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20249826, 20208477, 22664, '2023-05-21', 59, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20208477, 22664, '2023-02-16', 28, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20246928, 20215007, 22664, '2023-01-02', 48, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20215007, 22664, '2023-01-03', 45, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20252611, 20215007, 22664, '2023-05-15', 58, 'Essay');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20252611, 20208477, 26986, '2023-05-15', 38, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20252611, 20293929, 26986, '2023-03-05', 41, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20282621, 20293929, 26986, '2023-05-21', 41, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20209667, 20293929, 26986, '2023-05-20', 41, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20237724, 20208477, 26986, '2023-04-13', 41, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20256828, 20293929, 26986, '2023-03-10', 41, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20237724, 20293929, 26986, '2023-02-27', 11, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20209667, 20293929, 26986, '2023-01-29', 51, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20293929, 26986, '2023-05-16', 57, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20252611, 20293929, 26986, '2023-04-28', 46, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20209667, 20208477, 26986, '2023-01-28', 25, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20249826, 20208477, 26986, '2023-01-10', 46, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20282621, 20293929, 26986, '2023-04-28', 28, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20237724, 20208477, 26986, '2023-03-29', 38, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20282621, 20293929, 26986, '2023-04-26', 28, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20218294, 20293929, 26986, '2023-01-09', 8, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280874, 20293929, 26986, '2023-02-08', 35, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20256828, 20208477, 26986, '2023-03-26', 54, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20252611, 20208477, 26986, '2023-01-24', 59, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20293929, 26986, '2023-01-18', 5, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20282621, 20208477, 26986, '2023-04-18', 34, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20218294, 20293929, 26986, '2023-03-08', 19, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20256828, 20293929, 26986, '2023-01-12', 56, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20209667, 20208477, 26986, '2023-05-07', 26, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20237724, 20208477, 26986, '2023-05-24', 27, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20209667, 20293929, 26986, '2023-02-17', 37, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20209667, 20293929, 26986, '2023-04-04', 50, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20218294, 20208477, 26986, '2023-02-05', 9, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20237724, 20293929, 26986, '2023-04-29', 57, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20252611, 20293929, 26986, '2023-02-24', 5, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280874, 20293929, 26986, '2023-03-15', 52, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20218294, 20208477, 26986, '2023-01-14', 56, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20218294, 20293929, 26986, '2023-04-17', 50, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20256828, 20208477, 26986, '2023-05-17', 44, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20209667, 20208477, 26986, '2023-03-12', 8, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20209667, 20293929, 26986, '2023-05-08', 43, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20218294, 20293929, 26986, '2023-01-26', 54, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20249826, 20293929, 26986, '2023-01-11', 31, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280874, 20208477, 26986, '2023-04-06', 6, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280874, 20293929, 26986, '2023-03-02', 56, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20237724, 20293929, 26986, '2023-04-21', 26, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20293929, 26986, '2023-01-03', 31, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20252611, 20208477, 26986, '2023-05-08', 54, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20293929, 26986, '2023-04-23', 53, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280874, 20208477, 26986, '2023-03-04', 57, 'Stoichiometry');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20249704, 20230527, 26765, '2023-05-15', 28, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20215007, 26765, '2023-01-23', 10, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20246928, 20215007, 26765, '2023-04-23', 32, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20249704, 20230527, 26765, '2023-03-18', 43, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20258249, 20230527, 26765, '2023-01-27', 28, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20258249, 20215007, 26765, '2023-01-22', 32, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20230527, 26765, '2023-02-28', 44, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20258249, 20215007, 26765, '2023-05-30', 18, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20215007, 26765, '2023-02-12', 57, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20249704, 20230527, 26765, '2023-02-03', 36, 'Mikes Bikes');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280874, 20215007, 26765, '2023-03-29', 45, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20249704, 20230527, 26765, '2023-03-13', 30, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20258249, 20215007, 26765, '2023-01-08', 24, 'Mikes Bikes');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280874, 20230527, 26765, '2023-05-29', 10, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20258249, 20230527, 26765, '2023-01-18', 20, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20230527, 26765, '2023-01-09', 59, 'Mikes Bikes');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20249704, 20230527, 26765, '2023-02-17', 12, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20215007, 26765, '2023-05-21', 48, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20258249, 20215007, 26765, '2023-01-07', 49, 'Mikes Bikes');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20230527, 26765, '2023-03-11', 52, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20258249, 20215007, 26765, '2023-01-28', 60, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20230527, 26765, '2023-01-13', 58, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20258249, 20215007, 26765, '2023-05-20', 22, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20230527, 26765, '2023-04-27', 6, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280874, 20215007, 26765, '2023-01-26', 17, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20249704, 20215007, 26765, '2023-03-26', 44, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20215007, 26765, '2023-01-07', 32, 'Mikes Bikes');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20258249, 20215007, 26765, '2023-03-07', 33, 'Mikes Bikes');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20249704, 20230527, 26765, '2023-05-27', 60, 'Rule of Accounting');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20249704, 20215007, 26765, '2023-02-09', 49, 'Mikes Bikes');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20244742, 20299748, 28816, '2023-02-12', 22, 'Loops');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20246928, 20299748, 28816, '2023-03-04', 24, 'Arrays and Structs');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20244742, 20299748, 28816, '2023-03-06', 34, 'Arrays and Structs');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270576, 20299748, 28816, '2023-04-29', 40, 'Loops');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20244742, 20299748, 28816, '2023-02-25', 43, 'Loops');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20244742, 20299748, 28816, '2023-03-23', 14, 'Loops');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20244742, 20299748, 28816, '2023-04-06', 10, 'Arrays and Structs');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20246928, 20299748, 28816, '2023-04-21', 42, 'Loops');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20246928, 20299748, 28816, '2023-01-03', 32, 'Arrays and Structs');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20246928, 20299748, 28816, '2023-03-12', 32, 'Loops');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20246928, 20299748, 28816, '2023-02-24', 37, 'Loops');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259851, 20299748, 28816, '2023-03-12', 6, 'Loops');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270195, 20299748, 28816, '2023-02-27', 13, 'Loops');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270195, 20299748, 28816, '2023-03-23', 8, 'Loops');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270195, 20299748, 28816, '2023-02-14', 14, 'Loops');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270195, 20299748, 28816, '2023-03-20', 48, 'Loops');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270195, 20299748, 28816, '2023-03-03', 48, 'Arrays and Structs');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20272587, 25287, '2023-01-26', 55, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20272587, 25287, '2023-03-23', 35, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20246928, 20293929, 25287, '2023-01-01', 28, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270576, 20293929, 25287, '2023-03-09', 48, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20209667, 20272587, 25287, '2023-01-01', 51, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20272587, 25287, '2023-03-28', 19, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20209667, 20272587, 25287, '2023-04-11', 44, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233626, 20272587, 25287, '2023-04-24', 31, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20256828, 20272587, 25287, '2023-04-26', 53, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20209667, 20293929, 25287, '2023-04-13', 38, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20272587, 25287, '2023-01-13', 12, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20258249, 20272587, 25287, '2023-03-19', 16, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20293929, 25287, '2023-02-10', 38, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20256828, 20272587, 25287, '2023-02-09', 24, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259813, 20272587, 25287, '2023-04-16', 43, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20246928, 20293929, 25287, '2023-02-01', 28, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259813, 20293929, 25287, '2023-03-15', 33, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20293929, 25287, '2023-04-17', 39, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20272587, 25287, '2023-04-13', 37, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270576, 20272587, 25287, '2023-02-12', 21, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20293929, 25287, '2023-03-02', 34, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20246928, 20272587, 25287, '2023-03-17', 52, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20209667, 20293929, 25287, '2023-02-19', 54, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270576, 20272587, 25287, '2023-02-24', 32, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20293929, 25287, '2023-01-12', 45, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20246928, 20272587, 25287, '2023-01-04', 50, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20256828, 20293929, 25287, '2023-03-11', 41, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20272587, 25287, '2023-03-03', 29, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20256828, 20293929, 25287, '2023-01-06', 52, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233626, 20293929, 25287, '2023-03-02', 5, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20256828, 20293929, 25287, '2023-03-18', 24, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20293929, 25287, '2023-02-13', 44, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280052, 20293929, 25287, '2023-01-12', 56, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233626, 20293929, 25287, '2023-03-11', 33, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270576, 20293929, 25287, '2023-03-03', 19, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20258249, 20272587, 25287, '2023-04-06', 13, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259813, 20272587, 25287, '2023-03-12', 58, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20209667, 20293929, 25287, '2023-03-07', 27, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259813, 20293929, 25287, '2023-03-22', 44, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20246928, 20293929, 25287, '2023-04-14', 24, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270576, 20293929, 25287, '2023-01-13', 22, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20272587, 25287, '2023-01-24', 29, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20270576, 20272587, 25287, '2023-03-10', 47, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233626, 20293929, 25287, '2023-04-04', 39, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20244742, 20293929, 24352, '2023-03-01', 57, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20293929, 24352, '2023-01-17', 45, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259851, 20264548, 24352, '2023-01-14', 14, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20206275, 20264548, 24352, '2023-04-25', 14, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20256828, 20264548, 24352, '2023-01-07', 31, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20293929, 24352, '2023-04-20', 45, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20237106, 20264548, 24352, '2023-02-08', 23, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20293929, 24352, '2023-01-14', 10, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20206275, 20293929, 24352, '2023-04-15', 34, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233998, 20293929, 24352, '2023-01-15', 53, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259851, 20264548, 24352, '2023-01-23', 54, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20258249, 20264548, 24352, '2023-04-17', 29, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20225509, 20264548, 24352, '2023-02-17', 58, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20293929, 24352, '2023-02-14', 8, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20293929, 24352, '2023-01-21', 47, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280052, 20293929, 24352, '2023-01-16', 14, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20225509, 20293929, 24352, '2023-02-24', 47, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20264548, 24352, '2023-01-18', 49, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20237106, 20293929, 24352, '2023-04-14', 17, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20227594, 20293929, 24352, '2023-03-26', 58, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20293929, 24352, '2023-02-06', 10, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20252611, 20264548, 24352, '2023-01-29', 60, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20293929, 24352, '2023-02-25', 21, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20225509, 20264548, 24352, '2023-01-20', 12, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20256828, 20293929, 24352, '2023-02-07', 52, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20264548, 24352, '2023-03-14', 55, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20244742, 20264548, 24352, '2023-04-01', 31, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233998, 20293929, 24352, '2023-04-28', 29, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233998, 20264548, 24352, '2023-03-05', 27, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20224532, 20293929, 24352, '2023-03-30', 17, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20206275, 20264548, 24352, '2023-03-14', 51, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280052, 20293929, 24352, '2023-01-30', 36, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20293929, 24352, '2023-01-09', 38, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20258249, 20264548, 24352, '2023-01-02', 28, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259851, 20264548, 24352, '2023-04-06', 36, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20225509, 20293929, 24352, '2023-01-24', 58, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20276463, 20293929, 24352, '2023-01-20', 11, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20227594, 20264548, 24352, '2023-02-25', 41, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280052, 20293929, 24352, '2023-04-19', 35, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233998, 20264548, 24352, '2023-01-28', 8, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20276463, 20264548, 24352, '2023-04-16', 11, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233998, 20264548, 24352, '2023-01-10', 11, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280052, 20293929, 24352, '2023-02-02', 10, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20233998, 20264548, 24352, '2023-03-08', 27, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20227594, 20293929, 24352, '2023-03-07', 12, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20256828, 20264548, 24352, '2023-01-15', 46, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20206275, 20293929, 24352, '2023-04-17', 16, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20252611, 20293929, 24352, '2023-02-19', 47, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20227594, 20264548, 24352, '2023-04-17', 56, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20259851, 20264548, 24352, '2023-04-19', 56, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20276463, 20264548, 24352, '2023-03-25', 47, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20227594, 20264548, 24352, '2023-01-06', 40, 'Transformations');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20250276, 20264548, 24352, '2023-02-12', 17, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20276463, 20293929, 24352, '2023-01-19', 38, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20227594, 20264548, 24352, '2023-04-15', 41, 'Domains');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20299748, 26567, '2023-01-19', 19, 'Derivatives of Trig Functions');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280052, 20299748, 26567, '2023-03-28', 58, 'Derivatives of Trig Functions');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280052, 20293929, 26567, '2023-03-13', 27, 'Derivatives of Trig Functions');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280052, 20293929, 26567, '2023-03-27', 8, 'Derivatives of Trig Functions');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20279328, 20293929, 26567, '2023-04-10', 58, 'Derivatives of Trig Functions');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280052, 20264548, 26567, '2023-04-09', 53, 'Limits');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20264548, 26567, '2023-02-23', 15, 'Derivatives of Trig Functions');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20225509, 20293929, 26567, '2023-01-30', 45, 'Derivatives of Trig Functions');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20299748, 26567, '2023-01-22', 50, 'Derivatives of Trig Functions');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20293929, 26567, '2023-03-28', 31, 'Derivatives of Trig Functions');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280052, 20293929, 26567, '2023-04-01', 18, 'Limits');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280052, 20264548, 26567, '2023-02-26', 18, 'Derivatives of Trig Functions');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20279328, 20299748, 26567, '2023-02-22', 57, 'Derivatives of Trig Functions');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20279328, 20293929, 26567, '2023-02-27', 5, 'Derivatives of Trig Functions');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20228794, 20264548, 26567, '2023-01-15', 45, 'Derivatives of Trig Functions');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280052, 20264548, 26567, '2023-01-11', 56, 'Derivatives of Trig Functions');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20279328, 20299748, 26567, '2023-01-02', 30, 'Limits');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20279328, 20264548, 26567, '2023-02-04', 34, 'Limits');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20225509, 20299748, 26567, '2023-04-07', 23, 'Limits');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20279328, 20299748, 26567, '2023-03-08', 17, 'Limits');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280052, 20293929, 26567, '2023-01-08', 24, 'Limits');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20225509, 20264548, 26567, '2023-02-06', 52, 'Limits');
insert into session_t (StudentID, TutorID, CRN, Date, Duration, Description) values (20280052, 20293929, 26567, '2023-03-20', 26, 'Derivatives of Trig Functions');


/*
c++ script to save time on wriiting insert statements

#include <iostream>
#include <fstream>

using namespace std;

int main()
{
	ifstream in;
	ofstream out;
	
	int CRN, FacultyID;
	
	in.open(nums.txt);
	out.open(finally.txt);
	
	while(in >> CRN, FacultyID)
	{
		out << "insert into courseListing_t (CRN, FacultyID) values (" << CRN << ", " << FacultyID << ")\;";
	}
	
	in.close();
	out.close();
	
	return 0;
	
}

python script to randomly associate data
import random  

crn = [22664, 23142, 24100, 24352, 25287, 26765]

ids = [20270576, 20271293, 20280874]

tups = []

# num_studs = random.randint(1,len(ids))

for course in crn:
  num_studs = random.randint(1,len(ids))
  for i in range(num_studs+1):
    random.shuffle(ids)
    if ((course, ids[0])) not in tups:
      tups.append((course,ids[0]))

# print(tups)
df = open('tups.txt','w')
for tup in tups:
  df.write(f'{tup[0]} {tup[1]}\n')

df.close()
*/