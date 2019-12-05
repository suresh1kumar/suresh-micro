<%@page import="  java.io.*"%>  
<%@page import="  org.apache.poi.hssf.usermodel.*"%>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String name[] = request.getParameterValues("name");
		String address[] = request.getParameterValues("address");
		String contact[] = request.getParameterValues("contact");
		String email[] = request.getParameterValues("email");

		try {
			String filename = "C:/Users/Suraj-Java/Desktop/New folder (2)/data.xls";
			HSSFWorkbook hwb = new HSSFWorkbook();
			HSSFSheet sheet = hwb.createSheet("sheet");

			HSSFRow rowhead = sheet.createRow((short) 0);
			rowhead.createCell((short) 0).setCellValue("Name");
			rowhead.createCell((short) 1).setCellValue("Address");
			rowhead.createCell((short) 2).setCellValue("Contact No");
			rowhead.createCell((short) 3).setCellValue("E-mail");
			rowhead.createCell((short) 4).setCellValue("Logo");
			for (int i = 0; i < name.length; i++) {
				int j = i + 1;
				HSSFRow row = sheet.createRow((short) j);
				row.createCell((short) 0).setCellValue(name[i]);
				row.createCell((short) 1).setCellValue(address[i]);
				row.createCell((short) 2).setCellValue(contact[i]);
				row.createCell((short) 3).setCellValue(email[i]);
			}
			FileOutputStream fileOut = new FileOutputStream(filename);
			hwb.write(fileOut);
			fileOut.close();
			out.println("Your excel file has been generated!");
		} catch (Exception ex) {
			System.out.println(ex);
		}
	%>
	
</body>
</html>