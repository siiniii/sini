package com.project_catmoa.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;

import com.project_catmoa.common.Util;
import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.dto.MessageAttachDto;
import com.project_catmoa.dto.MessageBookmarkDto;
import com.project_catmoa.dto.MessageDto;
import com.project_catmoa.service.MessageService;
import com.project_catmoa.ui.ThePager;
import com.project_catmoa.view.MessageDownloadView;

@Controller
@RequestMapping(path = { "/message" })
public class MessageController {

	private final int PAGE_SIZE = 10;
	private final int PAGER_SIZE = 5;
	private final String RECV_LINK_URL = "recvMessage";
	private final String SENDED_LINK_URL = "sendedMessage";

	@Autowired
	@Qualifier("messageService")
	private MessageService messageService;

	// 받은 쪽지함 목록
	@GetMapping(path = { "recvMessage" })
	public String showRecvMessage(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, Model model) {

		IntroDto loginuser = (IntroDto) session.getAttribute("loginuser");
		String loginuserNic = loginuser.getNic();

		List<MessageDto> messages = messageService.findRecvMessageByPage(pageNo, PAGE_SIZE, loginuserNic);
		int RecvMessageCount = messageService.findRecvMessageCount(loginuserNic);

		List<MessageBookmarkDto> bookmarks = messageService.findBookmarkNic(loginuserNic);

		ThePager pager = new ThePager(RecvMessageCount, pageNo, PAGE_SIZE, PAGER_SIZE, RECV_LINK_URL);

		model.addAttribute("messages", messages);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);

		List<String> nics = new ArrayList<>();
		for (MessageBookmarkDto bookmark : bookmarks) {
			nics.add(bookmark.getBookmarkNic());
		}
		model.addAttribute("nics", nics);

