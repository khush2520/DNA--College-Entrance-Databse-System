
import subprocess as sp
import colours
from conandexec import execute
from conandexec import closeconnection
from conandexec import outputs

def delete_news():
    query = f'''
    DELETE FROM NewsUpdates
    WHERE DatePublished < CURDATE() - INTERVAL 1 YEAR;
    '''
    if execute(query) == 1:
        print(f"{colours.bcolors.OKGREEN}Deleted From Database{colours.bcolors.ENDC}", end='\n\n')
    return

def del_startup():
    name = input("Enter Startup Name you want to delete: ")
    query = f"Select * From Startups where Description = '{name}'"

    o = outputs(query)

    if len(o) == 0:
        print("Startup doesnt exist in database")
        return
    query = f"DELETE FROM Startups where Description = '{name}';"
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
            del_startup()
        elif ch == '3' or ch == 'back':
            return
        elif ch == '4' or ch == 'exit':
            closeconnection()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")
