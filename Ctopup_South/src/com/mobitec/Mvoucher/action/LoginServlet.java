package com.mobitec.Mvoucher.action;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mobitec.Mvoucher.dao.LoginService;
 
 @WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
        
    LoginService service = null;
     
    public void init(ServletConfig config)throws ServletException{
        service = new LoginService();
    }
     
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("************************Login Controller*********************");
    	String username = request.getParameter("username");
        String password = request.getParameter("password");
         
        System.out.println("username ::"+username);
        System.out.println("password ::"+password);
        String message = service.doLogin(username, password);
        if(message!=null){
        System.out.println("login message ::"+message);
        response.sendRedirect("index.html");
        }
        response.getWriter().write(message);
    }
}