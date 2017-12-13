package app.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="difficultquiz")
public class DifficultQuiz {

	String questionText;
	String topicName;
	int failedAttemptCnt;

	public DifficultQuiz() {

	}

	public DifficultQuiz(String questionText, String topicName, int failedAttemptCnt) {

		this.questionText=questionText;
		this.topicName=topicName;
		this.failedAttemptCnt=failedAttemptCnt;
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
	
	public int getFailedAttemptCnt() {
		return this.failedAttemptCnt;
	}
	public void setFailedAttemptCnt(int failedAttemptCnt) {
		this.failedAttemptCnt=failedAttemptCnt;
	}

}
