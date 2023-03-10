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
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.reactTeam3.dto.Hotspot;
import com.reactTeam3.dto.Weather;

@Controller
@RequestMapping(path = { "/weather" })
public class WeatherController {

	
	
	@GetMapping(path = { "/load-hotspot-data" })
	@ResponseBody
	public ArrayList<Hotspot> loadHotspot(HttpServletRequest req) {
			
		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
		ArrayList<Hotspot> hotspotList = new ArrayList<>();
	
		try
		
		{
			String hotspotPath = req.getServletContext().getRealPath("/data-files/hotspot-data2.CSV");
			fis = new FileInputStream(hotspotPath);
			isr = new InputStreamReader(fis, "UTF-8");
			br = new BufferedReader(isr);
			br.readLine();
			while (true) {
				String line = br.readLine();
				if (line == null)
					break;
	
				String[] data = line.split(",");
				Hotspot hotspot = new Hotspot();
	
				hotspot.setSpotNum(Integer.parseInt(data[0]));
				hotspot.setSpotName(data[1]);
	
				hotspotList.add(hotspot);
	
				System.out.println(hotspotList);
			}
	
		} catch( Exception ex )
		
		{ ex.printStackTrace();
		
		} finally
		
		{
			try {
				br.close();
			} catch (Exception ex) {
				
			}
			try {
				isr.close();
			} catch (Exception ex) {
				
			}
			try {
				fis.close();
			} catch (Exception ex) {
				
			}
		}

	System.out.println(hotspotList);

	return hotspotList;
	
}
	
	
	@GetMapping(path = { "/load-spotByGroup" })
	@ResponseBody
	public ArrayList<HashMap<String, Object>> loadSpotByGroup(String group, HttpServletRequest req) {
		
		ArrayList<HashMap<String, Object>> datas = new ArrayList<>();
		
		if (group.length() == 0) {
			return datas;
		}
	
		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
	
		try
		
		{
			String Path = req.getServletContext().getRealPath("/data-files/hotspot-data2.csv");
			fis = new FileInputStream(Path);
			isr = new InputStreamReader(fis, "UTF-8");
			br = new BufferedReader(isr);
			br.readLine();
			while (true) {
				String line = br.readLine();
				if (line == null)
					break;
	
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
	
		} catch( Exception ex )
		
		{ ex.printStackTrace();
		
		} finally
		
		{
			try {
				br.close();
			} catch (Exception ex) {
				
			}
			try {
				isr.close();
			} catch (Exception ex) {
				
			}
			try {
				fis.close();
			} catch (Exception ex) {
				
			}
		}
		
		return datas;
	}

	
	@GetMapping(path = { "/load-spotBySearch" })
	@ResponseBody
	public ArrayList<HashMap<String,Object>> loadWspotData(String spot, HttpServletRequest req) {
		
		ArrayList<HashMap<String, Object>> datas = new ArrayList<>();
		
		if (spot.length() == 0 ) {
			return datas;
		}
			
		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
	
		try
		
		{
			String Path = req.getServletContext().getRealPath("/data-files/hotspot-data2.csv");
			fis = new FileInputStream(Path);
			isr = new InputStreamReader(fis, "UTF-8");
			br = new BufferedReader(isr);
			br.readLine();
			while (true) {
				String line = br.readLine();
				if (line == null)
					break;
	
				List<String> aLine = new ArrayList<>();
				String[] lineArr = line.split(",");
				aLine = Arrays.asList(lineArr);
	
				HashMap<String, Object> data = new HashMap<>();
				
				data.put("spot", aLine.get(1));
				
				if (aLine.get(1).contains(spot)) {
					datas.add(data);
				}
			}
	
		} catch( Exception ex )
		
		{ ex.printStackTrace();
		
		} finally
		
		{
			try {
				br.close();
			} catch (Exception ex) {
				
			}
			try {
				isr.close();
			} catch (Exception ex) {
				
			}
			try {
				fis.close();
			} catch (Exception ex) {
				
			}
		}

	return datas;
	
}

	
	@GetMapping(path = { "/load-weather" })
	@ResponseBody
	public ArrayList<HashMap<String, Object>> loadWeather(Weather weatherInfo) {
		
		System.out.println(weatherInfo);
		
		String areanm = null;
		String key = "6f4e644e5070617231303879746c766c";
		int start = weatherInfo.getStart();
		int end = weatherInfo.getEnd();
		
		try {
			areanm = URLEncoder.encode(weatherInfo.getAreanm(), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
		
		ArrayList<HashMap<String, Object>> Wdatas = new ArrayList<>();
		
		try {
			
			//http://openapi.seoul.go.kr:8088/(인증키)/xml/citydata/1/5/광화문·덕수궁
			
			URL url = new URL("http://openapi.seoul.go.kr:8088/" + key + "/xml/citydata/" + start + "/" + end +
					"/" + areanm );
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        
	        System.out.println("Response code: " + conn.getResponseCode());
	        
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder = factory.newDocumentBuilder();
	        
	        Document doc = builder.parse(conn.getInputStream()); // xml 문자열 -> 객체 트리
	        
	        NodeList items = doc.getElementsByTagName("WEATHER_STTS");
	        
            for (int i = 0; i < items.getLength(); i++) {
            	Node item = items.item(i);
            	NodeList children = item.getChildNodes();
            	HashMap<String, Object> data = new HashMap<>(); 	// 한 편의 영화 저장 변수
            	for (int j = 0; j < children.getLength(); j++) {
            		Node child = children.item(j);
            		data.put(child.getNodeName(), child.getTextContent());
            		System.out.println(child.getNodeName() + ": " + child.getTextContent());
            	}
            	
            	 Wdatas.add(data);
            }	        
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		
		return Wdatas;
		
	}

}
