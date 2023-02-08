package com.project_catmoa.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project_catmoa.dto.DonateDto;
import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.mapper.DashboardMapper;
import com.project_catmoa.mapper.DonateMapper;

import lombok.Setter;

public class DashboardServiceImpl implements DashboardService{

	@Setter
	private DashboardMapper dashboardMapper;

	@Override
	public List<HashMap<String, Object>> userAreaBar() {
		List<HashMap<String, Object>> userArea = dashboardMapper.userAreaBar();
		return userArea;
	}

	@Override
	public List<HashMap<String, Object>> userAge() {
		List<HashMap<String, Object>> userAge = dashboardMapper.userAge();
		return userAge;
	}

	@Override
	public List<HashMap<String, Object>> userInflowCode() {
		List<HashMap<String, Object>> userInflowCode = dashboardMapper.userInflowCode();
		return userInflowCode;
	}

	@Override
	public List<HashMap<String, Object>> userGender() {
		List<HashMap<String, Object>> userGender = dashboardMapper.userGender();
		return userGender;
	}
	
}
