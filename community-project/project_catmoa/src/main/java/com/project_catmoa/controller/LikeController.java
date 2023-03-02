package com.project_catmoa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project_catmoa.dto.LikeDto;
import com.project_catmoa.service.LikeService;

@Controller
@RequestMapping(path = { "/board" })
public class LikeController {

	
	@Autowired
	@Qualifier("likeService")
	private LikeService likeService;
	
	// 좋아요 정보받기
	@PostMapping(path = {"/toggle-like"})
	@ResponseBody
	public String LikeDetail(LikeDto likeDto, boolean like) {

		likeService.likeInfo(likeDto, like);
		
		return "success";
	}

}
