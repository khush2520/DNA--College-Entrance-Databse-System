import MiniWorld
import colours
import subprocess as sp

def a():
    numbers = input("Enter numbers to search for:")
    query = f"""
    SELECT Phone_Number, Producer_ID as ID 
        FROM Producer_Phone_Num 
        WHERE Phone_Number LIKE "%{numbers}%" 
    UNION 
        SELECT Phone_Number, Employee_ID as ID 
        FROM Emp_Phone_Num 
        WHERE Phone_Number LIKE "%{numbers}%" 
    UNION 
        SELECT Phone_Number, Customer_ID as ID 
        FROM Cust_Phone_Num 
        WHERE Phone_Number LIKE "%{numbers}%"
    """
    MiniWorld.executeQuery(query)


def b():
    starting_letter = input("Enter starting letter: ")
    query = f'SELECT Drug_Name FROM Drug WHERE Drug_Name LIKE "{starting_letter}%"'
    MiniWorld.executeQuery(query)

def search():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. Phone Number")
        print("2. Drug")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("3. Back")
        print("4. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell=True)

        if ch == '1' or ch == 'phone number':
            a()
        elif ch == '2' or ch == 'drug':
            b()
        elif ch == '3' or ch == 'back':
            return
        elif ch == '4' or ch == 'exit':
            exit()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")
