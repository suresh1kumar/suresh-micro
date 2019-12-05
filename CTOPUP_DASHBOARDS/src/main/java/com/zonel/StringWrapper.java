package com.zonel;

public class StringWrapper {
	public static String makeNotNull(String string){
		if(string!=null && !string.trim().equals("") && !string.trim().equalsIgnoreCase("null")){
			return string.trim();
		}
		else
			return "";
	}
	public static String returnHyphenIfNull(String string){
		if(string!=null && !string.trim().equals("") && !string.trim().equalsIgnoreCase("null")){
			return string.trim();
		}
		else
			return "-";
	}
	public static String toString(Object object) {
		if (object != null) {
			return object.toString();
		} else
			return "";
	}

}