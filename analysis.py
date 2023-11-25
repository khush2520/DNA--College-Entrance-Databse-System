import MiniWorld
import colours
import subprocess as sp
from datetime import datetime

def a():
    todayDate = datetime.today().strftime('%Y-%m-%d')
    getDate = input("Enter date from when you want in form yyyy-mm-dd: ")
    query = f"""
SELECT Region_ID, SUM(Packages) / DATEDIFF('{todayDate}', '{getDate}') as Pac
FROM
(
    SELECT SUM(Num_Pkg_bought) as Packages, Falc_Emp_ID as FID
    FROM Buys
    WHERE Trans_Date >= '{getDate}'
    GROUP BY FID
) as A
INNER JOIN
(
    SELECT Employee_ID, Region_ID
    FROM Employee
    WHERE Employee_Type = 'Falcon'
) as F
ON F.Employee_ID = A.FID
GROUP BY F.Region_ID;
    """
    MiniWorld.executeQuery(query)


def b():
    startDate = input("Enter start date of the week in form yyyy-mm-dd: ")
    query = f"""
SELECT Ltnt_Emp_ID, Sum(amount) as Profit
FROM
(
    SELECT FID, Packages * (Total_Pkg_buy - Total_Pkg_sell) as amount
    FROM
    (
            SELECT Drug_ID as DID, sum(Num_Pkg_bought) as Packages, Falc_Emp_ID as FID
            FROM Buys
            WHERE Trans_Date >= '{startDate}' AND Trans_Date <= DATE_ADD('{startDate}', INTERVAL 7 DAY)
            GROUP BY DID, Falc_Emp_ID
    ) as F
    INNER JOIN Drug
    ON Drug_ID = DID
) as A
INNER JOIN Falcon
ON Employee_ID = FID
GROUP BY Ltnt_Emp_ID;
"""
    MiniWorld.executeQuery(query)


def c():
    query = """
SELECT
    Region_ID,
    COUNT(Customer_ID) as Customers,
    EXTRACT(MONTH FROM Trans_Date) as M,
    EXTRACT(YEAR FROM Trans_Date) as Y
FROM Buys
INNER JOIN
(
    SELECT Employee_ID, Region_ID
    FROM Employee
    WHERE Employee_Type = 'Falcon'
) as F
ON Falc_Emp_ID  = Employee_ID
GROUP BY Y, M, Region_ID
ORDER BY Region_ID, Y, M ASC;
    """
    MiniWorld.executeQuery(query)


def analysis():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. Average number of packages sold in a region after a particular date")
        print("2. Profit a lieutenant generates in a week")
        print("3. Change in number of buyers in a territory over the months")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("4. Back")
        print("5. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell=True)

        if ch == '1' or ch == 'average number of packages sold in a region after a particular date':
            a()
        elif ch == '2' or ch == 'profit a lieutenant generates in a week':
            b()
        elif ch == '3' or ch == 'change of number of buyers in a territory over the months':
            c()
        elif ch == '4' or ch == 'back':
            return
        elif ch == '5' or ch == 'exit':
            exit()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")
