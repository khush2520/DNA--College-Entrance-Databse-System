
import colours
import subprocess as sp
from conandexec import execute
from conandexec import closeconnection

def college_name():
    start_name = input("Enter starting substring:")
    query = f"""
        SELECT CollegeName, City, MedianPlacement 
        FROM Colleges 
        WHERE CollegeName LIKE "{start_name}%" 
    """
    execute(query)


def branch_name():
    substring = input("Enter substring to search for: ")
    query = f'SELECT BranchName, CurriculumSyllabus FROM Disciplines WHERE BranchName LIKE "%{substring}%"'
    execute(query)

def search():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. Retrieve list of colleges whose names start with some string eg. “Indian”.")
        print("2. Retrieve list of branches with substring “Computer”.")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("3. Back")
        print("4. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell=True)

        if ch == '1':
            college_name()
        elif ch == '2':
            branch_name()
        elif ch == '3' or ch == 'back':
            return
        elif ch == '4' or ch == 'exit':
            closeconnection()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")
