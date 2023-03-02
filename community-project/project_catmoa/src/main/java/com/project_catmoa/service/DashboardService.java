package com.project_catmoa.service;

import java.util.HashMap;
import java.util.List;

import com.project_catmoa.dto.DonateDto;

public interface DashboardService {


	List<HashMap<String, Object>> userAreaBar();

	List<HashMap<String, Object>> userAge();
	
	List<HashMap<String, Object>> userInflowCode();
	
	List<HashMap<String, Object>> userGender();
	
}
