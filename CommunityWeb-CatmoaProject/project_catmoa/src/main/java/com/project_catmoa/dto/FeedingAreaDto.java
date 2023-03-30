package com.project_catmoa.dto;

import lombok.Data;

@Data
public class FeedingAreaDto {

	private int localNo;
	private String city;
	private String gu;
	private String area;
	private double lat;
	private double lng;
}
