package com.project_catmoa.service;

import com.project_catmoa.dto.LikeDto;
import com.project_catmoa.mapper.LikeMapper;

import lombok.Setter;

public class LikeServiceImpl implements LikeService {

	@Setter
	private LikeMapper likeMapper;
	
	@Override
	public void likeInfo(LikeDto likeDto, boolean like) {
		if (like) {
			likeMapper.insertlikeInfo(likeDto);
		} else {
			likeMapper.deletelikeInfo(likeDto);
		}
	}

	@Override
	public int findCountByUserIdAndBoardNo(LikeDto likeDto) {
		return likeMapper.selectCountByUserIdAndBoardNo(likeDto);
	}
	
	
}
