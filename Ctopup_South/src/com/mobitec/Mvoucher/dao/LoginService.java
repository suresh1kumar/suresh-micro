package com.mobitec.Mvoucher.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginService {
    public String doLogin(String username, String password){
    	System.out.println("**********************Login Dao********************");
        Connection con = null;
        String message = null;
        try {
            //loading the driver class
            Class.forName("oracle.jdbc.driver.OracleDriver");
            //getting the connection from DriverManager factory Class by passing the connection url and credentials
            con = DriverManager.getConnection("jdbc:oracle:thin:@172.22.0.155:1533:testspd","test_mgmt","test_mgmt");
            //creating prepared statement for our required query
            System.out.println("connection ::"+con);
            PreparedStatement statement = con.prepareStatement("SELECT NAME, PASS FROM login WHERE NAME = ? AND PASS = ?");
            //setting the parameters
            statement.setString(1, username);
            statement.setString(2, password);
            //executing the prepared statement, which returns a ResultSet
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                message = "SUCCESS";
                System.out.println("Login Success..................");
            }else{
                message = "FAILURE";
                System.out.println("Login failure..................");
            }
        } catch (Exception e) {
            message = "FAILURE";
            e.printStackTrace();
        }
        return message;
    }
}