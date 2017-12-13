package app.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="certificate")
public class Certificate {

    String courseName;
    String studentFirstName;
    String studentLasrName;

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getStudentFirstName() {
        return studentFirstName;
    }

    public void setStudentFirstName(String studentFirstName) {
        this.studentFirstName = studentFirstName;
    }

    public String getStudentLasrName() {
        return studentLasrName;
    }

    public void setStudentLasrName(String studentLasrName) {
        this.studentLasrName = studentLasrName;
    }
}
