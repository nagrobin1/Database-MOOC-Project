package app.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="markMaterialCompleted")
public class MaterialCompleted {

	private int enrollmentID;
	private int sequenceID;
	
	public int getEnrollmentID() {
		return enrollmentID;
	}
	public void setEnrollmentID(int enrollmentID) {
		this.enrollmentID = enrollmentID;
	}
	public int getSequenceID() {
		return sequenceID;
	}
	public void setSequenceID(int sequenceID) {
		this.sequenceID = sequenceID;
	}
}
