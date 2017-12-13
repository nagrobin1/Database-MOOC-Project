### Trainly
CS5200 Project

## Videos

Installation Walkthrough : https://www.youtube.com/watch?v=yFQYFnu2-qk&list=PLJFO3PDCtwHeLN9lnU7HvM2JxMcNAt5Ec

Demo : https://youtu.be/7jVceC_GcL8

Backend Installation Steps
-----------------------

Backend API webservices are built using Java JAX-RS with Connector/J which provides JDBC APIs to interact my MySQL. The project is built using Maven and all the dependencies are mentioned in pom.xml. These are:

  * mysql-connector-java
  * asm
  * jaxb-api
  * jaxb-impl
  * jersey-bundle
  * jsr311-api
  * jackson-core-asl
  * jersey-guava
  * google-collections

1. First step would be the clone the repo using :

    git clone https://github.com/vikas8190/Trainly.git
    
2. Also download tomcat9 tar.gz file from : https://tomcat.apache.org/download-90.cgi . Uncompress into one of the locations      in the local machine.

2. Eclipse was used for the development of the project. Before the project is imported and setup in eclipse, its better to get    MySQL installation completed in the local system.

   To setup MySQL locally, use the brew package manager. Run the below command :
   
       1. brew uninstall mysql
       2. brew update
       3. brew install mysql
       4. To start mysql : brew services start mysql
       5. To stop mysql: brew services stop mysql
       6. mysql_secure_installation 
          To set the root password

   Also setup MySQLWorkbench locally to run the DBSetup scripts.
   
   Download from : https://dev.mysql.com/downloads/workbench/

3. Assuming that MySQL is installed following the instructions above and is up and running, setup connection in MySQLWorkBench    to connect to the MySQL running locally.

4. Open Trainly/DBSetup/ddl.sql within MySQLWorkBench and execute the same. After that execute Trainly/DBSetup/dml.sql

5. Open eclipse and import TrainlyApp by using File->Open Project from File system.

6. Modify src/app/db/db.Properties to modify the details of mysql user, password and the host.

7. All the dependencies for the project is mentioned in pom.xml. To generate a WAR to deploy on tomcat, do the below:

   Right click on project.

   Run as -> Maven build -> "clean install" as the goal.

   This creates the war file under TrainlyApp/target/TrainlyApp.war

8. To run the project, either of the below two steps can be used :

    Run within eclipse : 

       1. Create a tomcat server configuration within eclipse by following File->New->Other->Server and specifying path of the          local tomcat installation.

       2. Right click on project. Run as -> Run on server->Select the server created above. 

       3. This will get the webservice application hosted on tomcat instance.

    Run using local tomcat server:

       1. Copy the Trainly.war file to webapps directory of the local tomcat installation.

       2. Start/Restart the tomcat server.

       3. Now you would be able to access apis using http://localhost:8080/TrainlyApp/ followed by the endpoint.

          For example : http://localhost:8080/TrainlyApp/api/report/topicsofinterest/semester/fall
	  
9. Details regarding the end points offered are mentioned in the api documentation below. If a local setup for the application    is not needed to be setup, we have deployed the backend api webservices on an Amazon EC2 instance. The same can be accessed    using :http://ec2-54-243-14-181.compute-1.amazonaws.com:8080/TrainlyApp followed by the required api end point.

WebFrontEnd Installation Steps
-----------------------

WebFrontEnd is built using Angular2. The instruction to deploy it in tomcat instance is mentioned below:

1. Go to Trainly/WebFrontend from the checkout path.

2. brew install npm

3. npm install -g @angular/cli

4. npm install

5. ng build

6. In tomcat directory, go to webapps/ROOT and create a directory Trainly.

