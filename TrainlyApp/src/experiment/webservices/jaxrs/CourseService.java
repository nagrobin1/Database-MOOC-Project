package experiment.webservices.jaxrs;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import app.db.DBConnection;
import app.model.Course;
import app.model.User;

@Path("courses")
public class CourseService {

	Connection conn = null;

	public CourseService() {

		System.out.println("Task service constructor");

	}
	
	@Path("json")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Course> getPopularCourseJson() throws SQLException {

		conn = DBConnection.getConnection();
		Statement stmnt = null;
		
		String userQuery = "select * from Course";
		
		List<Course> courses = new ArrayList<Course>();
		try {
			stmnt = conn.createStatement();
			ResultSet rs = stmnt.executeQuery(userQuery);
			while(rs.next()) {
				Course course = new Course();
				course.setCourseID(rs.getInt("CourseID"));
				course.setCourseName(rs.getString("Name"));
				course.setCreatedDate(rs.getString("CreatedDate"));
				course.setDescription(rs.getString("Description"));
				course.setPrimaryTopic(rs.getInt("PrimaryTopic"));
				course.setCost(rs.getInt("Cost"));
				
				courses.add(course);
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if(stmnt!=null) {
				stmnt.close();
			}
		}
		
		return courses;
	}
}
