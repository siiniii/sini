package com.project_catmoa.service;

import java.util.List;

import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.dto.MessageAttachDto;
import com.project_catmoa.dto.MessageBookmarkDto;
import com.project_catmoa.dto.MessageDto;
import com.project_catmoa.mapper.MessageMapper;
import com.project_catmoa.mapper.MypageBookmarkMapper;

import lombok.Setter;

public class MypageBookmarkServiceImpl implements MypageBookmarkService{
	
	@Setter
	private MypageBookmarkMapper mypageBookmarkMapper;
	
	@Override
	public List<MessageBookmarkDto> findBookmarkNic(String loginuserNic, String bookmarkNic) {
		
		List<MessageBookmarkDto> bookmark = mypageBookmarkMapper.findBookmarkNic(loginuserNic);
		
		return bookmark;
	}

	@Override
	public void removeBookmark(String loginuserNic, String bookmarkNic) {
		
		mypageBookmarkMapper.removeBookmark(loginuserNic, bookmarkNic);
		
	}
	
}