package com.project_catmoa.dto;

import java.util.List;

import lombok.Data;

@Data
public class FeedingBoardDto extends BoardDto {

	private int boardNo;
	private String feedingContent;
	private int catsId;
	private int localNo;
	
	private List<BoardAttachDto> boardAttachments;
	
}
