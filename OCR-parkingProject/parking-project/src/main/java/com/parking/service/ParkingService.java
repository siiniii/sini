package com.parking.service;

import java.util.List;

import com.parking.Dto.ParkingDto;
import com.parking.entity.ParkingEntity;
import com.parking.entity.RateEntity;

public interface ParkingService {

	List<ParkingEntity> findAllCars();

	ParkingEntity getCarData(int indexNo);

	void updateParkingType(ParkingDto car);

	List<ParkingEntity> searchBycarNo(String carNo);

	List<RateEntity> findRateList();

	// void settingRate(RateDto rate);
	void settingRate(String rateType, int rate);
	
	void deletePayCar(int indexNo);

	//입차
	void enterParking (ParkingDto parking);

	//입차 출차 구분
	ParkingEntity findParkingEntityByCarNoAndNoExit(String carNo);

	//출차
	void exitParking (String carNo);

	




}
