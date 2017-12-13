package app.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="enroll")
public class Enrollment {

	int studentID;
	int courseID;
	String enrolledTime;
	String confirmationCode;
	String paymentTime;
	
	public int getStudentID() {
		return studentID;
	}
	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	public String getEnrolledTime() {
		return enrolledTime;
	}
	public void setEnrolledTime(String enrolledTime) {
		this.enrolledTime = enrolledTime;
	}
	public String getConfirmationCode() {
		return confirmationCode;
	}
	public void setConfirmationCode(String confirmationCode) {
		this.confirmationCode = confirmationCode;
	}
	public String getPaymentTime() {
		return paymentTime;
	}
	public void setPaymentTime(String paymentTime) {
		this.paymentTime = paymentTime;
	}
}
