import subprocess as sp
import pymysql
import pymysql.cursors
import colours
from prettytable import PrettyTable 
import modify
import analysis
import retrieve
import display
import maskpass
        

def executeQuery(query):
    print(query, end='\n\n')

    try:
        cur.execute(query)
        con.commit()
        cd = cur.description
        output = cur.fetchall()
        display.display(output,cd)
        return 1

    except Exception as e:
        con.rollback()
        print(f"{colours.bcolors.FAIL}>>{colours.bcolors.ENDC}", e)
        return -1

def execute():
    query = input("Input any query to execute: ")
    executeQuery(query)
    input("Enter any key to continue: ")


def dispatch(ch):
    if ch == '1':
        modify.modify()
    elif ch == '2':
        retrieve.retrieve()
    elif ch == '3':
        analysis.analysis()
    elif ch == '4':
        execute()
    elif ch == '5':
        exit()
    else:
        print("Invalid Option")



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
        con = pymysql.connect(host = 'localhost',
                            #   port = 30306,
                              user = username,
                              password = password,
                              db = 'los_pollos_hermanos',
                              cursorclass = pymysql.cursors.DictCursor)

        # tmp = sp.call('clear', shell = True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        # tmp = input("Enter any key to CONTINUE>")

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
