package app.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="coursetopicsummary")
public class CourseTopicPerSemesterSummary {

	String topicName;
	String courseName;
	String secondaryTopics;
	int enrolledCnt;
	double totalCost;
	int completedCnt;

	public CourseTopicPerSemesterSummary() {

	}

	public CourseTopicPerSemesterSummary(String topicName, String courseName, 
			String secondaryTopics, int enrolledCnt, double totalCost, int completedCnt) {

		this.topicName=topicName;
		this.courseName=courseName;
		this.secondaryTopics=secondaryTopics;
		this.enrolledCnt=enrolledCnt;
		this.totalCost=totalCost;
		this.completedCnt=completedCnt;
	}
	
	public String getTopicName() {
		return this.topicName;
	}
	public void setTopicName(String topicName) {
		this.topicName=topicName;
	}
	
	public String getCourseName() {
		return this.courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName=courseName;
	}
	
	public String getSecondaryTopics() {
		return this.secondaryTopics;
	}
	public void setSecondaryTopics(String secondaryTopics) {
		this.secondaryTopics=secondaryTopics;
	}
	
	public int getEnrolledCnt() {
		return this.enrolledCnt;
	}
	public void setEnrolledCnt(int enrolledCnt) {
		this.enrolledCnt=enrolledCnt;
	}
	
	public double getTotalCost() {
		return this.totalCost;
	}
	public void setTotalCost(double totalCost) {
		this.totalCost=totalCost;
	}
	
	public int getCompletedCnt() {
		return this.completedCnt;
	}
	public void setCompletedCnt(int completedCnt) {
		this.completedCnt=completedCnt;
	}


}
