package app.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="popularcourse")
public class PopularCourse {

	String courseName;
	String facultyName;
	int enrollmentCnt;
	double avgRating;

	public PopularCourse() {

	}

	public PopularCourse(String courseName, String facultyName, int enrollmentCnt, double avgRating) {

		this.courseName=courseName;
		this.facultyName=facultyName;
		this.enrollmentCnt=enrollmentCnt;
		this.avgRating=avgRating;
	}
	
	public String getCourseName() {
		return this.courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName=courseName;
	}
	
	public String getFacultyname() {
		return this.facultyName;
	}
	public void setFacultyname(String facultyName) {
		this.facultyName=facultyName;
	}
	
	public int getEnrollmentCnt() {
		return this.enrollmentCnt;
	}
	public void setEnrollmentCnt(int enrollmentCnt) {
		this.enrollmentCnt=enrollmentCnt;
	}
	
	public double getAvgRating() {
		return this.avgRating;
	}
	public void setAvgRating(double avgRating) {
		this.avgRating=avgRating;
	}

}
