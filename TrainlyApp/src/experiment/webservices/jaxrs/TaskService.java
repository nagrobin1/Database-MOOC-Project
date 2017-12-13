package experiment.webservices.jaxrs;

import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.sun.jersey.api.client.ClientResponse.Status;

import app.db.DBConnection;
import app.model.Authorization;
import app.model.Certificate;
import app.model.CertificateStatus;
import app.model.CourseCompletionInfo;
import app.model.CourseInfo;
import app.model.Enrollment;
import app.model.FavouriteQuestion;
import app.model.MaterialCompleted;
import app.model.MaterialInfoForStudentInClass;
import app.model.User;
import app.model.UserAccountHistory;

@Path("task")
public class TaskService {

	Connection conn = null;

	public TaskService() {

		System.out.println("Task service constructor");

	}

    /**
     * Task A: Register a new user
     * @param user
     * @return
     * @throws SQLException
     */
	@Path("create/user")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public Response createUser(User user) throws SQLException {
		Status status = null;
		conn = DBConnection.getConnection();
		System.out.println(user.getEmail());
		System.out.println(user.getFirstName());

		String userCreateQuery = "insert into User(Email,FirstName,LastName,Password,Picture,Street,"
				+ "City,PostalCode,Country,isStudent,isFaculty,isAdministrator) " + "values(?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement stmnt = null;
		Statement stmnt1 = null;
		try {
			conn.setAutoCommit(false);
			stmnt = conn.prepareStatement(userCreateQuery);
			stmnt.setString(1, user.getEmail());
			stmnt.setString(2, user.getFirstName());
			stmnt.setString(3, user.getLastName());
			stmnt.setString(4, SaltHash.saltHashPass(user.getPassword()));
			stmnt.setString(5, user.getPicture());
			stmnt.setString(6, user.getStreet());
			stmnt.setString(7, user.getCity());
			stmnt.setString(8, user.getPostalCode());
			stmnt.setString(9, user.getCountry());
			stmnt.setInt(10, user.getIsStudent());
			stmnt.setInt(11, user.getIsFaculty());
			stmnt.setInt(12, user.getIsAdministrator());
			System.out.println("running query");
			stmnt.executeUpdate();
			
			stmnt1 = conn.createStatement();
			stmnt1.executeUpdate("insert into Student(UserID) values(LAST_INSERT_ID())");
			conn.commit();
			status=Status.OK;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			if (conn != null) {
				try {
					System.err.print("Transaction is being rolled back");
					conn.rollback();
					status = Status.BAD_REQUEST;
				} catch (SQLException excep) {
					System.err.print("Exception while rolling back :" + e.getMessage());
				}
			}
		} finally {
			if (stmnt != null) {
				stmnt.close();
			}
			if (stmnt1 != null) {
				stmnt1.close();
			}
		}
		return Response.status(status).type(MediaType.TEXT_HTML_TYPE).build();

	}

    /**
     * Task B: As an administrator, authenticate a fellow administrator
     * @param auth
     * @return
     * @throws SQLException
     */
	@Path("authorize/admin")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public Response authorizeNewAdmin(Authorization auth) throws SQLException {
		conn = DBConnection.getConnection();

		String userCreateQuery = "insert into Administrator(UserID) values(?)";
		PreparedStatement stmnt = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		
		String authTime = dateFormat.format(date);
		Status status=null;
		try {
			conn.setAutoCommit(false);
			stmnt = conn.prepareStatement(userCreateQuery);
			stmnt.setInt(1, auth.getUserID());
			stmnt.executeUpdate();
			stmnt.close();
			stmnt = conn.prepareStatement("insert into GrantedRole values(?,?,?,?)");
			stmnt.setInt(1, auth.getUserID());
			stmnt.setInt(2, auth.getAdminID());
			stmnt.setString(3, "Admin");
			stmnt.setString(4, authTime);
			stmnt.executeUpdate();
			conn.commit();
			status=Status.OK;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			if (conn != null) {
				try {
					System.err.print("Transaction is being rolled back");
					status = Status.BAD_REQUEST;
					conn.rollback();
				} catch (SQLException excep) {
					System.err.print("Exception while rolling back :" + e.getMessage());
				}
			}
		} finally {
			if (stmnt != null) {
				stmnt.close();
			}
		}

		return Response.status(status).type(MediaType.TEXT_HTML_TYPE).build();
	}

