import MiniWorld
import subprocess as sp
import colours

def colleges():
    query = 'SELECT CollegeName FROM Colleges WHERE MedianPlacement > 10;'
    MiniWorld.executeQuery(query)


def ranking():
    query = 'SELECT R.RankingOrganization FROM CollegeListedInRanking R, Colleges C Where C.CollegeID = R.CollegeID and C.CollegeName = "IIT Madras;"'
    MiniWorld.executeQuery(query)


def selection():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. Colleges with median placement > 10 LPA")
        print("2. College Rankings where IIT Madras is in top colleges")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("3. Back")
        print("4. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell=True)

        if ch == '1':
            colleges()
        elif ch == '2':
            ranking()
        elif ch == '3' or ch == 'back':
            return
        elif ch == '4' or ch == 'exit':
            exit()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")
