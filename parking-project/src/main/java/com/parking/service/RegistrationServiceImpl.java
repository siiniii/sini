package com.parking.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parking.Dto.RegistrationDto;
import com.parking.entity.RegistrationEntity;
import com.parking.repository.RegRepository;

// @Component
@Service("registerService")
public class RegistrationServiceImpl implements RegistrationService {

	@Autowired
	private RegRepository regRepository;

	// 차량 등록
	@Override
	public void registrationCar(RegistrationDto regDto) {

		RegistrationEntity registrationEntity = RegistrationEntity.builder()
																  .regCarNo(regDto.getRegCarNo())
																  .regInfo(regDto.getRegInfo())
																  .build();
		regRepository.save(registrationEntity); // 데이터베이스에 데이터 저장

	}

	// 등록 차량 리스트
	@Override
	public List<RegistrationEntity> findAllRegCars() {

		List<RegistrationEntity> regList = regRepository.findAll();

		return regList;
	}

	// 차량번호 리스트
	@Override
	@Transactional
    public List<RegistrationEntity> searchNo(String searchCarNo) {
        List<RegistrationEntity> noList = regRepository.findByRegCarNoContaining(searchCarNo);
        return noList;
    }

	// 등록정보 리스트
	@Override
	@Transactional
    public List<RegistrationEntity> searchInfo(String searchRegInfo) {
        List<RegistrationEntity> infoList = regRepository.findByRegInfo(searchRegInfo);
        return infoList;
	}

	// 검색조건 모두충족 리스트
	@Override
	@Transactional
    public List<RegistrationEntity> searchBoth(String searchRegInfo, String searchCarNo) {
        List<RegistrationEntity> bothList = regRepository.findByRegInfoAndRegCarNoContaining(searchRegInfo, searchCarNo);
        return bothList;
	}

	///////////////////////

	// 등록차량 삭제
	@Override
	public void deleteRegCar(int indexNo) {

		System.out.println(indexNo);
		RegistrationEntity deleteE = regRepository.findByIndexNo(indexNo);
		System.out.println(deleteE);
		regRepository.delete(deleteE);


	}





}









