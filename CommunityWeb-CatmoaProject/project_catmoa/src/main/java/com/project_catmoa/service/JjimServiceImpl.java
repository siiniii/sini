package com.project_catmoa.service;

import com.project_catmoa.dto.JjimDto;
import com.project_catmoa.mapper.JjimMapper;

import lombok.Setter;

public class JjimServiceImpl implements JjimService {

	@Setter
	private JjimMapper jjimMapper;
	
	@Override
	public void jjimInfo(JjimDto jjimDto, boolean jjim) {
		if (jjim) {
			jjimMapper.insertJjimInfo(jjimDto);
		} else {
			jjimMapper.deleteJjimInfo(jjimDto);
		}
	}

	@Override
	public int findCountJjimByUserIdAndBoardNo(JjimDto jjimDto) {
		return jjimMapper.selectCountJjimByUserIdAndBoardNo(jjimDto);
	}
	
	
}
