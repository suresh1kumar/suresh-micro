package com.mobitec.Mvoucher;

import java.sql.Date;

public class PlanUpdateBean
{
  /*private int SNO;
  private String OPERATOR;
  private int CIRCLE;
  private int DENOMINATION;
  private String TYPE;
  private double TALKVALUE;
  private int VALIDITY;
  private String DESCRIPTION;
  private String COUNTRY;
  private Date START_DATE;
  private Date END_DATE;*/
	private String SNO;
	  private String OPERATOR;
	  private String CIRCLE;
	  private String DENOMINATION;
	  private String TYPE;
	  private String TALKVALUE;
	  private String VALIDITY;
	  private String DESCRIPTION;
	  private String COUNTRY;
	  private String START_DATE;
	  private String END_DATE;
  
  public PlanUpdateBean() {}

public String getSNO() {
	return SNO;
}

public void setSNO(String sNO) {
	SNO = sNO;
}

public String getOPERATOR() {
	return OPERATOR;
}

public void setOPERATOR(String oPERATOR) {
	OPERATOR = oPERATOR;
}

public String getCIRCLE() {
	return CIRCLE;
}

public void setCIRCLE(String cIRCLE) {
	CIRCLE = cIRCLE;
}

public String getDENOMINATION() {
	return DENOMINATION;
}

public void setDENOMINATION(String dENOMINATION) {
	DENOMINATION = dENOMINATION;
}

public String getTYPE() {
	return TYPE;
}

public void setTYPE(String tYPE) {
	TYPE = tYPE;
}

public String getTALKVALUE() {
	return TALKVALUE;
}

public void setTALKVALUE(String tALKVALUE) {
	TALKVALUE = tALKVALUE;
}

public String getVALIDITY() {
	return VALIDITY;
}

public void setVALIDITY(String vALIDITY) {
	VALIDITY = vALIDITY;
}

public String getDESCRIPTION() {
	return DESCRIPTION;
}

public void setDESCRIPTION(String dESCRIPTION) {
	DESCRIPTION = dESCRIPTION;
}

public String getCOUNTRY() {
	return COUNTRY;
}

public void setCOUNTRY(String cOUNTRY) {
	COUNTRY = cOUNTRY;
}

public String getSTART_DATE() {
	return START_DATE;
}

public void setSTART_DATE(String sTART_DATE) {
	START_DATE = sTART_DATE;
}

public String getEND_DATE() {
	return END_DATE;
}

public void setEND_DATE(String eND_DATE) {
	END_DATE = eND_DATE;
}

@Override
public String toString() {
	return "PlanUpdateBean [SNO=" + SNO + ", OPERATOR=" + OPERATOR
			+ ", CIRCLE=" + CIRCLE + ", DENOMINATION=" + DENOMINATION
			+ ", TYPE=" + TYPE + ", TALKVALUE=" + TALKVALUE + ", VALIDITY="
			+ VALIDITY + ", DESCRIPTION=" + DESCRIPTION + ", COUNTRY="
			+ COUNTRY + ", START_DATE=" + START_DATE + ", END_DATE=" + END_DATE
			+ "]";
}
  
  
  
 
}