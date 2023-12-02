import subprocess as sp
from prettytable import PrettyTable 
import pymysql
import pymysql.cursors
import colours
import display
import maskpass
from conandexec import execute


def executeanyquery():
    query = input("Input any query to execute: ")
    execute(query)
    input("Enter any key to continue: ")


import modify
import analysis
import retrieve

def dispatch(ch):
    if ch == '1':
        modify.modify()
    elif ch == '2':
        retrieve.retrieve()
    elif ch == '3':
        analysis.analysis()
    elif ch == '4':
        executeanyquery()
    elif ch == '5':
        exit()
    else:
        print("Invalid Option")


from conandexec import connecttosql
# Global
while(1):
    # tmp = sp.call('clear', shell=True)

    # Can be skipped if you want to hardcode username and password
    username = input("Enter Username: ")
    # username = "root"
    # password = "Camus@2716"
    print("[Press left ctrl key to show/hide password]")
    password = maskpass.advpass()
    # password = input("Enter Password: ")
    # password = maskpass.askpass(prompt="Password:::", mask="*")

    try:
        con = connecttosql(username,password)
        with con.cursor() as cur:
            while(1):
                # tmp = sp.call('clear', shell = True)
                print("What operation do you want to perform?")
                print(f"{colours.bcolors.OKCYAN}")
                print("1. Modify")
                print("2. Retrieve")
                print("3. Analysis")
                print("4. Execute")
                print(f"{colours.bcolors.ENDC}{colours.bcolors.PINK}5. Exit\n")
                ch = input(f"\033[38;5;215mEnter choice: ").lower()
                print(f"{colours.bcolors.ENDC}")
                # tmp = sp.call('clear', shell = True)
                dispatch(ch)

    except Exception as e:
        # tmp = sp.call('clear', shell = True)
        print(e)
