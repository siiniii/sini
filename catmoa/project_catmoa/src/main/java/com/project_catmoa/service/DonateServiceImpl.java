package com.project_catmoa.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project_catmoa.dto.DonateDto;
import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.mapper.DonateMapper;

import lombok.Setter;

public class DonateServiceImpl implements DonateService{

	@Setter
	private DonateMapper donateMapper;
	
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	@Override
	public void donateInfo(DonateDto donate) {
		donateMapper.insertDonateInfo(donate);
		
	}

	@Override
	public int donateSum() {
		int don = donateMapper.DonateSum();
		return don;
	}
	
	@Override
	public int donateId() {
		int dp = donateMapper.DonateId();
		return dp;
	}

	@Override
	public List<HashMap<String, Object>> findDonateRank() {
		return donateMapper.selectDonateRank();
	}
	
	@Override
	public List<HashMap<String, Object>> donateAreaBar() {
		List<HashMap<String, Object>> dab = donateMapper.DonateAreaBar();
		return dab;
	}
	
	
}
