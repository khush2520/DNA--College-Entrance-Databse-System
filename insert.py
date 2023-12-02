
import subprocess as sp
import colours
from conandexec import execute
from conandexec import closeconnection

# CREATE TABLE `Exam_prep_resources` (
#   `ExamName` varchar(255) DEFAULT NULL,
#   `ExamPreparationResources` varchar(255) DEFAULT NULL,
#   KEY `ExamName` (`ExamName`),
#   CONSTRAINT `Exam_prep_resources_ibfk_1` FOREIGN KEY (`ExamName`) REFERENCES `EntranceExams` (`ExamName`)
# )

def get_preparation_resources():
    prep_resources = []
    while True:
        resource = input("Enter preparation resource (or enter 'done' to finish): ")
        if resource.lower() == 'done':
            break
        prep_resources.append(resource)
    return prep_resources

def new_exam():

    # Takes region details as input
    examname = input("Enter Exam name: ")
    examauth = input("Enter exam authorities: ")
    syllabus = input("Enter Syllabus: ")
    
    regdeadline = input("Enter registration deadline (YYYY-MM-DD/NA): ")
    if(regdeadline == "NA"):
        regdeadline=None

    examdate = input("Enter exam date (YYYY-MM-DD/NA): ")
    if(examdate == "NA"):
        examdate=None

    regdetails = "Not announced yet"
    ask = input("Do you want to enter regustration details? (y/n): ")
    if(ask == 'y'):
        regdetails = input("Enter registration details: ")
    
    query = f"INSERT INTO EntranceExams VALUES ('{examname}','{regdetails}','{regdeadline}','{syllabus}','{examdate}','{examauth}');"
    query = query.replace("'None'", "NULL")
    if execute(query) == 1:
        print(f"{colours.bcolors.OKGREEN}Inserted Into Database{colours.bcolors.ENDC}")
        ask = input("Do you want to enter preparation resources? (y/n): ")
        if(ask == 'y'):
            flag=1
            prep_resources = get_preparation_resources()

            for resource in prep_resources:
                insert_query = f'''
                INSERT INTO Exam_prep_resources VALUES ('{examname}', '{resource}');
                '''
                if execute(insert_query) != 1:
                    flag=0   
            if(flag==1):
                print(f"{colours.bcolors.OKGREEN}Inserted Into Database{colours.bcolors.ENDC}")
    return query


def new_updates():

    # Takes Money Front details as input
    fname = input("Enter Front Name: ")
    oname = input("Enter Organisation Name: ")
    accid = input("Enter Accountant ID: ")
    amount = float(input("Enter Amount Laundered: "))

    query = f"INSERT INTO Money_Front VALUES ('{fname}','{oname}','{accid}','{amount}');"

    if execute(query) == 1:
        print(f"{colours.bcolors.OKGREEN}Inserted Into Database{colours.bcolors.ENDC}")
        print("")
    return





def insert():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. Adding details of a new entrance exam.")
        print("2. Entry of recent news/updates regarding exams, colleges, programs.")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("4. Back")
        print("5. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell = True)

        if ch == '1' :
            new_exam()
        elif ch == '2' :
            new_updates()
        elif ch == '4' or ch == 'back':
            return
        elif ch == '5' or ch == 'exit':
            closeconnection()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")
