package app.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="courses")
public class Course {

	int courseID;
	String courseName;
	String description;
	int cost;
	String createdDate;
	int primaryTopic;
	
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public int getPrimaryTopic() {
		return primaryTopic;
	}
	public void setPrimaryTopic(int primaryTopic) {
		this.primaryTopic = primaryTopic;
	}
}
