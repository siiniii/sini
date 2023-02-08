package com.project_catmoa.service;

import java.util.HashMap;
import java.util.List;

import com.project_catmoa.dto.BoardDto;
import com.project_catmoa.dto.JjimDto;
import com.project_catmoa.mapper.MypageBoardMapper;
import com.project_catmoa.mapper.MypageJjimMapper;

import lombok.Setter;


public class MypageJjimServiceImpl implements MypageJjimService{
	
	@Setter
	private MypageJjimMapper mypageJjimMapper;

	@Override
	public List<HashMap<String, Object>> findMypageJjim(String userId) {
		
		List<HashMap<String, Object>> jjimboard = mypageJjimMapper.selectMypageJjimBoard(userId);
		
		return jjimboard;
	}	
	
}
