package com.project_catmoa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardCommentDto {

	private int commentNo;
	private String content;
	private String userId;
	private int boardNo;
	private Date regDate;
	private boolean deleted;
	
	private int groupno;
	private int step;
	private int depth;
	

	
}
