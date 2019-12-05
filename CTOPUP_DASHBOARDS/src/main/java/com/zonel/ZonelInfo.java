package com.zonel;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.zonel.DBConnection;

public class ZonelInfo {
	
	Connection con = null;
	  Statement stInfo;
	  Statement stInfo1;
	  Statement stInfo2;
	  ResultSet rsInfo1;
	  ResultSet rsInfo;
	  ResultSet rsInfo2;
	  ResultSet rsInfo3;
	 // public static DBConnection db = null;
	 public String getZoneInfo(String loginId)
	  {
	    String zoneInfo = "";
	    CallableStatement cstmt = null;
	    try
	    {
	    	DBConnection db = new DBConnection();
	      con = db.getConnection();
	      stInfo = con.createStatement();
	      System.out.println("loginId==>" + loginId);
	      
	      cstmt = con.prepareCall("{? = call mvclient.MV_ZONEINFO(?)}");
	      if ((loginId != null) && (!loginId.equalsIgnoreCase("")) && (!loginId.equalsIgnoreCase("null"))) {
	        cstmt.registerOutParameter(1, 12);
	        cstmt.setString(2, loginId);
	        cstmt.execute();
	        zoneInfo = cstmt.getString(1);
	      }
	      System.out.println("cstmt---------------------->" + cstmt);
	      System.out.println("zoneInfo---------------------->" + zoneInfo);
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      if (rsInfo != null) {
	        try {
	          rsInfo.close();
	        }
	        catch (Exception localException5) {}
	        
	        rsInfo = null;
	      }
	      if (stInfo != null) {
	        try {
	          stInfo.close();
	        }
	        catch (Exception localException6) {}
	        
	        stInfo = null;
	      }
	      if (cstmt != null) {
	        try {
	          cstmt.close();
	        }
	        catch (Exception localException7) {}
	        
	        cstmt = null;
	      }
	      if (con != null) {
	        try {
	          con.close();
	        }
	        catch (Exception localException8) {}
	        
	        con = null;
	      }
	    }
	    return zoneInfo;
	  }
	 
	 public String getInfo1(String zoneId)
	  {
	   String info = "";String zoneName = "";
	    DBConnection db = new DBConnection();
	    con = db.getConnection();
	    try {
	      stInfo = con.createStatement();
	      String query = "select zoneid,z_fullname from mvclient.tbl_zone where zoneid='" + zoneId + "' order by z_fullname";
	      System.out.println(query);
	      rsInfo = stInfo.executeQuery(query);
	      System.out.println(query);
	      while (rsInfo.next()) {
	        zoneName = zoneName + rsInfo.getString(1) + "#" + rsInfo.getString(2) + "#";
	      }
	      
	      info = zoneName;
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      if (rsInfo != null) {
	        try {
	          rsInfo.close();
	        }
	        catch (Exception localException4) {}
	        
	        rsInfo = null;
	      }
	      if (stInfo != null) {
	        try {
	          stInfo.close();
	        }
	        catch (Exception localException5) {}
	        
	        stInfo = null;
	      }
	      if (con != null) {
	        try {
	          con.close();
	        }
	        catch (Exception localException6) {}
	        
	        con = null;
	      }
	    }
	    System.out.println("info------------->" + info);
	    return info;
	  }
	 public String getInfo2(String zoneId)
	  {
	    String regName = "";String info = "";
	    DBConnection db = new DBConnection();
	    con = db.getConnection();
	    try {
	      stInfo = con.createStatement();
	      String query = "select REGIONID,r_fullname from mvclient.tbl_region where zoneid='" + zoneId + "' order by r_fullname";
	      System.out.println(query);
	      rsInfo = stInfo.executeQuery(query);
	      System.out.println("query----------------------->" + query);
	      while (rsInfo.next()) {
	        regName = regName + rsInfo.getString(1) + "#" + rsInfo.getString(2) + "#";
	      }
	      
	      info = regName;
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      if (rsInfo != null) {
	        try {
	          rsInfo.close();
	        }
	        catch (Exception localException4) {}
	        
	        rsInfo = null;
	      }
	      if (stInfo != null) {
	        try {
	          stInfo.close();
	        }
	        catch (Exception localException5) {}
	        
	        stInfo = null;
	      }
	      if (con != null) {
	        try {
	          con.close();
	        }
	        catch (Exception localException6) {}
	        
	        con = null;
	      }
	    }
	    System.out.println("info------------->" + info);
	    return info;
	  }
	 public String getInfo3(String zoneId, String strregNam)
	  {
	    String regName = "";String info = "";
	    DBConnection db = new DBConnection();
	    con = db.getConnection();
	    try {
	      stInfo = con.createStatement();
	      String query = "select cityId,c_fullname from mvclient.tbl_city where zoneid='" + zoneId + "' and regionid=" + "(select regionid from mvclient.tbl_region where zoneid='" + zoneId + "' and r_fullname='" + strregNam + 
	    	        "') order by c_fullname";
	      
	      
	      String query1 = "  select cityId,c_fullname from mvclient.tbl_city where zoneid='1' and regionid=(select regionid from mvclient.tbl_region where zoneid='1' and regionid='1') order by c_fullname";

	    //  String query = "select REGIONID,r_fullname from mvclient.tbl_region where zoneid='" + zoneId + "' order by r_fullname";
	      System.out.println(query);
	      rsInfo = stInfo.executeQuery(query);
	      System.out.println("query----------------------->" + query);
	      while (rsInfo.next()) {
	        regName = regName + rsInfo.getString(1) + "#" + rsInfo.getString(2) + "#";
	      }
	      
	      info = regName;
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      if (rsInfo != null) {
	        try {
	          rsInfo.close();
	        }
	        catch (Exception localException4) {}
	        
	        rsInfo = null;
	      }
	      if (stInfo != null) {
	        try {
	          stInfo.close();
	        }
	        catch (Exception localException5) {}
	        
	        stInfo = null;
	      }
	      if (con != null) {
	        try {
	          con.close();
	        }
	        catch (Exception localException6) {}
	        
	        con = null;
	      }
	    }
	    System.out.println("info------------->" + info);
	    return info;
	  }
	  
//==========================================================================================
	 public String getInfo(String zoneId, String regionId) {
		    String regName = "";String info = "";String zoneName = "";
		    DBConnection db = new DBConnection();
		    con = db.getConnection();
		    try {
		      stInfo = con.createStatement();
		      String query = "select zoneid,z_fullname from mvclient.tbl_zone where zoneid='" + zoneId + "' order by z_fullname";
		      System.out.println(query);
		      rsInfo = stInfo.executeQuery(query);
		      System.out.println(query);
		      while (rsInfo.next()) {
		        zoneName = zoneName + rsInfo.getString(1) + "#" + rsInfo.getString(2) + "#";
		      }
		      
		      query = "select REGIONID,r_fullname from mvclient.tbl_region where regionid='" + regionId + "' order by r_fullname";
		      System.out.println(query);
		      rsInfo = stInfo.executeQuery(query);
		      System.out.println(query);
		      while (rsInfo.next()) {
		        regName = regName + rsInfo.getString(1) + "#" + rsInfo.getString(2) + "#";
		      }
		      
		      info = zoneName + regName;
		    } catch (Exception e) {
		      e.printStackTrace();
		    } finally {
		      if (rsInfo != null) {
		        try {
		          rsInfo.close();
		        }
		        catch (Exception localException4) {}
		        
		        rsInfo = null;
		      }
		      if (stInfo != null) {
		        try {
		          stInfo.close();
		        }
		        catch (Exception localException5) {}
		        
		        stInfo = null;
		      }
		      if (con != null) {
		        try {
		          con.close();
		        }
		        catch (Exception localException6) {}
		        
		        con = null;
		      }
		    }
		    System.out.println("info------------->" + info);
		    return info;
		  }
	 
