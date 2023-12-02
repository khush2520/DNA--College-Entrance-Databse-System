-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: CollegeAdmissions
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Alumni`
--

DROP TABLE IF EXISTS `Alumni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alumni` (
  `AlumniID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `CurrentCompany` varchar(100) DEFAULT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `GraduationYear` year DEFAULT NULL,
  `CollegeID` int DEFAULT NULL,
  `ProgramID` int DEFAULT NULL,
  PRIMARY KEY (`AlumniID`),
  KEY `CollegeID` (`CollegeID`),
  KEY `ProgramID` (`ProgramID`),
  CONSTRAINT `Alumni_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`),
  CONSTRAINT `Alumni_ibfk_2` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumni`
--

LOCK TABLES `Alumni` WRITE;
/*!40000 ALTER TABLE `Alumni` DISABLE KEYS */;
INSERT INTO `Alumni` VALUES
  (1, 'John Doe', 'TechCorp', 'Software Engineer', 2010, 1, 1),
  (2, 'Jane Smith', 'PowerTech', 'Electrical Engineer', 2012, 3, 2),
  (3, 'Bob Johnson', 'MechDesign', 'Mechanical Engineer', 2015, 1, 3),
  (4, 'Alice Williams', 'ConBuild', 'Civil Engineer', 2013, 1, 4),
  (5, 'Charlie Brown', 'MarketStrat', 'Marketing Manager', 2014, 2, 5);
/*!40000 ALTER TABLE `Alumni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AlumniGraduatedFromCollegeInProgram`
--

DROP TABLE IF EXISTS `AlumniGraduatedFromCollegeInProgram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AlumniGraduatedFromCollegeInProgram` (
  `CollegeID` int DEFAULT NULL,
  `AlumniID` int DEFAULT NULL,
  `ProgramID` int DEFAULT NULL,
  KEY `CollegeID` (`CollegeID`),
  KEY `AlumniID` (`AlumniID`),
  KEY `ProgramID` (`ProgramID`),
  CONSTRAINT `AlumniGraduatedFromCollegeInProgram_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`),
  CONSTRAINT `AlumniGraduatedFromCollegeInProgram_ibfk_2` FOREIGN KEY (`AlumniID`) REFERENCES `Alumni` (`AlumniID`),
  CONSTRAINT `AlumniGraduatedFromCollegeInProgram_ibfk_3` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlumniGraduatedFromCollegeInProgram`
--

LOCK TABLES `AlumniGraduatedFromCollegeInProgram` WRITE;
/*!40000 ALTER TABLE `AlumniGraduatedFromCollegeInProgram` DISABLE KEYS */;
INSERT INTO `AlumniGraduatedFromCollegeInProgram` VALUES
  (1, 1, 1),
  (3, 2, 2),
  (1, 3, 3),
  (1, 4, 4),
  (2, 5, 5);
/*!40000 ALTER TABLE `AlumniGraduatedFromCollegeInProgram` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `Alumni_contact_details`
--

DROP TABLE IF EXISTS `Alumni_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alumni_contact_details` (
  `AlumniID` int DEFAULT NULL,
  `ContactDetails` varchar(255) DEFAULT NULL,
  KEY `AlumniID` (`AlumniID`),
  CONSTRAINT `Alumni_contact_details_ibfk_1` FOREIGN KEY (`AlumniID`) REFERENCES `Alumni` (`AlumniID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumni_contact_details`
--

LOCK TABLES `Alumni_contact_details` WRITE;
/*!40000 ALTER TABLE `Alumni_contact_details` DISABLE KEYS */;
INSERT INTO `Alumni_contact_details` (`AlumniID`, `ContactDetails`) VALUES
  (1, 'john.doe@example.com'),
  (1, 'john.doe@gmail.com'),
  (2, 'jane.smith@example.com'),
  (3, 'bob.johnson@example.com'),
  (4, 'alice.williams@example.com'),
  (4, 'alice.williams@gmail.com'),
  (5, 'charlie.brown@example.com');
