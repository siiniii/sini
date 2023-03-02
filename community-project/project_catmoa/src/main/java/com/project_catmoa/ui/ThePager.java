package com.project_catmoa.ui;

public class ThePager {
	
	private int pageSize;//한 페이지당 데이터 개수
	private int pagerSize;//번호로 보여주는 페이지 Link 개수
	private int dataCount;//총 데이터 수
	
	private int pageNo;//현재 페이지 번호
	private int pageCount;//총 페이지 수
	
	private String linkUrl;//페이저가 포함되는 페이지의 주소
	
	
	public ThePager(int dataCount, int pageNo, 
		int pageSize, int pagerSize, String linkUrl) {
		
		this.linkUrl = linkUrl;
		
		this.dataCount = dataCount;
		this.pageSize = pageSize;
		this.pagerSize = pagerSize;
		this.pageNo = pageNo;		
		pageCount = 
			(dataCount / pageSize) + ((dataCount % pageSize) > 0 ? 1 : 0); 
	}
	
	public String toString(){
		StringBuffer linkString = new StringBuffer(2048);
		
		//1. 처음, 이전 항목 만들기
		
		linkString.append("<ul class='paginationz'>");
		linkString.append("<li class='prev'>");
		linkString.append("&nbsp;");
		if (pageNo > 1) {
			linkString.append(String.format(
				"<a title='' href='%s?pageNo=%d'><i class='fa fa-angle-left'></i></a></li>", linkUrl, pageNo - 1));
			linkString.append("&nbsp;");
		} else {
			linkString.append(String.format(
					"<a title='' href='#'><i class='fa fa-angle-left'></i></a></li>", linkUrl, pageNo - 1));
			linkString.append("&nbsp;");
		}
		
		//2. 페이지 번호 Link 만들기
		
		int pagerBlock = (pageNo - 1) / pagerSize;
		int start = (pagerBlock * pagerSize) + 1;
		int end = start + pagerSize;
		for (int i = start; i < end; i++) {
			if (i > pageCount) break;
			if(i == pageNo) {
				linkString.append(String.format("<li><a title='' href='#' class='active'>%02d</a></li>", i));
				linkString.append("&nbsp;");
			} else { 
				linkString.append(String.format(
					"<li><a title='' href='%s?pageNo=%d'>%02d</a></li>", linkUrl, i, i));
				linkString.append("&nbsp;");
			}
		}
		
		//3. 다음, 마지막 항목 만들기
		
		linkString.append("<li class='next'>");
		if (pageNo < pageCount) {
			linkString.append(String.format(
				"<a title='' href='%s?pageNo=%d'><i class='fa fa-angle-right'></i></a></li>", linkUrl, pageNo + 1));
			linkString.append("&nbsp;");
		} else {
			linkString.append(String.format(
					"<a title='' href='#'><i class='fa fa-angle-right'></i></a></li>", linkUrl, pageNo + 1));
			linkString.append("&nbsp;");
		}
		linkString.append("</ul>");
		
		return linkString.toString();
	}

}













