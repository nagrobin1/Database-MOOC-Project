package experiment.webservices.jaxrs;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import app.db.DBConnection;
import app.model.CourseTopicPerSemesterSummary;
import app.model.DifficultQuiz;
import app.model.FavouriteQuestion;
import app.model.PopularCourse;
import app.model.TopicsOfInterest;

@Path("report")				
public class ReportService {
	
	
	
	Connection conn = null;
	public ReportService() {

		conn = DBConnection.getConnection();
	}

	@Path("topicsofinterest/semester/{semester}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<TopicsOfInterest> getTopicsOfInterestasJson(@PathParam("semester") String semester) throws SQLException {

		PreparedStatement stmnt = null;
		
		String topicsOfInterestQuery = "select temp.semester as semester,temp.topicName as topicName,avg(temp.rating) as avgRating, 'minCompletionPercent' as matchType from (select CASE WHEN MONTH(EnrolledTime) BETWEEN 1 and 4 THEN CONCAT(YEAR(EnrolledTime),\"-Spring\")\n" + 
				"            WHEN MONTH(EnrolledTime) BETWEEN 5 and 8 THEN CONCAT(YEAR(EnrolledTime),\"-Summer\")\n" + 
				"            WHEN MONTH(EnrolledTime) BETWEEN 9 and 12 THEN CONCAT(YEAR(EnrolledTime),\"-Fall\") END as semester,\n" + 
				"            t.name as topicName,c.PrimaryTopic as topicID, e.EnrollmentID, e.Rating as rating\n" + 
				"                  from Enrollment e\n" + 
				"                  inner join Course c\n" + 
				"                                    on e.CourseID=c.CourseID\n" + 
				"                  inner join Topic t\n" + 
				"                                    on c.PrimaryTopic=t.TopicID) temp\n" + 
				"                   where temp.semester like CONCAT('%',@semester,'%')\n" + 
				"                   group by temp.semester,temp.topicName\n" + 
				"                   having (\n" + 
				"                         (select count(e.EnrollmentID) from\n" + 
				"                                  Enrollment e\n" + 
				"                                  inner join Course c\n" + 
				"                                             on e.CourseID=c.CourseID\n" + 
				"                                  inner join CompletedMaterial cm\n" + 
				"                                                             on cm.EnrollmentID=e.EnrollmentID\n" + 
				"                                  where c.PrimaryTopic=temp.topicID\n" + 
				"                                       group by e.EnrollmentID,c.CourseID\n" + 
				"                                       having count(distinct cm.Sequence) =\n" + 
				"                                                   (select count(distinct Sequence) from Material\n" + 
				"                                                       where\n" + 
				"                                                         CourseID=c.CourseID)\n" + 
				"                              )/count(temp.EnrollmentID))*100 >= 80\n" + 
				"                  UNION\n" + 
				"                     select temp.semester as semester, temp.topicName as topicName,max(avgRating) as avgRating,'MaxAverageRating' as matchType\n" + 
				" from\n" + 
				"           (select CASE WHEN MONTH(EnrolledTime) BETWEEN 1 and 4 THEN CONCAT(YEAR(EnrolledTime),\"-Spring\")\n" + 
				"            WHEN MONTH(EnrolledTime) BETWEEN 5 and 8 THEN CONCAT(YEAR(EnrolledTime),\"-Summer\")\n" + 
				"            WHEN MONTH(EnrolledTime) BETWEEN 9 and 12 THEN CONCAT(YEAR(EnrolledTime),\"-Fall\") END as semester,\n" + 
				"            t.name as topicName,avg(rating) as avgRating\n" + 
				"            from\n" + 
				"                   Enrollment e\n" + 
				"                   inner join Course c\n" + 
				"                                   on e.CourseID=c.CourseID\n" + 
				"                   inner join Topic t\n" + 
				"                                   on c.PrimaryTopic=t.TopicID\n" + 
				"                    group by semester,topicName) temp\n" + 
				"            where temp.semester like CONCAT('%',?,'%')\n" + 
				"            group by temp.semester,temp.topicName\n" + 
				"            order by avgRating";
		
		List<TopicsOfInterest> topics = new ArrayList<TopicsOfInterest>();
		try {
			stmnt = conn.prepareStatement(topicsOfInterestQuery);
			stmnt.setString(1, semester);
			ResultSet rs = stmnt.executeQuery();
			while(rs.next()) {
				TopicsOfInterest topic = new TopicsOfInterest();
				topic.setSemester(rs.getString("semester"));
				topic.setTopicName(rs.getString("topicName"));
				topic.setAvgRating(rs.getDouble("avgRating"));
				topic.setMatchType(rs.getString("matchType"));
				topics.add(topic);
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if(stmnt!=null) {
				stmnt.close();
			}
		}
		
		return topics;
	}
    
   
	@Path("popularcourse/json")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<PopularCourse> getPopularCourseJson() throws SQLException {

		Statement stmnt = null;
		
		String popularcourseQuery = "select c.Name as CourseName,CONCAT(u.FirstName,'.',u.LastName) as FacultyName, count(e.EnrollmentID) as EnrollmentCnt" + 
				",avg(e.Rating) as AverageRating" + 
				"         from Enrollment e" + 
				"         inner join Course c on e.CourseID=c.CourseID" + 
				"         inner join CourseCreated cc on c.CourseID=cc.CourseID" + 
				"         inner join User u on cc.UserID=u.UserID" + 
				"         where" + 
				"              exists(select CourseID from Interest where CourseID=c.CourseID group by CourseID" + 
				"              having count(UserID) >0)" + 
				"              and e.EnrolledTime > date_sub(NOW(), INTERVAL 1 YEAR)" + 
				"         group by c.Name,u.FirstName" + 
				"         having count(e.EnrollmentID) >=5" + 
				"         and avg(e.Rating)>=4" + 
				"         order by count(e.EnrollmentID),avg(e.Rating)";
		
		List<PopularCourse> popCourses = new ArrayList<PopularCourse>();
		try {
			stmnt = conn.createStatement();
			ResultSet rs = stmnt.executeQuery(popularcourseQuery);
			while(rs.next()) {
				PopularCourse popCourse = new PopularCourse();
				popCourse.setCourseName(rs.getString("CourseName"));
				popCourse.setFacultyname(rs.getString("FacultyName"));
				popCourse.setEnrollmentCnt(rs.getInt("EnrollmentCnt"));
				popCourse.setAvgRating(rs.getDouble("AverageRating"));
				popCourses.add(popCourse);
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if(stmnt!=null) {
				stmnt.close();
			}
		}
		
		return popCourses;
	}
	
	@Path("difficultquiz/json")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<DifficultQuiz> getDifficultQuizJson() throws SQLException {

		Statement stmnt = null;
		
		String difficultQuizQuery = "select CONVERT(qq.Text USING utf8) as questionText,t.Name as topicName,count(stquizans.QuizQuestionNumber) as failedAttemptCnt\n" + 
				"        from StudentQuizAns stquizans\n" + 
				"                inner join QuizQuestion qq on qq.CourseID=stquizans.CourseID and\n" + 
				"                                                                 qq.Sequence=stquizans.Sequence and\n" + 
				"                                                                 qq.QuestionNumber=stquizans.QuizQuestionNumber\n" + 
				"               inner join Course c on qq.courseID=c.CourseID\n" + 
				"               inner join Topic t on c.PrimaryTopic=t.TopicID\n" + 
				"                      where exists(select 1 from QuizQuestionAns where\n" + 
				"                                                CourseID=stquizans.CourseID\n" + 
				"                                                and Sequence=stquizans.Sequence and\n" + 
				"                                                QuizQuestionNumber=stquizans.QuizQuestionNumber\n" + 
				"                                                and isCorrect=1 and OptionNumber <> stquizans.OptionNumber)\n" + 
				"                group by qq.QuizQuestionID\n" + 
				"                order by count(stquizans.QuizQuestionNumber) desc\n" + 
				"   LIMIT 5;";
		
		List<DifficultQuiz> diffQuizes = new ArrayList<DifficultQuiz>();
		try {
			stmnt = conn.createStatement();
			ResultSet rs = stmnt.executeQuery(difficultQuizQuery);
			while(rs.next()) {
				DifficultQuiz diffQuiz = new DifficultQuiz();
				diffQuiz.setQuestionText(rs.getString("questionText"));
				diffQuiz.setTopicName(rs.getString("topicName"));
				diffQuiz.setFailedAttemptCnt(rs.getInt("failedAttemptCnt"));
				diffQuizes.add(diffQuiz);
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if(stmnt!=null) {
				stmnt.close();
			}
		}
		
		return diffQuizes;
	}
	
	@Path("favouritequestion/course/{courseName}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<FavouriteQuestion> getFavouriteQuestionasJson(@PathParam("courseName") String courseName) throws SQLException {

		PreparedStatement stmnt = null;
		
		String favouriteQuestionQuery = "SELECT  CONVERT(q.Question using utf8) as Question_Text, t.Name as topicName,COUNT(s.userID) as Number_Of_Likes\n" + 
				"    FROM Course c\n" + 
				"    inner join Topic t on c.PrimaryTopic=t.TopicID\n" + 
				"    inner join Enrollment en on c.CourseID = en.courseID\n" + 
				"    inner join Student s on s.UserID = en.UserID\n" + 
				"    inner join Question q on q.EnrollmentID = en.EnrollmentID\n" + 
				"    left join QuestionLike ql on ql.UserID = s.UserID AND ql.QuestionID = q.QuestionID\n" + 
				"WHERE c.Name = ? and q.IsPublic = 1\n" + 
				"GROUP BY ql.QuestionId,topicName\n" + 
				"    HAVING COUNT(s.userID) >= 2\n" + 
				"    Order By Number_Of_Likes desc";
		
		List<FavouriteQuestion> questions = new ArrayList<FavouriteQuestion>();
		try {
			stmnt = conn.prepareStatement(favouriteQuestionQuery);
			stmnt.setString(1, courseName);
		
			ResultSet rs = stmnt.executeQuery();
			while(rs.next()) {
				FavouriteQuestion question = new FavouriteQuestion();
				question.setQuestionText(rs.getString("Question_Text"));
				question.setTopicName(rs.getString("topicName"));
				question.setNoOfLikes(rs.getInt("Number_Of_Likes"));
				questions.add(question);
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if(stmnt!=null) {
				stmnt.close();
			}
		}
		
		return questions;
	}
	
	@Path("coursetopicsummary/semester/{semester}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<CourseTopicPerSemesterSummary> getCourseTopicSummaryasJson(@PathParam("semester") String semester) throws SQLException {

		PreparedStatement stmnt = null;
		
		String favouriteQuestionQuery = "select sub.topicName,sub.courseName,sub.secondaryTopics,sub.enrolledCnt,sub.totalAmount,sub.completedCnt\n" + 
				"from\n" + 
				"(select CASE WHEN MONTH(EnrolledTime) BETWEEN 1 and 4 THEN CONCAT(YEAR(EnrolledTime),\"-Spring\")\n" + 
				"			WHEN MONTH(EnrolledTime) BETWEEN 5 and 8 THEN CONCAT(YEAR(EnrolledTime),\"-Summer\")\n" + 
				"			WHEN MONTH(EnrolledTime) BETWEEN 9 and 12 THEN CONCAT(YEAR(EnrolledTime),\"-Fall\") END as semester,t.Name as topicName,c.Name as courseName,secondary.secTopics as secondaryTopics, \n" + 
				"count(e.EnrollmentID) as enrolledCnt,sum(c.Cost) as totalAmount,\n" + 
				"completed.completedCnt\n" + 
				"from Enrollment e\n" + 
				"inner join Course c on e.CourseID=c.CourseID\n" + 
				"inner join Topic t on c.PrimaryTopic=t.TopicID\n" + 
				"left join (select c.CourseID,group_concat(t.Name) as secTopics from \n" + 
				"            Course c\n" + 
				"            inner join SecondaryTopic st on st.CourseID=c.CourseID\n" + 
				"            inner join\n" + 
				"			Topic t\n" + 
				"            on st.TopicID=t.TopicID\n" + 
				"             group by c.CourseID) secondary\n" + 
				"    on c.CourseID=secondary.CourseID\n" + 
				"left join (select c.courseID as courseID,t.TopicID as topicID,count(distinct e.EnrollmentID) as completedCnt\n" + 
				"           from \n" + 
				"           Enrollment e\n" + 
				"          inner join Course c\n" + 
				"		          on e.CourseID=c.CourseID\n" + 
				"	      inner join Topic t\n" + 
				"				  on c.PrimaryTopic=t.TopicID\n" + 
				"          inner join CompletedMaterial cm\n" + 
				"                  on cm.EnrollmentID=e.EnrollmentID\n" + 
				"          group by c.CourseID,t.TopicID\n" + 
				"          having count(distinct cm.Sequence) =\n" + 
				"                           (select count(distinct Sequence) from Material\n" + 
				"								where\n" + 
				"								CourseID=c.CourseID)) completed\n" + 
				"on c.CourseID=completed.courseID and t.TopicID=completed.topicID\n" + 
				"group by t.Name,c.Name\n" + 
				"having completedCnt>0\n" + 
				"order by enrolledCnt,completedCnt) sub\n" + 
				"where semester like CONCAT('%',?,'%')";
		
		List<CourseTopicPerSemesterSummary> summaries = new ArrayList<CourseTopicPerSemesterSummary>();
		try {
			stmnt = conn.prepareStatement(favouriteQuestionQuery);
			stmnt.setString(1, semester);
		
			ResultSet rs = stmnt.executeQuery();
			while(rs.next()) {
				CourseTopicPerSemesterSummary summary = new CourseTopicPerSemesterSummary();
				summary.setCourseName(rs.getString("courseName"));
				summary.setTopicName(rs.getString("topicName"));
				summary.setSecondaryTopics(rs.getString("secondaryTopics")==null?"":rs.getString("secondaryTopics"));
				summary.setEnrolledCnt(rs.getInt("enrolledCnt"));
				summary.setTotalCost(rs.getDouble("totalAmount"));
				summary.setCompletedCnt(rs.getInt("completedCnt"));
				summaries.add(summary);
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if(stmnt!=null) {
				stmnt.close();
			}
		}
		
		return summaries;
	}

}
