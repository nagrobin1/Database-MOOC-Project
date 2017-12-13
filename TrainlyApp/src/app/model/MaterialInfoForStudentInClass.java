package app.model;

import javax.xml.bind.annotation.XmlRootElement;

/*
 * Class for Task Query E.
 */
@XmlRootElement(name="materialinfoforstudentinclass")
public class MaterialInfoForStudentInClass {

    String materialName;
    String completed;
    int sequence;
    int enrollmentID;


    public String getMaterialName() {
        return this.materialName;
    }
    public void setMaterialName(String materialName) {
        this.materialName=materialName;
    }

    public String getCompleted() {
        return this.completed;
    }
    public void setCompleted(String completed) {
        this.completed=completed;
    }
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	public int getEnrollmentID() {
		return enrollmentID;
	}
	public void setEnrollmentID(int enrollmentID) {
		this.enrollmentID = enrollmentID;
	}

}