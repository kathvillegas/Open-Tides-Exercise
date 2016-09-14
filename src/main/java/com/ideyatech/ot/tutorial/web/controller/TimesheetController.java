package com.ideyatech.ot.tutorial.web.controller;

import java.util.List;

import org.opentides.web.controller.BaseCrudController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ideyatech.ot.tutorial.entity.Employee;
import com.ideyatech.ot.tutorial.entity.Timesheet;
import com.ideyatech.ot.tutorial.service.EmployeeService;

@Controller
@RequestMapping("/timesheet")
public class TimesheetController extends BaseCrudController<Timesheet>{

	@Autowired
	private EmployeeService employeeService;
	
	@ModelAttribute(value="employees")
	public List<Employee> getEmployees(){
		return employeeService.findAll();
	}
	
}