/*!40000 ALTER TABLE `Alumni_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollegeAdmitStudents`
--

DROP TABLE IF EXISTS `CollegeAdmitStudents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CollegeAdmitStudents` (
  `DisciplineID` varchar(255) DEFAULT NULL,
  `CollegeID` int DEFAULT NULL,
  `ProgramID` int DEFAULT NULL,
  `ExamName` varchar(255) DEFAULT NULL,
  `CutoffScore` int DEFAULT NULL,
  KEY `DisciplineID` (`DisciplineID`),
  KEY `CollegeID` (`CollegeID`),
  KEY `ProgramID` (`ProgramID`),
  KEY `ExamName` (`ExamName`),
  CONSTRAINT `CollegeAdmitStudents_ibfk_1` FOREIGN KEY (`DisciplineID`) REFERENCES `Disciplines` (`BranchName`),
  CONSTRAINT `CollegeAdmitStudents_ibfk_2` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`),
  CONSTRAINT `CollegeAdmitStudents_ibfk_3` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`),
  CONSTRAINT `CollegeAdmitStudents_ibfk_4` FOREIGN KEY (`ExamName`) REFERENCES `EntranceExams` (`ExamName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollegeAdmitStudents`
--

LOCK TABLES `CollegeAdmitStudents` WRITE;
/*!40000 ALTER TABLE `CollegeAdmitStudents` DISABLE KEYS */;
/*!40000 ALTER TABLE `CollegeAdmitStudents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollegeListedInRanking`
--

DROP TABLE IF EXISTS `CollegeListedInRanking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CollegeListedInRanking` (
  `CollegeID` int DEFAULT NULL,
  `RankingOrganization` varchar(255) DEFAULT NULL,
  `RankingValue` int DEFAULT NULL,
  KEY `CollegeID` (`CollegeID`),
  KEY `RankingOrganization` (`RankingOrganization`),
  CONSTRAINT `CollegeListedInRanking_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`),
  CONSTRAINT `CollegeListedInRanking_ibfk_2` FOREIGN KEY (`RankingOrganization`) REFERENCES `Rankings` (`RankingOrganization`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollegeListedInRanking`
--

LOCK TABLES `CollegeListedInRanking` WRITE;
/*!40000 ALTER TABLE `CollegeListedInRanking` DISABLE KEYS */;
/*!40000 ALTER TABLE `CollegeListedInRanking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollegeOffersPrograms`
--

DROP TABLE IF EXISTS `CollegeOffersPrograms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CollegeOffersPrograms` (
  `CollegeID` int DEFAULT NULL,
  `ProgramID` int DEFAULT NULL,
  KEY `CollegeID` (`CollegeID`),
  KEY `ProgramID` (`ProgramID`),
  CONSTRAINT `CollegeOffersPrograms_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`),
  CONSTRAINT `CollegeOffersPrograms_ibfk_2` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollegeOffersPrograms`
--

LOCK TABLES `CollegeOffersPrograms` WRITE;
/*!40000 ALTER TABLE `CollegeOffersPrograms` DISABLE KEYS */;
/*!40000 ALTER TABLE `CollegeOffersPrograms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `College_Contacts`
--

DROP TABLE IF EXISTS `College_Contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `College_Contacts` (
  `CollegeID` int DEFAULT NULL,
  `ContactDetails` float DEFAULT NULL,
  KEY `CollegeID` (`CollegeID`),
  CONSTRAINT `College_Contacts_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `College_Contacts`
--

LOCK TABLES `College_Contacts` WRITE;
/*!40000 ALTER TABLE `College_Contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `College_Contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Colleges`
--

DROP TABLE IF EXISTS `Colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Colleges` (
  `CollegeID` int NOT NULL,
  `CollegeName` varchar(255) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `MedianPlacement` float DEFAULT NULL,
  `HighestPlacement` float DEFAULT NULL,
  `AveragePlacement` float DEFAULT NULL,
  `PercentageOfPlacements` int DEFAULT NULL,
  `TotalSeats` int DEFAULT NULL,
  `EstablishedYear` year DEFAULT NULL,
  `Affiliations` varchar(255) DEFAULT NULL,
  `Accreditations` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CollegeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colleges`
--

LOCK TABLES `Colleges` WRITE;
/*!40000 ALTER TABLE `Colleges` DISABLE KEYS */;
INSERT INTO `Colleges` VALUES 
(1,'Indian Institute of Technology Bombay','Maharashtra','Mumbai',15.6,40.2,28.9,95,1200,1958,'IITs','NAAC'),
(2,'Delhi Technological University','Delhi','New Delhi',12.8,35.7,24.5,88,1400,1941,'DTU','AICTE'),
(3,'Anna University','Tamil Nadu','Chennai',14.5,38.9,26.7,92,1800,1978,'AU','UGC'),
(4,'Indian Institute of Management Bangalore','Karnataka','Bangalore',18.2,45.6,32.4,98,900,1973,'IIMs','AACSB'),
(5,'Jadavpur University','West Bengal','Kolkata',11.9,32.4,21.8,85,1000,1955,'JU','NAAC');
/*!40000 ALTER TABLE `Colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Colleges_from_exam`
--

DROP TABLE IF EXISTS `Colleges_from_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Colleges_from_exam` (
  `CollegeID` int DEFAULT NULL,
  `ExamName` varchar(255) DEFAULT NULL,
  KEY `CollegeID` (`CollegeID`),
  KEY `ExamName` (`ExamName`),
  CONSTRAINT `Colleges_from_exam_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`),
  CONSTRAINT `Colleges_from_exam_ibfk_2` FOREIGN KEY (`ExamName`) REFERENCES `EntranceExams` (`ExamName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colleges_from_exam`
--

LOCK TABLES `Colleges_from_exam` WRITE;
/*!40000 ALTER TABLE `Colleges_from_exam` DISABLE KEYS */;
INSERT INTO `Colleges_from_exam` (`CollegeID`, `ExamName`) VALUES 
(1, 'JEE Advance'),
(1, 'CAT'),
(1, 'GATE'),
(2, 'JEE Mains'),
(2, 'CAT'),
(3, 'GATE'),
(4, 'CAT'),
(4, 'GATE'),
(5, 'JEE Mains');
/*!40000 ALTER TABLE `Colleges_from_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Discipline_future_scope`
--

DROP TABLE IF EXISTS `Discipline_future_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Discipline_future_scope` (
  `BranchName` varchar(255) DEFAULT NULL,
  `FutureScopeCareerOpportunities` varchar(1000) DEFAULT NULL,
  KEY `BranchName` (`BranchName`),
  CONSTRAINT `Discipline_future_scope_ibfk_1` FOREIGN KEY (`BranchName`) REFERENCES `Disciplines` (`BranchName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discipline_future_scope`
--

LOCK TABLES `Discipline_future_scope` WRITE;
/*!40000 ALTER TABLE `Discipline_future_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `Discipline_future_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disciplines`
--

DROP TABLE IF EXISTS `Disciplines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Disciplines` (
  `CollegeID` int NOT NULL,
  `ProgramID` int NOT NULL,
  `BranchName` varchar(255) NOT NULL,
  `CurriculumSyllabus` varchar(255) DEFAULT NULL,
  `CourseFee` float DEFAULT NULL,
  `Seats` int DEFAULT NULL,
  `AdmissionRequirements` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CollegeID`,`ProgramID`,`BranchName`),
  KEY `fk_program_discipline` (`ProgramID`),
  KEY `idx_branch_name` (`BranchName`),
  CONSTRAINT `Disciplines_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`),
  CONSTRAINT `Disciplines_ibfk_2` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`),
  CONSTRAINT `fk_college_discipline` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`),
  CONSTRAINT `fk_program_discipline` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disciplines`
--

LOCK TABLES `Disciplines` WRITE;
/*!40000 ALTER TABLE `Disciplines` DISABLE KEYS */;
INSERT INTO `Disciplines` (`CollegeID`, `ProgramID`, `BranchName`, `CurriculumSyllabus`, `CourseFee`, `Seats`, `AdmissionRequirements`) VALUES
(1, 1, 'Computer Science and Engineering', 'CS Curriculum', 120000, 100, 'JEE Advance and Interview'),
(1, 2, 'Business Administration', 'MBA Curriculum', 200000, 50, 'CAT Score and Interview'),
(2, 1, 'Information Technology', 'IT Curriculum', 110000, 80, 'JEE Mains and Interview'),
(3, 3, 'Civil Engineering', 'Civil Engg Curriculum', 130000, 60, 'Entrance Exam and Interview'),
(4, 2, 'Finance', 'Finance Curriculum', 180000, 40, 'CAT Score and Interview'),
(5, 1, 'Electrical Engineering', 'EE Curriculum', 125000, 70, 'Entrance Exam and Interview');

