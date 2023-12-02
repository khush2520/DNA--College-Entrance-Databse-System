import colours
from prettytable import PrettyTable 
import subprocess as sp
import pymysql
import pymysql.cursors

def display(output,cd):
    
    # ANSI escape code for purple text
    PURPLE = '\033[95m'
    # ANSI escape code to reset text color
    RESET = '\033[0m'
    # Get the column names
    columns = [column[0] for column in cd]

    # Create a PrettyTable instance and set the column names
    table = PrettyTable(columns)

    if (len(output) == 0):
        print(PURPLE + "No results found!" + RESET)
        return

    # Add rows to the table
    for row in output:
        table.add_row(row.values())
    print(PURPLE + str(table) + RESET)

    # Print the shaded purple table
    if (len(output) == 0):
        return
    return