    /**
     * Task B: As an administrator, authenticate a faculty user (based upon title/affiliation/website/email)
     * @param auth
     * @return
     * @throws SQLException
     */
	@Path("authorize/faculty")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public Response authorizeNewFaculty(Authorization auth) throws SQLException {
		conn = DBConnection.getConnection();

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		
		String authTime = dateFormat.format(date);
		String authorizeFacultyQuery = "update Faculty SET ValidatedBy=?,ValidationTime=? where UserID=?";
		PreparedStatement stmnt = null;
		Status status=null;
		try {
			stmnt = conn.prepareStatement(authorizeFacultyQuery);
			stmnt.setInt(1, auth.getAdminID());
			stmnt.setString(2, authTime);
			stmnt.setInt(3, auth.getUserID());
			stmnt.executeUpdate();
			stmnt.close();
			conn.commit();
			status = Status.OK;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			if (conn != null) {
				try {
					System.err.print("Transaction is being rolled back");
					conn.rollback();
					status = Status.BAD_REQUEST;
				} catch (SQLException excep) {
					System.err.print("Exception while rolling back :" + e.getMessage());
				}
			}
		} finally {
			if (stmnt != null) {
				stmnt.close();
			}
		}
		return Response.status(status).type(MediaType.TEXT_HTML_TYPE).build();

	}

