package com.angularjs.report.mvoucher;

import java.sql.SQLException;
import java.util.List;



public interface IPlanUpdateDao {
	
	public List<ReportBean> getAllRecordEnable(String qualification,String gender,String joinDate,String jdate1,String uaction) throws SQLException;
	public List<ReportBean> getAllRecordDisable(String qualification,String gender,String joinDate,String jdate1,String uaction) throws SQLException;
	
	
	
	
}
