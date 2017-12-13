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
-- Dumping data for table `Administrator`
--

LOCK TABLES `Administrator` WRITE;
/*!40000 ALTER TABLE `Administrator` DISABLE KEYS */;
INSERT INTO `Administrator` VALUES (1),(5),(8),(9),(10),(11),(14),(21),(22),(23),(24),(25),(26),(32);
/*!40000 ALTER TABLE `Administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `CompletedMaterial`
--

LOCK TABLES `CompletedMaterial` WRITE;
/*!40000 ALTER TABLE `CompletedMaterial` DISABLE KEYS */;
INSERT INTO `CompletedMaterial` VALUES (1,1,'2017-11-21 21:06:08'),(1,2,'2017-11-22 21:06:15'),(1,3,'2017-11-23 21:06:20'),(1,4,'2017-11-22 21:42:43'),(1,5,'2017-12-10 01:01:59'),(3,1,'2017-11-15 21:04:55'),(3,2,'2017-11-15 21:05:05'),(3,3,'2017-11-15 21:05:11'),(3,4,'2017-11-21 21:05:18'),(3,5,'2017-11-22 21:05:25'),(3,6,'2017-11-25 21:05:34'),(7,4,'2017-12-10 00:49:38'),(7,5,'2017-12-10 00:46:52');
/*!40000 ALTER TABLE `CompletedMaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES (1,'Android Basics Nanodegree by Google','No programming experience? No Problem! Start ','https://s3-us-west-1.amazonaws.com/udacity-co',200,'2017-11-01 17:43:31',1),(2,'Android Developer Nanodegree by Google','Start your career as an Android developer. Le','https://s3-us-west-1.amazonaws.com/udacity-co',250,'2017-11-14 17:44:15',1),(3,'Artificial Intelligence Nanodegree','Learn skills and tools used by the most innov','https://s3-us-west-1.amazonaws.com/udacity-co',350,'2017-11-14 17:44:50',2),(4,'Artificial Intelligence - Deep Learning','Learn the fundamentals of deep neural network','https://s3-us-west-1.amazonaws.com/udacity-co',450,'2017-11-19 17:45:23',2),(5,'Data Analyst Nanodegree','Prepare for a data science career. Learn to u','https://s3-us-west-1.amazonaws.com/udacity-co',250,'2017-11-06 17:46:16',3),(6,'Intro to Data Analysis','Explore a variety of datasets, posing a','https://lh3.googleusercontent.com/oN7SxjOKxWS',275,'2017-11-07 17:46:48',3),(7,'Intro to Machine Learning','This class will teach you the end-to-end proc','https://lh4.ggpht.com/iH59AlLRPUJvthBY2aYpNo-',500,'2017-11-14 17:47:44',4),(8,'Data Visualization and D3.js','Learn the fundamentals of data visualization ','https://lh4.ggpht.com/-8k47x6ig0mLWtYBVs1jSIL',375,'2017-11-15 17:48:25',4),(9,'Deep Learning Nanodegree Foundation','Deep learning is driving advances in artifici','https://s3-us-west-1.amazonaws.com/udacity-co',150,'2017-07-13 17:49:04',5),(10,'Deep Learning - Convolutional Neural Networks','Learn how to build convolutional neural netwo','https://s3-us-west-1.amazonaws.com/udacity-co',275,'2017-11-15 17:49:32',5),(11,'Writing READMEs','Documentation is an important part of the dev','https://lh3.googleusercontent.com/FWszT_WPN9F',900,'2017-11-19 17:50:08',6),(12,'Linux Command Line Basics','An introduction to the Linux command line int','https://lh3.googleusercontent.com/01InpXSAJZ8',450,'2017-11-15 17:51:14',6),(13,'Digital Marketing Nanodegree','Gain real-world experience running live campa','https://s3-us-west-1.amazonaws.com/udacity-co',500,'2017-11-09 17:51:58',7),(14,'Search Engine Optimization (SEO)','Learn how to use SEO to optimize your search ','https://s3-us-west-1.amazonaws.com/udacity-co',550,'2017-11-04 17:52:29',7),(15,'Become an iOS Developer','Master writing in Swift as you build five por','https://www.udacity.com/course/ios-developer-',300,'2017-11-01 17:43:31',8),(16,'Core ML: Machine Learning for iOS','Learn how to use Apple\'s Core ML framework to','https://www.udacity.com/course/core-ml--ud103',200,'2017-11-01 17:43:31',8),(17,'Machine Learning Engineer Nanodegree','Become a machine learning engineer and apply ','https://www.udacity.com/course/machine-learni',180,'2017-11-01 17:43:31',9),(18,'Data Analyst Nanodegree','Prepare for a data science career. Learn to u','https://www.udacity.com/course/data-analyst-n',390,'2017-11-01 17:43:31',9),(19,'Server-Side Swift','In this course, built in collaboration with I','https://www.udacity.com/course/server-side-sw',400,'2017-11-01 17:43:31',10),(20,'Learn Swift Programming Syntax','This course focuses on the syntax of the Swif','https://lh3.googleusercontent.com/Qkrte2_RNAP',200,'2017-11-01 17:43:31',10),(21,'How to Build a Startup','Learn what it takes to build a successful sta','https://lh6.ggpht.com/l0tJ09Lye8eNFttGQ7uvMGV',100,'2017-11-01 17:43:31',11),(22,'Product Design','Learn product validation, UI/UX practices, Go','https://lh3.googleusercontent.com/1RoMggIjpqs',300,'2017-11-01 17:43:31',11),(23,'Self-Driving Car Engineer Nanodegree','In this advanced program, you’ll master the j','https://s3-us-west-1.amazonaws.com/udacity-co',400,'2017-11-01 17:43:31',12),(24,'Self-Driving Car Engineer - Deep Learning','Build and train deep neural networks to class','https://d17h27t6h515a5.cloudfront.net/topher/',200,'2017-11-01 17:43:31',12),(25,'How to Use Git and GitHub','Learn to use version control, an important to','https://s3-us-west-1.amazonaws.com/udacity-co',180,'2017-11-01 17:43:31',13),(26,'Intro to Computer Science','Learn key computer science concepts in this i','https://s3-us-west-1.amazonaws.com/udacity-co',200,'2017-11-01 17:43:31',13),(27,'VR Developer Nanodegree','Master the latest tools and technologies, and','https://s3-us-west-1.amazonaws.com/udacity-co',300,'2017-11-01 17:43:31',14),(28,'Introduction to Virtual Reality','If you are interested in learning more about ','https://lh3.googleusercontent.com/eIOkiYRITNN',200,'2017-11-01 17:43:31',14),(29,'Front-End Web Developer Nanodegree','In the Front End Developer Nanodegree program','https://s3-us-west-1.amazonaws.com/udacity-co',190,'2017-11-01 17:43:31',15),(30,'Full Stack Web Developer Nanodegree','Learn how to create server-side, data-driven ','https://s3-us-west-1.amazonaws.com/udacity-co',300,'2017-11-01 17:43:31',15),(31,'Android Basics Nanodegree by Google','No programming experience? No Problem! Start ','https://s3-us-west-1.amazonaws.com/udacity-co',200,'2017-11-01 17:43:31',1);
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `CourseCreated`
--

LOCK TABLES `CourseCreated` WRITE;
/*!40000 ALTER TABLE `CourseCreated` DISABLE KEYS */;
INSERT INTO `CourseCreated` VALUES (6,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10),(5,11),(5,12),(5,13),(5,14),(5,15),(5,16),(5,17),(5,18),(5,19),(5,20),(4,21),(6,21),(4,22),(6,22),(4,23),(6,23),(4,24),(6,24),(5,25),(6,25),(6,26),(6,27),(6,28),(6,29),(6,30);
/*!40000 ALTER TABLE `CourseCreated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Enrollment`
--

LOCK TABLES `Enrollment` WRITE;
/*!40000 ALTER TABLE `Enrollment` DISABLE KEYS */;
INSERT INTO `Enrollment` VALUES (1,1,1,'2017-11-20 20:49:11','D7A78S','2017-11-13 20:49:20',5,NULL),(2,2,1,'2017-11-19 20:50:53','DF98AS','2017-11-19 20:51:08',4,NULL),(3,3,3,'2017-11-20 20:51:23','VBN98C','2017-11-18 20:51:33',4,'Amazing Course!!!!'),(4,7,21,'2017-11-20 20:51:23','ADE45F','2017-11-18 20:51:33',NULL,NULL),(7,7,1,'2017-11-21 12:06:15','MAN43E','2017-11-21 12:07:40',NULL,NULL),(8,3,1,'2017-11-22 14:06:15','KKK43F','2017-11-22 14:07:25',NULL,NULL),(9,15,1,'2017-11-20 16:08:15','SQA43B','2017-11-22 16:08:31',NULL,NULL),(10,1,5,'2017-11-22 21:40:17','DSFG978','2017-11-22 21:40:17',NULL,NULL),(11,1,2,'2017-11-28 20:51:23','RDE23F','2017-11-28 20:54:33',3,NULL),(12,2,2,'2017-11-27 20:02:00','RDE23F','2017-11-27 20:00:00',3,NULL),(13,1,30,'2017-11-21 19:00:00','FFFQS8','2017-11-21 19:01:00',NULL,NULL),(25,3,30,'2017-11-21 19:00:00','FFFQS8','2017-11-21 19:01:00',NULL,NULL),(29,7,30,'2017-11-21 19:00:00','MFFQS8','2017-11-21 19:01:00',NULL,NULL),(30,1,19,'2017-12-09 03:53:21','2142','2017-12-09 03:53:21',NULL,NULL),(31,2,6,'2017-12-09 04:10:38','2142','2017-12-09 04:10:38',NULL,NULL),(34,15,28,'2017-12-09 04:12:01','2142','2017-12-09 04:12:01',NULL,NULL),(37,1,28,'2017-12-09 04:13:36','2142','2017-12-09 04:13:36',NULL,NULL),(38,16,23,'2017-12-09 04:18:21','tueLc','2017-12-09 04:18:21',NULL,NULL);
/*!40000 ALTER TABLE `Enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES (4,'somewhere.com','Mr','Professor',9,'2017-11-20 17:24:14'),(5,'something.com','Mr','Professor',10,'2017-10-16 17:24:34'),(6,'someone.com','Mr','Professor',9,'2017-11-13 17:24:57'),(14,'somewhat.com','Ms','Professor',9,'2017-11-22 21:29:44'),(27,'alpert11.com','Mr','Professor',9,'2017-11-28 17:20:00'),(28,'barney_mypage.com','Mr','Assistant Professor',9,'2017-11-28 19:20:00'),(29,'charlie_mypage.com','Mr','Professor',10,'2017-11-29 19:22:05'),(30,'david_mypage.com','Mr','Professor',10,'2017-11-29 21:30:05'),(31,'ellen_mypage.com','Mrs','Professor',9,'2017-11-29 22:30:09'),(32,'frank_mypage.com','Mr','Assistant Professor',9,'2017-11-29 23:30:00');
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `File`
--

LOCK TABLES `File` WRITE;
/*!40000 ALTER TABLE `File` DISABLE KEYS */;
INSERT INTO `File` VALUES (23,1,'https://cs.nyu.edu/~fergus/tutorials/deep_lea',200,'PDF'),(23,2,'https://www.deepdyve.com/lp/elsevier/sensor-f',100,'HTML'),(23,3,'http://www.cs.lamar.edu/faculty/disrael/COSC5',200,NULL),(25,1,'http://ccs.neu.edu/tr/gitcourse/gitintro.pdf',200,'PDF'),(25,2,'http://ccs.neu.edu/tr/gitcourse/gitbasics.pdf',100,'PDF'),(25,3,'http://ccs.neu.edu/tr/gitcourse/gitmerge.pdf',150,'PDF'),(25,4,'http://ccs.neu.edu/tr/gitcourse/gittkit.pdf',230,'PDF'),(25,5,'http://ccs.neu.edu/tr/gitcourse/gitvering.pdf',220,'PDF'),(26,1,'http://ccs.neu.edu/tr/comp/comp1.pdf',230,'PDF'),(26,2,'http://ccs.neu.edu/tr/comp/comp2.pdf',220,'PDF');
/*!40000 ALTER TABLE `File` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `GrantedRole`
--

LOCK TABLES `GrantedRole` WRITE;
/*!40000 ALTER TABLE `GrantedRole` DISABLE KEYS */;
INSERT INTO `GrantedRole` VALUES (1,8,'Admin','2017-12-08 23:41:23'),(5,8,'Admin','2017-12-09 04:57:11'),(8,9,'Admin','2017-11-20 17:24:14'),(10,9,'Finance','2017-10-16 17:24:34'),(11,9,'Finance','2017-11-22 21:31:06'),(14,10,'Admin','2017-12-09 04:52:04'),(21,8,'Admin','2017-11-21 17:00:00'),(22,9,'Admin','2017-11-21 18:00:00'),(23,21,'Admin','2017-11-24 19:00:00'),(24,21,'Admin','2017-11-24 20:00:00'),(25,8,'Admin','2017-11-25 21:00:00'),(26,9,'Admin','2017-11-25 22:00:00'),(32,9,'Admin','2017-11-25 21:30:12');
/*!40000 ALTER TABLE `GrantedRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Interest`
--

LOCK TABLES `Interest` WRITE;
/*!40000 ALTER TABLE `Interest` DISABLE KEYS */;
INSERT INTO `Interest` VALUES (1,1),(2,3),(2,7),(1,9),(1,18),(15,18),(16,18),(17,24),(18,24),(19,31);
/*!40000 ALTER TABLE `Interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Link`
--

LOCK TABLES `Link` WRITE;
/*!40000 ALTER TABLE `Link` DISABLE KEYS */;
INSERT INTO `Link` VALUES (2,1,1,'https://youtu.be/bJ_2_AQboc0'),(2,2,1,'https://youtu.be/47x8c9Q8WTE'),(2,3,1,'https://youtu.be/3tb7AiRyNUM'),(2,4,1,'https://youtu.be/h69WDWZdqi4'),(2,5,1,'https://youtu.be/_BwoT-K7OLk'),(3,1,1,'https://www.youtube.com/watch?v=TjZBTDzGeGg'),(3,2,1,'https://www.youtube.com/watch?v=PNKj529yY5c'),(3,3,1,'https://www.youtube.com/watch?v=leXa7EKUPFk'),(3,4,1,'https://www.youtube.com/watch?v=j1H3jAAGlEA'),(3,5,1,'https://www.youtube.com/watch?v=gGQ-vAmdAOI'),(3,6,1,'https://www.youtube.com/watch?v=STjW3eH0Cik');
/*!40000 ALTER TABLE `Link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Material`
--

LOCK TABLES `Material` WRITE;
/*!40000 ALTER TABLE `Material` DISABLE KEYS */;
INSERT INTO `Material` VALUES (1,1,'Android Basics: User Interface',3),(1,2,'Android Basics: User Input',3),(1,3,'Android Basics: Multi-Screen Apps',3),(1,4,'Android Basics: Networking',3),(1,5,'Android Basics: Data Storage',3),(2,1,'Developing Android Apps',3),(2,2,'Advanced Android App Development',3),(2,3,'Gradle for Android and Java',3),(2,4,'Material Design for Android Developers',3),(2,5,'Capstone Project',3),(3,1,'Introduction and Scope',2),(3,2,'Reasoning: Goal Trees and Problem Solving',2),(3,3,'Reasoning: Goal Trees and Rule-Based Expert S',2),(3,4,'Search: Depth-First, Hill Climbing, Beam',2),(3,5,'Search: Optimal, Branch and Bound, A*',2),(3,6,'Search: Games, Minimax, and Alpha-Beta',2),(21,1,'Lesson 1: What We Now Know',3),(21,2,'Lessons 1.5A and 1.5B: Business Models and Cu',3),(21,3,'Lesson 2: Value Proposition',3),(21,4,'Lesson 3: Customer Segments',3),(22,1,'Ideation & Validation',3),(22,2,'UI/UX',3),(22,3,'Design Sprint',3),(22,4,'Key Metrics',3),(23,1,'Computer Vision and Deep Learning',1),(23,2,'Sensor Fusion, Localization, and Control',1),(23,3,'Path Planning, Concentrations, and Systems',1),(25,1,'Git intro',1),(25,2,'Git basics',1),(25,3,'Git merge and rebase',1),(25,4,'Git toolkit',1),(25,5,'Git versioning',1),(26,1,'Computer Science Basics',1),(26,2,'Other info about Computer Science',1);
/*!40000 ALTER TABLE `Material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `MaterialType`
--

LOCK TABLES `MaterialType` WRITE;
/*!40000 ALTER TABLE `MaterialType` DISABLE KEYS */;
INSERT INTO `MaterialType` VALUES (1,'File'),(2,'Link'),(3,'Post'),(4,'Quiz');
/*!40000 ALTER TABLE `MaterialType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Phone`
--

LOCK TABLES `Phone` WRITE;
/*!40000 ALTER TABLE `Phone` DISABLE KEYS */;
INSERT INTO `Phone` VALUES (1,'6173200348'),(1,'971501005503'),(2,'4987896321'),(3,'3666999889'),(3,'3695544865'),(3,'8964563214'),(7,'8176985563'),(8,'8578691962'),(8,'919731419125'),(11,'6178195687');
/*!40000 ALTER TABLE `Phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Playlist`
--

LOCK TABLES `Playlist` WRITE;
/*!40000 ALTER TABLE `Playlist` DISABLE KEYS */;
INSERT INTO `Playlist` VALUES (1,1,'Android Basics Posts'),(2,1,'Android Networking Posts'),(3,1,'Android Storage Posts'),(4,2,'Android Full'),(5,3,'AI Nano Intro'),(6,3,'AI Nano Reasoning'),(7,3,'AI Nano Search'),(8,7,'Building Startup Lesson 1'),(9,7,'Building Startup Lesson 2'),(10,7,'Building Startup Lesson 3');
/*!40000 ALTER TABLE `Playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `PlaylistMaterial`
--

LOCK TABLES `PlaylistMaterial` WRITE;
/*!40000 ALTER TABLE `PlaylistMaterial` DISABLE KEYS */;
INSERT INTO `PlaylistMaterial` VALUES (1,1,1,1),(1,1,2,2),(1,1,3,3),(2,1,4,1),(3,1,5,1),(4,1,1,1),(4,1,2,2),(4,1,3,3),(4,1,4,4),(4,1,5,5),(5,3,1,1),(6,3,2,1),(6,3,3,2),(6,3,4,1),(6,3,5,2),(6,3,6,3),(8,21,1,1),(8,21,2,2),(9,21,3,1),(10,21,4,1);
/*!40000 ALTER TABLE `PlaylistMaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Post`
--

LOCK TABLES `Post` WRITE;
/*!40000 ALTER TABLE `Post` DISABLE KEYS */;
INSERT INTO `Post` VALUES (1,1,'Learn how to transform hand-drawn app designs into layouts using the XML markup language, and use Views and ViewGroups to display images and text.'),(1,2,'Harness the power of Java to build a coffee-ordering app, use variables to add interactivity to your app, and learn the basics of object-oriented programming.'),(1,3,'Learn how to show multiple screens, and add audio and images to an app. Learn how Android handles touch events, and make visual changes to add polish to your app.'),(1,4,'Discover the power of Web APIs and how to use them, and learn the basics of networking in Android, including HTTP networking, JSON parsing, and threads.'),(2,1,'Work with instructors step-by-step to build a cloud-connected Android app. Blending theory and practice, learn how to build great apps the right way.'),(2,2,'Make your apps more responsive, and create a total user experience with home screen widgets, third-party libraries, and more. Also, learn to deeply integrate rich media, test user interfaces, and publish to Google Play.'),(2,3,'Learn how to customize your Gradle build, and explore advanced topics like: app testing, configuring free vs. paid apps, and creating and integrating libraries.'),(2,4,'Apply the design principles that define Android\'s visual language to your apps, using material design elements, transitions and graphics, across multiple form factors.'),(2,5,'Integrate all you\'ve learned in this program to bring your own app idea to life, and publish your app to Google Play.'),(21,1,'History of the Corporation\nStartups Are Not Smaller Versions of Large Companies\nWaterfall Development\nCustomer vs. Product Development\nEntrepreneurial Education'),(21,2,'Value Proposition\nCustomer Segments\nRevenue Streams\nKey Resources\nCustomer Development Processes\nMinimum Viable Product\nMarket Opportunity Analysis'),(21,3,'Product Market Fit\nRank and Day in the Life\nMultiple Customer Segments\nMarket Types Introduction: Existing, Resegmented, New, Clone\nConsequences of Not Understanding a Market'),(21,4,'Product Market Fit\nRank and Day in the Life\nMultiple Customer Segments\nMarket Types Introduction: Existing, Resegmented, New, Clone\nConsequences of Not Understanding a Market'),(22,1,'Develop, validate and refine your ideas to build for a product/market fit.\nCase studies and interviews with founders, product experts, and investors.\nLearn how to efficiently conduct user research and build an entrepreneurial mindset.'),(22,2,'Go beyond visual style to understand material design, building for accessibility, user flows and personas.\nLearn about how startups make design decisions and learn from senior designers at Google.\nAnalyze the user experience of another product and start documenting a user flow for your own product.'),(22,3,''),(22,4,'Learn to identify common metrics for websites and apps relating to traffic, customer satisfaction, and engagement.\nLearn tools that can be used to monitor metrics and examples from startups on what metrics not to measure.\nIdentify actionable metrics that will work best for your own product.'),(23,1,'https://r.search.yahoo.com/_ylt=A0LEV74XZhNaXlIAK9MPxQt.;_ylu=X3oDMTByNXM5bzY5BGNvbG8DYmYxBHBvcwMzBHZ0aWQDBHNlYwNzcg--/RV=2/RE=1511249559/RO=10/RU=https%3a%2f%2fcs.nyu.edu%2f~fergus%2ftutorials%2fdeep_learning_cvpr12%2f/RK=2/RS=Gp51vS.ZnG1K2Bf58NgWT4BaoBA-'),(23,2,'https://r.search.yahoo.com/_ylt=A0LEVkBAZhNaxx4ASusPxQt.;_ylu=X3oDMTByOHZyb21tBGNvbG8DYmYxBHBvcwMxBHZ0aWQDBHNlYwNzcg--/RV=2/RE=1511249601/RO=10/RU=https%3a%2f%2fmedium.com%2fudacity%2fterm-2-in-depth-on-udacitys-self-driving-car-curriculum-775130aae502/RK=2/RS=wktI.urCAa_IwaBkWIIFTtXe6JI-'),(23,3,'https://r.search.yahoo.com/_ylt=A0LEVjBfZhNapJ8AFBQPxQt.;_ylu=X3oDMTBydDI5cXVuBGNvbG8DYmYxBHBvcwM2BHZ0aWQDBHNlYwNzcg--/RV=2/RE=1511249631/RO=10/RU=https%3a%2f%2fwww.researchgate.net%2fpublication%2f260014480_Controllability_analysis_and_attitude_path_planning_of_underactuated_spacecraft_systems/RK=2/RS=gHUtJyL78qw.grESYCB.FiP0qZM-');
/*!40000 ALTER TABLE `Post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Question`
--

LOCK TABLES `Question` WRITE;
/*!40000 ALTER TABLE `Question` DISABLE KEYS */;
INSERT INTO `Question` VALUES (1,1,'Delete the space of MySQL?\r\nHow can we delete the table and release the space of MySQL? It seems after we run the code, the space of computer is occupied.','Easiest approach: uninstall XAMPP, then reinstall. Space could be used by a number of sources, including logs.\r\n \r\nHowever, the data from this lab should only take a few gigabytes, even with indexes. If your computer has that little free space, you need to free it up from other sources to avoid serious performance slow-down.',0,4),(2,2,'What is Default Package?','all classes and Interfaces that you define has to be inside a package (also called name spaces). when you do not specifically put a line stating that the class/Interface belongs to a particular package, then the class/interface lies in a default package. \nyou might want to take a look at this  : https://www.javatpoint.com/package',1,6),(3,1,'Hi all,\r\nI use windows PowerShell to run MariaDB. When I use \'SOURCE path /to/ data_25m_100k . sql ;  \' to insert data in the table, the average time of adding 100,000 rows is about 2 seconds.\r\nBut when I work on problem 4.1, after I create index on data(a100), the average time of adding 100,000 rows becomes 10.7 seconds.\r\nWhy it becomes so slow? I have changed the max_allowed_packet value to 25m. And I didn\'t run any other program at the same time.','Because you are building the index \"data(a100)\" as you insert rows into the table',1,4),(4,1,'HW4 Problem7\r\nThe correct solution should be\r\nFD:W,X->YZ\r\n \r\nT1: WX->Y\r\nT2: Y->Z\r\n \r\nor not?\r\nThx!',NULL,0,4),(5,1,'weak entity\r\nThe relationship between a weak entity and a strong enity,  which provides it with the pk, will mostly be a 1:N type (with double lines between the weak entity and the relationship)? ',NULL,0,NULL),(6,2,'Are java primitives immutable?','This is a bit tricky but I will try to put what I understand.\n \nTo answer your question. Yes. primitives are immutable.',1,5),(7,2,'How do we write the contracts for a function that operates on global variables? ','The contract of a method is determined solely by its input parameters and output.\n \nYou can use:\n- the RETURNS portion of the purpose statement to explain how a global variable is operated on to compute the return value\n  or\n- the EFFECT portion to explain how a global variable is updated during the execution of the method.',0,NULL),(8,2,'Sample for accepting userInput',NULL,0,NULL),(9,2,'About data storage hw. Where to submit the hw?',NULL,0,NULL),(10,2,'What libraries are available to make use of networking in android',NULL,0,NULL);
/*!40000 ALTER TABLE `Question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `QuestionLike`
--

LOCK TABLES `QuestionLike` WRITE;
/*!40000 ALTER TABLE `QuestionLike` DISABLE KEYS */;
INSERT INTO `QuestionLike` VALUES (1,2),(3,2),(7,2),(2,3),(3,3),(7,3),(15,3),(1,6),(3,6),(7,6),(15,6);
/*!40000 ALTER TABLE `QuestionLike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `QuestionMaterial`
--

LOCK TABLES `QuestionMaterial` WRITE;
/*!40000 ALTER TABLE `QuestionMaterial` DISABLE KEYS */;
INSERT INTO `QuestionMaterial` VALUES (1,1,1),(2,1,1),(3,1,1),(8,1,1),(2,1,2),(8,1,2),(2,1,3),(10,1,4),(4,1,5),(9,1,5);
/*!40000 ALTER TABLE `QuestionMaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Quiz`
--

LOCK TABLES `Quiz` WRITE;
/*!40000 ALTER TABLE `Quiz` DISABLE KEYS */;
INSERT INTO `Quiz` VALUES (1,1,65),(1,2,65),(1,3,70),(1,4,75),(1,5,75),(2,1,65),(2,2,65),(2,3,70),(2,4,75),(2,5,75),(3,1,65),(3,2,65),(3,3,70),(3,4,75),(3,5,75),(3,6,75),(21,1,65),(21,2,65),(21,3,70),(21,4,75),(22,1,65),(22,2,65),(22,3,70),(22,4,75),(23,1,75),(23,2,75),(23,3,80);
/*!40000 ALTER TABLE `Quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `QuizQuestion`
--

LOCK TABLES `QuizQuestion` WRITE;
/*!40000 ALTER TABLE `QuizQuestion` DISABLE KEYS */;
INSERT INTO `QuizQuestion` VALUES (1,1,1,1,'What is an interface?'),(2,1,1,2,'How many interfaces in the angry bird app?'),(3,1,2,1,'How many user inputs can sysout take?'),(4,1,2,2,'Can an user input be an document?'),(5,1,3,1,'How many multi screens do Android support?'),(6,1,3,2,'Are all apps multi screen compatible?'),(7,1,4,1,'Does a network need internet?'),(8,1,4,2,'What is a typical network speed in NY?'),(9,1,5,1,'What is the unit of storage?'),(10,1,5,2,'How many MB in 1 GB?'),(11,2,1,1,'What makes an Android app different from Ios app?'),(12,2,1,2,'What percent of the app market is Android?'),(13,2,2,1,'What is multi-threading?'),(14,2,2,2,'How does Java handle concurrency issues?'),(15,2,3,1,'What is the main  differences between Gradle and Maven?'),(16,2,3,2,'How much faster is Gradle?'),(17,2,4,1,'How many iterations needed for a good app design?'),(18,2,4,2,'Should you have split screen design?'),(19,2,5,1,'Will your app require a database?'),(20,2,5,2,'How many features will your capstone project have?'),(21,2,5,3,'How many describe team members?'),(22,3,1,1,'When was the term AI founded?'),(23,3,1,2,'How many subfields are in AI?'),(24,3,2,1,'What is the Bayes theorm formula?'),(25,3,2,2,'What is the maximum value a probability can take?'),(26,3,3,1,'How many rules are there for the Goal Tree?'),(27,3,3,2,'Should a goal tree used for BFS?'),(28,3,4,1,'Is DFS better than BFS for close to root searches?'),(29,3,4,2,'What is the time complexity of the hill climibing algorithm?'),(30,3,5,1,'What time complexity is considered an optimal AI algorithm?'),(31,3,6,1,'What is the runtime MiniMax algorithm implemented?'),(32,3,6,2,'What is the space complexity for the MiniMax algorithm?'),(33,21,1,1,'How old is a typical a startup?'),(34,21,1,2,'What percent of startups go public?'),(35,21,2,1,'What is the main idea from 1.5A?'),(36,21,2,2,'What is the main idea from 1.5B?'),(37,21,3,1,'How many points are there in the value proposition?'),(38,21,4,1,'At what step should you get customer requirements?'),(39,21,4,2,'How many customer segment values should you collect?'),(40,22,1,1,'What year was the idea of product design made?'),(41,22,1,2,'How many principles are there for product design?'),(42,22,2,1,'What does UI stand for?'),(43,22,2,2,'What does UX stand for?'),(44,22,3,1,'How long is a sprint?'),(45,22,4,1,'How many metrics are usually needed for testing?'),(46,23,1,1,'When was DeepMind founded?'),(47,23,2,1,'How many sensors are used in VI?'),(48,23,2,2,'How fast is localization in VI?'),(49,23,3,1,'How many paths lie in a binary search?'),(50,23,3,2,'Are paths faster than routes in VI?');
/*!40000 ALTER TABLE `QuizQuestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `QuizQuestionAns`
--

LOCK TABLES `QuizQuestionAns` WRITE;
/*!40000 ALTER TABLE `QuizQuestionAns` DISABLE KEYS */;
INSERT INTO `QuizQuestionAns` VALUES (1,1,1,1,1,'A class',0),(2,1,1,1,2,'A template',1),(3,1,1,2,1,'6',1),(4,1,1,2,2,'8',0),(5,1,2,1,1,'5',1),(6,1,2,1,2,'9',0),(7,1,2,2,1,'5',1),(8,1,2,2,2,'9',0),(9,1,3,1,1,'3',1),(10,1,3,1,2,'4',0),(11,1,3,2,1,'yes',0),(12,1,3,2,2,'no',1),(13,1,4,1,1,'yes',0),(14,1,4,1,2,'no',1),(15,1,4,2,1,'20',1),(16,1,4,2,2,'30',0),(17,1,5,1,1,'MB',1),(18,1,5,1,2,'BMC',0),(19,1,5,2,1,'500',0),(20,1,5,2,2,'1000',1),(21,2,1,1,1,'Speed',0),(22,2,1,1,2,'Space',0),(23,2,1,1,3,'Platform',1),(24,2,1,2,1,'50',0),(25,2,1,2,2,'70',1),(26,2,2,1,1,'JVM threads',1),(27,2,2,1,2,'JVM heap',0),(28,2,2,2,1,'threads',1),(29,2,2,2,2,'dump memory',0),(30,2,3,1,1,'Lines of Code',0),(31,2,3,1,2,'Speed',1),(32,2,3,2,1,'30',0),(33,2,3,2,2,'50',1),(34,2,4,1,1,'5',0),(35,2,4,1,2,'8',1),(36,2,4,2,1,'yes',1),(37,2,4,2,2,'no',0),(38,2,5,1,1,'yes',1),(39,2,5,1,2,'no',0),(40,2,5,2,1,'5',0),(41,2,5,2,2,'10',1),(42,2,5,3,1,'3',0),(43,2,5,3,2,'4',1),(44,2,5,3,3,'10',0),(45,3,1,1,1,'1850',1),(46,3,1,1,2,'1900',0),(47,3,1,1,3,'1950',0),(48,3,1,2,1,'More than 10',1),(49,3,1,2,2,'Less than 10',0),(50,3,2,1,1,'Formula 1',0),(51,3,2,1,2,'Formula 2',1),(52,3,2,2,1,'100',0),(53,3,2,2,2,'1',1),(54,3,3,1,1,'10',0),(55,3,3,1,2,'5',1),(56,3,3,2,1,'yes',1),(57,3,3,2,2,'no',0),(58,3,4,1,1,'yes',1),(59,3,4,1,2,'no',0),(60,3,4,2,1,'n log n',0),(61,3,4,2,2,'log n',1),(62,3,5,1,1,'n^2',0),(63,3,5,1,2,'n log n',1),(64,3,6,1,1,'n log n',1),(65,3,6,1,2,'n^2',0),(66,3,6,2,1,'n',1),(67,3,6,2,2,'log n',0),(68,21,1,1,1,'6 months',0),(69,21,1,1,2,'1 year',0),(70,21,1,1,3,'3 yeara',1),(71,21,1,2,1,'30 %',1),(72,21,1,2,2,'50 %',0),(73,21,2,1,1,'Structure',1),(74,21,2,1,2,'Logic',0),(75,21,2,2,1,'Power Consumption',0),(76,21,2,2,2,'Space Consumption',1),(77,21,3,1,1,'5',0),(78,21,3,1,2,'15',0),(79,21,3,1,3,'50',1),(80,21,4,1,1,'First',0),(81,21,4,1,2,'Second',1),(82,21,4,2,1,'10',0),(83,21,4,2,2,'23',1),(84,22,1,1,1,'1805',0),(85,22,1,1,2,'1850',1),(86,22,1,2,1,'3',0),(87,22,1,2,2,'4',1),(88,22,2,1,1,'User Intergration',0),(89,22,2,1,2,'User Interface',1),(90,22,2,2,1,'User Experience',1),(91,22,2,2,2,'User Expert',0),(92,22,3,1,1,'1 week',0),(93,22,3,1,2,'1 month',1),(94,22,4,1,1,'20',0),(95,22,4,1,2,'50',1),(96,23,1,1,1,'2000',0),(97,23,1,1,2,'2005',0),(98,23,1,1,3,'2011',1),(99,23,2,1,1,'5',0),(100,23,2,1,2,'18',1),(101,23,2,2,1,'30 fps',0),(102,23,2,2,2,'60 fps',1),(103,23,3,1,1,'n^2',1),(104,23,3,1,2,'n logn n',0),(105,23,3,2,1,'yes',0),(106,23,3,2,2,'no',1);
/*!40000 ALTER TABLE `QuizQuestionAns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `SecondaryTopic`
--

LOCK TABLES `SecondaryTopic` WRITE;
/*!40000 ALTER TABLE `SecondaryTopic` DISABLE KEYS */;
INSERT INTO `SecondaryTopic` VALUES (1,2),(1,3),(7,3),(18,3),(5,4),(6,4),(2,6),(1,10),(2,10),(31,10);
/*!40000 ALTER TABLE `SecondaryTopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (1),(2),(3),(7),(15),(16),(17),(18),(19),(20),(39),(44),(47);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `StudentQuizAns`
--

LOCK TABLES `StudentQuizAns` WRITE;
/*!40000 ALTER TABLE `StudentQuizAns` DISABLE KEYS */;
INSERT INTO `StudentQuizAns` VALUES (1,1,1,1,1,2,1),(2,1,1,1,2,2,0),(3,1,1,2,1,1,1),(4,1,1,2,2,2,0),(5,1,1,3,1,1,1),(6,1,1,3,2,2,1),(7,1,1,4,1,1,0),(8,1,1,4,2,1,1),(9,1,1,5,1,1,1),(10,1,1,5,2,2,1),(11,2,1,1,1,1,0),(12,2,1,1,2,2,0),(13,2,1,2,1,1,1),(14,2,1,2,2,1,1),(15,2,1,3,1,1,1),(16,2,1,3,2,2,1),(17,2,1,4,1,1,0),(18,2,1,4,2,2,0),(19,2,1,5,1,2,0),(20,2,1,5,2,2,1),(21,3,3,1,1,1,0),(22,3,3,1,2,2,0),(23,3,3,2,1,1,1),(24,3,3,2,2,1,1),(25,3,3,3,1,1,1),(26,3,3,3,2,2,1);
/*!40000 ALTER TABLE `StudentQuizAns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Topic`
--

LOCK TABLES `Topic` WRITE;
/*!40000 ALTER TABLE `Topic` DISABLE KEYS */;
INSERT INTO `Topic` VALUES (1,'Android'),(2,'Artificial Intelligence'),(3,'Data Analytics'),(4,'Data Science'),(5,'Deep Learning'),(6,'Developer Essentrials'),(7,'Digital Marketing'),(8,'iOS'),(9,'Machine Learning'),(10,'Mobile App Development'),(11,'Non-Tech'),(12,'Self-Driving Car'),(13,'Software Engineering'),(14,'Virtual Reality'),(15,'Web Development');
/*!40000 ALTER TABLE `Topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'vidhu@bu.edu','Vidhu','Bhatnagar','$fefoyama$c5cf21ad990b295b852b38ee10721f22a8a','https://randomuser.me/api/portraits/lego/1.jpg','136 Hemenway St','Boston','02115','USA',1,0,0),(2,'DiannaAGleason@jourrapide.com','John','Doe','$juvodala$43ca9305ce451d6d0e13c7d69443c6ecde1','https://randomuser.me/api/portraits/lego/2.jpg','1993 Wood Street','New Orleans','70171','USA',1,0,0),(3,'HollyRAustin@rhyta.com','Holly','Austin','$wizedogi$416f4dddc08311efe67345c352aa364f93f','https://randomuser.me/api/portraits/lego/3.jpg','877 Crim Lane','Miamisburg','45342','USA',1,0,0),(4,'timorthy@somewhere.com','Timothy','Goodale','$bekibola$d3c16a2dcf16d5f2da77d309a191f77f35a','https://randomuser.me/api/portraits/lego/4.jpg','4407 Crestview Manor','Indianapolis','46205','USA',0,1,0),(5,'SandraWRoss@dayrep.com','Sandra','Ross','$guzovuge$90466a0c2ddc78516ceab43bccb3179d490','https://randomuser.me/api/portraits/lego/5.jpg','1473 Gerald L. Bates Drive','Bedford','01730','USA',0,1,0),(6,'SantosLKennedy@jourrapide.com','Santos','Kennedy','$binetemi$76574bccb2f9492b63f1a91bfa1fc834623','https://randomuser.me/api/portraits/lego/6.jpg','2418 Creekside Lane','Santa Barbara','93101','USA',0,1,0),(7,'RaeRHiggins@armyspy.com','Rae ','Higgins','$yixevaba$5e0ddead34f669a079f50a51d2f1168e417','https://randomuser.me/api/portraits/lego/7.jpg','1651 Broadway Avenue','Fall Creek Falls','37367','USA',1,0,0),(8,'tsanuroopa@gmail.com','Anuroopa','TS','$texupawa$b5e664b80546c1f56e4b8649056a6e4d200','https://randomuser.me/api/portraits/lego/8.jpg','109 Peterborough Street','Boston','02215','USA',0,0,1),(9,'CharlotteJHogue@armyspy.com','Charlotte','Hogue','$xexeluzi$3c1a5da947d507702e2268ae0e3c2e3d1b3','https://randomuser.me/api/portraits/lego/9.jpg','4191 Laurel Lane','Midland','79701','USA',0,0,1),(10,'chandlerh@ymail.com','Harold','Chandler','$tidonazo$4c6d3cab2a9fa08f99eeefb58461bb5cadd','https://randomuser.me/api/portraits/lego/5.jpg','581 Clifford Street','Oakland','94607','USA',0,0,1),(11,'CarlyTRichardson@teleworm.us','Carly','Richardson','$haligavi$7f0b25ebb48ed9b7895d5140a700b8dc6b7','https://randomuser.me/api/portraits/lego/2.jpg','62 Harley Vincent Drive','Cleveland','44113','USA',0,0,1),(14,'MaryDMosier@jourrapide.com','Mary','Mosier','$noxokova$4a7446c6503cb48cd973f68f5bd376223c0','http://www.fakenamegenerator.com/images/xsil-female.png.pagespeed.ic.aD_Ur5qVK2.webp','4177 Rinehart Road','Opa Locka','33056','USA',0,1,0),(15,'Email','FirstName','LastName','$xolotuto$ef777716c20e8a895f9d6e8462556630e5e','Picture','Street','City','PostalCode','Country',1,0,0),(16,'howardmonica@ymail.com','Monica','Howard','$duzibabi$754ff9e3442d81496c4657c58f2d586fcf2',NULL,'232 Branford Street','Michigan','96607','USA',1,0,0),(17,'lewinskynat@ymail.com','Nat','Lewinksy','$xepodecu$1e83679af7a44f2f70593c873c8fb7a6d84',NULL,'456 Grain Street','Ohio','45632','USA',1,0,0),(18,'starkbran@ymail.com','Bran','Stark','$rexicapo$73b280505a81ddabde1b65a86cf34d1fb45',NULL,'381 Winter Street','Alaska','96698','USA',1,0,0),(19,'gailm@ymail.com','Gail','Maynard','$suyetene$cd49371b6d2ce2944e76aeea593c3f63818',NULL,'565 Robman Street','Arizona','96637','USA',1,0,0),(20,'williamsrob@ymail.com','Rob','Williams','$pexituto$036547f2ab349e1e08eb4ab907edb1c6750',NULL,'111 Milk Street','Boston','96607','USA',1,0,0),(21,'robert@bu.edu','RObert','Chan','$runigivo$700bb2a83ef1f70e362325869e0afdf6f72','https://randomuser.me/api/portraits/lego/21.jpg','15 Chambers St','Boston','02131','USA',0,0,1),(22,'albert@bu.edu','Albert','Cohen','$lutoyoxo$1992d5a27e3364bd9b717d751500bfe0d04','https://randomuser.me/api/portraits/lego/22.jpg','54 Harold St','Boston','02131','USA',0,0,1),(23,'bill@bu.edu','Bill','Cobert','$nojotuta$a60c6d35d41a74aef0402adc9d7ae97110b','https://randomuser.me/api/portraits/lego/23.jpg','23 Lambord St','Boston','02131','USA',0,0,1),(24,'hazel@bu.edu','Hazel','Wood','$culinalu$1a7169ca6c14ee8ed2e1dd304d6e2d7c055','https://randomuser.me/api/portraits/lego/24.jpg','343 Hording St','Boston','02133','USA',0,0,1),(25,'alex@bu.edu','Alex','Hales','$hukeyoro$7b862637e4d0650b46473bdea546ab0fceb','https://randomuser.me/api/portraits/lego/25.jpg','424 Mt hope St','Boston','02131','USA',0,0,1),(26,'robin@bu.edu','Robin','Ken','$rujacaku$2fbf9629786f82eb21a14d33d939a366e0a','https://randomuser.me/api/portraits/lego/26.jpg','4353 Mudford Ave','Boston','02135','USA',0,0,1),(27,'alpert@bu.edu','Alpert','Dao','$rivecobe$	b86a1cc11ce6a05472746f6b5f39f0ac4a','https://randomuser.me/api/portraits/lego/27.jpg','98 Chambers St','Boston','02131','USA',0,1,0),(28,'barney@bu.edu','Barney','Chapman','$guvezohu$a4db339692826e1d1c6ee22be7b85001331','https://randomuser.me/api/portraits/lego/28.jpg','128 Grenwich St','Boston','02131','USA',0,1,0),(29,'charlieN@bu.edu','Charlie','Newton','$gecarude$12a0b39d6cb00ad0fd1f164bce9f23741ab','https://randomuser.me/api/portraits/lego/29.jpg','3560 Cham Ave','Boston','02135','USA',0,1,0),(30,'david@bu.edu','David','Love','$povovowe$75e880d9283cb3f8a7b389bb028d2ad218d','https://randomuser.me/api/portraits/lego/30.jpg','9823 Fort St','Boston','02131','USA',0,1,0),(31,'ellen@bu.edu','Ellen','Gene','$naxepone$f2879ad47be2c6750e03d6fe101effbfec4','https://randomuser.me/api/portraits/lego/31.jpg','343 Love St','Boston','02135','USA',0,1,0),(32,'frank@bu.edu','Frank','Tip','$kujetevo$48bd3b2ad073ec55fff8f762089f8c28094','https://randomuser.me/api/portraits/lego/32.jpg','90 Headling St','Boston','02131','USA',0,1,0),(39,'vikas8190@gmail.com','vikas','Janardhanan','$tufuravo$82a64ebf77142cdb27f4b76ab073c4db65e',NULL,'203 hillside','Boston','02120','USA',1,0,0),(44,'Alice@somewhere.com','Bob','Alice','$ludufegi$b9c80bf08ea96859f5e22c0ccaa10c1a571','my picture','136 Hemenway St','Boston','02115','USA',1,0,0),(47,'pharry@gmail.com','Harry','Potter','$lBJb0eL$04343fc6b7ccc2b19778217d7a30d98afbf9',NULL,'Hogwarts','Boston','02120','USA',1,0,0);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-10  1:10:02
