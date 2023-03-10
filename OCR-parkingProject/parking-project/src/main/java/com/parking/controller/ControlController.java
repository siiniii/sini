package com.parking.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parking.Dto.RegistrationDto;
import com.parking.entity.ControlEntity;
import com.parking.entity.RegistrationEntity;
import com.parking.service.RegistrationService;

@Controller
@RequestMapping(path = { "/control" })
public class ControlController {

	@Autowired
	@Qualifier("registerService")
	private RegistrationService regService;
	
	private boolean stringIsNullOrEmpty(String source) {
		return source == null || source.length() == 0;
	}
	
	// 등록차량 리스트 화면 
		@GetMapping(path = {"/vehicleManage"})
		public String showBoardList() {

		
			return "/control/vehicleManage";
		}
	
	// 등록차량 리스트 
	@GetMapping(path = {"/loadCarList"})
	public String loadCarList(String regCarNo, String regInfo, Model model) {

		if (!stringIsNullOrEmpty(regCarNo) && stringIsNullOrEmpty(regInfo)) {
			// 차량번호 검색 
			List<RegistrationEntity> searchCarNo = regService.searchNo(regCarNo);
			model.addAttribute("vehicles", searchCarNo);
		} else if (stringIsNullOrEmpty(regCarNo) && !stringIsNullOrEmpty(regInfo)) {
			// 등록정보 검색 
			List<RegistrationEntity> searchRegInfo = regService.searchInfo(regInfo);
			model.addAttribute("vehicles", searchRegInfo);
		} else if (!stringIsNullOrEmpty(regCarNo) && !stringIsNullOrEmpty(regInfo)) {
			//  검색조건 모두충족 리스트 검색 
			List<RegistrationEntity> searchBorh = regService.searchBoth(regInfo, regCarNo);
			model.addAttribute("vehicles", searchBorh);
		} else {
			// 모든차량 조회 
			List<RegistrationEntity> allVehicles = regService.findAllRegCars();
			model.addAttribute("vehicles", allVehicles);
		}
	
		return "/control/car-list";
	}
	
	
	@GetMapping(path = {"/searchAllVehicle"})
	@ResponseBody
	public List<RegistrationEntity> showAllRegCars() {
		List<RegistrationEntity> returnAllCar = regService.findAllRegCars();
		
	return returnAllCar;
}

	

	@GetMapping(path = {"/controlSystem"})
	public String showControlSystem() {
		return "control/control-system";
	}
	
	// 차량등록 
	@PostMapping(path = { "/register" })
	public String register(RegistrationDto regDto) { 
		
		regService.registrationCar(regDto);
		
		return "redirect:/control/vehicleManage";
	}
	
	
	// 차량삭제 
	@PostMapping(path = { "/deleteVehicle" })
	public String deleteCar(int indexNo) {	
		
		
		regService.deleteRegCar(indexNo);
		
		return "redirect:vehicleManage";
	}			
	
	// 차량수정 데이터 
	@PostMapping(path = { "/modifyVehicle" })
	@ResponseBody
	public RegistrationEntity modifyData(int indexNo) {	
		RegistrationEntity modifyE = regService.modifyCarData(indexNo);
		
		return modifyE;
	}		
	// 차량수정 
	@PostMapping(path = { "/modifyCar" })
	public String modifyCar(RegistrationEntity regE) {	
		
		regService.modifyRegCar(regE);
		
		return "redirect:vehicleManage";
	}		
	
	// 차량수정 데이터 
	@PostMapping(path = { "/inout" })
	@ResponseBody
	public List<ControlEntity> inoutCar(String carNo) {
		List<ControlEntity> ce = regService.findRegCarInOut(carNo);
		return ce;
	}
	
}
