package com.project_catmoa.service;

import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import com.project_catmoa.dto.CatColorDto;
import com.project_catmoa.dto.FeedingAreaDto;
import com.project_catmoa.dto.IntroDto;

public interface AdminService {

	List<IntroDto> findUserList(int pageNo, int pageSize);

	int findUserListCount();
	
	void addAdmin(String userId);

	void removeAdmin(String userId);

	List<HashMap<String, Object>> findAllReportList(int pageNo, int pageSize);

	int findReportListCount(); //page

	HashMap<String, Object>  findReportDetailByBoardNo(int boardNo);

	HashMap<String, Object> findCatinfoDetailByCatsId(String catsId);

	FeedingAreaDto searchRegion(FeedingAreaDto region);

	FeedingAreaDto searchRegion2(@Valid FeedingAreaDto region);

	void addRegion(FeedingAreaDto region);

	List<CatColorDto> findCatColor();

	List<HashMap<String, Object>> findCatInfoListByPage(String sido, String gu, int colorCode,int pageNo, int pageSize);

	int findCatInfoListCount(String sido, String gu, int colorCode);

	void updateCatinfoByBoardNo(int boardNo);
}
