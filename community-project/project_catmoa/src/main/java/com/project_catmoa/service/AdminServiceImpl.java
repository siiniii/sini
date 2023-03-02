package com.project_catmoa.service;

import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import com.project_catmoa.dto.CatColorDto;
import com.project_catmoa.dto.FeedingAreaDto;
import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.mapper.AdminMapper;

import lombok.Setter;

public class AdminServiceImpl implements AdminService{

	@Setter
	private AdminMapper adminMapper;
	
	@Override
	public List<IntroDto> findUserList(int pageNo, int pageSize) {
		
		int from = (pageNo -1) * pageSize;
		int count = pageSize;
		
		List<IntroDto> user = adminMapper.findUserList(from, count);
		
		return user;
	}

	@Override
	public int findUserListCount() {
		
		int UserListCount = adminMapper.selectUserListCount();
		
		return UserListCount;
	}
	
	@Override
	public void addAdmin(String userId) {
		
		adminMapper.addAdmin(userId);
		
	}

	@Override
	public void removeAdmin(String userId) {
		
		adminMapper.removeAdmin(userId);
		
	}

	@Override
	public List<HashMap<String, Object>> findAllReportList(int pageNo, int pageSize) {
		
		int from = (pageNo -1) * pageSize;
		int count = pageSize;
		
		return adminMapper.selectReportList(from, count);
	}


	@Override 
	public int findReportListCount() { 
		int ReportListCount = adminMapper.selectReportListCount(); 
		return ReportListCount; 
	}

	@Override
	public HashMap<String, Object>  findReportDetailByBoardNo(int boardNo) {
		HashMap<String, Object> reportDto = adminMapper.selectReportDetailByBoardNo(boardNo);
		return reportDto;
	}

	@Override
	public HashMap<String, Object> findCatinfoDetailByCatsId(String catsId) {
		HashMap<String, Object> catinfoDto = adminMapper.selectCatinfoDetailByCatsId(catsId);
		return catinfoDto;
	}
	
	@Override
	public FeedingAreaDto searchRegion(FeedingAreaDto region) {
		
		FeedingAreaDto area = adminMapper.searchRegion(region);
		
		return area;
	}

	@Override
	public FeedingAreaDto searchRegion2(@Valid FeedingAreaDto region) {
		
		FeedingAreaDto area2 = adminMapper.searchRegion2(region);
		
		return area2;
	}
	
	@Override
	public void addRegion(FeedingAreaDto region) {
		
		adminMapper.addRegion(region);

	}

	@Override
	public List<CatColorDto> findCatColor() {
		
		List<CatColorDto> catcolors = adminMapper.selectCatColor();
		return catcolors;
	}

	@Override
	public List<HashMap<String, Object>> findCatInfoListByPage(String sido, String gu, int colorCode, int pageNo,  int pageSize) {
		int from = (pageNo -1) * pageSize;
		int count = pageSize;
		return adminMapper.selectCatInfoListByPage(sido, gu, colorCode, from, count);
	}
	
	@Override 
	public int findCatInfoListCount(String sido, String gu, int colorCode) {
		return adminMapper.selectCatInfoListCount(sido, gu, colorCode);
	}

	@Override
	public void updateCatinfoByBoardNo(int boardNo) {

		HashMap<String, Object> reportDto = adminMapper.selectReportDetailByBoardNo(boardNo);
		adminMapper.insertCatinfoByBoardNo(boardNo);
	}


}
