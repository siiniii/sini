package com.project_catmoa.service;

import java.util.HashMap;
import java.util.List;

import com.project_catmoa.dto.DonateDto;

public interface DonateService {

	void donateInfo(DonateDto donate);

	int donateSum();

	int donateId();

	List<HashMap<String, Object>> findDonateRank();

	List<HashMap<String, Object>> donateAreaBar();
	

}
