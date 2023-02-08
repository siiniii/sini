package com.reactTeam3.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.reactTeam3.dto.Cctv;
import com.reactTeam3.dto.Hotspot;
import com.reactTeam3.dto.RoadTraffic;

@Controller
@RequestMapping(path = { "/traffic" })
public class TrafficController {
	
	// 서울 핫플레이스 50개 장소 그룹으로 가져오기
	
	@GetMapping(path = { "/load-spotGroup" })
	@ResponseBody
	public ArrayList<HashMap<String, Object>> loadSpotGroup(HttpServletRequest req, String group) {
		
		ArrayList<HashMap<String, Object>> datas = new ArrayList<>();
		
		if(group.length() == 0) {
			return datas;
		}
		
		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
		
		try {
			
			String spotPath = req.getServletContext().getRealPath("/data-files/hotspot-data.CSV");
			fis = new FileInputStream(spotPath);
			isr = new InputStreamReader(fis, "UTF-8");
			br = new BufferedReader(isr);
			br.readLine();
			
			while(true) {
				String line = br.readLine();
				if(line == null) break;
				
				List<String> aLine = new ArrayList<>();
				String[] lineArr = line.split(",");
				aLine = Arrays.asList(lineArr);
				
				int x = Integer.parseInt(aLine.get(0));
				
				HashMap<String, Object> data = new HashMap<>();
				
				if (x >= 1 && x <= 7) {
					data.put("group", "관광 특구");
				} else if (x >= 8 && x <= 10) {
					data.put("group", "고궁 문화유산");
				} else if (x >= 11 && x <= 25) {
					data.put("group", "인구 밀집지역");
				} else if (x >= 26 && x <= 38) {
					data.put("group", "발달 상권");
				} else{
					data.put("group", "공원");
				}
				
				data.put("spot", aLine.get(1));
				
				if (data.get("group").equals(group)) {
					datas.add(data);
				}
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try { br.close(); } catch (Exception ex) {}
			try { isr.close(); } catch (Exception ex) {}
			try { fis.close(); } catch (Exception ex) {}
		}
		return datas;
		
		
	}
	
	
	// 도로소통현황
	
	@GetMapping(path = { "/load-traffic-stts" })
	@ResponseBody
	// public ArrayList<HashMap<String, Object>> loadTrafficIdx(String string, RoadTraffic roadTrafficInfo) {
	public ArrayList<HashMap<String, Object>> loadTrafficIdx(String string, RoadTraffic roadTrafficInfo) {
		
		String areaNM = "";
		String key = "4b6e7350456a6f7936387961484346";
		int start = roadTrafficInfo.getStart();
		int end = roadTrafficInfo.getEnd();
		
		try {
			areaNM = URLEncoder.encode(roadTrafficInfo.getAreaNM(), "UTF-8");
			// areaNM = URLEncoder.encode("서울", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		ArrayList<HashMap<String, Object>> datas = new ArrayList<>();
		
		if (areaNM.length() == 0) {
			return datas;
		}


		try {
			// http://openapi.seoul.go.kr:8088/(인증키)/xml/citydata/1/5/광화문·덕수궁

			URL url = new URL("http://openapi.seoul.go.kr:8088/" + key + "/xml/citydata/" + start + "/" + end + "/" + areaNM);
			
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/xml");

			System.out.println("Response code: " + conn.getResponseCode());

			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();

			org.w3c.dom.Document doc = builder.parse(conn.getInputStream()); // xml 문자열 -> 객체 트리
			
			NodeList items = doc.getElementsByTagName("ROAD_TRAFFIC_STTS");

			for (int i = 1; i < items.getLength(); i++) {
				Node item = items.item(i);
				NodeList children = item.getChildNodes();
				HashMap<String, Object> data = new HashMap<>(); // 한 편의 영화 저장 변수
				for (int j = 0; j < children.getLength(); j++) {
					Node child = children.item(j);
					data.put(child.getNodeName(), child.getTextContent());
				}
				System.out.println(data);
				datas.add(data);
			}
			
//			InputStreamReader isr = new InputStreamReader(conn.getInputStream());
//			BufferedReader br = new BufferedReader(isr);
//			while (true) {
//				String line = br.readLine();
//				if (line == null) {
//					break;
//				}
//				System.out.println(line);
//			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return datas;

	}

	
	// 실시간 cctv 영상
		
		@GetMapping(path = { "/load-cctv" })
		@ResponseBody
		public ArrayList<HashMap<String, Object>> loadCctv(String type) {
			
			String key = "4d43980ff7ee4d238e13512c1e728977";

			ArrayList<HashMap<String, Object>> datas = new ArrayList<>();

			try {
				// https://openapi.its.go.kr:9443/cctvInfo?apiKey=test&type=ex&cctvType=1&minX=127.100000&maxX=128.890000&minY=34.100000&maxY=39.100000&getType=json
				URL url = new URL("https://openapi.its.go.kr:9443/cctvInfo?apiKey=4d43980ff7ee4d238e13512c1e728977&type=" + type + "&cctvType=1&minX=126.76832&maxX=127.352485&minY=37.378751&maxY=37.743961&getType=xml");
				
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Content-type", "application/xml");

				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();

				org.w3c.dom.Document doc = builder.parse(conn.getInputStream()); // xml 문자열 -> 객체 트리
				
				NodeList items = doc.getElementsByTagName("data");

				for (int i = 1; i < items.getLength(); i++) {
					Node item = items.item(i);
					NodeList children = item.getChildNodes();
					HashMap<String, Object> data = new HashMap<>();
					for (int j = 0; j < children.getLength(); j++) {
						Node child = children.item(j);
						data.put(child.getNodeName(), child.getTextContent());
					}
					datas.add(data);
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return datas;

		}
}
