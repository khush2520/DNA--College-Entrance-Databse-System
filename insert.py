import subprocess as sp
import colours
from conandexec import execute
from conandexec import closeconnection
from datetime import datetime

def get_url():
    prep_resources = []
    while True:
        resource = input("Enter url (or enter 'done' to finish): ")
        if resource.lower() == 'done':
            break
        prep_resources.append(resource)
    return prep_resources

def get_preparation_resources():
    prep_resources = []
    while True:
        resource = input("Enter preparation resource (or enter 'done' to finish): ")
        if resource.lower() == 'done':
            break
        prep_resources.append(resource)
    return prep_resources

def new_exam():

    # Takes region details as input
    examname = input("Enter Exam name: ")
    examauth = input("Enter exam authorities: ")
    syllabus = input("Enter Syllabus: ")
    
    regdeadline = input("Enter registration deadline (YYYY-MM-DD/NA): ")
    if(regdeadline == "NA"):
        regdeadline=None

    examdate = input("Enter exam date (YYYY-MM-DD/NA): ")
    if(examdate == "NA"):
        examdate=None

    regdetails = "Not announced yet"
    ask = input("Do you want to enter regustration details? (y/n): ")
    if(ask == 'y'):
        regdetails = input("Enter registration details: ")
    
    query = f"INSERT INTO EntranceExams VALUES ('{examname}','{regdetails}','{regdeadline}','{syllabus}','{examdate}','{examauth}');"
    query = query.replace("'None'", "NULL")
    if execute(query) == 1:
        ask = input("Do you want to enter preparation resources? (y/n): ")
        if(ask == 'y'):
            flag=1
            prep_resources = get_preparation_resources()

            for resource in prep_resources:
                insert_query = f'''
                INSERT INTO Exam_prep_resources VALUES ('{examname}', '{resource}');
                '''
                if execute(insert_query) != 1:
                    flag=0   
            if(flag==1):
                print(f"{colours.bcolors.OKGREEN}Inserted Into Database{colours.bcolors.ENDC}")
    return query

def new_updates():

    # Takes Money Front details as input
    title = input("Enter News/Update Title: ")
    datepub = datetime.today().date()
    print(f"Date published: {datepub}")
    content= input("Enter content: ")
    category=input("Enter news/update category: ")
    file_path=''
    blob_data=None
    ask = input("Do you want to include an image? (y/n): ")
    if(ask == 'y'):
        file_path = input("Enter the path to the image file: ")
        with open(file_path, mode='rb') as file:
            blob_data = file.read()
    if blob_data:
        values = (title,datepub, content, category, bytes(blob_data))

    else:
        values = (title,datepub, content, category, None)

    query = "INSERT INTO NewsUpdates (NewsUpdatesTitle, DatePublished, Content, Category, Image) VALUES (%s, %s, %s, %s, %s);"
    
    # print(query)

    # query = f"INSERT INTO NewsUpdates VALUES ('{title}','{datepub}','{content}','{category}',LOAD_FILE('{file_path}'));"
    # query=f"SELECT LOAD_FILE('{file_path}')"
    # query = query.replace("'None'", "NULL")    
    print(file_path)
    
    if execute(query, values) == 1:
        print(f"{colours.bcolors.OKGREEN}Inserted Into Database{colours.bcolors.ENDC}")
    
        print("Is the news related to:\n1. College\n2. Exam\n3. None  ?\n")
        ch=input("Enter choice (1/2/3): ")
        
        if(ch=='1'):
            college=input("Enter college name: ")
            query = f'''
                    INSERT INTO NewsUpdatesRelatedToCollege (NewsUpdatesTitle, CollegeID)
                    SELECT '{title}',CollegeID
                    FROM Colleges
                    WHERE CollegeName = '{college}';
                    '''
            execute(query)

        elif(ch=='2'):
            exam=input("Enter exam name: ")
            query = f'''
                    INSERT INTO NewsUpdatesRelatedToCollege VALUES ('{title}','{exam}');
                    '''
            execute(query)
        
        
        print(f"{colours.bcolors.OKGREEN}Inserted Into Database{colours.bcolors.ENDC}")
        ask = input("Do you want to enter URLs of related articles? (y/n): ")
        if(ask == 'y'):
            flag=1
            url_resources = get_url()

            for resource in url_resources:
                insert_query = f'''
                INSERT INTO Urls_of_articles VALUES ('{title}', '{resource}');
                '''
                if execute(insert_query) != 1:
                    flag=0   
            if(flag==1):
                print(f"{colours.bcolors.OKGREEN}Inserted Into Database{colours.bcolors.ENDC}")
        
    return

def prog_new():
    college=input("Enter college name: ")
    prog=input("Enter program name that college is now offering: ")
    query = f"""
    INSERT INTO CollegeOffersPrograms (CollegeID, ProgramID)
    SELECT Colleges.CollegeID, Programs.ProgramID
    FROM Colleges, Programs
    WHERE Colleges.CollegeName = '{college}' AND Programs.ProgramName = '{prog}';
    """
    execute(query)


def insert():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. Adding details of a new entrance exam.")
        print("2. Entry of recent news/updates regarding exams, colleges, programs.")
        print("3. Entry of programs recently introduced by colleges")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("4. Back")
        print("5. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell = True)

        if ch == '1' :
            new_exam()
        elif ch == '2' :
            new_updates()
        elif ch == '3':
            prog_new()
        elif ch == '4' or ch == 'back':
            return
        elif ch == '5' or ch == 'exit':
            closeconnection()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")
        