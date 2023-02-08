package com.reactTeam3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping(path = { "/", "/people", "/traffic", "/weather", "/transport", "/transport/lineMap",
			"/news"})
	public String home() {
		
		return "index";
	}
	
}
