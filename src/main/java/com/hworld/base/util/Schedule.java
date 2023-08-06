package com.hworld.base.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hworld.base.dao.ScheduleDAO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class Schedule {
	
	@Autowired
	private ScheduleDAO scheduleDAO;

	@Scheduled (cron = "0 0 0 1 * *")
	public void paymentDetailUpdate () throws Exception {
		Map<String, Integer> map = new HashMap<>();
		scheduleDAO.paymentDetailUpdate(map);
		int result = map.get("result");
		if(result < 0) {
			log.error("errorCode : {}", result);
			log.error("요금 업데이트 중 오류가 발생하였습니다");
		}
		else {
			log.info("요금 업데이트 작업을 정상적으로 수행하였습니다");
		}

	}
	
	@Scheduled (cron = "0 0 0 1 * *")
	public void billInsert () throws Exception {
		Map<String, Integer> map = new HashMap<>();
		scheduleDAO.billInsert(map);
		int result = map.get("result");
		if(result < 0) {
			log.error("errorCode : {}", result);
			log.error("청구서 발급 중 오류가 발생하였습니다");
		}
		else {
			log.info("요금 업데이트 작업을 정상적으로 수행하였습니다");
		}

	}
	
//	@Scheduled 
//	public void billCheckUpdate () {
//		
//	}
}
