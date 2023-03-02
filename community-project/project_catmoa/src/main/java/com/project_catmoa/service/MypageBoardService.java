package com.project_catmoa.service;

import java.util.List;

import com.project_catmoa.dto.BoardDto;


public interface MypageBoardService {

	List<BoardDto> findMypageBoard(String userId);

}