package com.servlet.bean;

public class Zone {
	
	int ZONEID;       
	String Z_SHORTNAME; 
	String Z_FULLNAME ;
	public Zone() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Zone(int zONEID, String z_SHORTNAME, String z_FULLNAME) {
		super();
		ZONEID = zONEID;
		Z_SHORTNAME = z_SHORTNAME;
		Z_FULLNAME = z_FULLNAME;
	}
	public int getZONEID() {
		return ZONEID;
	}
	public void setZONEID(int zONEID) {
		ZONEID = zONEID;
	}
	public String getZ_SHORTNAME() {
		return Z_SHORTNAME;
	}
	public void setZ_SHORTNAME(String z_SHORTNAME) {
		Z_SHORTNAME = z_SHORTNAME;
	}
	public String getZ_FULLNAME() {
		return Z_FULLNAME;
	}
	public void setZ_FULLNAME(String z_FULLNAME) {
		Z_FULLNAME = z_FULLNAME;
	}
	@Override
	public String toString() {
		return "Zone [ZONEID=" + ZONEID + ", Z_SHORTNAME=" + Z_SHORTNAME + ", Z_FULLNAME=" + Z_FULLNAME + "]";
	}
	
	

}
