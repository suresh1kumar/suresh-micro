package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	// String url = "jdbc:mysql://localhost:3306/surajschema";
	public static final String URL = "jdbc:mysql://localhost:3306/surajschema";
	public static final String USER_NAME = "root";
	public static final String PASSWORD = "root";

	public static Connection getConnection() {
		Connection con = null;
		try {
			try {
				// Class.forName("com.mysql.jdbc.Driver");
				Class.forName("com.mysql.jdbc.Driver");
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
