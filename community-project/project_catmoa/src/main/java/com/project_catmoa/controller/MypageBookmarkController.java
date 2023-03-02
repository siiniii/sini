package com.project_catmoa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.dto.MessageBookmarkDto;
import com.project_catmoa.service.IntroService;
import com.project_catmoa.service.MessageService;
import com.project_catmoa.service.MypageBookmarkService;

@Controller
public class MypageBookmarkController {
	
	@Autowired
	@Qualifier("messageService")
	private MessageService messageService;
	
	@Autowired
	@Qualifier("IntroService")
	private IntroService introService;
	
	@Autowired
	@Qualifier("mypageBookmarkService")
	private MypageBookmarkService mypageBookmarkService;

	// 마이페이지 즐겨찾기 목록 불러오기
	@GetMapping(path = { "/mypage-Friend" })
	public String rAddBookmark(String bookmarkNic, HttpSession session, Model model) {
		
		// bookmarkNic에 해당하는 사용자를 로그인 유저의 즐겨찾기로 등록
		
		IntroDto loginuser = (IntroDto) session.getAttribute("loginuser");
		
		String userNics = loginuser.getNic();
		
		List<MessageBookmarkDto> friendNics = messageService.findBookmarkNic(userNics);
		List<IntroDto> allUser = introService.findAllUser();
		
		List<IntroDto> friendBookmark = new ArrayList<>();
		
		for (MessageBookmarkDto friendNic : friendNics ) {
			
			for (IntroDto user : allUser ) {
				
				if (friendNic.getBookmarkNic().equals(user.getNic())) {
					
					friendBookmark.add(user);
				}
			}
		}
		
		model.addAttribute("friendBookmark", friendBookmark );
		
		return "mypage-Friend";
		
	}
	 
	/*
	 * // 마이페이지 즐겨찾기 해제
	 * 
	 * @GetMapping(path = { "/mypage-Friend" }) public String sRemoveBookmark(String
	 * bookmarkNic, HttpSession session, Model model) {
	 * 
	 * // bookmarkNic에 해당하는 사용자를 로그인 유저의 즐겨찾기 해제 IntroDto loginuser = (IntroDto)
	 * session.getAttribute("loginuser"); String loginuserNic = loginuser.getNic();
	 * mypageBookmarkService.removeBookmark(loginuserNic, bookmarkNic);
	 * 
	 * return "mypage-Friend"; }
	 */
	 
}
