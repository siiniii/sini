package com.project_catmoa.service;

import java.util.List;

import com.project_catmoa.dto.CatInfoDto;
import com.project_catmoa.dto.FeedingAreaDto;
import com.project_catmoa.dto.LocalDto;
import com.project_catmoa.mapper.CatInfoMapper;

import lombok.Setter;

public interface CatInfoService {

	List<CatInfoDto> findCatBoardByPage(int pageNo, int page_size);

	int findBoardCount();
	
	List<CatInfoDto> findCatinfoByLocalNo(int localNo);

	List<FeedingAreaDto> findAllFeedingAreas();

	List<LocalDto> findAllLocals();

	List<String> findAllSido();

	List<String> findGugunBySido(String sido);

	List<LocalDto> findDongByGugun(String gugun);
}