/*!40000 ALTER TABLE `Disciplines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DisciplinesAvailableInProgramsInColleges`
--

DROP TABLE IF EXISTS `DisciplinesAvailableInProgramsInColleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DisciplinesAvailableInProgramsInColleges` (
  `CollegeID` int DEFAULT NULL,
  `ProgramID` int DEFAULT NULL,
  `BranchName` varchar(255) DEFAULT NULL,
  KEY `CollegeID` (`CollegeID`),
  KEY `ProgramID` (`ProgramID`),
  KEY `BranchName` (`BranchName`),
  CONSTRAINT `DisciplinesAvailableInProgramsInColleges_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`),
  CONSTRAINT `DisciplinesAvailableInProgramsInColleges_ibfk_2` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`),
  CONSTRAINT `DisciplinesAvailableInProgramsInColleges_ibfk_3` FOREIGN KEY (`BranchName`) REFERENCES `Disciplines` (`BranchName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DisciplinesAvailableInProgramsInColleges`
--

LOCK TABLES `DisciplinesAvailableInProgramsInColleges` WRITE;
/*!40000 ALTER TABLE `DisciplinesAvailableInProgramsInColleges` DISABLE KEYS */;
/*!40000 ALTER TABLE `DisciplinesAvailableInProgramsInColleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EntranceExamRequiresEntranceExam`
--

DROP TABLE IF EXISTS `EntranceExamRequiresEntranceExam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EntranceExamRequiresEntranceExam` (
  `PreliminaryExamName` varchar(255) DEFAULT NULL,
  `SecondaryExamName` varchar(255) DEFAULT NULL,
  `CutoffScore` int DEFAULT NULL,
  KEY `PreliminaryExamName` (`PreliminaryExamName`),
  KEY `SecondaryExamName` (`SecondaryExamName`),
  CONSTRAINT `EntranceExamRequiresEntranceExam_ibfk_1` FOREIGN KEY (`PreliminaryExamName`) REFERENCES `EntranceExams` (`ExamName`),
  CONSTRAINT `EntranceExamRequiresEntranceExam_ibfk_2` FOREIGN KEY (`SecondaryExamName`) REFERENCES `EntranceExams` (`ExamName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EntranceExamRequiresEntranceExam`
--

LOCK TABLES `EntranceExamRequiresEntranceExam` WRITE;
/*!40000 ALTER TABLE `EntranceExamRequiresEntranceExam` DISABLE KEYS */;
-- Insert data into EntranceExamRequiresEntranceExam
INSERT INTO `EntranceExamRequiresEntranceExam` VALUES
  ('Entrance Exam A', 'Entrance Exam B', 80),
  ('Entrance Exam A', 'Entrance Exam C', 75),
  ('Entrance Exam B', 'Entrance Exam D', 85),
  ('Entrance Exam C', 'Entrance Exam D', 90),
  ('Entrance Exam D', 'Entrance Exam E', 88),
  ('Entrance Exam A', 'Entrance Exam E', 82);
