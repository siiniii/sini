package com.project_catmoa.service;

import java.util.List;

import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.dto.MessageAttachDto;
import com.project_catmoa.dto.MessageBookmarkDto;
import com.project_catmoa.dto.MessageDto;

public interface MessageService {
	
	List<MessageDto> findRecvMessageByPage(int pageNo, int pageSize, String loginuserNic);
	
	int findRecvMessageCount (String loginuserNic);

	List<MessageDto> findSendedMessageByPage(int pageNo, int pageSize, String loginuserNic);
	
	int findSendedMessageCount (String loginuserNic);

	MessageDto findMessageDetailByMsgNo(int msgNo);
	
	IntroDto searchRecvNic(MessageDto message);
	
	void sendMessage(MessageDto message);
	
	MessageAttachDto selectMessageAttachByMsgFileNo(int msgFileNo);

	void increaseRecvChk(int msgNo);

	List<MessageBookmarkDto> findBookmarkNic(String loginuserNic);

	void addBookmark(String loginuserNic, String bookmarkNic);

	void removeBookmark(String loginuserNic, String bookmarkNic);
	
}
