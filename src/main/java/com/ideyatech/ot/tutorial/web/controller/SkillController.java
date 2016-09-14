package com.ideyatech.ot.tutorial.web.controller;

import java.util.List;

import org.opentides.web.controller.BaseCrudController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ideyatech.ot.tutorial.entity.Employee;
import com.ideyatech.ot.tutorial.entity.Skill;
import com.ideyatech.ot.tutorial.service.EmployeeService;

@Controller
@RequestMapping("/skill")
public class SkillController extends BaseCrudController<Skill>{

	@RequestMapping(value = "/findByEmployeeId/{employeeId}", produces = "application/json")
	public @ResponseBody List<Skill> findSkillsByEmployeeId(@PathVariable Long employeeId) {
		Skill sample = new Skill();
		sample.setEmployeeId(employeeId);
		return getService().findByExample(sample);
	}

}
