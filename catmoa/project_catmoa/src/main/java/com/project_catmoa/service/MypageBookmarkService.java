package com.project_catmoa.service;

import java.util.List;

import com.project_catmoa.dto.MessageBookmarkDto;

public interface MypageBookmarkService {
	
	List<MessageBookmarkDto> findBookmarkNic(String loginuserNic, String bookmarkNic);

	void removeBookmark(String loginuserNic, String bookmarkNic);
	
}
