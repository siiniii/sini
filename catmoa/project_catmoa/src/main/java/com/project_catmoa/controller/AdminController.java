package com.project_catmoa.controller;

import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project_catmoa.dto.CatColorDto;
import com.project_catmoa.dto.FeedingAreaDto;
import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.service.AdminService;
import com.project_catmoa.service.DashboardService;
import com.project_catmoa.ui.AjaxPager;
import com.project_catmoa.ui.ThePager;

@Controller
@RequestMapping(path = { "/admins" })
public class AdminController {
	
	private final int PAGE_SIZE = 20;
	private final int PAGE_SIZE2 = 5;
	private final int PAGER_SIZE = 5;
	private final String USERLIST_LINK_URL = "adminUser";
	private final String REPORTLIST_LINK_URL = "adminReport";
	private final String CATINFOLIST_LINK_URL = "load-cat-info-list";
	
	@Autowired
	@Qualifier("adminService")
	private AdminService adminService;
	
	@Autowired
	@Qualifier("dashboardService")
	private DashboardService dashboardService;
	
	// 관리자 페이지 메인
	@GetMapping(path = { "adminMain" })
	public String admin( Model model) {
		List<HashMap<String, Object>> userArea = dashboardService.userAreaBar();
		List<HashMap<String, Object>> userAge = dashboardService.userAge();
		List<HashMap<String, Object>> userInflowcode = dashboardService.userInflowCode();
		List<HashMap<String, Object>> userGender = dashboardService.userGender();
		
		model.addAttribute("userAreaList", userArea);
		model.addAttribute("userAges", userAge);
		model.addAttribute("userInflowcodes", userInflowcode);
		model.addAttribute("userGenders", userGender);
		
		return "admins/adminMain";
	}
	
	// 유저 목록 페이지
	@GetMapping(path = { "adminUser" })
	public String adminUser(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		
		List<IntroDto> user = adminService.findUserList(pageNo, PAGE_SIZE);
		int UserListCount = adminService.findUserListCount();
		
		ThePager pager = new ThePager(UserListCount, pageNo, PAGE_SIZE, PAGER_SIZE, USERLIST_LINK_URL);
		
		model.addAttribute("user", user);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);
		
		return "admins/adminUser";
	}
	
	// 관리자 등록
	@PostMapping(path = { "addAdmin" })
	public String addAdmin(@RequestParam(defaultValue = "1")int pageNo, String userId, Model model) {
		
		// userId에 해당하는 사용자를 관리자로 변경
		adminService.addAdmin(userId);
		
		return "redirect:/admins/adminUser?pageNo=" + pageNo;
		
	}
	
	// 관리자 해제, 일반회원으로 변경
	@PostMapping(path = { "removeAdmin" })
	public String removeAdmin(@RequestParam(defaultValue = "1")int pageNo, String userId, Model model) {
		
		// userId에 해당하는 관리자를 사용자로 변경
		adminService.removeAdmin(userId);

		return "redirect:/admins/adminUser?pageNo=" + pageNo;
		
	}
	
	// 고양이 제보목록 (관리자페이지)
	@GetMapping(path = { "adminReport" })
	public String adminReport(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		
		int reportListCount = adminService.findReportListCount();
		AjaxPager reportPager = new AjaxPager(reportListCount, pageNo, PAGE_SIZE2, PAGER_SIZE, REPORTLIST_LINK_URL);
	
		model.addAttribute("reportPager", reportPager);
		model.addAttribute("pageNo", pageNo);
		
		
		List<HashMap<String, Object>> reportList = adminService.findAllReportList(pageNo, PAGE_SIZE2);
		model.addAttribute("reportList", reportList);
		
		List<CatColorDto> catcolors = adminService.findCatColor();
		model.addAttribute("catcolors", catcolors);
		
		return "admins/adminReport";
	}
	
	@GetMapping(path = { "/load-report-list" })
	public String loadReportList(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		
		int reportListCount = adminService.findReportListCount();
		AjaxPager reportPager = new AjaxPager(reportListCount, pageNo, PAGE_SIZE2, PAGER_SIZE, REPORTLIST_LINK_URL);
	
		model.addAttribute("reportPager", reportPager);
		model.addAttribute("pageNo", pageNo);		
		
		List<HashMap<String, Object>> reportList = adminService.findAllReportList(pageNo, PAGE_SIZE2);
		model.addAttribute("reportList", reportList);
		
		return "admins/report-list";
	}
		
	@GetMapping(path = { "load-report-detail" })
	@ResponseBody
	public HashMap<String, Object>  loadReportDetail(@RequestParam(defaultValue = "-1") int boardNo, Model model) {
		
		if (boardNo == -1) {
			
		}
		
		HashMap<String, Object> reportDto = adminService.findReportDetailByBoardNo(boardNo);
		
		return reportDto;
	}
	
	@GetMapping(path = { "/load-cat-info-list" })
	public String loadCatInfoList(@RequestParam(defaultValue = "1") int pageNo, String sido, String gu, int colorCode, Model model) {
		
		List<HashMap<String, Object>> catinfoList = adminService.findCatInfoListByPage(sido, gu, colorCode, pageNo, PAGE_SIZE2);
		
		int catinfoListCount = adminService.findCatInfoListCount(sido, gu, colorCode);
		AjaxPager catinfoPager = new AjaxPager(catinfoListCount, pageNo, PAGE_SIZE2, PAGER_SIZE, CATINFOLIST_LINK_URL);
		
		model.addAttribute("catinfoList", catinfoList);
		model.addAttribute("catinfoPager", catinfoPager);
		model.addAttribute("pageNo", pageNo);
		
		return "admins/cat-info-list";
	}
	
	@GetMapping(path = { "load-catinfo-detail" })
	@ResponseBody
	public HashMap<String, Object> loadCatinfoDetail(@RequestParam(defaultValue = "-1") String catsId, Model model){
		
		HashMap<String, Object> catinfoDto = adminService.findCatinfoDetailByCatsId(catsId);
		
		return catinfoDto;
		
	}

	@PostMapping(path = { "insert-catinfo" })
	@ResponseBody
	public String insertCatinfo(@RequestParam(defaultValue = "-1") int boardNo) {
		
		adminService.updateCatinfoByBoardNo(boardNo);
		
		return "success";
	}
	
	// 지역등록 페이지
	@GetMapping(path = { "adminAddRegion" })
	public String adminAddRegion(@RequestParam(defaultValue = "1") int pageNo) {
		
		return "admins/adminAddRegion";
	}
	
	// 지역등록
	@PostMapping(path = { "addRegion" })
	public String addRegion(@Valid FeedingAreaDto region, Model model) {
		
		// 지역 정보 존재 여부 확인
		FeedingAreaDto area = adminService.searchRegion(region);
		// 지역 정보 (시,구,동)이 같은 지역 존재 여부 확인
		FeedingAreaDto area2 = adminService.searchRegion2(region);
		
		if (area == null) {
			// DB에 지역정보가 비어있을 경우
			adminService.addRegion(region);
			return "redirect:adminAddRegion";
		} else if (area2 != null){
			// DB에 (시,구,동)이 같은 지역정보가 있을 경우
			model.addAttribute("exist", region);
			model.addAttribute("region", region);
			return "admins/adminAddRegion";
		} else {
			// DB에 지역정보가 이미 있을 경우
			model.addAttribute("exist", region);
			model.addAttribute("region", region);
			return "admins/adminAddRegion";
		}
	}
	

	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
