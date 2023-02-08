package com.project_catmoa.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class CatInfoDto {

	private String catsId;
	private String characteristic;
	private int tnrYn;
	private String catNickname;
	private int colorCode;
	private int catGender;
	private String catImage; 
	private int localNo;
	private Date registerTime;
}
