package com.parking.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.parking.Dto.ParkingDto;
import com.parking.entity.ParkingEntity;
import com.parking.repository.ParkingRepository;

// @Component
@Service("ParkingService2")
public class ParkingServiceImpl2 implements ParkingService2 {

	@Autowired
	private ParkingRepository parkingRepository;

	// 페이징 조회
	@Override
	public HashMap<String, Object> findAllByPage(int pageNo, int pageSize) {
		PageRequest pageRequest = PageRequest.of(pageNo, pageSize, Sort.by("enterTime").descending());
		Page<ParkingEntity> page = parkingRepository.findAll(pageRequest);

		HashMap<String, Object> pagingData = new HashMap<>();
		pagingData.put("dataCount", (int)page.getTotalElements());
		pagingData.put("pageCount", page.getTotalPages());
		List<ParkingEntity> parkingList = page.getContent();

		ArrayList<ParkingDto> records = new ArrayList<>();
		for (ParkingEntity parkingEntity : parkingList) {
			records.add(parkingEntity.exportParkingDto());
		}

		pagingData.put("records", records);

		return pagingData;
	}
}
