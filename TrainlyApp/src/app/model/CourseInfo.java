package app.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="courseinfo")
public class CourseInfo {

	int courseID;
	String courseName;
	String primaryTopic;
	String secondaryTopics;
	double avgRating;
	
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getPrimaryTopic() {
		return primaryTopic;
	}
	public void setPrimaryTopic(String primaryTopic) {
		this.primaryTopic = primaryTopic;
	}
	public String getSecondaryTopics() {
		return secondaryTopics;
	}
	public void setSecondaryTopics(String secondaryTopics) {
		this.secondaryTopics = secondaryTopics;
	}
	public double getAvgRating() {
		return avgRating;
	}
	public void setAvgRating(double avgRating) {
		this.avgRating = avgRating;
	}
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
}
