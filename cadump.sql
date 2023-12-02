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
  CONSTRAINT `Alumni_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Alumni_ibfk_2` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumni`
--

LOCK TABLES `Alumni` WRITE;
/*!40000 ALTER TABLE `Alumni` DISABLE KEYS */;
INSERT INTO `Alumni` VALUES (1,'Medha Prasad','TechCorp','Software Engineer',2010,1,1),(2,' Smith','PowerTech','Electrical Engineer',2012,3,2),(3,'Bob Johnson','MechDesign','Mechanical Engineer',2015,1,3),(4,'Alice Williams','ConBuild','Civil Engineer',2013,1,4),(5,'Charlie Brown','MarketStrat','Marketing Manager',2014,2,5);
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
  CONSTRAINT `AlumniGraduatedFromCollegeInProgram_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `AlumniGraduatedFromCollegeInProgram_ibfk_2` FOREIGN KEY (`AlumniID`) REFERENCES `Alumni` (`AlumniID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AlumniGraduatedFromCollegeInProgram_ibfk_3` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlumniGraduatedFromCollegeInProgram`
--

LOCK TABLES `AlumniGraduatedFromCollegeInProgram` WRITE;
/*!40000 ALTER TABLE `AlumniGraduatedFromCollegeInProgram` DISABLE KEYS */;
INSERT INTO `AlumniGraduatedFromCollegeInProgram` VALUES (1,1,1),(3,2,2),(1,3,3),(1,4,4),(2,5,5);
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
  CONSTRAINT `Alumni_contact_details_ibfk_1` FOREIGN KEY (`AlumniID`) REFERENCES `Alumni` (`AlumniID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumni_contact_details`
--

LOCK TABLES `Alumni_contact_details` WRITE;
/*!40000 ALTER TABLE `Alumni_contact_details` DISABLE KEYS */;
INSERT INTO `Alumni_contact_details` VALUES (1,'john.doe@example.com'),(1,'john.doe@gmail.com'),(2,'jane.smith@example.com'),(3,'bob.johnson@example.com'),(4,'alice.williams@example.com'),(4,'alice.williams@gmail.com'),(5,'charlie.brown@example.com');
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
  CONSTRAINT `CollegeAdmitStudents_ibfk_1` FOREIGN KEY (`DisciplineID`) REFERENCES `Disciplines` (`BranchName`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `CollegeAdmitStudents_ibfk_2` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CollegeAdmitStudents_ibfk_3` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CollegeAdmitStudents_ibfk_4` FOREIGN KEY (`ExamName`) REFERENCES `EntranceExams` (`ExamName`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollegeAdmitStudents`
--

LOCK TABLES `CollegeAdmitStudents` WRITE;
/*!40000 ALTER TABLE `CollegeAdmitStudents` DISABLE KEYS */;
INSERT INTO `CollegeAdmitStudents` VALUES ('Computer Science and Engineering',1,1,'JEE Advance',90),('Electrical Engineering',1,1,'JEE Advance',85),('Business Administration',1,2,'CAT',80),('Information Technology',2,1,'JEE Mains',85),('Civil Engineering',3,1,'GATE',70),('Finance',4,2,'CAT',75),('Computer Science and Engineering',2,1,'JEE Mains',88),('Electrical Engineering',5,1,'JEE Mains',87);
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
  CONSTRAINT `CollegeListedInRanking_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `CollegeListedInRanking_ibfk_2` FOREIGN KEY (`RankingOrganization`) REFERENCES `Rankings` (`RankingOrganization`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollegeListedInRanking`
--

LOCK TABLES `CollegeListedInRanking` WRITE;
/*!40000 ALTER TABLE `CollegeListedInRanking` DISABLE KEYS */;
INSERT INTO `CollegeListedInRanking` VALUES (1,'QS World University Rankings',50),(2,'Times Higher Education',30),(3,'QS World University Rankings',80),(4,'Financial Times MBA Ranking',15),(5,'QS World University Rankings',65),(6,'QS World University Rankings',110);
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
  CONSTRAINT `CollegeOffersPrograms_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `CollegeOffersPrograms_ibfk_2` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollegeOffersPrograms`
--

LOCK TABLES `CollegeOffersPrograms` WRITE;
/*!40000 ALTER TABLE `CollegeOffersPrograms` DISABLE KEYS */;
INSERT INTO `CollegeOffersPrograms` VALUES (1,1),(1,2),(2,1),(3,3),(4,2),(5,1),(5,4);
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
  `ContactDetails` varchar(255) DEFAULT NULL,
  KEY `CollegeID` (`CollegeID`),
  CONSTRAINT `College_Contacts_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `College_Contacts`
--

LOCK TABLES `College_Contacts` WRITE;
/*!40000 ALTER TABLE `College_Contacts` DISABLE KEYS */;
INSERT INTO `College_Contacts` VALUES (1,'123'),(1,'123'),(2,'987'),(2,'987'),(3,'111'),(3,'111'),(4,'555'),(5,'999'),(5,'999');
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
INSERT INTO `Colleges` VALUES (1,'Indian Institute of Technology Bombay','Maharashtra','Mumbai',15.6,40.2,28.9,95,1200,1958,'IITs','NAAC'),(2,'Delhi Technological University','Delhi','New Delhi',12.8,35.7,24.5,88,1400,1941,'DTU','AICTE'),(3,'Anna University','Tamil Nadu','Chennai',14.5,38.9,26.7,92,1800,1978,'AU','UGC'),(4,'Indian Institute of Management Bangalore','Karnataka','Bangalore',18.2,45.6,32.4,98,900,1973,'IIMs','AACSB'),(5,'Jadavpur University','West Bengal','Kolkata',11.9,32.4,21.8,85,1000,1955,'JU','NAAC'),(6,'IIT Madras','Tamil Nadu','Madras',15.6,40.2,28.9,95,1200,1958,'IITs','NAAC');
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
  CONSTRAINT `Colleges_from_exam_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Colleges_from_exam_ibfk_2` FOREIGN KEY (`ExamName`) REFERENCES `EntranceExams` (`ExamName`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colleges_from_exam`
--

LOCK TABLES `Colleges_from_exam` WRITE;
/*!40000 ALTER TABLE `Colleges_from_exam` DISABLE KEYS */;
INSERT INTO `Colleges_from_exam` VALUES (1,'JEE Advance'),(1,'CAT'),(1,'GATE'),(2,'JEE Mains'),(2,'CAT'),(3,'GATE'),(4,'CAT'),(4,'GATE'),(5,'JEE Mains');
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
  CONSTRAINT `Discipline_future_scope_ibfk_1` FOREIGN KEY (`BranchName`) REFERENCES `Disciplines` (`BranchName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discipline_future_scope`
--

LOCK TABLES `Discipline_future_scope` WRITE;
/*!40000 ALTER TABLE `Discipline_future_scope` DISABLE KEYS */;
INSERT INTO `Discipline_future_scope` VALUES ('Computer Science and Engineering','Opportunities in software development, artificial intelligence, data science, and more.'),('Computer Science and Engineering','Exploring research roles, machine learning, and software engineering leadership.'),('Business Administration','Careers in management, finance, marketing, and entrepreneurship.'),('Information Technology','Roles in network administration, cybersecurity, database management, and software development.'),('Civil Engineering','Opportunities in construction, infrastructure development, project management, and environmental engineering.'),('Finance','Careers in banking, investment analysis, financial planning, and corporate finance.'),('Electrical Engineering','Roles in power systems, electronics, telecommunications, and renewable energy.');
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
  CONSTRAINT `fk_college_discipline` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_program_discipline` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disciplines`
--

LOCK TABLES `Disciplines` WRITE;
/*!40000 ALTER TABLE `Disciplines` DISABLE KEYS */;
INSERT INTO `Disciplines` VALUES (1,1,'Computer Science and Engineering','CS Curriculum',120000,100,'JEE Advance and Interview'),(1,2,'Business Administration','MBA Curriculum',200000,50,'CAT Score and Interview'),(2,1,'Computer Science and Engineering','CS Curriculum',135000,100,'JEE Mains and Interview'),(2,1,'Information Technology','IT Curriculum',110000,80,'JEE Mains and Interview'),(3,1,'Civil Engineering','Civil Engg Curriculum',130000,60,'12th Pass and Interview'),(4,2,'Finance','Finance Curriculum',180000,40,'CAT Score and Interview'),(5,1,'Electrical Engineering','EE Curriculum',125000,70,'JEE Mains and Interview');
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
  CONSTRAINT `DisciplinesAvailableInProgramsInColleges_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `DisciplinesAvailableInProgramsInColleges_ibfk_2` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DisciplinesAvailableInProgramsInColleges_ibfk_3` FOREIGN KEY (`BranchName`) REFERENCES `Disciplines` (`BranchName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DisciplinesAvailableInProgramsInColleges`
--

LOCK TABLES `DisciplinesAvailableInProgramsInColleges` WRITE;
/*!40000 ALTER TABLE `DisciplinesAvailableInProgramsInColleges` DISABLE KEYS */;
INSERT INTO `DisciplinesAvailableInProgramsInColleges` VALUES (1,1,'Computer Science and Engineering'),(1,2,'Business Administration'),(2,1,'Information Technology'),(3,1,'Civil Engineering'),(4,2,'Finance'),(2,1,'Computer Science and Engineering'),(5,1,'Electrical Engineering');
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
  CONSTRAINT `EntranceExamRequiresEntranceExam_ibfk_1` FOREIGN KEY (`PreliminaryExamName`) REFERENCES `EntranceExams` (`ExamName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EntranceExamRequiresEntranceExam_ibfk_2` FOREIGN KEY (`SecondaryExamName`) REFERENCES `EntranceExams` (`ExamName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EntranceExamRequiresEntranceExam`
--

LOCK TABLES `EntranceExamRequiresEntranceExam` WRITE;
/*!40000 ALTER TABLE `EntranceExamRequiresEntranceExam` DISABLE KEYS */;
INSERT INTO `EntranceExamRequiresEntranceExam` VALUES ('JEE Advance','JEE Mains',80),('NEET PG0','NEET UG',95);
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
  PRIMARY KEY (`ExamName`),
  CONSTRAINT `chk_exam_date_registration_date` CHECK ((`ExamDate` > `RegistrationDeadline`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EntranceExams`
--

LOCK TABLES `EntranceExams` WRITE;
/*!40000 ALTER TABLE `EntranceExams` DISABLE KEYS */;
INSERT INTO `EntranceExams` VALUES ('AIIMS PG','Details for AIIMS PG registration','2023-11-15','Syllabus for AIIMS PG','2023-11-30','AIIMS PG Authorities'),('CAT','Details for CAT registration','2023-09-30','Syllabus for CAT','2023-10-15','CAT Authorities'),('CMAT','Details for CMAT registration','2023-08-31','Syllabus for CMAT','2023-09-15','CMAT Authorities'),('GATE','Details for GATE registration','2023-10-15','Syllabus for GATE','2023-10-30','GATE Authorities'),('JEE Advance','Details for JEE Advance registration','2023-11-30','Syllabus for JEE Advance','2023-12-15','NTA'),('JEE Mains','Details for JEE Mains registration','2023-12-31','Syllabus for JEE Mains','2024-01-15','NTA'),('NEET UG','Details for NEET UG registration','2023-10-31','Syllabus for NEET UG','2023-11-15','NTA'),('XAT','Details for XAT registration','2023-09-15','Syllabus for XAT','2023-09-30','XAT Authorities');
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
  CONSTRAINT `Exam_prep_resources_ibfk_1` FOREIGN KEY (`ExamName`) REFERENCES `EntranceExams` (`ExamName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exam_prep_resources`
--

LOCK TABLES `Exam_prep_resources` WRITE;
/*!40000 ALTER TABLE `Exam_prep_resources` DISABLE KEYS */;
INSERT INTO `Exam_prep_resources` VALUES ('JEE Mains','Books, Online Courses'),('JEE Mains','Mock Tests'),('JEE Advance','Advanced Study Material'),('JEE Advance','Previous Year Papers'),('NEET UG','Biology Guides'),('NEET UG','Physics Guides'),('NEET UG','Chemistry Guides'),('CAT','Quantitative Aptitude Books'),('CAT','Mock CAT Series'),('XAT','Verbal Ability'),('XAT','Decision Making Books'),('GATE','GATE Study Material'),('GATE','Practice Tests'),('AIIMS PG','Medical Science Books'),('AIIMS PG','AIIMS PG Mock Tests'),('CMAT','Quantitative Techniques'),('CMAT','Logical Reasoning Guides');
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
INSERT INTO `NewsUpdates` VALUES ('Anna University Hosts National Technology Conference','2023-08-20','Anna University brings together experts for a national conference on technology.','Conference',NULL),('DTU Announces New Research Initiatives','2023-07-10','Delhi Technological University introduces innovative research projects.','Academic',NULL),('Exciting News at IIT Bombay','2023-06-01','IIT Bombay achieves a new milestone in research and development.','Academic',NULL),('IIM Bangalore Tops Global MBA Rankings','2023-09-05','IIM Bangalore secures the top position in global MBA program rankings.','Ranking',NULL),('Jadavpur University Celebrates Diamond Jubilee','2023-10-15','Jadavpur University marks its 75th anniversary with grand celebrations.','Anniversary',NULL);
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
  CONSTRAINT `NewsUpdatesRelatedToCollege_ibfk_1` FOREIGN KEY (`NewsUpdatesTitle`) REFERENCES `NewsUpdates` (`NewsUpdatesTitle`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `NewsUpdatesRelatedToCollege_ibfk_2` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NewsUpdatesRelatedToCollege`
--

LOCK TABLES `NewsUpdatesRelatedToCollege` WRITE;
/*!40000 ALTER TABLE `NewsUpdatesRelatedToCollege` DISABLE KEYS */;
INSERT INTO `NewsUpdatesRelatedToCollege` VALUES ('Exciting News at IIT Bombay',1),('DTU Announces New Research Initiatives',2),('Anna University Hosts National Technology Conference',3),('IIM Bangalore Tops Global MBA Rankings',4),('Jadavpur University Celebrates Diamond Jubilee',5),('New Product Launch at IIT Bombay',1);
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
  CONSTRAINT `NewsUpdatesRelatedToEntranceExam_ibfk_1` FOREIGN KEY (`NewsUpdatesTitle`) REFERENCES `NewsUpdates` (`NewsUpdatesTitle`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `NewsUpdatesRelatedToEntranceExam_ibfk_2` FOREIGN KEY (`ExamName`) REFERENCES `EntranceExams` (`ExamName`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NewsUpdatesRelatedToEntranceExam`
--

LOCK TABLES `NewsUpdatesRelatedToEntranceExam` WRITE;
/*!40000 ALTER TABLE `NewsUpdatesRelatedToEntranceExam` DISABLE KEYS */;
INSERT INTO `NewsUpdatesRelatedToEntranceExam` VALUES ('Exciting News at IIT Bombay','JEE Mains'),('DTU Announces New Research Initiatives','CAT'),('Anna University Hosts National Technology Conference','GATE'),('IIM Bangalore Tops Global MBA Rankings','CAT'),('Jadavpur University Celebrates Diamond Jubilee','JEE Mains'),('New Product Launch at IIT Bombay','JEE Mains');
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
  CONSTRAINT `Program_specialisations_ibfk_1` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Program_specialisations`
--

LOCK TABLES `Program_specialisations` WRITE;
/*!40000 ALTER TABLE `Program_specialisations` DISABLE KEYS */;
INSERT INTO `Program_specialisations` VALUES (1,'Electrical Engineering'),(1,'Computer Science and Engineering'),(1,'Mechanical Engineering'),(1,'Civil Engineering'),(2,'Professor'),(3,'Surgeon'),(1,'Electronics and Communication Engineering');
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
INSERT INTO `Programs` VALUES (1,'BTech',4,'study pf technology',''),(2,'BSc',4,'study of sciences','Proffessor, TA'),(3,'MBBS',4,'study of medicine','bleh, Surgeon'),(4,'IPM',2,'study of management','Business Analyst, Marketing Manager'),(5,'LLB',2,'study of law','Advocate');
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
INSERT INTO `Rankings` VALUES ('Business Today - MDRA Best Business Schools Survey','MBA',2022),('National Assessment and Accreditation Council (NAAC)','Accreditation',2021),('National Institutional Ranking Framework (NIRF)','Engineering',2021),('QS MBA Rankings','Overall',2022),('QS World University Rankings','Overall',2022),('The Times Higher Education (THE) World University Rankings','Business School',2023);
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
  PRIMARY KEY (`RankingOrganization`,`CriteriaEvaluated`),
  CONSTRAINT `fk_Rankings_evaluated_on_Rankings` FOREIGN KEY (`RankingOrganization`) REFERENCES `Rankings` (`RankingOrganization`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rankings_evaluated_on`
--

LOCK TABLES `Rankings_evaluated_on` WRITE;
/*!40000 ALTER TABLE `Rankings_evaluated_on` DISABLE KEYS */;
INSERT INTO `Rankings_evaluated_on` VALUES ('Business Today - MDRA Best Business Schools Survey','Academic Excellence'),('Business Today - MDRA Best Business Schools Survey','Infrastructure and Facilities'),('National Assessment and Accreditation Council (NAAC)','Curricular Aspects'),('National Assessment and Accreditation Council (NAAC)','Teaching-Learning and Evaluation'),('National Institutional Ranking Framework (NIRF)','Research and Professional Practice'),('National Institutional Ranking Framework (NIRF)','Teaching, Learning & Resources'),('QS MBA Rankings','Employability'),('QS MBA Rankings','Return on Investment'),('QS World University Rankings','Academic Reputation'),('QS World University Rankings','Employer Reputation'),('QS World University Rankings','Faculty/Student Ratio'),('The Times Higher Education (THE) World University Rankings','International Diversity'),('The Times Higher Education (THE) World University Rankings','Research'),('The Times Higher Education (THE) World University Rankings','Teaching');
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
  CONSTRAINT `Reviews_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Reviews_ibfk_2` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES (1,4,'Great college with excellent faculty and infrastructure.','JohnDoe',1,1),(2,5,'I had an amazing experience at DTU. The campus is vibrant, and the courses are well-designed.','AliceSmith',2,1),(3,3,'Anna University has good academics, but the campus facilities could be improved.','TechEnthusiast',3,3),(4,5,'IIM Bangalore offers top-notch MBA programs. The placements are outstanding.','MBAAspirant',4,2),(5,4,'Jadavpur University provides a strong foundation in engineering. The cultural events are a highlight.','ArtsAndTech',5,1),(6,3,'The college needs to focus more on placement opportunities. The faculty is knowledgeable.','ConcernedStudent',1,2),(7,5,'Excellent electrical engineering program with practical learning opportunities.','FutureEngineer',5,1);
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
  CONSTRAINT `ReviewsOfProgramOfferedByCollege_ibfk_1` FOREIGN KEY (`ReviewID`) REFERENCES `Reviews` (`ReviewID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ReviewsOfProgramOfferedByCollege_ibfk_2` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ReviewsOfProgramOfferedByCollege_ibfk_3` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewsOfProgramOfferedByCollege`
--

LOCK TABLES `ReviewsOfProgramOfferedByCollege` WRITE;
/*!40000 ALTER TABLE `ReviewsOfProgramOfferedByCollege` DISABLE KEYS */;
INSERT INTO `ReviewsOfProgramOfferedByCollege` VALUES (1,1,1),(2,2,1),(3,3,3),(4,4,2),(5,5,1),(6,1,2),(7,5,1);
/*!40000 ALTER TABLE `ReviewsOfProgramOfferedByCollege` ENABLE KEYS */;
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
  CONSTRAINT `Startup_founder_ibfk_1` FOREIGN KEY (`StartupID`) REFERENCES `Startups` (`StartupID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Startup_founder`
--

LOCK TABLES `Startup_founder` WRITE;
/*!40000 ALTER TABLE `Startup_founder` DISABLE KEYS */;
INSERT INTO `Startup_founder` VALUES (1,'John Doe'),(1,'Jane Smith'),(2,'Alice Johnson'),(2,'Bob Davis'),(3,'Emily Brown'),(3,'David Wilson'),(4,'Michael Lee'),(4,'Sarah Turner'),(5,'Chris Miller'),(5,'Olivia White'),(6,'Eva Harris'),(6,'Ryan Clark'),(7,'Daniel Garcia'),(7,'Sophia Rodriguez');
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
  CONSTRAINT `Startups_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Startups`
--

LOCK TABLES `Startups` WRITE;
/*!40000 ALTER TABLE `Startups` DISABLE KEYS */;
INSERT INTO `Startups` VALUES (1,'Tech Innovators',2010,'Information Technology',1,5000000),(2,'Green Energy Solutions',2015,'Renewable Energy',2,10000000),(3,'HealthTech Solutions',2018,'Healthcare',3,8000000),(4,'Finance Wizard',2012,'Finance',4,15000000),(5,'EduTech Revolution',2017,'Education',5,12000000),(6,'AI Robotics',2014,'Artificial Intelligence',1,20000000),(7,'Electric Mobility',2019,'Automotive',5,18000000);
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
  CONSTRAINT `Urls_of_articles_ibfk_1` FOREIGN KEY (`NewsUpdatesTitle`) REFERENCES `NewsUpdates` (`NewsUpdatesTitle`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Urls_of_articles`
--

LOCK TABLES `Urls_of_articles` WRITE;
/*!40000 ALTER TABLE `Urls_of_articles` DISABLE KEYS */;
INSERT INTO `Urls_of_articles` VALUES ('Exciting News at IIT Bombay','https://example.com/iit-bombay-news1'),('Exciting News at IIT Bombay','https://example.com/iit-bombay-news2'),('DTU Announces New Research Initiatives','https://example.com/dtu-research-initiatives'),('Anna University Hosts National Technology Conference','https://example.com/anna-university-tech-conference'),('IIM Bangalore Tops Global MBA Rankings','https://example.com/iim-bangalore-mba-rankings'),('Jadavpur University Celebrates Diamond Jubilee','https://example.com/jadavpur-university-diamond-jubilee'),('New Product Launch at IIT Bombay','https://example.com/iit-bombay-product-launch');
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

-- Dump completed on 2023-12-03  4:25:07
