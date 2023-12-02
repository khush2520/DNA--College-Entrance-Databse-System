import pymysql
import colours
import display
import subprocess as sp
con = ""
def connecttosql(username, password):
    try:
        # Connect to the MySQL server
        global con
        con = pymysql.connect(host='localhost',
                              user=username,
                              password=password,
                              cursorclass=pymysql.cursors.DictCursor)

        with con.cursor() as cursor:
            # Check if the database 'College' exists
            cursor.execute("SHOW DATABASES LIKE 'CollegeAdmissions'")
            db_exists = cursor.fetchone()

            if not db_exists:
                # Create the 'College' database if it doesn't exist
                cursor.execute("CREATE DATABASE CollegeAdmissions")
                print("Database 'CollegeAdmissions' created")

        # Connect to the 'College' database
        con = pymysql.connect(host='localhost',
                              user=username,
                              password=password,
                              db='CollegeAdmissions',
                              cursorclass=pymysql.cursors.DictCursor)

        if con.open:
            print("Connected to database 'CollegeAdmissions'")
            command = f"mysql -u{username} -p{password} CollegeAdmissions < cadump.sql"
            sp.run(command, shell=True)
           
        else:
            print("Failed to connect to database 'CollegeAdmissions'")

    except pymysql.Error as e:
        print("Error connecting to MySQL:", e)
    return con

def execute(query):
    print(query, end='\n\n')

    try:
        # con = connecttosql(username,password)
        cur = con.cursor()
        cur.execute(query)
        con.commit()
        cd = cur.description
        output = cur.fetchall()
        if output:
            display.display(output,cd)
        return 1

    except Exception as e:
        # con.rollback()
        print(f"{colours.bcolors.FAIL}>>{colours.bcolors.ENDC}", e)
        return -1
def closeconnection():
      con.close()
      print("Connection Closed")
      exit()