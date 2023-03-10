package com.parking.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parking.Dto.ParkingDto;
import com.parking.entity.ParkingEntity;
import com.parking.entity.RateEntity;
import com.parking.service.ParkingService;

@Controller
@RequestMapping(path = { "/parking" })
public class ParkingController {

	@Autowired
	@Qualifier("ParkingService")
	private ParkingService parkingService;

	private boolean stringIsNullOrEmpty(String source) {
		return source == null || source.length() == 0;
	}

	@GetMapping(path = { "/rateCheck" })
	public String showRateCheck(String carNo, Model model) {

		// 모든 차량조회
		List<ParkingEntity> allVehicles = parkingService.findAllCars();
		model.addAttribute("vehicles", allVehicles);

		List<RateEntity> rateList = parkingService.findRateList();
		model.addAttribute("rate", rateList);

		return "parking/rate-check";
	}

	@GetMapping(path = { "/load-cars" })
	public String loadCars(String carNo, Model model) {

		if (!stringIsNullOrEmpty(carNo)) {
			// 차량번호 검색
			List<ParkingEntity> searchCarNo = parkingService.searchBycarNo(carNo);
			model.addAttribute("vehicles", searchCarNo);

			List<RateEntity> rateList = parkingService.findRateList();
			model.addAttribute("rate", rateList);
		} else {
			// 모든 차량조회
			List<ParkingEntity> allVehicles = parkingService.findAllCars();
			model.addAttribute("vehicles", allVehicles);

			List<RateEntity> rateList = parkingService.findRateList();
			model.addAttribute("rate", rateList);
		}

		return "parking/car-list";
	}

	@PostMapping(path = { "/get-indexNo" })
	@ResponseBody
	public ParkingEntity getCarData(int indexNo) {

		ParkingEntity car = parkingService.getCarData(indexNo);

		return car;
	}

	@PostMapping(path = { "/update-parking-type" })
	@ResponseBody
	public String updateParkingType(ParkingDto car) {

		parkingService.updateParkingType(car);

		return "success";
	}


	 @GetMapping(path= {"/setting-rate"})
	 @ResponseBody
	 // public String settingRate(RateDto rate) {
	 public String settingRate(String rateType, int rate) {

		 parkingService.settingRate(rateType, rate);

		 return "success";

	 }

	// 차량삭제
	@PostMapping(path = { "/delete-payCar" })
	public String deleteCar(int indexNo) {

		parkingService.deletePayCar(indexNo);

		return "redirect:/parking/rateCheck";
	}

	@GetMapping(path = { "/parkingSystem" })
	public String showParkingSystem() {
		return "parking/parking-system";
	}

}
