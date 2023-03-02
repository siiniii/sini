package com.project_catmoa.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project_catmoa.dto.DonateDto;
import com.project_catmoa.service.DonateService;

@Controller
public class DonateController {
	
	@Autowired
	@Qualifier("donateService")
	private DonateService donateService;
	
	
	// 후원 금액 및 차트보기
	@GetMapping(path = {"donate-main"})
	public String donateMain(Model model) {
		int don = donateService.donateSum();
		int dp = donateService.donateId();
		List<HashMap<String, Object>> donateAreaRanks = donateService.donateAreaBar();
		model.addAttribute("don", don);
		model.addAttribute("dp",dp);
		model.addAttribute("donateAreaRanks", donateAreaRanks);
		return "donate-main";
	}
	
	
	// 후원하러가기
	@GetMapping(path = {"donate-detail"})
	public String donateDetail() {
		return "donate-detail";
	}
	
	// 후원 금액 날짜 받기 + 아이디 받기
	@PostMapping(path = {"/donateInfo"})
	public String donateMD(DonateDto donate) {
		// 1. 요청 데이터 읽기 ( 전달인자로 대체 )
		
		// 2. 요청 처리
		donateService.donateInfo(donate);
		// 3. View에서 읽을 수 있도록 데이터 저장
		// 4. View 또는 다른 컨트롤러로 이동
		return "redirect:donate-main";
	}
	
	 // 후원 순위 보기
	@GetMapping(path = {"donate-rank"})
	@ResponseBody
	public List<HashMap<String, Object>> donateRank() {
	
		List<HashMap<String, Object>> donateRanks = donateService.findDonateRank();
		
		return donateRanks;
	} 
	
	// 지역별 후원내역 바 차트
	@GetMapping(path = {"load-donate-area-bar"})
	public List<HashMap<String, Object>> loadDonateAreaBar() {
		List<HashMap<String, Object>> donateAreaRanks = donateService.donateAreaBar();
		return donateAreaRanks;
	}
	
	
	
	
}
