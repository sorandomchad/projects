# Tutoring Service Database
In this project we will create a database for a fictional tutoring service application. 

## Objective
This projects analyzes customer data for a website selling eyeglasses. In this project we will:
  * create a marketing funnel from a survey given to customers
  * create a funnel from the journey of several customers through the process of buying a product
  * compare the results of an A/B test given to users of a website
  * provide actionable insights and recommendations based on the results

We will use SQL to query the database and aggregate the data. Then we will use MS Excel to create summary tables. Finally, we will use MS PowerPoint to present the findings and provide recommendations.

## Files
This project contains four files:

| Filename | Description |
| :-----------: | -------- |
| requirements_design.pdf | The document outlining the app requirements, the entity-relation diagram, and the relationship schema |
| ProjectDDL.sql | The code to create the tables and populate them with data  |
| queries.sql | Queries to gather insights from the tutoring service database  |
| presentation.pdf | PowerPoint presentation summarizing the entire project |


## Database
This database includes 8 tables: enrollment, student, course, courseListing, faculty, session, tutor, tutorCourses.

### Enrollment Table
A bridge table including students and the courses they are taking.

| Variable | Description |
| :-----------: | -------- |
| StudentID | The student's unique ID |
| CRN | The course's unique ID |

### Student Table
Includes enrolled student information.

| Variable | Description |
| :-----------: | -------- |
| StudentID | The student's unique ID |
| FirstName | The student's first name |
| LastName | The student's last name |
| Major | The student's declare major |
| GPA | The student's cumulative GPA |
| IsTutor | Is the student or not? |

### Course Table
Includes information about courses offered.

| Variable | Description |
| :-----------: | -------- |
| CRN | The course's unique ID |
| Title | Course title |
| Department | Department offereing the course |
| CourseCode | The course's ID within the department |

### CourseListing Table
A bridge table showing the course and the faculty memeber teaching it.

| Variable | Description |
| :-----------: | -------- |
| CRN | The course's unique ID |
| FacultyID | The faculty member's unique ID |

### Faculty Table
Includes employed faculty information.

| Variable | Description |
| :-----------: | -------- |
| FacultyID | The faculty member's unique ID |
| FirstName | The student's first name |
| LastName | The student's last name |
| Department | Department employing the faculty member |

### Tutor Table
A view with tutor information (inherited from the student table).

| Variable | Description |
| :-----------: | -------- |
| TutorID | The tutor's unique student ID |

### TutorCourses Table
A bridge table containing information about the courses a tutor offers.

| Variable | Description |
| :-----------: | -------- |
| CRN | The course's unique ID |
| TutorID | The tutor's unique student ID |
| Availability | The tutor's schedule |

### TutorCourses Table
A bridge table containing information about each tutoring session.

| Variable | Description |
| :-----------: | -------- |
| SessionID | The session's unique ID |
| StudentID | The tutee's unique ID |
| TutorID | The tutor's unique student ID |
| CRN | The course's unique ID |
| Date | Session date |
| Duration | Session length |
| Description | Topics covered in the session |
