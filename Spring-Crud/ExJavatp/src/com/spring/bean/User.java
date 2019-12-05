package com.spring.bean;

public class User {
	
	private Integer  ID;
	 private String NAME;
	 private int AGE;
	 private String DEPT;
	 
	 public User() {
	  super();
	 }
	 
	 public User(Integer ID) {
	  super();
	  this.ID = ID;
	 }

	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public int getAGE() {
		return AGE;
	}

	public void setAGE(int aGE) {
		AGE = aGE;
	}

	public String getDEPT() {
		return DEPT;
	}

	public void setDEPT(String dEPT) {
		DEPT = dEPT;
	}

	@Override
	public String toString() {
		return "User [ID=" + ID + ", NAME=" + NAME + ", AGE=" + AGE + ", DEPT=" + DEPT + "]";
	}

	
	
	 
	}