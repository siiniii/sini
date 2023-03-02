package com.project_catmoa.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project_catmoa.dto.BoardDto;
import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.dto.JjimDto;
import com.project_catmoa.service.JjimService;
import com.project_catmoa.service.MypageJjimService;

@Controller
public class MypageJjimController {

	
	@Autowired
	@Qualifier("mypageJjimService")
	private MypageJjimService mypageJjimService;
	
	// 찜한 게시물 목록 받기
	@GetMapping(path = {"/mypage-Timeline"})
	public String JjimDetail(HttpSession session, Model model) {
		
		 IntroDto user = (IntroDto)session.getAttribute("loginuser");
		 List<HashMap<String, Object>> userjjims = mypageJjimService.findMypageJjim(user.getUserId());
		 model.addAttribute("userjjims",userjjims);
		
		return "mypage-Timeline";
	}

}
