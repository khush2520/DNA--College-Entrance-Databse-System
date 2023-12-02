
import colours
import subprocess as sp
from conandexec import execute
from conandexec import closeconnection

def avg_placement():
    city = input("Enter city name eg. Mumbai: ")
    query = f"""
    SELECT City, AVG(MedianPlacement) as Avg_median_placement
    FROM Colleges
    WHERE City = "{city}"
    GROUP BY City;
    """
    execute(query)



def max_cutoff():
    exam = input("Enter exam name: ")
    query = f"""
    SELECT CutoffScore as max_cutoff_score, DisciplineID as branch_name, CollegeName as college_name
    FROM CollegeAdmitStudents INNER JOIN Colleges ON CollegeAdmitStudents.CollegeID = Colleges.CollegeID
    WHERE ExamName = "{exam}" AND CutoffScore IN( 
                                                    SELECT MAX(CutoffScore) as max_cutoff_score
                                                    FROM CollegeAdmitStudents
                                                );
    """
    execute(query)
    
def sum_seats():
    branch = input("Enter Branch name: ")
    query = f"""
    SELECT sum(D.Seats) as Seats
    FROM Disciplines D
    join Colleges C on C.CollegeID = D.CollegeID
    where BranchName = '{branch}';
    """ 
    execute(query)


def aggregate():
    while(1):
        tmp = sp.call('clear', shell = True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. Average placements (median) across all colleges in a given city")
        print("2. Branch (in any college) that has the maximum cutoff score across all colleges for a particular exam.")
        print("3. Total number of seats available for a given branch (eg. ECE) across all colleges.")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("4. Back")
        print("5. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell = True)

        if ch == '1':
            avg_placement()
        elif ch == '2':
            max_cutoff()
        elif ch == '3':
            sum_seats()
        elif ch == '4' or ch == 'back':
            return
        elif ch == '5' or ch == 'exit':
            closeconnection()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")
