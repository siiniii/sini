package com.parking.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.parking.Dto.ControlDto;
import com.parking.entity.ControlEntity;
import com.parking.entity.RegistrationEntity;
import com.parking.service.ControlService;
import com.parking.service.RegistrationService;
import com.parking.ui.ThePager;

@Controller
@RequestMapping(path = { "/control" })
public class ControlController2 {

	@Autowired
	@Qualifier("controlService")
	private ControlService controlService;

	@Autowired
	@Qualifier("registerService")
	private RegistrationService regService;

	/////////////////////////////////////////////

	private final int PAGE_SIZE = 10; // 한 페이지에 표시되는 데이터 개수
	private final int PAGER_SIZE = 5; // 한 번에 표시할 페이지 번호 개수
	private final String LINK_URL = "controlRecord"; // 페이지 번호를 클릭했을 때 이동할 페이지 경로

	/////////////////////////////////////////////

	@PostMapping("/picToOcrControl")
	public String picToOcrControl(@RequestParam("file") MultipartFile file, Model model) {

		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");

		String name = format.format(date) + ".png";

		String savedPath = "c:/control/" + name;

		try {
			file.transferTo(new File(savedPath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			String path = "http://192.168.200.204:8082/upload-picture4";
			URL url = new URL(path);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");

			conn.setDoOutput(true); // 요청 스트림에 데이터 쓰기 가능
			OutputStream os = conn.getOutputStream();
			os.write(String.format("name=%s",  name).getBytes("utf-8"));
			os.flush();
			os.close();

			int respCode = conn.getResponseCode();
			if (respCode == HttpURLConnection.HTTP_OK) {
				InputStream is = conn.getInputStream();
				InputStreamReader isr = new InputStreamReader(is, "utf-8");
				BufferedReader br = new BufferedReader(isr);
				String carNumber = "";
				while (true) {
					String line = br.readLine();
					if (line == null) {
						break;
					}
					carNumber += line;
				}

				carNumber = carNumber.replace(" ", "");

				String enterExit = "입차";
				System.out.println(carNumber);

				ControlDto control = new ControlDto();
				control.setCarNo(carNumber);
				control.setReg(false);


				// 등록 차량 확인
				List<RegistrationEntity> allVehicles = regService.findAllRegCars();

				for (RegistrationEntity vehicle : allVehicles) {

					if (carNumber.equals(vehicle.getRegCarNo())) {
						control.setReg(true);
						break;
					}

				}

				//입차 출차 확인
				ControlEntity controlEntity = controlService.findControlEntityByCarNoAndNoExit(carNumber);

				if (controlEntity != null) {
					enterExit = "출차";
					controlService.exitControl(carNumber);

				} else {
					controlService.enterControl(control);
				}

				model.addAttribute("carNumber", carNumber);
				model.addAttribute("enterExit", enterExit);

				if (control.getReg() ) {
					String reg = "등록차량";
					model.addAttribute("reg", reg);
				} else {
					String reg = "미등록차량";
					model.addAttribute("reg", reg);
				}

					return "control/control-check";

				} else {
					String message = "미상";
					model.addAttribute("carNumber", message);
					return "control/control-check";
				}

		} catch (Exception ex) {
			String message = "에러";
			model.addAttribute("carNumber", message);
			return "control/control-check";
		}

	}

	@GetMapping("/controlRecord")
	public String showControlRecord(@RequestParam(defaultValue = "1")int pageNo, Model model) {

		HashMap<String, Object> pagingData = controlService.findAllByPage(pageNo - 1, PAGE_SIZE);

		ThePager pager = new ThePager((int)pagingData.get("dataCount"), pageNo, PAGE_SIZE, PAGER_SIZE, LINK_URL);

		model.addAttribute("records", pagingData.get("records"));
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);

		return "control/control-record";
	}

}
