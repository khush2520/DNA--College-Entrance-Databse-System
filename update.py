
import colours
import subprocess as sp
from conandexec import execute
from conandexec import closeconnection

def exam_dates():
    ExamName = input("Enter Exam Name: ")
    ExamDate = input("Enter Updated Exam Date: ")

    query = f"UPDATE EntranceExams SET ExamDate = '{ExamDate}' where ExamName = '{ExamName}';"

    if execute(query) == 1:
        print(f"{colours.bcolors.OKGREEN}Updated Database{colours.bcolors.ENDC}")
        print("")
    return


def exam_reg():
    ExamName = input("Enter Exam Name: ")
    RegistrationDetails = input("Enter Updated Exam Registration: ")

    query = f"UPDATE EntranceExams SET RegistrationDetails  = '{RegistrationDetails}' where ExamName = '{ExamName}';"

    if execute(query) == 1:
        print(f"{colours.bcolors.OKGREEN}Updated Database{colours.bcolors.ENDC}")
        print("")
    return


def c():
    name = input("Enter Organisation name: ")
    value = float(input("Enter Updated Market Value: "))

    query = f"UPDATE Organisation SET Market_Value = {value} where Organisation_Name = '{name}'"

    if execute(query) == 1:
        print(f"{colours.bcolors.OKGREEN}Updated Database{colours.bcolors.ENDC}")
        print("")
    return


def update():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. Update the exam dates for entrance exams every year.")
        print("2. Update exam registration details and deadlines every year")
        print("3. Update the data related to placements of graduates from various programs, branches and colleges annually.")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("4. Back")
        print("5. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell=True)

        if ch == '1':
            exam_dates()
        elif ch == '2':
            exam_reg()
        elif ch == '3':
            print("Lol sike i did only two updates")
        elif ch == '4' or ch == 'back':
            return
        elif ch == '5' or ch == 'exit':
            exit()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")