7. Copy the contents of WebFrontEnd/dist/* to webapps/ROOT/Trainly. Edit ROOT/Trainly/index.html to change href="." .

8. Start the tomcat server using ./startup.sh from the bin directory.

9. Navigate to http://localhost:8080/Trainly to view the application.


## Final Packaged Project Contents

Access Trainly/packet to find the final WAR file of the backend build which can be directly taken and copied to webapps directory in tomcat to test the backend if the above installation steps were not carried out. Its configured to connect to MySQL started using the Amazon RDS service.

Other files related to project submission is also available in the same directory.

## API documentation:

End point: http://ec2-54-243-14-181.compute-1.amazonaws.com:8080/TrainlyApp

## Report Queries 

### 1. Topics of Interest

If topics of interest is defined as those topics for which the related courses has enrollments which has resulted in atleast 80 percent completion of related courses in a semester or for which the related courses has received maximum average rating among all the other topics related courses in the same semester, then write a query that finds such topics for the given semester across all possible year. So the result set shows the topics of interests for each of the year data we have per semester given. User input the query is either “Fall,Spring or Summer”. Resultset includes : topicName,semester,avgRating,matchType where
Semester is year followed by either -Spring,-Summer,-Fall
matchType is either minCompletionPercent or maxAverageRating
Order the final results in the decreasing order of avgRating


GET: api/report/topicsofinterest/semester/{semester}

semester = Fall,Spring,Summer

   output json fields :
   
   a. semester
   
   b. topicName
   
   c. avgRating
   
   d. matchType


### 2. Popular course:

List names of faculty and the courses they created that has resulted in atleast 5 enrollments in the last year and have received atleast an average rating of 4 for the course and has atleast 1 interested student. Resultset should have CourseName, FacultyName, EnrollmentCnt and AverageRating. Order the results in decreasing order of EnrollmentCnt,AverageRating

GET: api/report/popularcourse/json

  No parameters 

  output json fields:
  
  a. courseName
  
  b. facultyName
  
  c. enrollmentCnt
  
  d. avgRating


### 3. Difficult Quiz Question/Topic

List the top 5 quiz questions along with the topic that they are associated with that resulted in the highest number of failed attempts. Result should have questionText, topicName and failedAttemptCnt. Results should be ordered by decreasing number of failedAttemptCnt.

GET: api/report/difficultquiz/json

  No parameters

  output json fields:
  
  a. questionText
  
  b. topicName
  
  c. failedAttemptCnt


### 4. Favourite questions.

-- for a given courseName, find the most liked question, primary topic its related to, the count of likes it received
-- the question should be liked by atleast 2 students
-- pass in the parameter in WHERE courseName=
-- order by the decreasing order of number of likes received

GET: api/report/favouritequestion/course/{courseName}

  courseName

  output json fields:
  
  a. questionText
  
  b. topicName
  
  c. noOfLikes


### 5. Course-Topic Enrollment Summary for a semester:

Produce a course-topic summary for the semester given. The summary would include topicName, courseName, secondaryTopics(comma seperated secondary topics associated with the course), enrolledCnt(Total number of students enrolled in the course in the given semester),
completedCnt(Total number of enrolled students who have completed the course in the given semester). Atleast one student should have completed the course in the given semester.
Order the results in decreasing order of enrolledCnt,completedCnt

GET: api/report/coursetopicsummary/semester/{semester}

  semester

  output json fields:
  
  a. topicName
  
  b. courseName
  
  c. secondaryTopics
  
  d. enrolledCnt
  
  e. totalCost
  
  f. completedCnt

## Task Queries

### 1. Task A: Register a new user

POST: api/task/create/user

fields:

  a. email
  
  b. firstName
  
  c. lastName
  
  d. password
  
  e. picture
  
  f. street
  
  g. city
  
  h. postalCode
  
  g. country
  
  h. isStudent
  
  i. isFaculty
  
  j. isAdministrator


### 2a. Task B: Authorize User as Admin

POST: api/task/authorize/admin

fields:
  
  a. adminID (the admin who is granting the authorization)
  
  b. userID (the new user who is going to be made as admin)


### 2b. Task B: Authorize Faculty

POST: api/task/authorize/faculty

fields:
  
  a. adminID
  
  b. userID (faculty userID who is to be authenticated)


### 3. Task C: Provide a categorized list of a student’s courses (each with primary/secondary topics, ranked by average evaluation score): currently enrolled, completed, of interest

GET: api/task/courseinfo/student/{studentID}

studentID - ID of student for which details are to be fetched

  output json fields:
  
    a. courseName
  
    b. primaryTopic
  
    c. secondaryTopics
  
    d. avgRating


### 4. Task D:Enroll student in a course

POST: api/task/enroll

fields:
  
  a. studentID
  
  b. courseID
  
  c. enrolledTime
  
  d. confirmationCode
  
  e. paymentTime

### 5. Task E: For a student enrolled in a course, list materials, in order, indicating the line of demarcation between completed/not completed

GET: api/task/materialinfo/{studentID}/{courseID}

studentID - ID of student for which details are to be fetched
courseID - ID of class for which details are to be fetched

output json fields:
  
  a. materialName
  
  b. completed
  
### 6. Task F: Mark course material as having been completed by a student (possibly resulting in course completion)

POST: api/task/markMaterialCompleted

Fields:

   a. enrollmentID

   b. sequenceID

### 7. Task G: Provide a certificate of completion for a student (assuming s/he has successfully completed all materials)

GET: api/task/certificate/{userID}/{courseID}

userID - ID of student for which the certificate is to be made
courseID - ID of course for which the certificate is to be fetched

output String : "No Certificate" or "Yes Certificate"

### 8. Task H: Provide an account history for a user: dates of enrollment/completion for each course, amount paid (with confirmation code), and total spent. 

GET: api/task/userAccountHistory/{userID}

userID - ID of user for which details are to be fetched

output json fields:
  
  a. userID
  
  b. userFirstName
  
  c. userLastName
  
  d. completionInfoList:

      1. courseName
      2. enrolledTime
      3. confirmationCode
      4. courseCost
      5. isCompleted

  e. totalSpent

## Helper Queries
  
### 1. Get list of users

GET: api/users/json

fields:
  
  userID
   
	email
	
  firstName
   
	lastName
   
	password
   
	picture
   
	street
   
	city
   
	postalCode
   
	country
   
	isStudent
   
	isFaculty
   
	isAdministrator
	
### 2. List of Courses

GET: api/courses/json

fields:
  
  courseID
  
  courseName
  
  description
  
  cost
  
  createdDate
  
  primaryTopic