/*!40000 ALTER TABLE `EntranceExamRequiresEntranceExam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EntranceExams`
--

DROP TABLE IF EXISTS `EntranceExams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EntranceExams` (
  `ExamName` varchar(255) NOT NULL,
  `RegistrationDetails` varchar(255) DEFAULT NULL,
  `RegistrationDeadline` date DEFAULT NULL,
  `Syllabus` varchar(255) DEFAULT NULL,
  `ExamDate` date DEFAULT NULL,
  `ExamAuthorities` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ExamName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EntranceExams`
--

LOCK TABLES `EntranceExams` WRITE;
/*!40000 ALTER TABLE `EntranceExams` DISABLE KEYS */;
INSERT INTO `EntranceExams` VALUES
  ('Entrance Exam A', 'Details for Exam A registration', '2023-06-30', 'Syllabus for Exam A', '2023-07-15', 'Exam A Authorities'),
  ('Entrance Exam B', 'Details for Exam B registration', '2023-07-15', 'Syllabus for Exam B', '2023-08-01', 'Exam B Authorities'),
  ('Entrance Exam C', 'Details for Exam C registration', '2023-08-01', 'Syllabus for Exam C', '2023-08-15', 'Exam C Authorities'),
  ('Entrance Exam D', 'Details for Exam D registration', '2023-08-15', 'Syllabus for Exam D', '2023-08-30', 'Exam D Authorities'),
  ('Entrance Exam E', 'Details for Exam E registration', '2023-09-01', 'Syllabus for Exam E', '2023-09-15', 'Exam E Authorities');
