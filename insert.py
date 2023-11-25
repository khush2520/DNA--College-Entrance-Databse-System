import MiniWorld
import subprocess as sp
import colours

def a():

    # Takes region details as input
    id = input("Enter Region ID: ")
    rname = input("Enter Region Name: ")
    oname = input("Enter Organisation Name: ")
    mgrid = input("Enter Region Manager ID: ")

    query = f"INSERT INTO Region VALUES ('{id}','{rname}','{oname}','{mgrid}');"

    if MiniWorld.executeQuery(query) == 1:
        print(f"{colours.bcolors.OKGREEN}Inserted Into Database{colours.bcolors.ENDC}")
        print("")
    return


def b():

    # Takes Money Front details as input
    fname = input("Enter Front Name: ")
    oname = input("Enter Organisation Name: ")
    accid = input("Enter Accountant ID: ")
    amount = float(input("Enter Amount Laundered: "))

    query = f"INSERT INTO Money_Front VALUES ('{fname}','{oname}','{accid}','{amount}');"

    if MiniWorld.executeQuery(query) == 1:
        print(f"{colours.bcolors.OKGREEN}Inserted Into Database{colours.bcolors.ENDC}")
        print("")
    return


def c():

    # Takes Employee details as input
    eid = input("Enter Employee ID: ")
    oname = input("Enter Organisation Name: ")
    empType = input("Enter Employee Type: ")
    sDate = input("Enter Start Date(YYYY-MM-DD): ")
    eDate = input("Enter End Date(YYYY-MM-DD/NA): ")
    rid = input("Enter Region ID: ")
    fname = input("Enter First Name: ")
    lname = input("Enter Last Name: ")
    dob = input ("Enter Date of Birth(YYYY-MM-DD): ")
    sal = float(input("Enter Salary: "))

    if eDate.upper() == 'NA':
        eDate = "9999-12-31"

    query = f"INSERT INTO Employee VALUES ('{eid}','{oname}','{empType}','{sDate}','{eDate}','{rid}', '{fname}','{lname}','{dob}','{sal}');"

    if MiniWorld.executeQuery(query) == 1:
        print(f"{colours.bcolors.OKGREEN}Inserted Into Database{colours.bcolors.ENDC}")
        print("")
    return


def insert():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. Region")
        print("2. Money Front")
        print("3. Employee")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("4. Back")
        print("5. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell = True)

        if ch == '1' or ch == 'region':
            a()
        elif ch == '2' or ch == 'money front':
            b()
        elif ch == '3' or ch == 'employee':
            c()
        elif ch == '4' or ch == 'back':
            return
        elif ch == '5' or ch == 'exit':
            exit()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")
