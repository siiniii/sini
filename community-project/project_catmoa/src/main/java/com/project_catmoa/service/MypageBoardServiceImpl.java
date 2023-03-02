package com.project_catmoa.service;

import java.util.List;

import com.project_catmoa.dto.BoardDto;
import com.project_catmoa.mapper.MypageBoardMapper;

import lombok.Setter;


public class MypageBoardServiceImpl implements MypageBoardService{
	
	@Setter
	private MypageBoardMapper mypageBoardMapper;

	@Override
	public List<BoardDto> findMypageBoard(String userId) {
		
		List<BoardDto> userboard = mypageBoardMapper.selectMypageBoard(userId);
		
		return userboard;
	}	
	
}
