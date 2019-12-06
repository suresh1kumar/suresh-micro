package com.crud.bean;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope("request")
public class StudentBean {
 private int roll;
 private String name;
 private String address;

 
 
 
 public StudentBean() {
	super();
	// TODO Auto-generated constructor stub
}



public StudentBean(int roll, String name, String address) {
 this.roll = roll;
 this.name = name;
 this.address = address;
 }

 
 
 public StudentBean(int roll) {
	super();
	this.roll = roll;
}



public int getRoll() {
 return roll;
 }

 public void setRoll(int roll) {
 this.roll = roll;
 }

 public String getName() {
 return name;
 }

 public void setName(String name) {
 this.name = name;
 }

 public String getAddress() {
 return address;
 }

 public void setAddress(String address) {
 this.address = address;
 }

 @Override
 public String toString() {
 return "StudentBean [roll=" + roll + ", name=" + name + ", address=" + address + "]";
 }

}
