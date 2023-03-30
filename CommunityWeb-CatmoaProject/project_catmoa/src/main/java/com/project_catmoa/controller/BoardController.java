package com.project_catmoa.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;

import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;
import com.project_catmoa.common.Util;
import com.project_catmoa.dto.BoardAttachDto;
import com.project_catmoa.dto.BoardCommentDto;
import com.project_catmoa.dto.BoardDto;
import com.project_catmoa.dto.CatColorDto;
import com.project_catmoa.dto.CatInfoDto;
import com.project_catmoa.dto.FeedingBoardDto;
import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.dto.JjimDto;
import com.project_catmoa.dto.LikeDto;
import com.project_catmoa.dto.ReportAttachDto;
import com.project_catmoa.dto.ReportBoardDto;
import com.project_catmoa.service.BoardService;
import com.project_catmoa.service.CatInfoService;
import com.project_catmoa.service.JjimService;
import com.project_catmoa.service.LikeService;
import com.project_catmoa.ui.ThePager;
import com.project_catmoa.view.BoardDownloadView;

@Controller
@RequestMapping(path = { "/board" })
public class BoardController {

	@Autowired
	@Qualifier("likeService")
	private LikeService likeService;

	@Autowired
	@Qualifier("jjimService")
	private JjimService jjimService;

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("catInfoService")
	private CatInfoService catInfoService;

	private final int PAGE_SIZE = 3; // 한 페이지에 표시되는 데이터 개수
	private final int PAGER_SIZE = 3; // 한 번에 표시할 페이지 번호 개수
	private final String LINK_URL = "list"; // 페이지 번호를 클릭했을 때 이동할 페이지 경로

