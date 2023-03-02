package com.project_catmoa.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.project_catmoa.common.Util;
import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.mapper.IntroMapper;
import com.project_catmoa.service.IntroService;

@Controller
public class IntroController {

	@Autowired
	@Qualifier("IntroService")
	private IntroService introService;

	// 메인페이지, 회원가입 하기, 로그인 하기
	@GetMapping(path = { "/login" })
	public String showLoginForm(IntroDto user) {
		
		return "/login"; // /WEB-INF/views/ + account/register + .jsp
	}
	
	@PostMapping(path = { "/login" })
	public String login(String userId, String passwd, HttpSession session, Model model) {
		
		// 1. 요청 데이터 읽기 (전달인자 사용해서 대체)
		
		// 2. 요청 처리
		IntroDto user = introService.findIntroByIdAndPasswd(userId, passwd);
		
		if(user != null) {
			session.setAttribute("loginuser", user);
		} else {
			model.addAttribute("loginfail", userId);
			return "/intro"; 	// /WEB-INF/views/ + account/login + ./jsp
		}
		// 3. View에서 사용하도록 데이터 전달
		
		// 4. View 또는 다른 Controller로 이동
		
		// 로그인 유저 관리자 여부 데이터 가져오기
		IntroDto loginuser = (IntroDto)session.getAttribute("loginuser");
		int loginuserAdmin = loginuser.getAdmin();
		
		return "redirect:/home-feeding"; //new RedirectView("/home.action");
		
	}
	
	@GetMapping(path = { "/register" })
	public String showRegisterForm(@ModelAttribute("user")IntroDto user) {
		
		return "register"; // /WEB-INF/views/ + account/register + .jsp
	}
	
	
	@PostMapping(path = { "/register" })
	public String register(@Valid @ModelAttribute("user")IntroDto user, BindingResult br, Model model) {
		
		if (br.hasErrors()) {
			model.addAttribute("registerfail", user);
			return "intro";
		}
		

		// 1. 요청 데이터 읽기 -> DTO에 저장 : 전달인자 사용으로 대체

		// 2. 요청 처리
		introService.registerUser(user);

		// 3. View에서 사용할 수 있도록 데이터 전달

		// 4. View 또는 다른 Controller로 이동
		return "intro";
	}
	
	// 로그아웃
	
	  @GetMapping(path = { "/logout" }) public View logout(HttpSession session) {
	  
	  session.removeAttribute("loginuser");
	  
	  return new RedirectView("/project_catmoa/intro"); 
	  
	  }
	
	// 네이버 아이디로 로그인
	@GetMapping(path = {"/naver-login"})
	public String showLoginView() {
		
		return "naver-login";
	}
	
	// 네이버 로그인 콜백
	@GetMapping(path = {"/naver-login-callback"})
	public String showNaverLoginCallbakView() {
		
		return "naver-login-callback";
	}
	
	// 네이버 로그인 성공
	@GetMapping(path = {"/naver-login-success"})
	public String NaverLoginSuccess(String id, HttpSession session) {
		
		session.setAttribute("loginuser", id);
		return "redirect:/home-feeding";
		
	}
	
	// 아이디 중복
	@PostMapping(path= {"/idcheck"})
	@ResponseBody
	public String selectUserId(String userId) {
		
		IntroDto data = introService.findRegisterUserId(userId);
		
		if (data == null) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@PostMapping(path= {"/niccheck"})
	@ResponseBody
	public String selectUsernic(String nic) {
		
		IntroDto nicdata = introService.findRegisterUsernic(nic);
		
		if (nicdata == null) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	// 마이페이지 로그인하기
		@GetMapping(path = { "/Mypagelogin" })
		public String showMypageLoginForm(IntroDto user) {
			
			return "/Mypagelogin"; // /WEB-INF/views/ + account/register + .jsp
		}
		
		@PostMapping(path = { "/Mypagelogin" })
		public String Mypagelogin(String userId, String passwd, HttpSession session, Model model) {
			// 1. 요청 데이터 읽기 (전달인자 사용해서 대체)
			
			IntroDto user = (IntroDto)session.getAttribute("loginuser");
			
				String ownUserId = user.getUserId();
				String ownUserPw = user.getPasswd();
	
			passwd = Util.getHashedString(passwd, "SHA-256");
			
			if (userId.equals(ownUserId) && passwd.equals(ownUserPw)) {
				return "mypage-sujung2";
			}
			
			return "mypage-sujung";
			
		}

	
	  
	  // 프로필 사진 등록/변경
	  @GetMapping(path = { "/mypage/profile" })
	  public String ShowMyPageProfile(HttpSession session, Model model) {
		  
		  return "mypage-profile";
	  }
	  
	 
	  @PostMapping(path = { "/mypage/profile"}) 
	  public String InsertProfile(String userId, HttpSession session, MultipartHttpServletRequest req, Model model) {
		  
		  IntroDto user = (IntroDto)session.getAttribute("loginuser");
		  userId = user.getUserId();
		  
		  MultipartFile memberImg = req.getFile("memberImg");
		  ServletContext application = req.getServletContext();
		  String path = application.getRealPath("/resources/images");
		  String fileName = memberImg.getOriginalFilename(); // 파일 이름 가져오기
		  String ext = fileName.substring(fileName.lastIndexOf(".")); // abc/def/xyz.txt ==> .txt 
		  fileName = userId + ext;
		  try {
				memberImg.transferTo(new File(path, fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				
			}
			 		  	
			  introService.updateProfileImg(fileName, userId);
			  
			  user.setMemberImg(fileName);
			  
			return "mypage-profile";
	  }
	  
	  		// 내 정보 업데이트
			@GetMapping(path = { "/mypagesujung2" })
			public String showMypageMemberUpdateForm(IntroDto user) {
				
				return "/mypagesujung2"; // /WEB-INF/views/ + account/register + .jsp
				
			}
			
			@PostMapping(path = { "/mypagesujung2" })
			public String MypageMemberUpdate(IntroDto user, HttpSession session, Model model) {
				// 1. 요청 데이터 읽기 (전달인자 사용해서 대체)
				introService.updatemembersujung(user);
				
				return "mypage-sujung2";
				
			}
			
			// 내 정보 삭제
			@GetMapping(path = {"/memberdelete"})
			public String deletemember(HttpSession session) {
				
				IntroDto member = (IntroDto)session.getAttribute("loginuser");
				
				introService.deletemember(member.getUserId());
				
				return "intro";
			}
			
}
	  
