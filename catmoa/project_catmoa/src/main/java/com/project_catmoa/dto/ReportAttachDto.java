package com.project_catmoa.dto;

import lombok.Data;

@Data
public class ReportAttachDto {
	
	private int reportFileNo;
	private int boardNo;
	private int boardGroupNo;
	private String userFileName;
	private String savedFileName;
	
}
