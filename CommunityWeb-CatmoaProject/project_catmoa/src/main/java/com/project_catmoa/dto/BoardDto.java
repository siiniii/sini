package com.project_catmoa.dto;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardDto {
	
		private int boardNo;
		private String boardTitle;
		private int readCount;
		private int boardGroupNo;
		private Date writeTime;
		private String report;
		private String userId;
		private String boardContent;
		private boolean boardDeleted;
		
		private List<BoardAttachDto> boardAttachments;
		
		private List<BoardCommentDto> comments;
}
