package com.mobitec.Mvoucher;

import java.sql.SQLException;
import java.util.List;



public interface IPlanUpdateDao {
	
	public List<PlanUpdateBean> getAllPlanUpdateRecord(String regionid) throws SQLException;
	
	public boolean addPlanUpdateRecordDao(String OPERATOR,int CIRCLE,int DENOMINATION,String TYPE,
			double TALKVALUE,int VALIDITY,String DESCRIPTION,String COUNTRY,String START_DATE,
			String END_DATE,int SNO) throws SQLException;
	
	public boolean updatePlanUpdateRecordDao(String OPERATOR,int CIRCLE,int DENOMINATION,String TYPE,
			double TALKVALUE,int VALIDITY,String DESCRIPTION,String COUNTRY,String START_DATE,
			String END_DATE,int SNO) throws SQLException;
	
	public int deletePlanUpdateRecordDao(int sid)throws SQLException;

}
