Running Miniworld.py from the project directory in a terminal automatically connects to and populates the database, and also starts the Command Line Interface.
The user will be required to log in with their MySql Credentials for authentication. Below we give an overview of the implemented functions in our database.

# Introduction to the Mini-World: 
The mini-world represents a database system for managing information related to colleges and their admission cutoffs. It encompasses details about colleges, undergraduate programs, and the minimum cutoff scores required for admission. This database helps students and administrators access information about various colleges and their admission requirements. 

# Purpose of the Database: 
The primary purpose of the database is to provide a central repository for information about colleges and their admission cutoffs. Users can easily search for colleges based on specific criteria, such as location, or cutoff scores. Additionally, administrators can update and maintain the database to keep information accurate and up-to-date.

# Users of the Database:

Students: To search for colleges, undergraduate programs, and exams required for admission.
Parents: To assist students in finding suitable colleges and programs.
College Administrators: To update information about their institutions, programs, and exam requirements. 
Exam Authorities: To provide information about exams and update their details.
Website Administrators: To maintain the website and ensure data accuracy. 

# Applications of the Database:
 
College Search: Users can search for colleges and their admission cutoffs and exam requirements. 
Program Information: Users can access information about programs and their courses. 
Exam Details: Users can find information about various exams, including registration deadlines and syllabus.
College and Exam Updates: Administrators can update and maintain information about colleges, programs, and exams.

# Functions implemented:

**modify:**

insert:
1. Adding details of a new entrance exam.
2. Entry of recent news/updates regarding exams, colleges, programs.

delete:
1. Delete news/updates that are older than a year.
2. Delete startup (business shutdown).

update:
1. Update the exam dates for entrance exams every year.
2. Update exam registration details and deadlines every year.



**retrieve:**

selection:
1. Colleges with median placement > 10 LPA
2. College Rankings where IIT Madras is in top colleges

projection:
1. CollegeName, ContactDetails of colleges in a city that offer a particular program
2. Contact details of alumni of a given college
3. ExamName, ExamDates of entrance exams are required for admission to branches in a given college

aggregate
1. Average placements (median) across all colleges in a given city
2. Branch (in any college) that has the maximum cutoff score across all colleges for a particular exam.

search
1. Retrieve list of colleges whose names start with some string eg. “Indian”.
2. Retrieve list of branches with substring “Computer”.


**analysis**

1. Find a list of branches you are eligible for based on a score in an exam
2. Percentage of placements in the college with the highest NIRF ranking
3. Industries in which startups founded in Mumbai Colleges are working

