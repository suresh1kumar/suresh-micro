package com.angularjs.report.mvoucher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PlanUpdateDaoImpl implements IPlanUpdateDao{

	Statement stInfo;
	Statement stInfo1;
	ResultSet rsInfo;
	Connection con=null;
    
	@Override
	public List<ReportBean> getAllRecordEnable(String qualification,String gender,String joinDate,String jdate1,String uaction) throws SQLException {
		System.out.println("*********************<<Report view DAO Enable>>**************************");
		Connection con=null;
	    Statement st=null;
	    ResultSet rs=null;
	    String QueryE="";
	    List<ReportBean> list=new ArrayList();
	    try {
	    	con=DBConnection.createConnection();//studentrecord
	    	st=con.createStatement();
	    	QueryE= "select studentId,studentName,qualification,gender,joinDate,uaction from studentrecord  ";
	    	
	    	if (uaction!=null) {// && (uaction.equalsIgnoreCase(""))) {
	    		
	    		QueryE = QueryE + " where uaction= '" + uaction + " ' ";
	    	}
	    	System.out.println("Query Enable ::"+QueryE);
	    	rs=st.executeQuery(QueryE);
	    	
	    	while(rs.next()){
	    		ReportBean reportBean=new ReportBean();
	    				
	    		reportBean.setStudentId(rs.getString("studentId")); 
	    		reportBean.setStudentName(rs.getString("studentName")); 
	    		reportBean.setQualification(rs.getString("qualification"));  
	    		reportBean.setGender(rs.getString("gender")); 
	    		reportBean.setJoinDate(rs.getString("joinDate"));  
	    		reportBean.setUaction(rs.getString("uaction")); 
	    		
	            list.add(reportBean);
	    	}
	        
	    } catch (SQLException ex) {
	        Logger.getLogger(PlanUpdateDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	        return null;
	    } finally {
	        if (con != null) {
	            try {
	                con.close();
	            } catch (SQLException ex) {
	                Logger.getLogger(PlanUpdateDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
	        if (st != null) {
	            try {
	                st.close();
	            } catch (SQLException ex) {
	                Logger.getLogger(PlanUpdateDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
	    }
		return list;
	}
	
	public List<ReportBean> getAllRecordDisable(String qualification,String gender,String joinDate,String jdate1,String uaction) throws SQLException {
		System.out.println("*********************<<Report view DAO Disable>>**************************");
		Connection con=null;
	    Statement st=null;
	    ResultSet rs=null;
	    String QueryD="";
	    List<ReportBean> list=new ArrayList();
	    try {
	    	con=DBConnection.createConnection();
	    	st=con.createStatement();
	    	QueryD= "select studentId,studentName,qualification,gender,joinDate,"
	    			+ "uaction from studentrecord where  joinDate>='"+joinDate+"' and joinDate<='"+jdate1+"' ";
	    	
	    	if (uaction!=null ) {//&& (!uaction.equalsIgnoreCase(""))) {
	    		
	    		QueryD = QueryD + " and uaction= '" + uaction + "' ";
	    	}
	    	System.out.println("Query Desible ::"+QueryD);
	    	
	    	rs=st.executeQuery(QueryD);
	    	
	    	while(rs.next()){
	    		ReportBean reportBean=new ReportBean();
	    				
	    		reportBean.setStudentId(rs.getString("studentId")); 
	    		reportBean.setStudentName(rs.getString("studentName")); 
	    		reportBean.setQualification(rs.getString("qualification"));  
	    		reportBean.setGender(rs.getString("gender")); 
	    		reportBean.setJoinDate(rs.getString("joinDate"));  
	    		reportBean.setUaction(rs.getString("uaction")); 
	    		
	            list.add(reportBean);
	    	}
	        
	    } catch (SQLException ex) {
	        Logger.getLogger(PlanUpdateDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	        return null;
	    } finally {
	        if (con != null) {
	            try {
	                con.close();
	            } catch (SQLException ex) {
	                Logger.getLogger(PlanUpdateDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
	        if (st != null) {
	            try {
	                st.close();
	            } catch (SQLException ex) {
	                Logger.getLogger(PlanUpdateDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
	    }
		return list;
		
	}
	
	public String getCircleid(String circleids)
	  {
		
	    String regName = "";String info = "";String zoneName = "";
	    DBConnection db = new DBConnection();
	    //con = db.dbConnection();
	    con=DBConnection.createConnection();
	    try
	    {
	      stInfo = con.createStatement();
	      //String query = "select regionid,r_fullname from mvclient.tbl_region where zoneid='" + zoneId + "'";
	      String query = "select  regionid from mvclient.tbl_region where  r_fullname='" + circleids + "'";
	      
	      rsInfo = stInfo.executeQuery(query);
	      
	      while (rsInfo.next())
	      {
	        regName = regName + rsInfo.getString(1);
	      }
	      


	      info = regName;
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    finally
	    {
	      if (rsInfo != null)
	      {
	        try
	        {
	          rsInfo.close();
	        }
	        catch (Exception localException4) {}
	        
	        rsInfo = null;
	      }
	      if (stInfo != null)
	      {
	        try
	        {
	          stInfo.close();
	        }
	        catch (Exception localException5) {}
	        
	        stInfo = null;
	      }
	      if (con != null)
	      {
	        try
	        {
	          con.close();
	        }
	        catch (Exception localException6) {}
	        
	        con = null;
	      }
	    }
	    
	    return info;
	  }
	

}
