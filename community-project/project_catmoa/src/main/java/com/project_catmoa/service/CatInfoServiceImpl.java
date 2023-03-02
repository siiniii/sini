package com.project_catmoa.service;

import java.util.List;

import org.springframework.cglib.core.Local;

import com.project_catmoa.dto.CatInfoDto;
import com.project_catmoa.dto.FeedingAreaDto;
import com.project_catmoa.dto.LocalDto;
import com.project_catmoa.mapper.CatInfoMapper;

import lombok.Setter;

public class CatInfoServiceImpl implements CatInfoService {

	@Setter
	private CatInfoMapper catInfoMapper;

	
	 // 페이지설정  
	  @Override public List<CatInfoDto> findCatBoardByPage(int pageNo, int pageSize) {
	  
		  int from = (pageNo - 1) * pageSize; int count = pageSize;
		  
		  List<CatInfoDto> catinfomation = catInfoMapper.selectCatinfoByPage(from, count); return catinfomation;
		  
	  }
	 

	@Override
	public int findBoardCount() {

		int boardCount = catInfoMapper.selectBoardCount();
		return boardCount;

	}

	@Override
	public List<CatInfoDto> findCatinfoByLocalNo(int localNo) {

		List<CatInfoDto> catinfomations = catInfoMapper.selectCatinfoByLocalNo(localNo);
		return catinfomations;
	}

	@Override
	public List<FeedingAreaDto> findAllFeedingAreas() {
		List<FeedingAreaDto> feedingAreas = catInfoMapper.selectAllFeedingAreas();
		return feedingAreas;
	}


	@Override
	public List<LocalDto> findAllLocals() {
		List<LocalDto> locals = catInfoMapper.selectAllLocals();
		return locals;
	}


	@Override
	public List<String> findAllSido() {
		List<String> sidoList = catInfoMapper.selectAllSido();
		return sidoList;
	}


	@Override
	public List<String> findGugunBySido(String sido) {
		List<String> gugunList = catInfoMapper.selectGugunBySido(sido);
		return gugunList;
	}


	@Override
	public List<LocalDto> findDongByGugun(String gugun) {
		List<LocalDto> dongList = catInfoMapper.selectDongByGugun(gugun);
		return dongList;
	}
}