/*!40000 ALTER TABLE `EntranceExams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exam_prep_resources`
--

DROP TABLE IF EXISTS `Exam_prep_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exam_prep_resources` (
  `ExamName` varchar(255) DEFAULT NULL,
  `ExamPreparationResources` varchar(255) DEFAULT NULL,
  KEY `ExamName` (`ExamName`),
  CONSTRAINT `Exam_prep_resources_ibfk_1` FOREIGN KEY (`ExamName`) REFERENCES `EntranceExams` (`ExamName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exam_prep_resources`
--

LOCK TABLES `Exam_prep_resources` WRITE;
/*!40000 ALTER TABLE `Exam_prep_resources` DISABLE KEYS */;
-- Insert data into Exam_prep_resources
INSERT INTO `Exam_prep_resources` VALUES
  ('Entrance Exam A', 'Preparation resources for Exam A'),
  ('Entrance Exam B', 'Preparation resources for Exam B'),
  ('Entrance Exam C', 'Preparation resources for Exam C'),
  ('Entrance Exam D', 'Preparation resources for Exam D'),
  ('Entrance Exam E', 'Preparation resources for Exam E');

/*!40000 ALTER TABLE `Exam_prep_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NewsUpdates`
--

DROP TABLE IF EXISTS `NewsUpdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NewsUpdates` (
  `NewsUpdatesTitle` varchar(255) NOT NULL,
  `DatePublished` date DEFAULT NULL,
  `Content` varchar(1000) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Image` blob,
  PRIMARY KEY (`NewsUpdatesTitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NewsUpdates`
--

LOCK TABLES `NewsUpdates` WRITE;
/*!40000 ALTER TABLE `NewsUpdates` DISABLE KEYS */;
INSERT INTO `NewsUpdates` VALUES
  ('Exciting News 1', '2023-01-01', 'This is the content of the first news update.', 'General', NULL),
  ('Latest Announcement', '2023-02-15', 'Read about our latest achievements and announcements.', 'Announcement', NULL),
  ('Tech Innovation', '2023-03-10', 'Discover the latest technological innovations shaping our future.', 'Technology', NULL),
  ('Sports Highlights', '2023-04-05', 'Recap of the recent sports events and achievements.', 'Sports', NULL),
  ('Community Spotlight', '2023-05-20', 'Highlighting the outstanding contributions of our community members.', 'Community', NULL);

/*!40000 ALTER TABLE `NewsUpdates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NewsUpdatesRelatedToCollege`
--

DROP TABLE IF EXISTS `NewsUpdatesRelatedToCollege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NewsUpdatesRelatedToCollege` (
  `NewsUpdatesTitle` varchar(255) DEFAULT NULL,
  `CollegeID` int DEFAULT NULL,
  KEY `NewsUpdatesTitle` (`NewsUpdatesTitle`),
  KEY `CollegeID` (`CollegeID`),
  CONSTRAINT `NewsUpdatesRelatedToCollege_ibfk_1` FOREIGN KEY (`NewsUpdatesTitle`) REFERENCES `NewsUpdates` (`NewsUpdatesTitle`),
  CONSTRAINT `NewsUpdatesRelatedToCollege_ibfk_2` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NewsUpdatesRelatedToCollege`
--

LOCK TABLES `NewsUpdatesRelatedToCollege` WRITE;
/*!40000 ALTER TABLE `NewsUpdatesRelatedToCollege` DISABLE KEYS */;

-- Insert data into NewsUpdatesRelatedToCollege
INSERT INTO `NewsUpdatesRelatedToCollege` VALUES
  ('Exciting News 1', 1),
  ('Latest Announcement', 2),
  ('Tech Innovation', 3),
  ('Sports Highlights', 4),
  ('Community Spotlight', 5),
  ('New Product Launch', 1);

