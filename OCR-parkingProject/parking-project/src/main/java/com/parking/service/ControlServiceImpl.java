package com.parking.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.parking.Dto.ControlDto;
import com.parking.entity.ControlEntity;
import com.parking.repository.ControlRepository;

// @Component
@Service("controlService")
public class ControlServiceImpl implements ControlService {

	@Autowired
	private ControlRepository controlRepository;

	// 입차
	@Override
	public void enterControl(ControlDto control) {

		if (control.getReg()) {

			ControlEntity controlEntity = ControlEntity.builder()
					  .carNo(control.getCarNo())
					  .reg(true)
					  .build();

			controlRepository.save(controlEntity); // 데이터베이스에 데이터 저장
		} else {
			ControlEntity controlEntity = ControlEntity.builder()
					  .carNo(control.getCarNo())
					  .reg(false)
					  .build();

			controlRepository.save(controlEntity); // 데이터베이스에 데이터 저장
		}

	}

	// 입차 출차 구분
	@Override
	public ControlEntity findControlEntityByCarNoAndNoExit(String carNo) {

		ControlEntity controlEntity = controlRepository.findControlEntityByCarNoAndNoExit(carNo);

		return controlEntity;
	}

	// 출차
	@Override
	public void exitControl(String carNo) {
		controlRepository.exitControl(carNo);
	}

	// 전체 조회
	@Override
	public List<ControlEntity> findAll() {
		List<ControlEntity> records = controlRepository.findAll();
		return records;
	}

	// 페이징 조회
	@Override
	public HashMap<String, Object> findAllByPage(int pageNo, int pageSize) {
		PageRequest pageRequest = PageRequest.of(pageNo, pageSize, Sort.by("enterTime").descending());
		Page<ControlEntity> page = controlRepository.findAll(pageRequest);

		HashMap<String, Object> pagingData = new HashMap<>();
		pagingData.put("dataCount", (int)page.getTotalElements());
		pagingData.put("pageCount", page.getTotalPages());
		List<ControlEntity> controlList = page.getContent();

		ArrayList<ControlDto> records = new ArrayList<>();
		for (ControlEntity controlEntity : controlList) {
			records.add(controlEntity.exportControlDto());
		}

		pagingData.put("records", records);

		return pagingData;
	}

}
