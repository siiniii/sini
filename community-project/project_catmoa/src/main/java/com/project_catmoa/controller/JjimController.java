package com.project_catmoa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project_catmoa.dto.JjimDto;
import com.project_catmoa.service.JjimService;

@Controller
@RequestMapping(path = { "/board" })
public class JjimController {

	
	@Autowired
	@Qualifier("jjimService")
	private JjimService jjimService;
	
	// 좋아요 정보받기
	@PostMapping(path = {"/toggle-jjim"})
	@ResponseBody
	public String JjimDetail(JjimDto jjimDto, boolean jjim) {

		jjimService.jjimInfo(jjimDto, jjim);
		
		return "success";
	}

}
