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
import app.model.User;

@Path("users")
public class UserService {

	Connection conn = null;

	public UserService() {

		System.out.println("Task service constructor");

	}
	
	@Path("json")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<User> getPopularCourseJson() throws SQLException {

		conn = DBConnection.getConnection();
		Statement stmnt = null;
		
		String userQuery = "select * from User";
		
		List<User> users = new ArrayList<User>();
		try {
			stmnt = conn.createStatement();
			ResultSet rs = stmnt.executeQuery(userQuery);
			while(rs.next()) {
				User user = new User();
				user.setUserID(rs.getInt("UserID"));
				user.setEmail(rs.getString("Email"));
				user.setFirstName(rs.getString("FirstName"));
				user.setLastName(rs.getString("LastName"));
				user.setPassword(rs.getString("Password"));
				user.setStreet(rs.getString("Street"));
				user.setCity(rs.getString("City"));
				user.setPostalCode(rs.getString("PostalCode"));
				user.setCountry(rs.getString("Country"));
				user.setIsStudent(rs.getInt("isStudent"));
				user.setIsFaculty(rs.getInt("isFaculty"));
				user.setIsAdministrator(rs.getInt("isAdministrator"));
				users.add(user);
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if(stmnt!=null) {
				stmnt.close();
			}
		}
		
		return users;
	}
}
