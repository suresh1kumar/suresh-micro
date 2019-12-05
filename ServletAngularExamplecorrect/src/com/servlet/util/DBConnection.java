package com.servlet.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	// String url = "jdbc:mysql://localhost:3306/surajschema";
	//public static final String URL = "jdbc:oracle:thin:@172.22.0.155:1533:ctopup";
	public static final String URL = "jdbc:oracle:thin:@172.22.0.199:1521:ctopup";
	//public static final String USER_NAME = "test_mgmt";
	//public static final String PASSWORD = "test_mgmt";
	public static final String USER_NAME = "mvoucher";
	public static final String PASSWORD = "mvoucher";


	public static Connection getConnection() {
		Connection con = null;
		try {
			try {
				// Class.forName("com.mysql.jdbc.Driver");
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			con = DriverManager.getConnection(URL, USER_NAME, PASSWORD);
			System.out.println("Printing connection object " + con);

		} catch (SQLException ex) {

			throw new RuntimeException("Error connecting to the database", ex);

		}
		return con;
	}

}
//https://www.liveprogramming.info/zone-ajax-country-state-city-dropdown-example-in-jsp.html
