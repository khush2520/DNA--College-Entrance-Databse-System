import subprocess as sp
import pymysql
import pymysql.cursors
import colours
from prettytable import PrettyTable 
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
    # print()
    username = input("Enter Username: ")
    print("[Press left ctrl key to show/hide password]")
    password = maskpass.advpass()
    # password = maskpass.askpass(prompt="Password:::", mask="*")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server
        con = connecttosql(username,password)
        with con.cursor() as cur:
            while(1):
                # tmp = sp.call('clear', shell = True)
                print("What would you like to do today?")
                print(f"{colours.bcolors.OKCYAN}")
                print("1. Modify")
                print("2. Retrieve")
                print("3. Analysis")
                print("4. Execute")
                print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
                print("5. Exit")
                print(f"{colours.bcolors.ENDC}")
                ch = input("Enter choice: ").lower()
                # tmp = sp.call('clear', shell = True)
                dispatch(ch)

    except Exception as e:
        # tmp = sp.call('clear', shell = True)
        print(e)
