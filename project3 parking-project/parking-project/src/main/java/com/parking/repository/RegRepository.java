package com.parking.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parking.entity.ControlEntity;
import com.parking.entity.RegistrationEntity;

public interface RegRepository extends JpaRepository<RegistrationEntity, Integer> {
	// 목록 전부 조회 
	List<RegistrationEntity> findAll();
	
	// 차량번호 검색  
	List<RegistrationEntity> findByRegCarNoContaining(String searchCarNo);

	// 등록정보 검색 
	List<RegistrationEntity> findByRegInfoContaining(String RegInfo);
	
	// 차량번호 && 등록정보 검색 
	List<RegistrationEntity> findByRegInfoAndRegCarNoContaining(String searchCarNo, String RegInfo);
	
	////////////////////////
	
	RegistrationEntity findByIndexNo(int indexNo);
	
}
