package com.project_catmoa.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class DonateDto {
	private String donationSum;
	private Date donationDate;
	
	private String userId;
	private int donationNo;
}
