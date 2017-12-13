package app.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="user")
public class User {

	int userID;
	String email;
	String firstName;
	String lastName;
	String password;
	String picture;
	String street;
	String city;
	String postalCode;
	String country;
	int isStudent;
	int isFaculty;
	int isAdministrator;
	
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getIsStudent() {
		return isStudent;
	}
	public void setIsStudent(int isStudent) {
		this.isStudent = isStudent;
	}
	public int getIsFaculty() {
		return isFaculty;
	}
	public void setIsFaculty(int isFaculty) {
		this.isFaculty = isFaculty;
	}
	public int getIsAdministrator() {
		return isAdministrator;
	}
	public void setIsAdministrator(int isAdministrator) {
		this.isAdministrator = isAdministrator;
	}
}