/*!40000 ALTER TABLE `NewsUpdatesRelatedToCollege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NewsUpdatesRelatedToEntranceExam`
--

DROP TABLE IF EXISTS `NewsUpdatesRelatedToEntranceExam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NewsUpdatesRelatedToEntranceExam` (
  `NewsUpdatesTitle` varchar(255) DEFAULT NULL,
  `ExamName` varchar(255) DEFAULT NULL,
  KEY `NewsUpdatesTitle` (`NewsUpdatesTitle`),
  KEY `ExamName` (`ExamName`),
  CONSTRAINT `NewsUpdatesRelatedToEntranceExam_ibfk_1` FOREIGN KEY (`NewsUpdatesTitle`) REFERENCES `NewsUpdates` (`NewsUpdatesTitle`),
  CONSTRAINT `NewsUpdatesRelatedToEntranceExam_ibfk_2` FOREIGN KEY (`ExamName`) REFERENCES `EntranceExams` (`ExamName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NewsUpdatesRelatedToEntranceExam`
--

LOCK TABLES `NewsUpdatesRelatedToEntranceExam` WRITE;
/*!40000 ALTER TABLE `NewsUpdatesRelatedToEntranceExam` DISABLE KEYS */;
/*!40000 ALTER TABLE `NewsUpdatesRelatedToEntranceExam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Program_specialisations`
--

DROP TABLE IF EXISTS `Program_specialisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Program_specialisations` (
  `ProgramID` int DEFAULT NULL,
  `Specialisations` varchar(255) DEFAULT NULL,
  KEY `ProgramID` (`ProgramID`),
  CONSTRAINT `Program_specialisations_ibfk_1` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Program_specialisations`
--

LOCK TABLES `Program_specialisations` WRITE;
/*!40000 ALTER TABLE `Program_specialisations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Program_specialisations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Programs`
--

DROP TABLE IF EXISTS `Programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Programs` (
  `ProgramID` int NOT NULL,
  `ProgramName` varchar(255) DEFAULT NULL,
  `Duration` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `CareerOpportunities` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProgramID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Programs`
--

LOCK TABLES `Programs` WRITE;
/*!40000 ALTER TABLE `Programs` DISABLE KEYS */;
INSERT INTO `Programs` VALUES (1,'Computer Science and Engineering',4,'This program covers various aspects of computer science.','Software Engineer, Data Analyst'),(2,'Electrical Engineering',4,'Study of electrical systems and technologies.','Electrical Engineer, Power Systems Analyst'),(3,'Mechanical Engineering',4,'Focuses on mechanical systems and design principles.','Mechanical Engineer, Automotive Engineer'),(4,'Civil Engineering',4,'Deals with the design and construction of infrastructure.','Civil Engineer, Structural Engineer'),(5,'Business Administration',2,'Covers various aspects of business management.','Business Analyst, Marketing Manager');
/*!40000 ALTER TABLE `Programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rankings`
--

DROP TABLE IF EXISTS `Rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rankings` (
  `RankingOrganization` varchar(255) NOT NULL,
  `RankingType` varchar(50) DEFAULT NULL,
  `Year` year DEFAULT NULL,
  PRIMARY KEY (`RankingOrganization`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rankings`
--

LOCK TABLES `Rankings` WRITE;
/*!40000 ALTER TABLE `Rankings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rankings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rankings_evaluated_on`
--

DROP TABLE IF EXISTS `Rankings_evaluated_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rankings_evaluated_on` (
  `RankingOrganization` varchar(255) NOT NULL,
  `CriteriaEvaluated` varchar(255) NOT NULL,
  PRIMARY KEY (`RankingOrganization`,`CriteriaEvaluated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rankings_evaluated_on`
--

LOCK TABLES `Rankings_evaluated_on` WRITE;
/*!40000 ALTER TABLE `Rankings_evaluated_on` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rankings_evaluated_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reviews` (
  `ReviewID` int NOT NULL,
  `Rating` int DEFAULT NULL,
  `ReviewText` varchar(1000) DEFAULT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `CollegeID` int DEFAULT NULL,
  `ProgramID` int DEFAULT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `CollegeID` (`CollegeID`),
  KEY `ProgramID` (`ProgramID`),
  CONSTRAINT `Reviews_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`),
  CONSTRAINT `Reviews_ibfk_2` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReviewsOfProgramOfferedByCollege`
--

DROP TABLE IF EXISTS `ReviewsOfProgramOfferedByCollege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReviewsOfProgramOfferedByCollege` (
  `ReviewID` int DEFAULT NULL,
  `CollegeID` int DEFAULT NULL,
  `ProgramID` int DEFAULT NULL,
  KEY `ReviewID` (`ReviewID`),
  KEY `CollegeID` (`CollegeID`),
  KEY `ProgramID` (`ProgramID`),
  CONSTRAINT `ReviewsOfProgramOfferedByCollege_ibfk_1` FOREIGN KEY (`ReviewID`) REFERENCES `Reviews` (`ReviewID`),
  CONSTRAINT `ReviewsOfProgramOfferedByCollege_ibfk_2` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`),
  CONSTRAINT `ReviewsOfProgramOfferedByCollege_ibfk_3` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewsOfProgramOfferedByCollege`
--

LOCK TABLES `ReviewsOfProgramOfferedByCollege` WRITE;
/*!40000 ALTER TABLE `ReviewsOfProgramOfferedByCollege` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReviewsOfProgramOfferedByCollege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews_branch`
--

DROP TABLE IF EXISTS `Reviews_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reviews_branch` (
  `ReviewID` int DEFAULT NULL,
  `BranchName` varchar(255) DEFAULT NULL,
  KEY `ReviewID` (`ReviewID`),
  KEY `BranchName` (`BranchName`),
  CONSTRAINT `Reviews_branch_ibfk_1` FOREIGN KEY (`ReviewID`) REFERENCES `Reviews` (`ReviewID`),
  CONSTRAINT `Reviews_branch_ibfk_2` FOREIGN KEY (`BranchName`) REFERENCES `Disciplines` (`BranchName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews_branch`
--

LOCK TABLES `Reviews_branch` WRITE;
/*!40000 ALTER TABLE `Reviews_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reviews_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Startup_founder`
--

DROP TABLE IF EXISTS `Startup_founder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Startup_founder` (
  `StartupID` int DEFAULT NULL,
  `Founders` varchar(255) DEFAULT NULL,
  KEY `StartupID` (`StartupID`),
  CONSTRAINT `Startup_founder_ibfk_1` FOREIGN KEY (`StartupID`) REFERENCES `Startups` (`StartupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Startup_founder`
--

LOCK TABLES `Startup_founder` WRITE;
/*!40000 ALTER TABLE `Startup_founder` DISABLE KEYS */;
/*!40000 ALTER TABLE `Startup_founder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Startups`
--

DROP TABLE IF EXISTS `Startups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Startups` (
  `StartupID` int NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `YearOfLaunch` year DEFAULT NULL,
  `IndustryField` varchar(100) DEFAULT NULL,
  `CollegeID` int DEFAULT NULL,
  `CurrentlyValuedAt` float DEFAULT NULL,
  PRIMARY KEY (`StartupID`),
  KEY `CollegeID` (`CollegeID`),
  CONSTRAINT `Startups_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Startups`
--

LOCK TABLES `Startups` WRITE;
/*!40000 ALTER TABLE `Startups` DISABLE KEYS */;
/*!40000 ALTER TABLE `Startups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Urls_of_articles`
--

DROP TABLE IF EXISTS `Urls_of_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Urls_of_articles` (
  `NewsUpdatesTitle` varchar(255) DEFAULT NULL,
  `URLs_of_related_articles` varchar(255) DEFAULT NULL,
  KEY `NewsUpdatesTitle` (`NewsUpdatesTitle`),
  CONSTRAINT `Urls_of_articles_ibfk_1` FOREIGN KEY (`NewsUpdatesTitle`) REFERENCES `NewsUpdates` (`NewsUpdatesTitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Urls_of_articles`
--

LOCK TABLES `Urls_of_articles` WRITE;
/*!40000 ALTER TABLE `Urls_of_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `Urls_of_articles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-23 23:13:07
