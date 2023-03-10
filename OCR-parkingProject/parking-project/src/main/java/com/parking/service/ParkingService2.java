package com.parking.service;

import java.util.HashMap;

public interface ParkingService2 {

	//페이징 조회
	HashMap<String, Object> findAllByPage(int pageNo, int pageSize);

}
