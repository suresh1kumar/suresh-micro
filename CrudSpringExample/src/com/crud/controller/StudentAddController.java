package com.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.crud.bean.StudentBean;
import com.crud.dao.StudentDao;

@Controller
public class StudentAddController {

	@Autowired
	private StudentDao studentDao;

	@RequestMapping(value = "/addnewrr", method = RequestMethod.GET)
	public String displayLogin(@ModelAttribute("studentBean") StudentBean studentBean) {
		return "addnew";
	}

	@RequestMapping(value = "/saveContact", method = RequestMethod.POST)
	public ModelAndView saveContact(@ModelAttribute StudentBean studentBean) {
		System.out.println("******************<<add Controller>>*******************");
		studentDao.insertStudentRecord(studentBean);
		System.out.println("Name Controller" + studentBean.getName());
		System.out.println("Address controller" + studentBean.getAddress());
		System.out.println("roll controller" + studentBean.getRoll());
		System.out.println("add contro ::" + studentDao.toString());

		return new ModelAndView("redirect:/getStudents");
	}

}
