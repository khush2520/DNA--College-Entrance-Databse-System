import colours
from prettytable import PrettyTable 
import subprocess as sp
import pymysql
import pymysql.cursors

def display(output,cd):
    
    PURPLE = '\033[95m'
    RESET = '\033[0m'
    columns = [column[0] for column in cd]

    table = PrettyTable(columns)

    if (len(output) == 0):
        print(PURPLE + "No results found!" + RESET)
        return

    for row in output:
        table.add_row(row.values())
    print(PURPLE + str(table) + RESET)

    if (len(output) == 0):
        return
    return

