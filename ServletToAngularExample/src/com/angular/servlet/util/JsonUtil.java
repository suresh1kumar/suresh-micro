package com.angular.servlet.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUtil {
	
	private static  ObjectMapper objectMapper;
	static{
		objectMapper=new ObjectMapper();
	}
	public static String convertJavaToJson(Object obj){
		
		String jsonString="";
		try {
			jsonString=objectMapper.writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
			System.out.println("Exception occured while converting the java to json");
		}
		
		return jsonString;
		
	}

}
