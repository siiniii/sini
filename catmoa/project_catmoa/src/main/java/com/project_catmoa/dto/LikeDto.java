package com.project_catmoa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class LikeDto {
	public int boardNo;
	public String userId;
	public Date likeDate;
}
