package com.project_catmoa.dto;

import lombok.Data;

@Data
public class BoardAttachDto {
	private int attachmentNo;
	private int boardNo;
	private int boardGroupNo;
	private String userFileName;
	private String savedFileName;
}
