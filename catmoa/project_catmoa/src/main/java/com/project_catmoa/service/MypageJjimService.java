package com.project_catmoa.service;

import java.util.HashMap;
import java.util.List;

import com.project_catmoa.dto.BoardDto;
import com.project_catmoa.dto.JjimDto;


public interface MypageJjimService {

	List<HashMap<String, Object>> findMypageJjim(String userId); // 로그인 유저의 찜 목록 가져오기

}