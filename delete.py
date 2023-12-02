
import subprocess as sp
import colours
from conandexec import execute
from conandexec import closeconnection

def delete_news():
    query = f'''
    DELETE FROM NewsUpdates
    WHERE DatePublished < CURDATE() - INTERVAL 1 YEAR;
    '''

    if execute(query) == 1:
        print(f"{colours.bcolors.OKGREEN}Deleted From Database{colours.bcolors.ENDC}", end='\n\n')
    return


def b():
    fname = input("Enter Front Name you want to delete: ")
    oname = input("Enter Organisation Name you want to delete: ")
    accid = input("Enter Accountant ID you want to delete: ")

    query = f"DELETE FROM Money_Front where Front_Name = '{fname}' AND Organisation_Name = '{oname}' AND Acc_Emp_ID = '{accid}';"

    if execute(query) == 1:
        print(f"{colours.bcolors.OKGREEN}Deleted From Database{colours.bcolors.ENDC}", end='\n\n')
    return


def delete():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. Delete news/updates that are older than a year.")
        print("2. Delete startup (business shutdown).")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("3. Back")
        print("4. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell = True)

        if ch == '1':
            delete_news()
        elif ch == '2':
            b()
        elif ch == '3' or ch == 'back':
            return
        elif ch == '4' or ch == 'exit':
            exit()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")

