package com.bean;

public class Person {
    
    private String name;
    private String email;
    private String mobile;
    private String address;
    private String fromDate;
    private String tdDate;
    private String salary;
    
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getTdDate() {
		return tdDate;
	}
	public void setTdDate(String tdDate) {
		this.tdDate = tdDate;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	@Override
	public String toString() {
		return "Person [name=" + name + ", email=" + email + ", mobile=" + mobile + ", address=" + address
				+ ", fromDate=" + fromDate + ", tdDate=" + tdDate + ", salary=" + salary + "]";
	}
	
    
    

}