	 public String getcityInfo(String zoneId, String regionId)
	  {
	    String info = "";String cityName = "";
	    DBConnection db = new DBConnection();
	    con = db.getConnection();
	    try {
	      stInfo = con.createStatement();
	      String query = "select cityId,c_fullname from mvclient.tbl_city where zoneid='" + zoneId + "' and regionid='" + regionId + "' order by c_fullname";
	      System.out.println(query);
	      rsInfo = stInfo.executeQuery(query);
	      System.out.println(query);
	      while (rsInfo.next()) {
	        cityName = cityName + rsInfo.getString(1) + "#" + rsInfo.getString(2) + "#";
	      }
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    } finally {
	      if (rsInfo != null) {
	        try {
	          rsInfo.close();
	        }
	        catch (Exception localException4) {}
	        
	        rsInfo = null;
	      }
	      if (stInfo != null) {
	        try {
	          stInfo.close();
	        }
	        catch (Exception localException5) {}
	        
	        stInfo = null;
	      }
	      if (con != null) {
	        try {
	          con.close();
	        }
	        catch (Exception localException6) {}
	        
	        con = null;
	      }
	    }
	    System.out.println("cityName------------->" + cityName);
	    return cityName;
	  }
	 
	 public String getInfo4(String zoneId, String regionId, String cityId)
	  {
	    String regName = "";String info = "";String zoneName = "";String cityName = "";
	    DBConnection db = new DBConnection();
	    con = db.getConnection();
	    try {
	      stInfo = con.createStatement();
	      String query = "select zoneid,z_fullname from mvclient.tbl_zone where zoneid='" + zoneId + "' order by z_fullname";
	      System.out.println(query);
	      rsInfo = stInfo.executeQuery(query);
	      System.out.println(query);
	      while (rsInfo.next()) {
	        zoneName = zoneName + rsInfo.getString(1) + "#" + rsInfo.getString(2) + "#";
	      }
	      
	      query = "select REGIONID,r_fullname from mvclient.tbl_region where regionid='" + regionId + "' and zoneid='" + zoneId + "' order by r_fullname";
	      System.out.println(query);
	      rsInfo = stInfo.executeQuery(query);
	      System.out.println(query);
	      while (rsInfo.next()) {
	        regName = regName + rsInfo.getString(1) + "#" + rsInfo.getString(2) + "#";
	      }
	      
	      query = "select cityId,c_fullname from mvclient.tbl_city where regionid='" + regionId + "' and zoneid='" + zoneId + "' and cityid='" + cityId + "' order by c_fullname";
	      System.out.println(query);
	      rsInfo = stInfo.executeQuery(query);
	      System.out.println(query);
	      while (rsInfo.next()) {
	        cityName = cityName + rsInfo.getString(1) + "#" + rsInfo.getString(2) + "#";
	      }
	      
	      info = zoneName + regName + cityName;
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      if (rsInfo != null) {
	        try {
	          rsInfo.close();
	        }
	        catch (Exception localException4) {}
	        
	        rsInfo = null;
	      }
	      if (stInfo != null) {
	        try {
	          stInfo.close();
	        }
	        catch (Exception localException5) {}
	        
	        stInfo = null;
	      }
	      if (con != null) {
	        try {
	          con.close();
	        }
	        catch (Exception localException6) {}
	        
	        con = null;
	      }
	    }
	    System.out.println("info------------->" + info);
	    return info;
	  }
}
