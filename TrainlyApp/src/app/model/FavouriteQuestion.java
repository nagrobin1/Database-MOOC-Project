package app.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="favouritequestion")
public class FavouriteQuestion {

	String questionText;
	String topicName;
	int noOfLikes;

	public FavouriteQuestion() {

	}

	public FavouriteQuestion(String questionText, String topicName, int noOfLikes) {

		this.questionText=questionText;
		this.topicName=topicName;
		this.noOfLikes=noOfLikes;
	}
	
	public String getQuestionText() {
		return this.questionText;
	}
	public void setQuestionText(String questionText) {
		this.questionText=questionText;
	}
	
	public String getTopicName() {
		return this.topicName;
	}
	public void setTopicName(String topicName) {
		this.topicName=topicName;
	}
	
	public int getNoOfLikes() {
		return this.noOfLikes;
	}
	public void setNoOfLikes(int noOfLikes) {
		this.noOfLikes=noOfLikes;
	}

}
