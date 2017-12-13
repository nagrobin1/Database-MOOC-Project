package experiment.webservices.jaxrs;

import javax.ws.rs.Path;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import app.db.DBConnection;
import app.model.PopularCourse;

@Path("popularcourse")
public class PopularCourseService {

	Connection conn = null;
	public PopularCourseService() {

		conn = DBConnection.getConnection();
	}

	@Path("json")
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

}
