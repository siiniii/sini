package com.parking.service;

import java.util.HashMap;
import java.util.List;

import com.parking.Dto.ControlDto;
import com.parking.entity.ControlEntity;

public interface ControlService {

	//입차
	void enterControl (ControlDto control);

	//입차 출차 구분
	ControlEntity findControlEntityByCarNoAndNoExit(String carNo);

	//출차
	void exitControl (String carNo);

	//전체 조회
	List<ControlEntity> findAll();

	//페이징 조회
	HashMap<String, Object> findAllByPage(int pageNo, int pageSize);
}