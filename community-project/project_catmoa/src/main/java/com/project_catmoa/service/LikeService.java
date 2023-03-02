package com.project_catmoa.service;

import com.project_catmoa.dto.LikeDto;

public interface LikeService {
	void likeInfo(LikeDto likeDto, boolean like);
	
	int findCountByUserIdAndBoardNo(LikeDto likeDto);
}
