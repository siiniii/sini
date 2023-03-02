package com.project_catmoa.dto;

import java.util.List;

import lombok.Data;

@Data
public class ReportBoardDto extends BoardDto {

	private String characteristic;
	private int tnrYn;
	private String catNickname;
	private int colorCode;
	private int localNo;
	private int catGender;
	
	private int catMonth;
	private int catHour;
	private int catDay;
	
	
	private List<ReportAttachDto> reportAttachments;
	
}
