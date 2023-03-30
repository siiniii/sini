package com.project_catmoa.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project_catmoa.dto.DonateDto;
import com.project_catmoa.service.DashboardService;
import com.project_catmoa.service.DonateService;
import com.project_catmoa.service.IntroService;

@Controller
public class DashboardController {

	@Autowired
	@Qualifier("dashboardService")
	private DashboardService dashboardService;
	
}