    /**
     * Task C: Provide a categorized list of a student’s courses (each with primary/secondary topics, ranked by average
     * evaluation score): currently enrolled, completed, of interest
     * @param studentID
     * @return
     * @throws SQLException
     */
	@Path("courseinfo/student/{studentID}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<CourseInfo> getCourseInfoasJson(@PathParam("studentID") int studentID) throws SQLException {

		conn = DBConnection.getConnection();
		PreparedStatement stmnt = null;

		String courseInfoQuery = "SELECT avgRatings.CourseID AS CourseID, avgRatings.Name AS CourseName, avgRatings.PrimaryTopic, avgRatings.SecondaryTopic, avgRatings.AvgRating FROM\n"
				+ "(\n" + "    SELECT topics.*, AVG(`Enrollment`.`Rating`) AS AvgRating FROM\n" + "    (\n"
				+ "        SELECT\n" + "            `Course`.`CourseID`,\n" + "            `Course`.`Name`,\n"
				+ "            Topic.`Name` AS PrimaryTopic,\n"
				+ "            GROUP_CONCAT(`tp`.`Name` SEPARATOR ',') AS SecondaryTopic\n" + "        FROM Course\n"
				+ "        INNER JOIN\n" + "         `Topic`\n"
				+ "            ON(Topic.`TopicID` = `Course`.`PrimaryTopic`)\n" + "        LEFT JOIN\n"
				+ "         `SecondaryTopic`\n" + "            ON(`SecondaryTopic`.`CourseID` = `Course`.`CourseID`)\n"
				+ "        LEFT JOIN `Topic` tp\n" + "            ON(tp.`TopicID` = `SecondaryTopic`.`TopicID`)\n"
				+ "        GROUP BY Course.`CourseID`\n" + "    ) topics\n" + "    LEFT JOIN Enrollment\n"
				+ "        ON (topics.CourseID = `Enrollment`.`CourseID`)\n" + "    GROUP BY topics.CourseID\n"
				+ ") AS avgRatings\n" + "INNER JOIN\n" + "(\n" + "    (\n"
				+ "    SELECT `CourseID` FROM `Enrollment` WHERE UserID = ?\n" + "    )\n" + "    UNION ALL\n"
				+ "    (\n" + "    SELECT `CourseID` FROM `Interest` WHERE UserID = ?\n" + "    )\n"
				+ ") interestEnrollment\n" + "ON (avgRatings.CourseID = interestEnrollment.CourseID)\n"
				+ "GROUP BY avgRatings.CourseID";

		List<CourseInfo> courseInfos = new ArrayList<CourseInfo>();
		try {
			stmnt = conn.prepareStatement(courseInfoQuery);
			stmnt.setInt(1, studentID);
			stmnt.setInt(2, studentID);

			ResultSet rs = stmnt.executeQuery();
			while (rs.next()) {
				CourseInfo courseInfo = new CourseInfo();
				courseInfo.setCourseID(rs.getInt("CourseID"));
				courseInfo.setCourseName(rs.getString("CourseName"));
				courseInfo.setPrimaryTopic(rs.getString("PrimaryTopic"));
				courseInfo.setSecondaryTopics(rs.getString("SecondaryTopic"));
				courseInfo.setAvgRating(rs.getDouble("AvgRating"));
				courseInfos.add(courseInfo);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (stmnt != null) {
				stmnt.close();
			}
		}

		return courseInfos;
	}

    /**
     * Task D: Enroll a student in a course
     * @param enrollInfo
     * @return
     * @throws SQLException
     */
	@Path("enroll")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public Response enrollStudent(Enrollment enrollInfo) throws SQLException {
		Status status = null;
		conn = DBConnection.getConnection();

		String enrollQuery = "insert into Enrollment(UserID, CourseID, EnrolledTime, ConfirmationCode, PaymentTime) "
				+ "values(?,?,?,?,?)";
		PreparedStatement stmnt = null;
		try {
			conn.setAutoCommit(false);
			stmnt = conn.prepareStatement(enrollQuery);
			stmnt.setInt(1, enrollInfo.getStudentID());
			stmnt.setInt(2, enrollInfo.getCourseID());
			stmnt.setString(3, enrollInfo.getEnrolledTime());
			stmnt.setString(4, enrollInfo.getConfirmationCode());
			stmnt.setString(5, enrollInfo.getPaymentTime());
			stmnt.executeUpdate();
			stmnt.close();
			conn.commit();
			status = Status.OK;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			if (conn != null) {
				try {
					System.err.print("Transaction is being rolled back");
					conn.rollback();
					status = Status.BAD_REQUEST;
				} catch (SQLException excep) {
					System.err.print("Exception while rolling back :" + e.getMessage());
				}
			}
		} finally {
			if (stmnt != null) {
				stmnt.close();
			}
		}
		return Response.status(status).type(MediaType.TEXT_HTML_TYPE).build();

	}

    /**
     * Task E: For a student enrolled in a course, list materials, in order, indicating the line of
     * demarcation between completed/not completed
     * @param studentID
     * @param courseID
     * @return
     * @throws SQLException
     */
    @Path("materialinfo/{studentID}/{courseID}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<MaterialInfoForStudentInClass> getMaterialsForStudentInCourse(@PathParam("studentID") int studentID, @PathParam("courseID") int courseID) throws SQLException {

        conn = DBConnection.getConnection();
        PreparedStatement stmnt = null;

        String getMaterialsForStudentInCourseQuery = "SELECT\n" +
                "    `Material`.`Name` AS MaterialName,\n" +
                "    `Material`.`Sequence`,\n" +
                "    IF(`CompletedMaterial`.`DateTime`, \"Yes\", \"No\") AS Completed,\n" +
		"    Enrollment.`EnrollmentID`\n" +
                "       FROM\n" +
                "    `mydb`.`Enrollment`\n" +
                "    INNER JOIN `mydb`.`Student`\n" +
                "        ON (`Enrollment`.`UserID` = `Student`.`UserID`)\n" +
                "    INNER JOIN `mydb`.`Course`\n" +
                "        ON (`Enrollment`.`CourseID` = `Course`.`CourseID`)\n" +
                "    INNER JOIN `mydb`.`Material`\n" +
                "        ON (`Material`.`CourseID` = `Course`.`CourseID`)\n" +
                "    LEFT JOIN `mydb`.`CompletedMaterial`\n" +
                "        ON (`CompletedMaterial`.`EnrollmentID` = `Enrollment`.`EnrollmentID`) " +
                "       AND (`CompletedMaterial`.`Sequence` = `Material`.`Sequence`)\n" +
                "    WHERE `Student`.`UserID` = ? AND `Enrollment`.`CourseID` = ?\n" +
                "    ORDER BY `Course`.`CourseID`, `Material`.`Sequence`";

        List<MaterialInfoForStudentInClass> materialInfoForStudentInClassList = new ArrayList<>();

        try {
            stmnt = conn.prepareStatement(getMaterialsForStudentInCourseQuery);
            stmnt.setInt(1, studentID);
            stmnt.setInt(2, courseID);

            ResultSet rs = stmnt.executeQuery();

            while (rs.next()) {
                MaterialInfoForStudentInClass materialInfoForStudentInClass = new MaterialInfoForStudentInClass();
		        materialInfoForStudentInClass.setSequence(rs.getInt("Sequence"));
		        materialInfoForStudentInClass.setEnrollmentID(rs.getInt("EnrollmentID"));
                materialInfoForStudentInClass.setMaterialName(rs.getString("MaterialName"));
                System.out.println(rs.getString("Completed"));
                materialInfoForStudentInClass.setCompleted(rs.getString("Completed"));
                materialInfoForStudentInClassList.add(materialInfoForStudentInClass);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (stmnt != null) {
                stmnt.close();
            }
        }

        return materialInfoForStudentInClassList;
    }

    /**
     * Task F: Mark course material as having been completed by a student (possibly resulting in course completion)
     * @param enrollmentID
     * @param sequenceID
     * @return
     * @throws SQLException
     */

    @Path("markMaterialCompleted")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
    public Response markMaterialAsCompleted(MaterialCompleted materialCompleted) throws SQLException {

        conn = DBConnection.getConnection();
        PreparedStatement stmnt = null;
        Status status = null;
        String markMaterialAsCompletedQuery = "INSERT INTO `mydb`.`CompletedMaterial`\n" +
                "            (`EnrollmentID`,\n" +
                "             `Sequence`,\n" +
                "             `DateTime`)\n" +
                "             VALUES (?,\n" +
                "                     ?,\n" +
                "                     NOW())";

        try {
          	conn.setAutoCommit(false);
            stmnt = conn.prepareStatement(markMaterialAsCompletedQuery);
            stmnt.setInt(1, materialCompleted.getEnrollmentID());
            stmnt.setInt(2, materialCompleted.getSequenceID());
            stmnt.executeUpdate();
            conn.commit();
            status = Status.OK;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            if (conn != null) {
                try {
                    System.err.print("Transaction is being rolled back");
                    conn.rollback();
                    status = Status.BAD_REQUEST;
                } catch (SQLException excep) {
                    System.err.print("Exception while rolling back :" + e.getMessage());
                }
            }
        } finally {
            if (stmnt != null) {
                stmnt.close();
            }
        }
        return Response.status(status).type(MediaType.TEXT_HTML_TYPE).build();
    }

    /**
     * Task G: Provide a certificate of completion for a student (assuming s/he has successfully completed all matirials)
     * @param userID
     * @param courseID
     * @return
     * @throws SQLException
     */
    @Path("certificate/{userID}/{courseID}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public CertificateStatus getCertificate(@PathParam("userID") int userID, @PathParam("courseID") int courseID) throws SQLException {

        conn = DBConnection.getConnection();
        PreparedStatement stmnt = null;

        String isEnrolledQuery = "SELECT\n" +
                "  IF(\n" +
                "    EXISTS\n" +
                "    (SELECT\n" +
                "      *\n" +
                "    FROM\n" +
                "      `Enrollment`\n" +
                "    WHERE `Enrollment`.`UserID` = ?\n" +
                "      AND `Enrollment`.`CourseID` = ?),\n" +
                "    \"Enrolled\",\n" +
                "    \"Not Enrolled\"\n" +
                "  ) AS isEnrolled";

        Certificate certificate = new Certificate();
        String elgibileForCertificate = null;
        CertificateStatus cs = null;
        cs = new CertificateStatus();

        try {
            stmnt = conn.prepareStatement(isEnrolledQuery);
            stmnt.setInt(1, userID);
            stmnt.setInt(2, courseID);

            ResultSet rs = stmnt.executeQuery();
            String isStudentEnrolled = null;
            

            while (rs.next()) {
                isStudentEnrolled = rs.getString("isEnrolled");
            }

            if(isStudentEnrolled.equals("Enrolled")){

                String hasStudentCompletedAllMaterialQuery = "SELECT CASE\n" +
                        "(\n" +
                        "    SELECT\n" +
                        "        IF(`CompletedMaterial`.`DateTime`, \"Yes\", \"No\") AS Completed\n" +
                        "    FROM\n" +
                        "        `mydb`.`Enrollment`\n" +
                        "        INNER JOIN `mydb`.`Student`\n" +
                        "        ON (`Enrollment`.`UserID` = `Student`.`UserID`)\n" +
                        "        INNER JOIN `mydb`.`Course`\n" +
                        "        ON (`Enrollment`.`CourseID` = `Course`.`CourseID`)\n" +
                        "        INNER JOIN `mydb`.`Material`\n" +
                        "        ON (`Material`.`CourseID` = `Course`.`CourseID`)\n" +
                        "        LEFT JOIN `mydb`.`CompletedMaterial`\n" +
                        "        ON (`CompletedMaterial`.`EnrollmentID` = `Enrollment`.`EnrollmentID`) AND (`CompletedMaterial`.`Sequence` = `Material`.`Sequence`)\n" +
                        "        WHERE `Student`.`UserID` = ? AND `Enrollment`.`CourseID` = ? \n" +
                        "        HAVING Completed = 'No'\n" +
                        "        ORDER BY `Course`.`CourseID`, `Material`.`Sequence`\n" +
                        "        LIMIT 1\n" +
                        ") WHEN 'No' THEN \"No Certificate\" ELSE \"Yes Certificate\" END AS Certificate";

                stmnt = conn.prepareStatement(hasStudentCompletedAllMaterialQuery);
                stmnt.setInt(1, userID);
                stmnt.setInt(2, courseID);
                rs = stmnt.executeQuery();

                while (rs.next()) {
                    elgibileForCertificate = rs.getString("Certificate");
                }
                System.out.println("certificate for"+elgibileForCertificate);
                cs = new CertificateStatus();
                cs.setStatus(elgibileForCertificate);

//                if(elgibileForCertificate.equals("Yes Certificate")){
//                    createCertificateWithData(certificate, userID, courseID);
//                }

            }
        } catch (SQLException e) {
        	System.out.println("exception");
            System.out.println(e.getMessage());

        } finally {
            if (stmnt != null) {
                stmnt.close();
            }
        }
       

        if(cs.getStatus() == null) {
        	    cs.setStatus("No Certificate");
        }
        return cs;
    }

    /**
     * Task H: Provide an account history for a user: dates of enrollment/completion for each course,
     * amount paid (with confirmation code), and total spent.
     * @param userID
     * @return
     * @throws SQLException
     */
    @Path("userAccountHistory/{userID}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public UserAccountHistory getUserAccountHistory(@PathParam("userID") int userID) throws SQLException {

        conn = DBConnection.getConnection();
        PreparedStatement stmnt = null;
        UserAccountHistory userAccountHistory = new UserAccountHistory();
        userAccountHistory.setUserID(userID);

        String getUserAccountHistoryQuery = "SELECT\n" + 
        		"     User.`FirstName`, User.`LastName`, Enrollment.`EnrolledTime`, Enrollment.`ConfirmationCode`,\n" + 
        		"    `Course`.`Name` AS CourseName,\n" + 
        		"    `Course`.`Cost` AS CourseCost,\n" + 
        		"    IF(MIN(IF(`CompletedMaterial`.`DateTime`, 1, 0))=1, \"Yes\", \"No\") AS Completed\n" + 
        		"FROM\n" + 
        		"    `mydb`.`Enrollment`\n" + 
        		"    INNER JOIN `mydb`.`Student`\n" + 
        		"        ON (`Enrollment`.`UserID` = `Student`.`UserID`)\n" + 
        		"    INNER JOIN `User`\n" + 
        		"        ON (User.`UserID` = Student.`UserID`)\n" + 
        		"    INNER JOIN `mydb`.`Course`\n" + 
        		"        ON (`Enrollment`.`CourseID` = `Course`.`CourseID`)\n" + 
        		"    LEFT JOIN `mydb`.`Material`\n" + 
        		"        ON (`Material`.`CourseID` = `Course`.`CourseID`)\n" + 
        		"        LEFT JOIN `mydb`.`CompletedMaterial`\n" + 
        		"        ON (`CompletedMaterial`.`EnrollmentID` = `Enrollment`.`EnrollmentID`) AND (`CompletedMaterial`.`Sequence` = `Material`.`Sequence`)\n" + 
        		"    WHERE `Enrollment`.`UserID` = ?\n" + 
        		"    GROUP BY `Course`.`CourseID`\n" + 
        		"    ORDER BY `Course`.`CourseID`";

        try {

            stmnt = conn.prepareStatement(getUserAccountHistoryQuery);
            stmnt.setInt(1, userID);
            ResultSet rs = stmnt.executeQuery();

            while (rs.next()) {

                // Create CourseCompletionInfo object
                CourseCompletionInfo courseCompletionInfo = new CourseCompletionInfo();
                courseCompletionInfo.setCourseName(rs.getString("CourseName"));
                courseCompletionInfo.setEnrolledTime(rs.getString("EnrolledTime"));
                courseCompletionInfo.setConfirmationCode(rs.getString("ConfirmationCode"));
                courseCompletionInfo.setCourseCost(rs.getInt("CourseCost"));
                courseCompletionInfo.setIsCompleted(rs.getString("Completed"));

                // Add the CourseCompletionInfo to the UserAccountHistory
                userAccountHistory.addToCompletionInfoList(courseCompletionInfo);
            }

            getNameAndTotalSpentByUser(userAccountHistory, userID);

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (stmnt != null) {
                stmnt.close();
            }
        }

        return userAccountHistory;
    }

    private void getNameAndTotalSpentByUser(UserAccountHistory userAccountHistory, int userID) throws SQLException{

        Connection temp = null;
        temp = DBConnection.getConnection();
        PreparedStatement stmnt = null;

        String totalCostQuery = "SELECT\n" +
                "    `User`.`FirstName`\n" +
                "    , `User`.`LastName`\n" +
                "    , SUM(Course.`Cost`) AS TotalSpent\n" +
                "FROM\n" +
                "    `mydb`.`Student`\n" +
                "    INNER JOIN `mydb`.`User`\n" +
                "        ON (`Student`.`UserID` = `User`.`UserID`)\n" +
                "    INNER JOIN `mydb`.`Enrollment`\n" +
                "        ON (`Enrollment`.`UserID` = `Student`.`UserID`)\n" +
                "    INNER JOIN `mydb`.`Course`\n" +
                "        ON (`Enrollment`.`CourseID` = `Course`.`CourseID`)\n" +
                "    WHERE `User`.`UserID` = ?";

        try {
            stmnt = temp.prepareStatement(totalCostQuery);
            stmnt.setInt(1, userID);
            ResultSet rs = stmnt.executeQuery();
            while (rs.next()) {
                userAccountHistory.setUserFirstName(rs.getString("FirstName"));
                userAccountHistory.setUserLastName(rs.getString("LastName"));
                userAccountHistory.setTotalSpent(rs.getInt("TotalSpent"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (stmnt != null) {
                stmnt.close();
            }
        }
    }

    /**
     * REMOVE THIS FUNCTION as certificate only needs to return a string
     * Helper function for query G. This fills in the fields for a certificate object.
     * Gets the Course name, and the student's first and last name.
     * @param certificate
     * @param userID
     * @param courseID
     */
    /*
    private void createCertificateWithData(Certificate certificate, int userID, int courseID) throws SQLException {

        Connection temp = null;
        temp = DBConnection.getConnection();
        PreparedStatement stmnt = null;

        String courseNameQuery = "select Course.Name as courseName\n" +
                "from Course\n" +
                "where Course.CourseID = ?";

        String studentNameQuery = "select User.FirstName as firstName, User.LastName as lastName\n" +
                "from User\n" +
                "where User.UserID = ?";

        try {
            // get course name
            stmnt = temp.prepareStatement(courseNameQuery);
            stmnt.setInt(1, courseID);
            ResultSet rs = stmnt.executeQuery();

            while (rs.next()) {
                certificate.setCourseName(rs.getString("courseName"));
            }

            // get user name
            stmnt = temp.prepareStatement(studentNameQuery);
            stmnt.setInt(1, userID);
            ResultSet rst = stmnt.executeQuery();

            while (rst.next()) {
                certificate.setStudentFirstName(rst.getString("firstName"));
                certificate.setStudentLasrName(rst.getString("lastName"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (stmnt != null) {
                stmnt.close();
            }
        }
    }
    */
}
