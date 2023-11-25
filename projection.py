import MiniWorld
import subprocess as sp
import colours

def a():
    query = """
    SELECT 
        CONCAT(Employee.First_Name, " ", Employee.Last_Name) AS Name 
    FROM Employee 
    INNER JOIN Money_Front 
    ON Employee.Employee_ID = Money_Front.Acc_Emp_ID 
    WHERE Money_Front.Amount_Laundered >= 4800;
    """
    MiniWorld.executeQuery(query)


def b():
    territory = input("Enter Territory ID: ")
    query = f'SELECT Number_of_Employees FROM Territory WHERE Territory_ID = "{territory}";'
    MiniWorld.executeQuery(query)

def projection():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. List all managers of who laundered amount greater than 4800")
        print("2. Number of Employees in a Territory")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("3. Back")
        print("4. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell=True)

        if ch == '1' or ch == 'a':
            a()
        elif ch == '2' or ch == 'number of employees in a territory':
            b()
        elif ch == '3' or ch == 'back':
            return
        elif ch == '4' or ch == 'exit':
            exit()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")
