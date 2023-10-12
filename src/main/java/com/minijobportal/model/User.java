package com.minijobportal.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String fname;
	
	private String lname;
	
	private String phone;
	
	private String gender;
	
	private String address;
	
	private String city;
	
	private String country;
	
	private String qualification;
	
	private String designation;
	
	private String email;
	
	private String password;
	
	private String roles;
	
	public String getRoles() 
	{
		return roles;
	}
	public void setRoles(String roles) 
	{
		this.roles = roles;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	

	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	
	public User(String fname, String lname, String phone, String gender, String address, String city, String country,
			String qualification, String designation, String email, String password) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.phone = phone;
		this.gender = gender;
		this.address = address;
		this.city = city;
		this.country = country;
		this.qualification = qualification;
		this.designation = designation;
		this.email = email;
		this.password = password;
	}
	
	public User() 
	{
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", fname=" + fname + ", lname=" + lname + ", phone=" + phone + ", gender=" + gender
				+ ", address=" + address + ", city=" + city + ", country=" + country + ", qualification="
				+ qualification + ", designation=" + designation + ", email=" + email + ", password=" + password + "]";
	}
	
	
	
	
}
