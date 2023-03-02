package com.project_catmoa.service;

import java.util.List;

import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.dto.MessageAttachDto;
import com.project_catmoa.dto.MessageBookmarkDto;
import com.project_catmoa.dto.MessageDto;
import com.project_catmoa.mapper.MessageMapper;

import lombok.Setter;

public class MessageServiceImpl implements MessageService{
	
	@Setter
	private MessageMapper messageMapper;
	
	@Override
	public List<MessageDto> findRecvMessageByPage(int pageNo, int pageSize, String loginuserNic) {
		
		int from = (pageNo -1) * pageSize;
		int count = pageSize;
		
		List<MessageDto> messages = messageMapper.findRecvMessageByPage(from, count, loginuserNic);
		
		return messages;
	}
	
	@Override
	public int findRecvMessageCount(String loginuserNic) {
		
		int RecvMessageCount = messageMapper.selectRecvMessageCount(loginuserNic);
		
		return RecvMessageCount;
	}
	
	@Override
	public List<MessageDto> findSendedMessageByPage(int pageNo, int pageSize, String loginuserNic) {
		
		int from = (pageNo -1) * pageSize;
		int count = pageSize;
		
		List<MessageDto> messages = messageMapper.findSendedMessageByPage(from, count, loginuserNic);
		
		return messages;
	}
	
	@Override
	public int findSendedMessageCount(String loginuserNic) {
		
		int SendedMessageCount = messageMapper.selectSendedMessageCount(loginuserNic);
		
		return SendedMessageCount;
	}

	@Override
	public MessageDto findMessageDetailByMsgNo(int msgNo) {
		
		MessageDto message = messageMapper.findMessageDetailByMsgNo(msgNo);

		return message;
	}
	
	@Override
	public IntroDto searchRecvNic(MessageDto message) {
		
		IntroDto user = messageMapper.searchRecvNic(message);
		
		return user;
	}
	
	@Override
	public void sendMessage(MessageDto message) {
		
		messageMapper.sendMessage(message);
		
		if (message.getAttachments() != null) {
			for (MessageAttachDto attachment : message.getAttachments()) {
				attachment.setMsgNo(message.getMsgNo()); // 새로 만들어진 글번호를 Attach 객체에 저장
				messageMapper.insertmessageAttach(attachment);
			}
		}
		
	}	
	
	@Override
	public MessageAttachDto selectMessageAttachByMsgFileNo(int msgFileNo) {
		
		MessageAttachDto attachment = messageMapper.selectMessageAttachByMsgFileNo(msgFileNo);
		return attachment;
	}

	@Override
	public void increaseRecvChk(int msgNo) {
		
		messageMapper.increaseRecvChk(msgNo);
	}

	@Override
	public List<MessageBookmarkDto> findBookmarkNic(String loginuserNic) {
		
		List<MessageBookmarkDto> bookmark = messageMapper.findBookmarkNic(loginuserNic);
		
		return bookmark;
	}

	@Override
	public void addBookmark(String loginuserNic, String bookmarkNic) {
		
		messageMapper.addBookmark(loginuserNic, bookmarkNic);
		
	}

	@Override
	public void removeBookmark(String loginuserNic, String bookmarkNic) {
		
		messageMapper.removeBookmark(loginuserNic, bookmarkNic);
		
	}



	
}
