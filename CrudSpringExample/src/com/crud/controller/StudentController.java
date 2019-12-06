package com.crud.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.crud.bean.StudentBean;
import com.crud.dao.StudentDao;

@Controller
public class StudentController {

	@Autowired
	private StudentDao studentDao;

	@RequestMapping("/") // success
	public String showAddStudent() {
		System.out.println("************View Page**************");
		return "success";
	}
//*****************View Record****************
	@RequestMapping(value = "/getStudents")
	public ModelAndView getStudent() {
		System.out.println("**********************<<View Controller>>***************");
		List<StudentBean> list = new ArrayList<>();

		list = studentDao.getStudentRecord();
		return new ModelAndView("success", "student", list);
	}
	// ***********update**********

	@RequestMapping(value = "/editemp/{id}")
	public ModelAndView edit(@PathVariable int id) {
		System.out.println("******************<<getElement Id Controller>>******************");
		StudentBean emp = studentDao.getEmpById(id);
		return new ModelAndView("update", "command", emp);
	}

	@RequestMapping(value = "/editsave", method = RequestMethod.POST)
	public ModelAndView editsave(@ModelAttribute("emp") StudentBean emp, BindingResult result, ModelMap map) {
		System.out.println("*******************<<update Controller>>*****************");
		System.out.println("roll controlle ::" + Integer.valueOf(emp.getRoll()));
		System.out.println("name controller:: " + emp.getName());
		System.out.println("Address controller :: " + emp.getAddress());
		studentDao.update(emp);
		System.out.println("updated....");
		return new ModelAndView("redirect:/getStudents");
	}

	// *************Delete***********

	@RequestMapping(value = "/deleteemp/{id}", method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int id) {
		System.out.println("***************<<delete Controller>>*******************");
		System.out.println("roll id controller ::" + id);
		studentDao.delete(id);
		return new ModelAndView("redirect:/getStudents");
	}

}
