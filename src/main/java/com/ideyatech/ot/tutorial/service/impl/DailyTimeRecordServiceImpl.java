package com.ideyatech.ot.tutorial.service.impl;


import org.opentides.service.impl.BaseCrudServiceImpl;
import org.springframework.stereotype.Service;

import com.ideyatech.ot.tutorial.entity.DailyTimeRecord;
import com.ideyatech.ot.tutorial.service.DailyTimeRecordService;

@Service("dailyTimeRecordService")
public class DailyTimeRecordServiceImpl extends BaseCrudServiceImpl<DailyTimeRecord> implements DailyTimeRecordService {

}
