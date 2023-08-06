package com.hworld.base.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleDAO {

	public Map<String, Integer> paymentDetailUpdate (Map<?, ?> map) throws Exception;
	
	public Map<String, Integer> billInsert (Map<?, ?> map) throws Exception;
}
