package app.model;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="useraccounthistory")
public class UserAccountHistory {

    int userID;
    String userFirstName;
    String userLastName;
    List<CourseCompletionInfo> completionInfoList;
    int totalSpent;

    public UserAccountHistory() {
        	this.completionInfoList = new ArrayList<CourseCompletionInfo>();
    }

    public UserAccountHistory(int userID, String userFirstName, String userLastName) {
        this.completionInfoList = new ArrayList<CourseCompletionInfo>();
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserFirstName() {
        return userFirstName;
    }

    public void setUserFirstName(String userFirstName) {
        this.userFirstName = userFirstName;
    }

    public String getUserLastName() {
        return userLastName;
    }

    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }

    public List<CourseCompletionInfo> getCompletionInfoList() {
        return completionInfoList;
    }

    public void setCompletionInfoList(List<CourseCompletionInfo> completionInfoList) {
        this.completionInfoList = completionInfoList;
    }

    public void addToCompletionInfoList(CourseCompletionInfo courseCompletionInfo) {
        this.completionInfoList.add(courseCompletionInfo);
    }

    public int getTotalSpent() {
        return totalSpent;
    }

    public void setTotalSpent(int totalSpent) {
        this.totalSpent = totalSpent;
    }
}
