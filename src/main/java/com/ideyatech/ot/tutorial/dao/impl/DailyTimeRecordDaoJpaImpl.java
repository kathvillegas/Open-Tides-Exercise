package com.ideyatech.ot.tutorial.dao.impl;

import org.opentides.dao.impl.BaseEntityDaoJpaImpl;
import org.springframework.stereotype.Repository;

import com.ideyatech.ot.tutorial.dao.DailyTimeRecordDao;
import com.ideyatech.ot.tutorial.entity.DailyTimeRecord;


@Repository(value="dailyTimeRecordDao")
public class DailyTimeRecordDaoJpaImpl extends BaseEntityDaoJpaImpl<DailyTimeRecord, Long> implements DailyTimeRecordDao{

	
}
