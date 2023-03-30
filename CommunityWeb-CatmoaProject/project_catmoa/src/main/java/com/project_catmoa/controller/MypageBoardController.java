package com.project_catmoa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project_catmoa.dto.BoardDto;
import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.service.MypageBoardService;

@Controller
public class MypageBoardController {

	@Autowired
	@Qualifier("mypageBoardService")	
	private MypageBoardService mypageboardservice;
		
	// 내가 쓴 글 목록 받기
	@GetMapping(path = {"/mypageboardlist"})
	public String userboard(HttpSession session, Model model) {
		
		IntroDto user = (IntroDto)session.getAttribute("loginuser");
		List<BoardDto> userBoards = mypageboardservice.findMypageBoard(user.getUserId());
		model.addAttribute("userBoards",userBoards);
		
		return "mypage-boardList";
	}
	
}
	  
