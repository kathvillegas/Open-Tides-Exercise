package com.ideyatech.ot.tutorial.service.impl;


import org.opentides.service.impl.BaseCrudServiceImpl;
import org.springframework.stereotype.Service;

import com.ideyatech.ot.tutorial.entity.Timesheet;
import com.ideyatech.ot.tutorial.service.TimesheetService;

@Service("timesheetService")
public class TimesheetServiceImpl extends BaseCrudServiceImpl<Timesheet> implements TimesheetService {

}
