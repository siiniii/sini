package com.parking.service;

import java.util.List;

import com.parking.Dto.ControlDto;
import com.parking.Dto.RegistrationDto;
import com.parking.entity.ControlEntity;
import com.parking.entity.RegistrationEntity;

public interface RegistrationService {

	void registrationCar(RegistrationDto regDto);
	
	public default RegistrationDto regEntityToDto(RegistrationEntity regEntity) {
		RegistrationDto regDto = new RegistrationDto();
		regDto.setIndexNo(regEntity.getIndexNo());
		regDto.setRegCarNo(regEntity.getRegCarNo());
		regDto.setRegInfo(regEntity.getRegInfo());
		regDto.setRegDate(regEntity.getRegDate());
		
		
		return regDto;		
	}

	List<RegistrationEntity> findAllRegCars();
	List<RegistrationEntity> searchNo(String searchCarNo);
	List<RegistrationEntity> searchInfo(String searchRegInfo);
	List<RegistrationEntity> searchBoth(String searchRegInfo, String searchCarNo);

	void deleteRegCar(int indexNo);
	RegistrationEntity modifyCarData(int indexNo);

	void modifyRegCar(RegistrationEntity regE);


	List<ControlEntity> findRegCarInOut(String carNo);
}