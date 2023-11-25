import MiniWorld
import colours
import subprocess as sp

def a():
    date = input("Enter Date in the form yyyy-mm-dd: ")
    query = f"""
    SELECT Sum(Falc.Packages) as Packages, Falcon.Territory_ID as Territory
    FROM
    (
        SELECT SUM(Num_Pkg_bought) as Packages, Falc_Emp_ID
        FROM Buys
        WHERE Trans_Date = "{date}"
        GROUP By Falc_Emp_ID
    ) as Falc
    INNER JOIN Falcon
    WHERE Falcon.Employee_ID = Falc.Falc_Emp_ID
    GROUP BY Falcon.Territory_ID;
    """
    MiniWorld.executeQuery(query)


def b():
    year = input("Enter Year: ");
    query = f'SELECT Sum(Net_Revenue) - Sum(Net_Spending) AS Net_Profit FROM Organisation_Details WHERE Date >= "{year}-01-01" AND Date <= "{year}-12-31";'
    MiniWorld.executeQuery(query)


def aggregate():
    while(1):
        tmp = sp.call('clear', shell = True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. Total Amount of Packages sold in a day")
        print("2. Net profit acquired by end of the year")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("3. Back")
        print("4. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell = True)

        if ch == '1' or ch == 'total amount of packages sold in a day':
            a()
        elif ch == '2' or ch == 'net profit acquired by end of the year':
            b()
        elif ch == '3' or ch == 'back':
            return
        elif ch == '4' or ch == 'exit':
            exit()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")
