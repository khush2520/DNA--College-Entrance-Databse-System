import MiniWorld
import subprocess as sp
import colours

def a():
    query = 'SELECT * FROM Drug WHERE Purity > 90;'
    MiniWorld.executeQuery(query)


def b():
    query = 'SELECT * FROM Employee WHERE Employee_Type = "Accountant";'
    MiniWorld.executeQuery(query)


def selection():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. Drugs with purity > 90%")
        print("2. Accountant Details")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("3. Back")
        print("4. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell=True)

        if ch == '1' or ch == 'drugs with purity > 90%':
            a()
        elif ch == '2' or ch == 'accountant details':
            b()
        elif ch == '3' or ch == 'back':
            return
        elif ch == '4' or ch == 'exit':
            exit()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")
