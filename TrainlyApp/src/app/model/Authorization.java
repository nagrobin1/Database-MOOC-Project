package app.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="authorize")
public class Authorization {

	int adminID;
	int userID;
	String authorizationTime;
	public int getAdminID() {
		return adminID;
	}
	public void setAdminID(int adminID) {
		this.adminID = adminID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getAuthorizationTime() {
		return authorizationTime;
	}
	public void setAuthorizationTime(String authorizationTime) {
		this.authorizationTime = authorizationTime;
	}
	
}
