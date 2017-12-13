CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.20, for osx10.12 (x86_64)
--
-- Host: db5200.ckaipjloudb0.us-east-1.rds.amazonaws.com    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Administrator`
--

DROP TABLE IF EXISTS `Administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administrator` (
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `fk_administrator_user` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompletedMaterial`
--

DROP TABLE IF EXISTS `CompletedMaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompletedMaterial` (
  `EnrollmentID` int(11) NOT NULL,
  `Sequence` int(11) NOT NULL,
  `DateTime` datetime NOT NULL,
  PRIMARY KEY (`EnrollmentID`,`Sequence`),
  KEY `fk_completedMaterial_material_idx` (`EnrollmentID`,`Sequence`),
  CONSTRAINT `fk_completedMaterial_enrollment` FOREIGN KEY (`EnrollmentID`) REFERENCES `Enrollment` (`EnrollmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course` (
  `CourseID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  `Icon` blob,
  `Cost` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `PrimaryTopic` int(11) NOT NULL,
  PRIMARY KEY (`CourseID`),
  UNIQUE KEY `CourseID_UNIQUE` (`CourseID`),
  KEY `fk_course_topic_idx` (`PrimaryTopic`),
  CONSTRAINT `fk_course_topic` FOREIGN KEY (`PrimaryTopic`) REFERENCES `Topic` (`TopicID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CourseCreated`
--

DROP TABLE IF EXISTS `CourseCreated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CourseCreated` (
  `UserID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`CourseID`),
  KEY `fk_courseCreated_course_idx` (`CourseID`),
  CONSTRAINT `fk_courseCreated_course` FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_courseCreated_faculty` FOREIGN KEY (`UserID`) REFERENCES `Faculty` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Enrollment`
--

DROP TABLE IF EXISTS `Enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Enrollment` (
  `EnrollmentID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `EnrolledTime` datetime NOT NULL,
  `ConfirmationCode` varchar(45) NOT NULL,
  `PaymentTime` datetime NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Comments` blob,
  PRIMARY KEY (`EnrollmentID`),
  UNIQUE KEY `EnrollmentID_UNIQUE` (`UserID`,`CourseID`),
  KEY `fk_enrollment_course_idx` (`CourseID`),
  CONSTRAINT `fk_enrollment_course` FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_user` FOREIGN KEY (`UserID`) REFERENCES `Student` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculty` (
  `UserID` int(11) NOT NULL,
  `Website` varchar(45) NOT NULL,
  `Title` varchar(45) NOT NULL,
  `Affiliation` varchar(45) NOT NULL,
  `ValidatedBy` int(11) DEFAULT NULL,
  `ValidationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `fk_faculty_administrator_idx` (`ValidatedBy`),
  CONSTRAINT `fk_faculty_administrator` FOREIGN KEY (`ValidatedBy`) REFERENCES `Administrator` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_faculty_user` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `File`
--

DROP TABLE IF EXISTS `File`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `File` (
  `CourseID` int(11) NOT NULL,
  `Sequence` int(11) NOT NULL,
  `Path` varchar(45) DEFAULT NULL,
  `Size` int(11) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CourseID`,`Sequence`),
  CONSTRAINT `fk_file_material` FOREIGN KEY (`CourseID`, `Sequence`) REFERENCES `Material` (`CourseID`, `Sequence`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GrantedRole`
--

DROP TABLE IF EXISTS `GrantedRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GrantedRole` (
  `To` int(11) NOT NULL,
  `From` int(11) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `DateTime` datetime NOT NULL,
  PRIMARY KEY (`To`,`From`),
  KEY `fk_grantor-administrator` (`From`),
  CONSTRAINT `fk_grantee-administrator` FOREIGN KEY (`To`) REFERENCES `Administrator` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_grantor-administrator` FOREIGN KEY (`From`) REFERENCES `Administrator` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Interest`
--

DROP TABLE IF EXISTS `Interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Interest` (
  `UserID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`CourseID`),
  KEY `fk_interest_course_idx` (`CourseID`),
  CONSTRAINT `fk_interest_course` FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_interest_student` FOREIGN KEY (`UserID`) REFERENCES `Student` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Link`
--

DROP TABLE IF EXISTS `Link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Link` (
  `CourseID` int(11) NOT NULL,
  `Sequence` int(11) NOT NULL,
  `isVideo` tinyint(1) NOT NULL DEFAULT '0',
  `URL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CourseID`,`Sequence`),
  CONSTRAINT `fk_link_material` FOREIGN KEY (`CourseID`, `Sequence`) REFERENCES `Material` (`CourseID`, `Sequence`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Material`
--

DROP TABLE IF EXISTS `Material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Material` (
  `CourseID` int(11) NOT NULL,
  `Sequence` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `MaterialType` int(11) NOT NULL,
  PRIMARY KEY (`CourseID`,`Sequence`),
  KEY `fk_material_materialType_idx` (`MaterialType`),
  CONSTRAINT `fk_material_course` FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_material_materialType` FOREIGN KEY (`MaterialType`) REFERENCES `MaterialType` (`MaterialTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MaterialType`
--

DROP TABLE IF EXISTS `MaterialType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MaterialType` (
  `MaterialTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaterialTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Phone`
--

DROP TABLE IF EXISTS `Phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Phone` (
  `UserID` int(11) NOT NULL,
  `PhoneNumber` varchar(45) NOT NULL,
  PRIMARY KEY (`UserID`,`PhoneNumber`),
  CONSTRAINT `fk_phone_user` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Playlist`
--

DROP TABLE IF EXISTS `Playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Playlist` (
  `PlaylistID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`PlaylistID`),
  KEY `fk_playlist_student_idx` (`UserID`),
  CONSTRAINT `fk_playlist_student` FOREIGN KEY (`UserID`) REFERENCES `Student` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PlaylistMaterial`
--

DROP TABLE IF EXISTS `PlaylistMaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlaylistMaterial` (
  `PlaylistID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Sequence` int(11) NOT NULL,
  `Position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PlaylistID`,`CourseID`,`Sequence`),
  KEY `fk_playlistMaterial_material_idx` (`CourseID`,`Sequence`),
  CONSTRAINT `fk_playlistMaterial_material` FOREIGN KEY (`CourseID`, `Sequence`) REFERENCES `Material` (`CourseID`, `Sequence`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlistMaterial_playlist` FOREIGN KEY (`PlaylistID`) REFERENCES `Playlist` (`PlaylistID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Post`
--

DROP TABLE IF EXISTS `Post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Post` (
  `CourseID` int(11) NOT NULL,
  `Sequence` int(11) NOT NULL,
  `Content` blob,
  PRIMARY KEY (`CourseID`,`Sequence`),
  CONSTRAINT `fk_post_material` FOREIGN KEY (`CourseID`, `Sequence`) REFERENCES `Material` (`CourseID`, `Sequence`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Question`
--

DROP TABLE IF EXISTS `Question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question` (
  `QuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `EnrollmentID` int(11) NOT NULL,
  `Question` blob,
  `Answer` blob,
  `IsPublic` tinyint(1) DEFAULT '0',
  `AnsweredBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`QuestionID`,`EnrollmentID`),
  KEY `fk_question_enrollment_idx` (`EnrollmentID`),
  KEY `fk_question_faculty_idx` (`AnsweredBy`),
  CONSTRAINT `fk_question_enrollment` FOREIGN KEY (`EnrollmentID`) REFERENCES `Enrollment` (`EnrollmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_faculty` FOREIGN KEY (`AnsweredBy`) REFERENCES `Faculty` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QuestionLike`
--

DROP TABLE IF EXISTS `QuestionLike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionLike` (
  `UserID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`QuestionID`),
  KEY `fk_questionLike_question_idx` (`QuestionID`),
  CONSTRAINT `fk_questionLike_question` FOREIGN KEY (`QuestionID`) REFERENCES `Question` (`QuestionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_questionLike_student` FOREIGN KEY (`UserID`) REFERENCES `Student` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QuestionMaterial`
--

DROP TABLE IF EXISTS `QuestionMaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionMaterial` (
  `QuestionID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Sequence` int(11) NOT NULL,
  PRIMARY KEY (`QuestionID`,`CourseID`,`Sequence`),
  KEY `fk_questionMaterial_material_idx` (`Sequence`,`CourseID`),
  CONSTRAINT `fk_questionMaterial_question` FOREIGN KEY (`QuestionID`) REFERENCES `Question` (`QuestionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Quiz`
--

DROP TABLE IF EXISTS `Quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Quiz` (
  `CourseID` int(11) NOT NULL,
  `Sequence` int(11) NOT NULL,
  `MinPassScore` int(11) DEFAULT NULL,
  PRIMARY KEY (`CourseID`,`Sequence`),
  CONSTRAINT `fk_quiz_material` FOREIGN KEY (`CourseID`, `Sequence`) REFERENCES `Material` (`CourseID`, `Sequence`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QuizQuestion`
--

DROP TABLE IF EXISTS `QuizQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuizQuestion` (
  `QuizQuestionID` int(11) NOT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `Sequence` int(11) DEFAULT NULL,
  `QuestionNumber` int(11) DEFAULT NULL,
  `Text` blob,
  PRIMARY KEY (`QuizQuestionID`),
  UNIQUE KEY `index2` (`CourseID`,`Sequence`,`QuestionNumber`),
  CONSTRAINT `fk_quizQuestion_quiz` FOREIGN KEY (`CourseID`, `Sequence`) REFERENCES `Quiz` (`CourseID`, `Sequence`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QuizQuestionAns`
--

DROP TABLE IF EXISTS `QuizQuestionAns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuizQuestionAns` (
  `QuizQuestionAnsID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID` int(11) DEFAULT NULL,
  `Sequence` int(11) DEFAULT NULL,
  `QuizQuestionNumber` int(11) DEFAULT NULL,
  `OptionNumber` int(11) DEFAULT NULL,
  `Text` blob,
  `IsCorrect` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`QuizQuestionAnsID`),
  UNIQUE KEY `index2` (`CourseID`,`Sequence`,`QuizQuestionNumber`,`OptionNumber`),
  CONSTRAINT `fk_quizQuestionAns` FOREIGN KEY (`CourseID`, `Sequence`, `QuizQuestionNumber`) REFERENCES `QuizQuestion` (`CourseID`, `Sequence`, `QuestionNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SecondaryTopic`
--

DROP TABLE IF EXISTS `SecondaryTopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SecondaryTopic` (
  `CourseID` int(11) NOT NULL,
  `TopicID` int(11) NOT NULL,
  PRIMARY KEY (`CourseID`,`TopicID`),
  KEY `fk_secondaryTopic_Topic_idx` (`TopicID`),
  CONSTRAINT `fk_secondaryTopic_Course` FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_secondaryTopic_Topic` FOREIGN KEY (`TopicID`) REFERENCES `Topic` (`TopicID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `fk_student_user` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StudentQuizAns`
--

DROP TABLE IF EXISTS `StudentQuizAns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentQuizAns` (
  `StudentQuizAnsID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `Sequence` int(11) DEFAULT NULL,
  `QuizQuestionNumber` int(11) DEFAULT NULL,
  `OptionNumber` int(11) DEFAULT NULL,
  `IsCorrect` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`StudentQuizAnsID`),
  UNIQUE KEY `index2` (`StudentID`,`CourseID`,`Sequence`,`QuizQuestionNumber`,`OptionNumber`),
  KEY `fk_studentQuizAns_quizQuestionAns_idx` (`CourseID`,`Sequence`,`QuizQuestionNumber`,`OptionNumber`),
  CONSTRAINT `fk_studentQuizAns_quizQuestionAns` FOREIGN KEY (`CourseID`, `Sequence`, `QuizQuestionNumber`, `OptionNumber`) REFERENCES `QuizQuestionAns` (`CourseID`, `Sequence`, `QuizQuestionNumber`, `OptionNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_studentQuizAns_student` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Topic`
--

DROP TABLE IF EXISTS `Topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Topic` (
  `TopicID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`TopicID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Picture` blob,
  `Street` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `PostalCode` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `isStudent` tinyint(4) NOT NULL DEFAULT '1',
  `isFaculty` tinyint(4) NOT NULL DEFAULT '0',
  `isAdministrator` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserID_UNIQUE` (`UserID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-10  1:08:21
