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

import com.reactTeam3.dto.Station;
import com.reactTeam3.dto.Subway;

@Controller
@RequestMapping(path = { "/transport" })
public class TransportController {
	
	
	@GetMapping(path = { "/load-station" })
	@ResponseBody
	public List<Station> loadStation(String name, HttpServletRequest req) {
		
		List<Station> stations = new ArrayList<>();
		
		if (name.length() == 0) {
			return stations;
		}
	
		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
	
		try
		
		{
			String Path = req.getServletContext().getRealPath("/data-files/data.csv");
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
	
				if (aLine.get(1).contains(name)) {
					Station station = new Station();
					station.setLine(aLine.get(0));
					if (aLine.get(1).equals("남한산성입구")) {
						aLine.set(1,"남한산성입구(성남법원, 검찰청)");
					}
					station.setName(aLine.get(1));
					if (aLine.get(0).equals("1호선")) {
						station.setColor("#0052A4");
					} else if (aLine.get(0).equals("2호선")) {
						station.setColor("#00A84D");
					} else if (aLine.get(0).equals("3호선")) {
						station.setColor("#EF7C1C");
					} else if (aLine.get(0).equals("4호선")) {
						station.setColor("#00A5DE");
					} else if (aLine.get(0).equals("5호선")) {
						station.setColor("#996CAC");
					} else if (aLine.get(0).equals("6호선")) {
						station.setColor("#CD7C2F");
					} else if (aLine.get(0).equals("7호선")) {
						station.setColor("#747F00");
					} else if (aLine.get(0).equals("8호선")) {
						station.setColor("#E6186C");
					} else if (aLine.get(0).equals("9호선")) {
						station.setColor("#BDB092");
					} else if (aLine.get(0).equals("분당선")) {
						station.setColor("#F5A200");
					} else if (aLine.get(0).equals("신분당선")) {
						station.setColor("#D4003B");
					} else if (aLine.get(0).equals("자기부상선")) {
						station.setColor("#FFCD12");
					} else if (aLine.get(0).equals("우이신설선")) {
						station.setColor("#B0CE18");
					} else if (aLine.get(0).equals("경의중앙선")) {
						station.setColor("#77C4A3");
					} else if (aLine.get(0).equals("공항철도")) {
						station.setColor("#0090D2");
					} else if (aLine.get(0).equals("경춘선")) {
						station.setColor("#0C8E72");
					}
					stations.add(station);
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
		
		return stations;
	}
	
	
	@GetMapping(path = { "/load-subway" })
	@ResponseBody
	public ArrayList<HashMap<String, Object>> loadSubway(Subway subwayInfo) {
		
		ArrayList<HashMap<String, Object>> datas = new ArrayList<>();
		
		if (subwayInfo.getStation().length() == 0 || subwayInfo.getLine().length() == 0) {
			return datas;
		}
		
		String station = null;
		String key = "754a58764268616539337168555671";
		int start = subwayInfo.getStart();
		int end = subwayInfo.getEnd();
		int line = 0;
		
		try {
			if (subwayInfo.getStation().equals("남한산성입구(성남법원, 검찰청)")) {
				station = "%EB%82%A8%ED%95%9C%EC%82%B0%EC%84%B1%EC%9E%85%EA%B5%AC(%EC%84%B1%EB%82%A8%EB%B2%95%EC%9B%90%2C%20%EA%B2%80%EC%B0%B0%EC%B2%AD)";
			} else {
				station = URLEncoder.encode(subwayInfo.getStation(), "UTF-8");
			}
            
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
		
		if (subwayInfo.getLine().equals("1호선")) {
			line = 1001;
		} else if (subwayInfo.getLine().equals("2호선")) {
			line = 1002;
		} else if (subwayInfo.getLine().equals("3호선")) {
			line = 1003;
		} else if (subwayInfo.getLine().equals("4호선")) {
			line = 1004;
		} else if (subwayInfo.getLine().equals("5호선")) {
			line = 1005;
		} else if (subwayInfo.getLine().equals("6호선")) {
			line = 1006;
		} else if (subwayInfo.getLine().equals("7호선")) {
			line = 1007;
		} else if (subwayInfo.getLine().equals("8호선")) {
			line = 1008;
		} else if (subwayInfo.getLine().equals("9호선")) {
			line = 1009;
		} else if (subwayInfo.getLine().equals("분당선")) {
			line = 1075;
		} else if (subwayInfo.getLine().equals("신분당선")) {
			line = 1077;
		} else if (subwayInfo.getLine().equals("자기부상선")) {
			line = 1091;
		} else if (subwayInfo.getLine().equals("우이신설선")) {
			line = 1092;
		} else if (subwayInfo.getLine().equals("경의중앙선")) {
			line = 1063;
		} else if (subwayInfo.getLine().equals("공항철도")) {
			line = 1065;
		} else if (subwayInfo.getLine().equals("경춘선")) {
			line = 1067;
		}
		
		try {	
			
			URL url = new URL("http://swopenapi.seoul.go.kr/api/subway/" + key + "/xml/realtimeStationArrival/" + start + "/" + end +
					"/" + station);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        
	        //System.out.println("Response code: " + conn.getResponseCode());
	        
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder = factory.newDocumentBuilder();
	        
	        Document doc = builder.parse(conn.getInputStream()); // xml 문자열 -> 객체 트리
	        
	        NodeList items = doc.getElementsByTagName("row");
	        
            for (int i = 0; i < items.getLength(); i++) {
            	Node item = items.item(i);
            	NodeList children = item.getChildNodes();
            	HashMap<String, Object> data = new HashMap<>(); // 한 편의 영화 저장 변수
            	for (int j = 0; j < children.getLength(); j++) {
            		Node child = children.item(j);
            		data.put(child.getNodeName(), child.getTextContent());
            		//System.out.println(child.getNodeName() + ": " + child.getTextContent());
            	}
            	//System.out.println(data);
            	if (data.get("subwayId").equals(String.valueOf(line))) {
            		data.put("subwayId", subwayInfo.getLine());
            		datas.add(data);
				}
            }	        
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return datas;
		
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
	public ArrayList<HashMap<String, Object>> loadSpotBySearch(String spot, HttpServletRequest req) {
		
		ArrayList<HashMap<String, Object>> datas = new ArrayList<>();
		
		if (spot.length() == 0) {
			return datas;
		}
	
		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
	
		try
		
		{
			String Path = req.getServletContext().getRealPath("/data-files/hotspot-data2.csv");
			fis = new FileInputStream(Path);
			isr = new InputStreamReader(fis);
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
	
	
	@GetMapping(path = { "/load-bikeInfo" })
	@ResponseBody
	public ArrayList<HashMap<String, Object>> loadBikeInfo(String spot) {
		
		ArrayList<HashMap<String, Object>> datas = new ArrayList<>();
		
		if (spot.length() == 0) {
			return datas;
		}
		
		String query = null;
		String key = "48666954566861653737614a476357";
		
		try {
				query = URLEncoder.encode(spot, "UTF-8");
		} catch (Exception e) {
		}
		
		try {	
			
			URL url = new URL("http://openapi.seoul.go.kr:8088/" + key + "/xml/citydata/1/5/"+query);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        
	        //System.out.println("Response code: " + conn.getResponseCode());
	        
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder = factory.newDocumentBuilder();
	        
	        Document doc = builder.parse(conn.getInputStream()); // xml 문자열 -> 객체 트리
	        
	        NodeList items = doc.getElementsByTagName("SBIKE_STTS");
	        
            for (int i = 0; i < items.getLength(); i++) {
            	Node item = items.item(i);
            	NodeList children = item.getChildNodes();
            	HashMap<String, Object> data = new HashMap<>(); // 한 편의 영화 저장 변수
            	for (int j = 0; j < children.getLength(); j++) {
            		Node child = children.item(j);
            		if (!child.getNodeName().equals("SBIKE_STTS")) {
            			data.put(child.getNodeName(), child.getTextContent());
					}
            	}
            	if (data.size() != 0) {
            		datas.add(data);
				}
            }
            
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return datas;
		
	}
	
	
	@GetMapping(path = { "/load-busInfoStn" })
	@ResponseBody
	public ArrayList<HashMap<String, Object>> loadBusInfoStn(String spot) {
		
		ArrayList<HashMap<String, Object>> datas = new ArrayList<>();
		
		if (spot.length() == 0) {
			return datas;
		}
		
		String query = null;
		String key = "48666954566861653737614a476357";
		
		try {
				query = URLEncoder.encode(spot, "UTF-8");
		} catch (Exception e) {
		}
		
		try {	
			
			URL url = new URL("http://openapi.seoul.go.kr:8088/" + key + "/xml/citydata/1/5/"+query);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        
	        //System.out.println("Response code: " + conn.getResponseCode());
	        
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder = factory.newDocumentBuilder();
	        
	        Document doc = builder.parse(conn.getInputStream()); // xml 문자열 -> 객체 트리
	        
	        NodeList items1 = doc.getElementsByTagName("BUS_STN_NM");
	        NodeList items2 = doc.getElementsByTagName("BUS_STN_X");
	        NodeList items3 = doc.getElementsByTagName("BUS_STN_Y");
	        
            for (int i = 0; i < items1.getLength(); i++) {
            	HashMap<String, Object> data = new HashMap<>();
            	
            	Node item1 = items1.item(i);
            	Node item2 = items2.item(i);
            	Node item3 = items3.item(i);
            	
            	data.put(item1.getNodeName(), item1.getTextContent());
            	data.put(item2.getNodeName(), item2.getTextContent());
            	data.put(item3.getNodeName(), item3.getTextContent());

        		datas.add(data);
            		
            }
            
            
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return datas;
		
	}
	
	
	@GetMapping(path = { "/load-busInfoDetail" })
	@ResponseBody
	public ArrayList<HashMap<String, Object>> loadBusInfoDetail(String spot, String stn) {
		
		ArrayList<HashMap<String, Object>> datas = new ArrayList<>();
		
		if (spot.length() == 0 || stn.length() == 0) {
			return datas;
		}
		
		String query = null;
		String key = "48666954566861653737614a476357";
		
		try {
				query = URLEncoder.encode(spot, "UTF-8");
		} catch (Exception e) {
		}
		
		try {	
			
			URL url = new URL("http://openapi.seoul.go.kr:8088/" + key + "/xml/citydata/1/5/"+query);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        
	        //System.out.println("Response code: " + conn.getResponseCode());
	        
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder = factory.newDocumentBuilder();
	        
	        Document doc = builder.parse(conn.getInputStream()); // xml 문자열 -> 객체 트리
	        
	        NodeList items = doc.getElementsByTagName("BUS_DETAIL");
	        
            for (int i = 0; i < items.getLength(); i++) {
            	Node item = items.item(i);
            	NodeList children = item.getChildNodes();
            	
            	HashMap<String, Object> data = new HashMap<>(); // 한 편의 영화 저장 변수
            	for (int j = 0; j < children.getLength(); j++) {
            		Node child = children.item(j);
            			data.put(child.getNodeName(), child.getTextContent());
            	}
            	
            	if (!data.containsKey("BUS_DETAIL")) {
            		
            		
            		if (data.get("RTE_STN_NM").equals(stn)) {
                		datas.add(data);
				} 
            		
				} else {
					if (i != 0) {
	            		i = items.getLength();
					}
            		
				}
            		
            }
            
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return datas;
		
	}
}
