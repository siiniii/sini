package com.parking.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.parking.entity.RateEntity;

public interface RateRepository extends JpaRepository<RateEntity, Integer> {
	// 목록 전부 조회
	// List<RateEntity> findAll();

}
