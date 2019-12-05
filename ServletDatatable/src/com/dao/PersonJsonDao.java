package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.wink.json4j.JSONArray;
import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.OrderedJSONObject;



public class PersonJsonDao {
	Connection con=null;
	// public static List<Person> getAllPersonRecord(){ 
	 Statement st=null;
	 ResultSet rs=null;
	 OrderedJSONObject jsonObject = null;
 	JSONArray jsonArray = null;
	 boolean data = false;
	public String getAllPersonRecord(String name, String fromDate, String toDate){
	         
	        try{  
	        	jsonArray = new JSONArray();
				jsonObject = new OrderedJSONObject();
				
	             con=DBConnection.getConnection(); 
	             st = con.createStatement();
	             
	            //String query="select name,email,mobile,address,salary,fdate,todate from person";
	             String query="select OPERATOR,CIRCLE,DENOMINATION,TYPE,TALKVALUE,VALIDITY,DESCRIPTION,COUNTRY ,START_DATE,END_DATE from companyrecord";
	            String s="select  OPERATOR,CIRCLE,DENOMINATION,TYPE,TALKVALUE,VALIDITY,DESCRIPTION,COUNTRY ,START_DATE,END_DATE from companyrecord where OPERATOR='"+name+"'";
	             if(name!=null && !name.equalsIgnoreCase("")){
	            	query += " where OPERATOR='"+name+"'";
				}
				/*if(fromDate!=null && !fromDate.equalsIgnoreCase("")){
					query += " where fromdate BETWEEN TO_DATE('"+fromDate+"','YYYY-MM-DD') ";
				}
				if(toDate!=null && !toDate.equalsIgnoreCase("")){
					query += " AND TO_DATE('"+toDate+"','YYYY-MM-DD')+0.99999";
				}*/
				rs=st.executeQuery(query);
				System.out.println("query ::"+query);
				 
				System.out.println("===========================DB================================");
	            while(rs.next()){  
	            		            	
	            	OrderedJSONObject json = new OrderedJSONObject();
	            	json.put("OPERATOR", rs.getString("OPERATOR"));
	            	json.put("CIRCLE", rs.getString("CIRCLE"));
	            	json.put("DENOMINATION", rs.getString("DENOMINATION"));
	            	json.put("TYPE", rs.getString("TYPE"));
	            	json.put("TALKVALUE", rs.getString("TALKVALUE"));
	            	json.put("VALIDITY", rs.getString("VALIDITY"));
	            	json.put("DESCRIPTION", rs.getString("DESCRIPTION"));
	            	json.put("COUNTRY", rs.getString("COUNTRY"));
	            	json.put("START_DATE", rs.getString("START_DATE"));
	            	json.put("END_DATE", rs.getString("END_DATE"));
	            	
	            	/*json.put("name", rs.getString("NAME"));
	            	json.put("email", rs.getString("EMAIL"));
	            	json.put("mobile", rs.getString("MOBILE"));
	            	json.put("address", rs.getString("ADDRESS"));
	            	json.put("salary", rs.getString("SALARY"));
	            	json.put("fdate", rs.getString("FDATE"));
	            	json.put("todate", rs.getString("TODATE"));*/
	            	jsonArray.add(json);
	               
	                System.out.println("person Dao json ::"+jsonArray);
	            } 
	            data  = jsonArray.isEmpty();
				jsonObject.put("status", "200");
				jsonObject.put("isEmpty", data);
				//jsonObject.put("name", "suraj");
				jsonObject.put("records", jsonArray);
	            con.close();  
	        }catch(SQLException sqle){
				try{
					sqle.printStackTrace();
					jsonObject.put("status", "500");
					}
					catch(JSONException jsone){
						jsone.printStackTrace();
					}
				}
				catch(JSONException jsone){ 
					jsone.printStackTrace();
				}
				finally{
					//close
				}
	          
	        return jsonObject.toString();  
	    }  

}
