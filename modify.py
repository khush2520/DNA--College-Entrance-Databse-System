import subprocess as sp
import colours
from insert import insert
from delete import delete
from update import update
from conandexec import closeconnection
def modify():
    while(1):
        tmp = sp.call('clear', shell = True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. Insert")
        print("2. Delete")
        print("3. Update")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("4. Back")

        print("5. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell = True)

        if ch == '1':
            insert()
        elif ch == '2':
            delete()
        elif ch == '3':
            update()
        elif ch == '4':
            return
        elif ch == '5':
            closeconnection()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")
    return