		return "message/recvMessage";
	}

	// 보낸 쪽지함 목록
	@GetMapping(path = { "sendedMessage" })
	public String showsendedMessage(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, Model model) {

		IntroDto loginuser = (IntroDto) session.getAttribute("loginuser");
		String loginuserNic = loginuser.getNic();

		List<MessageDto> messages = messageService.findSendedMessageByPage(pageNo, PAGE_SIZE, loginuserNic);
		int SendedMessageCount = messageService.findSendedMessageCount(loginuserNic);

		List<MessageBookmarkDto> bookmarks = messageService.findBookmarkNic(loginuserNic);

		ThePager pager = new ThePager(SendedMessageCount, pageNo, PAGE_SIZE, PAGER_SIZE, SENDED_LINK_URL);

		model.addAttribute("messages", messages);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);

		List<String> nics = new ArrayList<>();
		for (MessageBookmarkDto bookmark : bookmarks) {
			nics.add(bookmark.getBookmarkNic());
		}
		model.addAttribute("nics", nics);

		return "message/sendedMessage";
	}

	// 받은 쪽지 디테일
	@GetMapping(path = { "/recvMessageDetail.action" })
	public String recvMessageDetail(@RequestParam(defaultValue = "-1") int msgNo, HttpSession session, Model model) {

		if (msgNo == -1) { // 요청 데이터가 잘못된 경우
			return "redirect:recvMessage.action";
		}

		messageService.increaseRecvChk(msgNo);

		MessageDto message = messageService.findMessageDetailByMsgNo(msgNo);

		if (message == null) { // 조회되지 않은 경우 (글 번호가 잘못되었거나 또는 삭제된 글인 경우)
			return "redirect:recvMessage.action";
		}

		model.addAttribute("message", message);
		model.addAttribute("msgNo", msgNo);

		return "message/recvMessageDetail";
	}

	// 보낸 쪽지 디테일
	@GetMapping(path = { "/sendedMessageDetail.action" })
	public String sendedMessageDetail(@RequestParam(defaultValue = "-1") int msgNo, HttpSession session, Model model) {

		if (msgNo == -1) { // 요청 데이터가 잘못된 경우
			return "redirect:sendedMessage";
		}

		MessageDto message = messageService.findMessageDetailByMsgNo(msgNo);

		if (message == null) { // 조회되지 않은 경우 (글 번호가 잘못되었거나 또는 삭제된 글인 경우)
			return "redirect:sendedMessage";
		}

		model.addAttribute("message", message);
		model.addAttribute("msgNo", msgNo);

		return "message/sendedMessageDetail";
	}

	// 첨부파일 다운로드
	@GetMapping(path = { "/download.action" })
	public View download(@RequestParam(defaultValue = "-1") int msgFileNo, Model model) {

		if (msgFileNo == -1) {
			model.addAttribute("error_type", "download");
//			model.addAttribute("message", "첨부파일 번호가 없습니다.");
		}

		MessageAttachDto attachment = messageService.selectMessageAttachByMsgFileNo(msgFileNo);

		model.addAttribute("attachment", attachment);

		MessageDownloadView view = new MessageDownloadView();

		return view;
	}

	// 쪽지 보내기 폼
	@GetMapping(path = { "writeMessage" })
	public String writeMessage(HttpSession session, Model model) {
		
		// 즐겨찾기 목록 불러오기
		IntroDto loginuser = (IntroDto) session.getAttribute("loginuser");
		String loginuserNic = loginuser.getNic();
		List<MessageBookmarkDto> bookmarks = messageService.findBookmarkNic(loginuserNic);
		
		model.addAttribute("bookmarks", bookmarks);
		
		return "message/writeMessage";
	}

	// 쪽지 보내기
	@PostMapping(path = { "/sendMessage" })
	public String sendMessage(@Valid MessageDto message, String recvSelboxDirect, Model model, MultipartHttpServletRequest req) {

		// 첨부파일
		MultipartFile attach = req.getFile("attach");
		if (attach != null) { // 내용이 있는 경우
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/resources/msg-attachments");
			String fileName = attach.getOriginalFilename(); // 파일 이름 가져오기
			if (fileName != null && fileName.length() > 0) {
				String uniqueFileName = Util.makeUniqueFileName(fileName);

				try {
					attach.transferTo(new File(path, uniqueFileName)); // 파일 저장

					// 첨부파일 정보를 객체에 저장
					ArrayList<MessageAttachDto> attachments = new ArrayList<>(); // 첨부파일 정보를 저장하는 DTO 객체
					MessageAttachDto attachment = new MessageAttachDto();
					attachment.setUserFileName(fileName);
					attachment.setSavedFileName(uniqueFileName);
					attachments.add(attachment);
					message.setAttachments(attachments);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		String recvNic = null;
		
		if (recvSelboxDirect == null || recvSelboxDirect.length() == 0) {
			recvNic = message.getRecvNic();
		} else {
			recvNic = recvSelboxDirect;
			message.setRecvNic(recvNic);
		}
		
		// 받는 사람 존재 여부 확인
		IntroDto user = messageService.searchRecvNic(message);
		if (user != null) {
			// DB에 회원정보가 있을 경우
			messageService.sendMessage(message);
			return "redirect:sendedMessage";
		} else {
			// DB에 회원정보가 없을 경우
			model.addAttribute("nouser", message);
			model.addAttribute("message", message);
			return "message/writeMessage";
		}

	}

	// 답장 보내기 폼
	@PostMapping(path = { "/goReplyMessage" })
	public String goReplyMessage(MessageDto message, Model model) {

		model.addAttribute("message", message);

		return "message/replyMessage";
	}

	// 답장 보내기
	@PostMapping(path = { "/replyMessage" })
	public String replyMessage(@Valid MessageDto message, Model model, MultipartHttpServletRequest req) {

		// 첨부파일
		MultipartFile attach = req.getFile("attach");
		if (attach != null) { // 내용이 있는 경우
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/resources/msg-attachments");
			String fileName = attach.getOriginalFilename(); // 파일 이름 가져오기
			if (fileName != null && fileName.length() > 0) {
				String uniqueFileName = Util.makeUniqueFileName(fileName);

				try {
					attach.transferTo(new File(path, uniqueFileName)); // 파일 저장

					// 첨부파일 정보를 객체에 저장
					ArrayList<MessageAttachDto> attachments = new ArrayList<>(); // 첨부파일 정보를 저장하는 DTO 객체
					MessageAttachDto attachment = new MessageAttachDto();
					attachment.setUserFileName(fileName);
					attachment.setSavedFileName(uniqueFileName);
					attachments.add(attachment);
					message.setAttachments(attachments);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		// 받는 사람 존재 유무 확인
		IntroDto user = messageService.searchRecvNic(message);

		if (user != null) {
			messageService.sendMessage(message);
			return "redirect:sendedMessage";
		} else {
			// DB에 회원정보가 없을 경우
			model.addAttribute("nouser", message);
			model.addAttribute("message", message);
			return "message/replyMessage";
		}

	}

	// 받은 쪽지함 즐겨찾기 등록
	@PostMapping(path = { "rAddBookmark" })
	public String rAddBookmark(@RequestParam(defaultValue = "1") int pageNo, String bookmarkNic, HttpSession session,
			Model model) {

		// bookmarkNic에 해당하는 사용자를 로그인 유저의 즐겨찾기로 등록
		IntroDto loginuser = (IntroDto) session.getAttribute("loginuser");
		String loginuserNic = loginuser.getNic();
		messageService.addBookmark(loginuserNic, bookmarkNic);

		return "redirect:/message/recvMessage?pageNo=" + pageNo;
	}

	// 보낸 쪽지함 즐겨찾기 등록
	@PostMapping(path = { "sAddBookmark" })
	public String sAddBookmark(@RequestParam(defaultValue = "1") int pageNo, String bookmarkNic, HttpSession session,
			Model model) {

		// bookmarkNic에 해당하는 사용자를 로그인 유저의 즐겨찾기로 등록
		IntroDto loginuser = (IntroDto) session.getAttribute("loginuser");
		String loginuserNic = loginuser.getNic();
		messageService.addBookmark(loginuserNic, bookmarkNic);

		return "redirect:/message/sendedMessage?pageNo=" + pageNo;
	}

	// 받은 쪽지함 즐겨찾기 해제
	@PostMapping(path = { "rRemoveBookmark" })
	public String rRemoveBookmark(@RequestParam(defaultValue = "1") int pageNo, String bookmarkNic, HttpSession session,
			Model model) {

		// bookmarkNic에 해당하는 사용자를 로그인 유저의 즐겨찾기 해제
		IntroDto loginuser = (IntroDto) session.getAttribute("loginuser");
		String loginuserNic = loginuser.getNic();
		messageService.removeBookmark(loginuserNic, bookmarkNic);

		return "redirect:/message/recvMessage?pageNo=" + pageNo;
	}

	// 보낸 쪽지함 즐겨찾기 해제
	@PostMapping(path = { "sRemoveBookmark" })
	public String sRemoveBookmark(@RequestParam(defaultValue = "1") int pageNo, String bookmarkNic, HttpSession session,
			Model model) {

		// bookmarkNic에 해당하는 사용자를 로그인 유저의 즐겨찾기 해제
		IntroDto loginuser = (IntroDto) session.getAttribute("loginuser");
		String loginuserNic = loginuser.getNic();
		messageService.removeBookmark(loginuserNic, bookmarkNic);

		return "redirect:/message/sendedMessage?pageNo=" + pageNo;
	}

}
