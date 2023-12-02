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
        r = list(row.values())
        blob = b'\x89PNG\r\n\x1a\n\x00\x00\x00\rIHDR\x00\x00\x00\x01\x00\x00\x00\x01\x01\x00\x00\x00\x00\x9a\x9c\x18\x00\x00\x00\x0bI'

        if (type(r[-1])) == type(blob):
            im = r.pop()
            r.append("Image displayed")
            display_blob_as_image(im)
        table.add_row(r)
    
    print(PURPLE + str(table) + RESET)

    if (len(output) == 0):
        return
    return

def display2(output,cd):
    
    PURPLE = '\033[95m'
    RESET = '\033[0m'
    columns = [column[0] for column in cd]

    table = PrettyTable(columns)

    if (len(output) == 0):
        print(PURPLE + "No results found!" + RESET)
        return

    for row in output:
        table.add_row(row.values()[0])
    
    
    print(PURPLE + str(table) + RESET)

    if (len(output) == 0):
        return
    return

from PIL import Image
from io import BytesIO

def display_blob_as_image(blob_data):
    try:
        # Create a PIL Image from the blob data
        image = Image.open(BytesIO(blob_data))

        # Display the image
        image.show()

    except Exception as e:
        print(f"Error displaying image: {e}")

# Example usage:
# Replace your_blob_data with the actual blob data you have
your_blob_data = b'\x89PNG\r\n\x1a\n\x00\x00\x00\rIHDR\x00\x00\x00\x01\x00\x00\x00\x01\x01\x00\x00\x00\x00\x9a\x9c\x18\x00\x00\x00\x0bI'
# display_blob_as_image(your_blob_data)