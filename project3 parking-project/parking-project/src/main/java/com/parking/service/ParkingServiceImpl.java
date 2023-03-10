package com.parking.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parking.Dto.ParkingDto;
import com.parking.entity.ParkingEntity;
import com.parking.entity.RateEntity;
import com.parking.repository.ParkingRepository;
import com.parking.repository.RateRepository;

// @Component
@Service("ParkingService")
public class ParkingServiceImpl implements ParkingService {

	@Autowired
	private ParkingRepository parkingRepository;
	@Autowired
	private RateRepository rateRepository;

	// 주차 차량 리스트
	@Override
	public List<ParkingEntity> findAllCars() {

		List<ParkingEntity> parkingList = parkingRepository.findAll();

		return parkingList;
	}


	@Override
	public ParkingEntity getCarData(int indexNo) {

		ParkingEntity car = parkingRepository.findById(indexNo).orElse(null);

		return car;

	}

	// 주차타입 수정
	@Override
	public void updateParkingType(ParkingDto car) {

		ParkingEntity parkingEntity = parkingRepository.findById(car.getIndexNo()).orElse(null);
		parkingEntity.setParkingType(car.getParkingType());
		parkingRepository.save(parkingEntity);
	}

	// 차량번호 조회
	@Override
	@Transactional
	public List<ParkingEntity> searchBycarNo(String carNo) {
		List<ParkingEntity> searchCarNo = parkingRepository.findByCarNoContaining(carNo);
		return searchCarNo;
	}

	// 요금 불러오기
	@Override
	public List<RateEntity> findRateList() {

		List<RateEntity> rateList = rateRepository.findAll();

		return rateList;
	}

	// 요금 설정
	@Override
	public void settingRate(String rateType, int rate) {

		List<RateEntity> rateEntities = rateRepository.findAll();
		RateEntity rateEntity = rateEntities.get(0);
		if (rateType.equals("visitor")) {
			rateEntity.setVisitorRate(rate);
		} else if (rateType.equals("customer")) {
			rateEntity.setCustomerRate(rate);
		} else {
			rateEntity.setResidentRate(rate);
		}
		rateRepository.save(rateEntity);
	}
	
	// 정산한 차량 삭제
	@Override
	public void deletePayCar(int indexNo) {
		
		ParkingEntity parkingEntity = parkingRepository.findByIndexNo(indexNo);
		
		parkingRepository.delete(parkingEntity);
		
	}
	
//-------

	@Override
	public void enterParking(ParkingDto parking) {

		ParkingEntity parkingEntity = ParkingEntity.builder()
												   .carNo(parking.getCarNo())
												   .build();

		parkingRepository.save(parkingEntity); // 데이터베이스에 데이터 저장
	}


	@Override
	public ParkingEntity findParkingEntityByCarNoAndNoExit(String carNo) {
		ParkingEntity parkingEntity = parkingRepository.findParkingEntityByCarNoAndNoExit(carNo);

		return parkingEntity;
	}


	@Override
	public void exitParking(String carNo) {
		parkingRepository.exitParking(carNo);
	}


	





}
