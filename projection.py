import subprocess as sp
import colours
from conandexec import execute
from conandexec import closeconnection

def project_college():
    city = input("Enter city name eg. Hyderabad: ")
    course = input("Enter a program name eg. Bachelor of Legislative Law: ")
    query = f"""
    SELECT Colleges.CollegeName AS college_name, College_Contacts.ContactDetails AS contact_detail
    FROM Colleges
    LEFT JOIN College_Contacts ON Colleges.CollegeID = College_Contacts.CollegeID
    WHERE Colleges.City = '{city}'
    AND Colleges.CollegeID IN (
        SELECT Colleges.CollegeID
        FROM Colleges
        INNER JOIN CollegeOffersPrograms ON Colleges.CollegeID = CollegeOffersPrograms.CollegeID
        WHERE CollegeOffersPrograms.ProgramID IN (
            SELECT Programs.ProgramID
            FROM Programs
            WHERE ProgramName = '{course}'
        )
    );
    """
    execute(query)


def project_alumni():
    college = input("Enter college name: ")
    query = f"""
    SELECT Alumni.Name AS Alumni_name, ContactDetails 
    FROM Alumni 
    LEFT JOIN Alumni_contact_details ON Alumni.AlumniID = Alumni_contact_details.AlumniID
    WHERE Alumni.CollegeID IN (
        SELECT CollegeID
        FROM Colleges
        WHERE CollegeName = '{college}'
    );

    """

    execute(query)

def project_exam():
    college = input("Enter college name: ")
    query = f"""
    SELECT EntranceExams.ExamName AS ExamName, EntranceExams.ExamDate AS ExamDate
    FROM EntranceExams
    INNER JOIN CollegeAdmitStudents ON EntranceExams.ExamName = CollegeAdmitStudents.ExamName
    INNER JOIN Colleges ON CollegeAdmitStudents.CollegeID = Colleges.CollegeID
    WHERE Colleges.CollegeName = '{college}';

    """
    execute(query)

def projection():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. CollegeName, ContactDetails of colleges in a city that offer a particular program")
        print("2. Contact details of alumni of a given college")
        print("3. ExamName, ExamDates of entrance exams are required for admission to branches in a given college")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("4. Back")
        print("5. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell=True)

        if ch == '1':
            project_college()
        elif ch == '2':
            project_alumni()
        elif ch == '3':
            project_exam()
        elif ch == '4' or ch == 'back':
            return
        elif ch == '5' or ch == 'exit':
            closeconnection()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")

