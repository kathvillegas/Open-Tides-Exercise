package com.ideyatech.ot.tutorial.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.opentides.web.controller.BaseCrudController;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ideyatech.ot.tutorial.entity.DailyTimeRecord;

@Controller
@RequestMapping("/dailyTimeRecord")
public class DailyTimeRecordController extends BaseCrudController<DailyTimeRecord>{	
	@RequestMapping(value = "/findByEmployeeId/{employeeId}", produces = "application/json")
	public @ResponseBody List<DailyTimeRecord> findDtrByEmployeeId(@PathVariable Long employeeId) {
		DailyTimeRecord sample = new DailyTimeRecord();
		sample.setEmployeeId(employeeId);
		return getService().findByExample(sample);
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd'T'HH:mm"), true));
	}
	
}
