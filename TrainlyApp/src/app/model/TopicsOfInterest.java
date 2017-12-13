package app.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="topicsofinterest")
public class TopicsOfInterest {

	String semester;
	String topicName;
	double avgRating;
	String matchType;

	public TopicsOfInterest() {

	}

	public TopicsOfInterest(String semester, String topicName, double avgRating, String matchType) {

		this.semester=semester;
		this.topicName=topicName;
		this.avgRating=avgRating;
		this.matchType=matchType;
	}
	
	public String getSemester() {
		return this.semester;
	}
	public void setSemester(String semester) {
		this.semester=semester;
	}
	
	public String getTopicName() {
		return this.topicName;
	}
	public void setTopicName(String topicName) {
		this.topicName=topicName;
	}
	
	public double getAvgRating() {
		return this.avgRating;
	}
	public void setAvgRating(double avgRating) {
		this.avgRating=avgRating;
	}
	public String getMatchType() {
		return this.matchType;
	}
	public void setMatchType(String matchType) {
		this.matchType=matchType;
	}
	

}
