package com.mobitec.Mvoucher;

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
	public List<PlanUpdateBean> getAllPlanUpdateRecord(String regionid) throws SQLException {
		System.out.println("*********************<<Planupdate viewPlan DAO>>**************************");
		Connection con=null;
	    Statement st=null;
	    ResultSet rs=null;
	    String PlanGetQuery="";
	    List<PlanUpdateBean> list=new ArrayList();
	    try {
	    	con=DBConnection.createConnection();
	    	st=con.createStatement();
	    	//PlanGetQuery="select * from companyrecord order by DENOMINATION desc";
	    	PlanGetQuery = " select OPERATOR,CIRCLE,DENOMINATION,TYPE ,"
	    				 + " TALKVALUE,VALIDITY,DESCRIPTION ,COUNTRY,START_DATE,"
	    				 + " END_DATE,SNO from companyrecord order by DENOMINATION desc ";
	    	rs=st.executeQuery(PlanGetQuery);
	    	
	    	while(rs.next()){
	    		PlanUpdateBean planUpdateBean=new PlanUpdateBean();
	    				
	    		planUpdateBean.setSNO(rs.getString("SNO")); 
	    		planUpdateBean.setOPERATOR(rs.getString("OPERATOR")); 
	    		planUpdateBean.setCIRCLE(rs.getString("CIRCLE"));  
	    		planUpdateBean.setDENOMINATION(rs.getString("DENOMINATION")); 
	    		planUpdateBean.setTYPE(rs.getString("TYPE"));  
	    		planUpdateBean.setTALKVALUE(rs.getString("TALKVALUE")); 
	    		planUpdateBean.setVALIDITY(rs.getString("VALIDITY"));
	    		planUpdateBean.setDESCRIPTION(rs.getString("DESCRIPTION"));
	    		planUpdateBean.setCOUNTRY(rs.getString("COUNTRY"));
	    		planUpdateBean.setSTART_DATE(rs.getString("START_DATE"));
	    		planUpdateBean.setEND_DATE(rs.getString("END_DATE"));
	            list.add(planUpdateBean);
	            
	    		
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

	@Override
	public boolean addPlanUpdateRecordDao(String OPERATOR, int CIRCLE, int DENOMINATION, String TYPE, double TALKVALUE,
			int VALIDITY, String DESCRIPTION, String COUNTRY, String START_DATE, String END_DATE, int SNO)
			throws SQLException {
		System.out.println("*********************************<< addPlanUpdateRecordDao DAO >>*********************************");
		Connection con=null;
	    Statement st=null;
	    ResultSet rs=null;
	    PreparedStatement ps=null;
	    String PlanAddQuery="";
	    boolean flag=false;
	    try {
	    	con=DBConnection.createConnection();
	    	st=con.createStatement();
	    	//PlanGetQuery="select * from companyrecord order by SNO desc";
	    	 PlanAddQuery="insert into companyrecord(OPERATOR,CIRCLE,DENOMINATION,TYPE,TALKVALUE,VALIDITY,DESCRIPTION,COUNTRY,START_DATE,END_DATE) values(?,?,?,?,?,?,?,?,?,?)";
	    	//rs=st.executeQuery(PlanAddQuery);
	    	 ps=con.prepareStatement(PlanAddQuery);
	    	 System.out.println("addQuery ::"+PlanAddQuery);
	    	 	ps.setString(1,OPERATOR);
	    	    ps.setInt(2,CIRCLE);
	    	    ps.setInt(3,DENOMINATION);
	    	    ps.setString(4,TYPE);
	    	    ps.setDouble(5,TALKVALUE);
	    	    ps.setInt(6,VALIDITY);
	    	    ps.setString(7,DESCRIPTION);
	    	    ps.setString(8,COUNTRY);
	    	    ps.setString(9,START_DATE);
	    	    ps.setString(10,END_DATE);
	    	    int count= ps.executeUpdate();
	    	    if(count>0){
	    			flag=true;
	    		}
	    	System.out.println("count ::"+count);
	        
	    } catch (SQLException ex) {
	        Logger.getLogger(PlanUpdateDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	        //return null;
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
	    return flag;
	}

	@Override
	public boolean updatePlanUpdateRecordDao(String OPERATOR, int CIRCLE, int DENOMINATION, String TYPE, double TALKVALUE,
			int VALIDITY, String DESCRIPTION, String COUNTRY, String START_DATE, String END_DATE, int SNO)
			throws SQLException {
		System.out.println("*********************************<< updateProductDetails DAO >>*********************************");
		boolean flag=false;
		Connection con=null;
		PreparedStatement ps=null;
	    String PlanUpdateQuery="";
	    try {
	    	con=DBConnection.createConnection();
	    	
	    	//PlanGetQuery="select * from companyrecord order by SNO desc";
	    	 PlanUpdateQuery="update companyrecord set OPERATOR='" + OPERATOR + "',CIRCLE='" + CIRCLE + "',DENOMINATION='" + DENOMINATION + "'," +
					"TYPE='" + TYPE + "',TALKVALUE='" + TALKVALUE + "',VALIDITY='" + VALIDITY + "',DESCRIPTION='" + DESCRIPTION + "',COUNTRY='" + COUNTRY + "'," +
					"START_DATE='" + START_DATE + "',END_DATE='" + END_DATE + "'" +
					" where SNO='" + SNO + "'";
	    	ps=con.prepareStatement(PlanUpdateQuery);
			System.out.println("updated query ::"+PlanUpdateQuery);
		
		int count=ps.executeUpdate();
		if(count>0){
			flag=true;
			System.out.println("update true  dao-------------- ");
		}
		System.out.println("count-------------- "+count);
	    } catch (SQLException ex) {
	        Logger.getLogger(PlanUpdateDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	       // return null;
	    } finally {
	        if (con != null) {
	            try {
	                con.close();
	            } catch (SQLException ex) {
	                Logger.getLogger(PlanUpdateDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
	        if (ps != null) {
	            try {
	                ps.close();
	            } catch (SQLException ex) {
	                Logger.getLogger(PlanUpdateDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
	    }
	    return flag;
	}

	@Override
	public int deletePlanUpdateRecordDao(int sid) throws SQLException {
		System.out.println("*********************<<ProductDaoImpl deleteProduct Dao>>**************************");
		Connection con=null;
		PreparedStatement ps=null;
		boolean flag=false;
		String PlanDeleteQuery = "";
		int count=0;
		
		//System.out.println("Connection Established:"+con);
		//String query="delete from TBL_BSNL_PLANS where sno='" + sid + "'";
	    try {
	    	con=DBConnection.createConnection();
	    	PlanDeleteQuery="delete from companyrecord where sno='" + sid + "'";
	    	ps=con.prepareStatement(PlanDeleteQuery);
			//ps.setInt(1,sid);
			 count=ps.executeUpdate();
			 System.out.println("Deleted count >> ::"+count);
				if(count>0){
				flag=true;
			}
	        
	    } catch (SQLException ex) {
	        Logger.getLogger(PlanUpdateDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	        return 0;
	    } finally {
	        if (con != null) {
	            try {
	                con.close();
	            } catch (SQLException ex) {
	                Logger.getLogger(PlanUpdateDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
	        if (ps != null) {
	            try {
	                ps.close();
	            } catch (SQLException ex) {
	                Logger.getLogger(PlanUpdateDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
	    }
	    return count;
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
