package com.project_catmoa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping(path = {"/", "intro"})
	public String intro() {
		
		return "intro";
	}
	
	@GetMapping(path = {"mypage-boardList"})
	public String mypageMyboardDetail() {
		
		return "mypage-boardList";
	}
	
	@GetMapping(path = {"mypage-Photo"})
	public String mypage_Photo() {
		
		return "mypage-Photo";
	}
	
	@GetMapping(path = {"mypage-sujung"})
	public String mypagesujung() {
		
		return "mypage-sujung";
	}
	
	@GetMapping(path = {"mypage-sujung2"})
	public String mypagesujung2() {
		
		return "mypage-sujung2";
	}
	
	@GetMapping(path = {"mypage-passwdupdate"})
	public String mypagepasswdupdate() {
		
		return "mypage-passwdupdate";
	}
	
	@GetMapping(path = {"mypage-memberdelete"})
	public String mypagememberdelete() {
		
		return "mypage-memberdelete";
	}
	
	@GetMapping(path = {"mypage-profile"})
	public String mypageprofile() {
		
		return "mypage-profile";
	}
	
	@GetMapping(path = {"report-board2"})
	public String reportboard2() {
		return "report-board2";
	}
	
	@GetMapping(path = {"report-board"})
	public String reportBoard() {
		return "report-board";
	}

	@GetMapping(path = {"write"})
	public String write() {
		return "write";
	}

}