	@PostMapping(path = { "/write" })
	public String writeBoard(BoardDto board, Model model, MultipartHttpServletRequest req) {

		// 첨부파일
		MultipartFile attach = req.getFile("attach");
		if (attach != null) { // 내용이 있는 경우
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/resources/board-attachments");
			String fileName = attach.getOriginalFilename(); // 파일 이름 가져오기
			if (fileName != null && fileName.length() > 0) {
				String uniqueFileName = Util.makeUniqueFileName(fileName);

				try {
					attach.transferTo(new File(path, uniqueFileName)); // 파일 저장

					// 첨부파일 정보를 객체에 저장
					ArrayList<BoardAttachDto> attachments = new ArrayList<>(); // 첨부파일 정보를 저장하는 DTO 객체
					BoardAttachDto attachment = new BoardAttachDto();
					attachment.setUserFileName(fileName);
					attachment.setSavedFileName(uniqueFileName);
					attachments.add(attachment);
					board.setBoardAttachments(attachments);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		boardService.writeBoard(board);

		return "redirect:list?boardGroupNo=" + board.getBoardGroupNo();

	}
	
	// 급식게시판 입력
		@GetMapping(path = { "/feeding-write" })
		public String showFeedingWriteForm(@Param("boardGroupNo") int boardGroupNo, Model model) {

			// 지역 선택창 지역정보 불러오기
			List<String> feedingArea = boardService.searchSido();
			model.addAttribute("feedingArea", feedingArea);
			
			model.addAttribute("boardGroupNo", boardGroupNo);

			return "feeding-write";
		}
		
	
	// 급식게시판 입력
	@PostMapping(path = { "/feeding-write" })
	public String writeFeedingBoard(FeedingBoardDto board, Model model, MultipartHttpServletRequest req) {
		
		// 첨부파일
		MultipartFile attach = req.getFile("attach");
		if (attach != null) { // 내용이 있는 경우
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/resources/board-attachments");
			String fileName = attach.getOriginalFilename(); // 파일 이름 가져오기
			if (fileName != null && fileName.length() > 0) {
				String uniqueFileName = Util.makeUniqueFileName(fileName);
	
				try {
					attach.transferTo(new File(path, uniqueFileName)); // 파일 저장
	
					// 첨부파일 정보를 객체에 저장
					ArrayList<BoardAttachDto> attachments = new ArrayList<>(); // 첨부파일 정보를 저장하는 DTO 객체
					BoardAttachDto attachment = new BoardAttachDto();
					attachment.setUserFileName(fileName);
					attachment.setSavedFileName(uniqueFileName);
					attachments.add(attachment);
					board.setBoardAttachments(attachments);
	
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		boardService.writeFeedingBoard(board);
		
		return "redirect:/home-feeding";
	}

	@GetMapping(path = { "/write" })
	public String showWriteForm(@Param("boardGroupNo") int boardGroupNo, Model model) {

		model.addAttribute("boardGroupNo", boardGroupNo);

		return "write";
	}

	// 제보게시판 폼
	@PostMapping(path = { "/report-write" })
	public String writeReportBoard(MultipartHttpServletRequest req, ReportBoardDto board, Model model) {

		// 첨부파일
		MultipartFile attach = req.getFile("reportAttach");
		if (attach != null) { // 내용이 있는 경우
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/resources/report-attachments");
			String fileName = attach.getOriginalFilename(); // 파일 이름 가져오기
			if (fileName != null && fileName.length() > 0) {
				String uniqueFileName = Util.makeUniqueFileName(fileName);

				try {
					attach.transferTo(new File(path, uniqueFileName)); // 파일 저장

					// 첨부파일 정보를 객체에 저장
					ArrayList<ReportAttachDto> attachments = new ArrayList<>(); // 첨부파일 정보를 저장하는 DTO 객체
					ReportAttachDto attachment = new ReportAttachDto();
					attachment.setUserFileName(fileName);
					attachment.setSavedFileName(uniqueFileName);
					attachments.add(attachment);
					board.setReportAttachments(attachments);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		boardService.writeReportBoard(board);

		return "redirect:list?boardGroupNo=" + board.getBoardGroupNo();

	}

	@GetMapping(path = { "/report-write" })
	public String showReportWriteForm(@Param("boardGroupNo") int boardGroupNo, Model model) {

		// 지역 선택창 지역정보 불러오기
		List<String> feedingArea = boardService.searchSido();
		model.addAttribute("feedingArea", feedingArea);

		// 고양이 색상 정보 불러오기
		List<CatColorDto> color = boardService.searchColor();
		model.addAttribute("color", color);

		model.addAttribute("boardGroupNo", boardGroupNo);

		return "report-write";
	}

//	  @GetMapping(path = { "/load-city-list" })	  
//	  @ResponseBody public List<String> loadSidoList() {	  
//	  List<String> sidoList = catInfoService.findAllSido(); return sidoList; }
	  
	  @GetMapping(path = { "/load-gu-list" })	  
	  @ResponseBody public List<String> loadGugunList(String city) {	  
		  List<String> gugunList = boardService.findGugunBySido(city); 
		  return gugunList; 
	  }
	  
	  @GetMapping(path= { "/load-area-list" })	  
	  @ResponseBody public List<HashMap<String, Object>> loadAreaList(String gu){	  
		  List<HashMap<String, Object>> areaList = boardService.findAreaByGu(gu); 
		  return areaList; 
	}
	 
	


//	  @GetMapping(path= { "/load-area-list" })	  
//	  @ResponseBody public List<LocalDto> loadDongList(String gugun){	  
//		  List<LocalDto> dongList = catInfoService.findDongByGugun(gugun); 
//		  return dongList; 
//	}

	@GetMapping(path = { "/list" })
	public String showBoardList(@RequestParam(defaultValue = "1") int pageNo,
			@RequestParam(defaultValue = "1") int boardGroupNo, Model model) {

		List<BoardDto> boards = null;
		int boardCount = 0;

		if (boardGroupNo == 1) {
			boards = boardService.findBoardByPage(pageNo, PAGE_SIZE);
			boardCount = boardService.findBoardCount();
		} else if (boardGroupNo == 2) {
			boards = boardService.findRescueBoardByPage(pageNo, PAGE_SIZE);
			boardCount = boardService.findRescueBoardCount();
		} else if (boardGroupNo == 3 ){
			boards = boardService.findBoardByPage(pageNo, PAGE_SIZE);
			boardCount = boardService.findBoardCount();
		}

		ThePager pager = new ThePager(boardCount, pageNo, PAGE_SIZE, PAGER_SIZE, LINK_URL);

		model.addAttribute("boardGroupNo", boardGroupNo);
		model.addAttribute("boards", boards);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);

		if (boardGroupNo == 1) {
			return "report-board";
		} else if (boardGroupNo == 2) {
			return "report-board2";
		} else {
			return "home-feeding";
		}
	}

	@GetMapping(path = { "/detail" })
	public String showBoardDetail(@RequestParam(defaultValue = "1") int boardNo,
			@RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "1") int boardGroupNo,
			@RequestParam(defaultValue = "1") int commentNo, HttpSession session, Model model) {
		
		if (boardGroupNo == 2) {
			BoardDto board = boardService.findBoardByBoardNo(boardNo);
	
			List<BoardCommentDto> comments = boardService.findBoardCommentByBoardNo(boardNo);
	
			IntroDto introDto = (IntroDto) session.getAttribute("loginuser");
	
			// 좋아요
			LikeDto likeDto = new LikeDto();
	
			likeDto.setBoardNo(boardNo);
			likeDto.setUserId(introDto.getUserId());
			int count = likeService.findCountByUserIdAndBoardNo(likeDto);
	
			// 찜
			JjimDto jjimDto = new JjimDto();
	
			jjimDto.setBoardNo(boardNo);
			jjimDto.setUserId(introDto.getUserId());
			int Jcount = jjimService.findCountJjimByUserIdAndBoardNo(jjimDto);
	
			// 댓글 개수
			int replyCount = boardService.countReply(boardNo);
	
			model.addAttribute("boardGroupNo", boardGroupNo);
	
			model.addAttribute("comments", comments);
			model.addAttribute("board", board);
			model.addAttribute("pageNo", pageNo);
	
			// 좋아요
			model.addAttribute("like", count > 0);
			// 찜
			model.addAttribute("jjim", Jcount > 0);
			// 댓글 개수
			model.addAttribute("replyCount", replyCount);
	
			return "board-detail";
		} else {
			return "";
		}
	}
	
	@GetMapping(path = { "/report-detail" })
	public String showReportDetail(@RequestParam(defaultValue = "-1") int boardNo, Model model) {
		
		HashMap<String, Object> reportDto = boardService.findReportDetailByBoardNo(boardNo);
		
		model.addAttribute("reportDto", reportDto);
		
		return "report-detail";
	}
	
	// 급식
	@GetMapping(path = { "/feeding-detail" })
	public String showFeedingDetail(@RequestParam(defaultValue = "-1") int boardNo, Model model) {
		
		HashMap<String, Object> feedingDto = boardService.findFeedingDetailByBoardNo(boardNo);
		
		model.addAttribute("feedingDto", feedingDto);
		
		return "feeding-detail";
	}
	
	@GetMapping(path = { "/{boardNo}/delete.action" })
	public String deleteBoard(@PathVariable("boardNo") int boardNo, @RequestParam(defaultValue = "-1") int pageNo,
			Model model) {

		if (pageNo == -1) {

			model.addAttribute("error_type", "delete");
			return "redirect:list";

		}

		boardService.deleteBoard(boardNo);

		return "redirect:/board/list?pageNo=" + pageNo;
	}

	@PostMapping(path = { "/edit.action" })
	public String modifyBoard(@RequestParam(defaultValue = "-1") int pageNo, BoardDto board, Model model) {

		if (pageNo == -1) {
			model.addAttribute("error_type", "edit");
			return "redirect:list";
		}

		boardService.modifyBoard(board);

		int boardGroupNo = board.getBoardGroupNo();
		int boardNo = board.getBoardNo();

		return "redirect:detail?boardNo=" + boardNo + "&pageNo=" + pageNo + "&boardGroupNo=" + boardGroupNo;
	}

	@GetMapping(path = { "/edit.action" })
	public String showBoardEditForm(@RequestParam(defaultValue = "-1") int boardNo,
			@RequestParam(defaultValue = "-1") int pageNo, @RequestParam(defaultValue = "1") int boardGroupNo,
			Model model) {

		if (boardNo == -1 || pageNo == -1) {
			model.addAttribute("error_type", "edit");
			return "redirect:list";
		}

		BoardDto board = boardService.findBoardByBoardNo(boardNo);

		model.addAttribute("boardGroupNo", boardGroupNo);
		model.addAttribute("board", board);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("pageNo", pageNo);

		return "edit";
	}
	
	// 첨부파일 다운로드
	@GetMapping(path = { "/downloadBoardAttachment" })
	public View download(@RequestParam(defaultValue = "-1") int attachmentNo, Model model) {
		
		if (attachmentNo == -1) {
			model.addAttribute("error_type", "download");
//			model.addAttribute("message", "첨부파일 번호가 없습니다.");
		}

		BoardAttachDto attachment = boardService.selectAttachByAttachmentNo(attachmentNo);

		model.addAttribute("attachment", attachment);

		BoardDownloadView view = new BoardDownloadView();

		return view;
		
	}

	/*
	 * @GetMapping(path = {"/board-detail"}) public String showCommentList(int
	 * boardNo, Model model) {
	 * 
	 * List<BoardCommentDto> comments =
	 * boardService.findBoardCommentByBoardNo(boardNo);
	 * 
	 * model.addAttribute("comments", comments);
	 * 
	 * return "board-detail";
	 *
	 * }
	 */

	@PostMapping(path = { "/write-comment" })
	public String writeComment(BoardCommentDto commentDto, BoardDto board, @RequestParam(defaultValue = "-1") int boardNo, @RequestParam(defaultValue = "-1") int pageNo) {

		boardService.writeComment(commentDto);
		boardService.updateGroupNo(commentDto.getCommentNo(), commentDto.getCommentNo());

		int boardGroupNo = board.getBoardGroupNo();
		
//		return "redirect:/board/detail?boardNo=" + boardNo;
		return "redirect:/board/detail?boardNo=" + boardNo + "&pageNo=" + pageNo + "&boardGroupNo=" + boardGroupNo;		
	}

	@GetMapping(path = { "/delete-comment.action" })
	@ResponseBody
	public String deleteComment(@RequestParam(defaultValue = "-1") int commentNo, HttpSession session) {

		IntroDto member = (IntroDto) session.getAttribute("loginuser");
		BoardCommentDto comment = boardService.selectComment(commentNo);

		if (commentNo == -1) {
			return "";
		}

		//if (member.getUserId() == comment.getUserId()) {
		if (member.getUserId().equals(comment.getUserId())) {
			boardService.deleteComment(commentNo);
		} else {
			return "";
		}

		return "success";
	}

	@GetMapping(path = { "/comment-list" })
	public String loadCommentList(@RequestParam(defaultValue = "1") int boardNo, Model model) {

		List<BoardCommentDto> comments = boardService.findBoardCommentByBoardNo(boardNo);
		model.addAttribute("comments", comments);

		return "comment-list";
	}

	@PostMapping(path = { "/update-comment" })
	@ResponseBody
	// public String updateComment(@RequestParam(defaultValue = "-1") int commentNo) {
	public String updateComment(BoardCommentDto comment) {

		boardService.updateComment(comment);

		return "success";
	}

	@PostMapping(path = { "/write-recomment" })
	@ResponseBody
	public String writeReComment(BoardCommentDto commentDto) {

		boardService.writeReComment(commentDto);

		return "success";
	}
	
	//고양이 사진 불러오기
	@GetMapping(path = {"/showCatImgList"})
	public String showCatImgList(int localNo, Model model) {
		List<CatInfoDto> catinfomations = catInfoService.findCatinfoByLocalNo(localNo);
		model.addAttribute("catinfomations", catinfomations);
		return "feeding/feeding-write-catimg";
	}

}
