package com.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PersonJsonDao;


@WebServlet("/PaginationServlet")
public class PaginationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PaginationServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		System.out.println("=============================================action================");
		
		PersonJsonDao personJsonDao=new PersonJsonDao();
		
		String name=request.getParameter("name");
		String fdate=request.getParameter("dateFrom");
		String tdate=request.getParameter("dateTo");
		
		System.out.println("name ::"+name);
		System.out.println("from date ::"+fdate);
		System.out.println("to date   ::"+tdate);
		String jsonString = "";
		
		System.out.println("==========================pagination servlet=======================");
		PrintWriter writer = response.getWriter();
		
		 jsonString = personJsonDao.getAllPersonRecord(name,fdate,tdate);
		 System.out.println("response to Send :: "+jsonString);
		
		writer.write(jsonString);
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
