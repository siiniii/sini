package com.project_catmoa.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project_catmoa.dto.BoardDto;
import com.project_catmoa.dto.CatInfoDto;
import com.project_catmoa.dto.FeedingAreaDto;
import com.project_catmoa.dto.FeedingBoardDto;
import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.dto.LocalDto;
import com.project_catmoa.dto.MessageBookmarkDto;
import com.project_catmoa.service.BoardService;
import com.project_catmoa.service.CatInfoService;
import com.project_catmoa.service.CatInfoServiceImpl;
import com.project_catmoa.service.IntroService;
import com.project_catmoa.service.MessageService;
import com.project_catmoa.ui.ThePager;

@Controller
public class CatController {

	private final int PAGE_SIZE = 6; // 한 페이지에 표시되는 데이터 개수
	private final int PAGER_SIZE = 3;	// 한 번에 표시할 페이지 번호 개수
	private final String LINK_URL = "home-feeding"; // 페이지 번호를 클릭했을 때 이동할 페이지 경로
	
	@Autowired
	@Qualifier("catInfoService")
	private CatInfoService catInfoService;
	
	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("messageService")
	private MessageService messageService;
	
	@Autowired
	@Qualifier("IntroService")
	private IntroService introService;
	
	@GetMapping(path = { "home-feeding" })
	public String showHomeFeeding(Model model, HttpSession session) {

		 List<FeedingAreaDto> feedingAreas = catInfoService.findAllFeedingAreas();
		 //List<LocalDto> locals = catInfoService.findAllLocals();
		 
		 model.addAttribute("feedingAreas", feedingAreas);
		 //model.addAttribute("locals", locals);
		 
		 //홈 화면 친구 목록
		 IntroDto member = (IntroDto)session.getAttribute("loginuser");
		 
		 String userNic = member.getNic();
		 List<MessageBookmarkDto> friendsNic = messageService.findBookmarkNic(userNic);
		 List<IntroDto> allUser = introService.findAllUser();
		 
		 List<IntroDto> friends = new ArrayList<>();
		 
		 for (MessageBookmarkDto friendNic : friendsNic) {
			 
			for (IntroDto user : allUser) {
				
				if (friendNic.getBookmarkNic().equals(user.getNic())) {
					
					friends.add(user);
				}
				
			}
			
		 }
		 
		 model.addAttribute("friends",friends);

		return "feeding/home-feeding";
	}
	
	@GetMapping(path = { "home-community" })
	public String HomeCommunity(@RequestParam(defaultValue = "-1") int localNo, @RequestParam(defaultValue = "1") int pageNo, Model model) {
		
		// 1. 요청 데이터 읽기 ( 전달인자로 대체 )
		// 2. 요청 처리
		List<CatInfoDto> catinfomations = catInfoService.findCatinfoByLocalNo(localNo);
		List<FeedingAreaDto> feedingAreas = catInfoService.findAllFeedingAreas();
		List<BoardDto> boards = boardService.findAllBoard();
		List<FeedingBoardDto> feedingBoards = boardService.findFeedingBoard(localNo);
		System.out.println(boards);
		int boardCount = boardService.findBoardCount();
		
		ThePager pager = new ThePager(boardCount, pageNo, PAGE_SIZE, PAGER_SIZE, LINK_URL);

		// 3. View에서 읽을 수 있도록 데이터 저장
		model.addAttribute("catinfomations", catinfomations);
		model.addAttribute("feedingAreas", feedingAreas);
		
		model.addAttribute("boards", boards);
		model.addAttribute("feedingBoards", feedingBoards);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);
		// 4. View 또는 다른 컨터롤러로 이동
		return "feeding/home-community";
	}
	
	
	@GetMapping(path = {"/load-sido-list"})
	@ResponseBody
	public List<String> loadSidoList() {
		
		List<String> sidoList = catInfoService.findAllSido();
		return sidoList;
	}
	@GetMapping(path = {"/load-gugun-list"})
	@ResponseBody
	public List<String> loadGugunList(String sido) {
		
		List<String> gugunList = catInfoService.findGugunBySido(sido);
		return gugunList;
	}
	
	@GetMapping(path= {"/load-dong-list"})
	@ResponseBody
	public List<LocalDto> loadDongList(String gugun){
		
		List<LocalDto> dongList = catInfoService.findDongByGugun(gugun);
		return dongList;
	}
	
	/*
	 * @GetMapping(path = {"cat-home-list"}) public String
	 * showHomeFeeding2(@RequestParam(defaultValue = "1") int pageNo, Model model) {
	 * 
	 * List<BoardDto> boards = boardService.findBoardByPage(pageNo, PAGE_SIZE); int
	 * boardCount = boardService.findBoardCount();
	 * 
	 * ThePager pager = new ThePager(boardCount, pageNo, PAGE_SIZE, PAGER_SIZE,
	 * LINK_URL);
	 * 
	 * model.addAttribute("boards", boards); model.addAttribute("pager", pager);
	 * model.addAttribute("pageNo", pageNo);
	 * 
	 * return "feeding/home-feeding"; }
	 */	
	
	@PostMapping(path = {"/write"})
	public String writeBoard(BoardDto board) {
		boardService.writeBoard(board);
		return "feeding/home-feeding";
	}
	
	
	
	
	
}
