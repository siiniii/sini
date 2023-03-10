package com.parking.repository;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.parking.entity.ParkingEntity;

public interface ParkingRepository extends JpaRepository<ParkingEntity, Integer> {
	// 목록 전부 조회
	@Override
	List<ParkingEntity> findAll();

	// 차량번호 조회
	List<ParkingEntity> findByCarNoContaining(String carNo);
	
	// 정산한 차량 삭제
	ParkingEntity findByIndexNo(int indexNo);

	//입차 출차 구분
	@Query(value = "SELECT pe FROM ParkingEntity pe WHERE pe.carNo = :carNo AND pe.exitTime IS null")
	ParkingEntity findParkingEntityByCarNoAndNoExit(@Param("carNo") String carNo);

	//출차
	@Transactional
	@Modifying
	@Query(value = "UPDATE ParkingEntity pe SET pe.exitTime = LOCALTIMESTAMP WHERE pe.carNo = :carNo AND pe.exitTime IS null")
	void exitParking(@Param("carNo") String carNo);

	

	


}
