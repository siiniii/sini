package com.reactTeam3.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.reactTeam3.dto.Congestion;
import com.reactTeam3.dto.Hotspot;

@Controller
@RequestMapping(path = { "/people" })
public class PeopleController {
	
	
	@GetMapping(path = { "/load-hotspot-data" }, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public ArrayList<Hotspot> loadHotspot(int startNum, int endNum, HttpServletRequest req) {
		
		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
		ArrayList<Hotspot> hotspotList = new ArrayList<>();
		
		try {
			String hotspotPath = req.getServletContext().getRealPath("/data-files/hotspot-data.CSV");
			fis = new FileInputStream(hotspotPath);
			isr = new InputStreamReader(fis, "UTF-8");
			br = new BufferedReader(isr);
			br.readLine();
			while (true) {
				String line = br.readLine();
				if (line == null) break;
				
				String[] data = line.split(",");
				Hotspot hotspot = new Hotspot();
				
				hotspot.setSpotNum(Integer.parseInt(data[0]));
				hotspot.setSpotName(data[1]);
				hotspot.setSpotId(Integer.parseInt(data[2]));
			if (Integer.parseInt(data[0]) >= startNum && Integer.parseInt(data[0]) <= endNum ) {
				hotspotList.add(hotspot);
			}	
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try { br.close(); } catch (Exception ex) {}
			try { isr.close(); } catch (Exception ex) {}
			try { fis.close(); } catch (Exception ex) {}
		}
		
		return hotspotList;
	}
	
	
	
	@GetMapping(path = { "/load-population" })
	@ResponseBody
	public ArrayList<HashMap<String, Object>> loadPopulation(String areaName) {
		
		ArrayList<HashMap<String, Object>> datas = new ArrayList<>();
		
		if ( areaName.length() == 0 ) {
			return datas;
		}
		
		//areaName = null;
		String key = "485468726861733936324b796a5150";
		String encodeAreaName = "";
		
			
		try {	
			encodeAreaName = URLEncoder.encode(areaName, "UTF-8");
			// areaNM = URLEncoder.encode("서울", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		try {
			
	        URL url = new URL("http://openapi.seoul.go.kr:8088/" + key + "/xml/citydata/1/5/" + encodeAreaName);
	        
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder = factory.newDocumentBuilder();
	        
	        Document doc = builder.parse(conn.getInputStream()); // xml 문자열 -> 객체 트리
	        
	        NodeList items = doc.getElementsByTagName("LIVE_PPLTN_STTS");
	        
            for (int i = 0; i < items.getLength(); i++) {
            	Node item = items.item(i);
            	NodeList children = item.getChildNodes();
            	HashMap<String, Object> data = new HashMap<>(); // 한 편의 영화 저장 변수
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
	
	
	@GetMapping(path = "/load-congestions")
	@ResponseBody
	public ArrayList<Congestion> loadCongestions(int spotId) {
		
		ArrayList<Congestion> congestions = new ArrayList<>();
//		String apiURL = "https://apis.openapi.sk.com/puzzle/congestion/raw/hourly/pois/10067845?date=20221220";
        String apiURL = "https://apis.openapi.sk.com/puzzle/congestion/raw/hourly/pois/7887862?date=20221220";    // XML 결과
//		String apiURL = String.format("https://apis.openapi.sk.com/puzzle/congestion/raw/hourly/pois/%d?date=20221220", spotId);
		
		Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("accept", "application/json");
        requestHeaders.put("appkey", "l7xxbee0103072b54c6887480fbc32c2898d");
        
        try {
        	HttpURLConnection con = connect(apiURL);
        	con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode(); // 요청 전송 + 응답 수신
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                InputStream is = con.getInputStream();
    	        InputStreamReader isr = new InputStreamReader(is);
    	        
    	        JsonElement root = JsonParser.parseReader(isr);
    	        JsonObject obj =root.getAsJsonObject();
    	        
    	        Gson gson = new Gson();
    	        
    	        TypeToken<ArrayList<Congestion>> collectionType = new TypeToken<ArrayList<Congestion>>(){};
		        congestions = gson.fromJson(obj.get("contents").getAsJsonObject().get("raw"), collectionType);
                
            } else { // 오류 발생
            	System.out.println("오류1");
            }
        } catch (Exception ex) {
        	ex.printStackTrace();
        }
		
		return congestions;
	}
	
	
	@GetMapping(path = "/load-congestions2")
	@ResponseBody
	public List<Congestion> loadCongestions2(int spotId) {
		
		ArrayList<Congestion> congestions = new ArrayList<>();
		
		try {
			
	        URL url = new URL("https://apis.openapi.sk.com/puzzle/congestion/raw/hourly/pois/" + spotId + "?date=20221220");
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("accept", "application/json");
	        conn.setRequestProperty("appkey", "l7xxbee0103072b54c6887480fbc32c2898d");
	        
	        InputStream is = conn.getInputStream();
	        InputStreamReader isr = new InputStreamReader(is);
	        
	        JsonElement root = JsonParser.parseReader(isr);
	        JsonObject obj =root.getAsJsonObject();
	        
	        Gson gson = new Gson();
			
//			HttpRequest request = HttpRequest.newBuilder()
//				    .uri(URI.create(String.format("https://apis.openapi.sk.com/puzzle/congestion/raw/hourly/pois/%d?date=20221220", spotId)))
//				    .header("accept", "application/json")
//				    .header("appkey", "l7xxbee0103072b54c6887480fbc32c2898d")
//				    .method("GET", HttpRequest.BodyPublishers.noBody())
//				    .build();
//				HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
//				
//				//System.out.println(response.body());
//				
//				String jsonString = response.body();
//				
//				Gson gson = new Gson();
//				
//				JsonElement root = JsonParser.parseString(jsonString);
//		        JsonObject obj =root.getAsJsonObject();
		        
		        TypeToken<ArrayList<Congestion>> collectionType = new TypeToken<ArrayList<Congestion>>(){};
		        congestions = gson.fromJson(obj.get("contents").getAsJsonObject().get("raw"), collectionType);
				
				
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return congestions;
	}

//	
//	@GetMapping(path="/load-spotId")
//	@ResponseBody
//	public String loadSpotId(HttpServletRequest req) throws IOException, InterruptedException {
//		
//		FileInputStream fis = null;
//		InputStreamReader isr = null;
//		BufferedReader br = null;
//	
//		try
//		
//		{
//			String Path = req.getServletContext().getRealPath("/data-files/hotspot-data3.csv");
//			fis = new FileInputStream(Path);
//			isr = new InputStreamReader(fis);
//			br = new BufferedReader(isr);
//			
//			for (int i = 1; i <=45 ; i++) {
//				br.readLine();
//			}
//			
//			for(int i = 0; i < 7; i++) {
//				String line = br.readLine();
//				if (line == null)
//					break;
//	
//				List<String> aLine = new ArrayList<>();
//				String[] lineArr = line.split(",");
//				aLine = Arrays.asList(lineArr);
//	
//				int x = Integer.parseInt(aLine.get(0));
//				
//				HashMap<String, Object> data = new HashMap<>();
//				
//				 String a = null;
//				
//				try {
//					a = URLEncoder.encode(aLine.get(1), "UTF-8");
//				} catch (Exception e) {
//				}
//				
//				HttpRequest request = HttpRequest.newBuilder()
//					    .uri(URI.create("https://apis.openapi.sk.com/tmap/pois?version=1&searchKeyword=" + a + "&searchType=all&searchtypCd=A&reqCoordType=WGS84GEO&resCoordType=WGS84GEO&page=1&count=20&multiPoint=N&poiGroupYn=N"))
//					    .header("Accept", "application/json")
//					    .header("appKey", "l7xx846db5f3bc1e48d29b7275a745d501c8")
//					    .method("GET", HttpRequest.BodyPublishers.noBody())
//					    .build();
//					HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
//					System.out.println(aLine.get(1));
//					System.out.println(response.body());
//				
//			}
//	
//		} catch( Exception ex )
//		
//		{ ex.printStackTrace();
//		
//		} finally
//		
//		{
//			try {
//				br.close();
//			} catch (Exception ex) {
//				
//			}
//			try {
//				isr.close();
//			} catch (Exception ex) {
//				
//			}
//			try {
//				fis.close();
//			} catch (Exception ex) {
//				
//			}
//		}
		
		
		
		
//		String spotName = "이태원관광특구";
//		
//		try {
//			HttpRequest request = HttpRequest.newBuilder()
//				    .uri(URI.create(String.format("https://apis.openapi.sk.com/tmap/pois?version=1&searchKeyword=%s&searchType=all&searchtypCd=A&reqCoordType=WGS84GEO&resCoordType=WGS84GEO&page=1&count=20&multiPoint=N&poiGroupYn=N", spotName)))
//				    .header("appKey", "l7xxbee0103072b54c6887480fbc32c2898d")
//				    .header("Accept", "application/json")
//				    .method("GET", HttpRequest.BodyPublishers.noBody())
//				    .build();
//				HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
//				System.out.println(response.body());
//				
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		}
		
//		return "success";
		
//	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode(); // 요청 전송 + 응답 수신
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 오류 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }
	
	private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl); // URL : 네트워크 요청 처리 클래스
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }
	
	private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
        }
    }
}
