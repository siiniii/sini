package com.reactTeam3.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reactTeam3.dto.News;

@Controller
@RequestMapping(path = { "/news" })
public class NewsController {
	
	
	@GetMapping(path = { "/load-news" })
	@ResponseBody
	public ArrayList<HashMap<String, Object>> loadNews(News newsInfo) {
		
		ArrayList<HashMap<String, Object>> newsList = new ArrayList<>();
		int number = newsInfo.getStart();
		String query = null;
		
        try {
        	query = URLEncoder.encode(newsInfo.getQuery(), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
		try {
			String url = "https://search.naver.com/search.naver?where=news&sm=tab_pge&query=" + query + 
					"&sort=0&photo=0&field=0&pd=0&ds=&de=&cluster_rank=59&mynews=0&office_type=0&office_section_code=0&news_office_checked=&nso=so:r,p:all,a:all&start="+number;
			org.jsoup.nodes.Document doc = Jsoup.connect(url).get();
			
			Elements dls = doc.select(".api_ani_send");
			// System.out.println(dls.size());
			
			
			for (Element dl : dls) {
				HashMap<String, Object> news = new HashMap<>();
				Elements dts = dl.select(".news_area .news_tit");
				news.put("link", dts.attr("href"));
				news.put("title", dts.attr("title"));
				dts = dl.select(".news_area .news_dsc .dsc_wrap");
				news.put("desc", dts.select("a").text());
				
				newsList.add(news);
			}
			
		} catch (Exception ex) {
			
		} finally {
			
		}
		
		return newsList;
		
	}

}
