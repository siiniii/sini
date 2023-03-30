package com.project_catmoa.service;

import com.project_catmoa.dto.JjimDto;

public interface JjimService {
	void jjimInfo(JjimDto jjimDto, boolean jjim);
	
	int findCountJjimByUserIdAndBoardNo(JjimDto jjimDto);
}
