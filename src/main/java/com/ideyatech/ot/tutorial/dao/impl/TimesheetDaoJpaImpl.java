package com.ideyatech.ot.tutorial.dao.impl;

import org.opentides.dao.impl.BaseEntityDaoJpaImpl;
import org.springframework.stereotype.Repository;

import com.ideyatech.ot.tutorial.dao.TimesheetDao;
import com.ideyatech.ot.tutorial.entity.Timesheet;


@Repository(value="timesheetDao")
public class TimesheetDaoJpaImpl extends BaseEntityDaoJpaImpl<Timesheet, Long> implements TimesheetDao{

	
}
