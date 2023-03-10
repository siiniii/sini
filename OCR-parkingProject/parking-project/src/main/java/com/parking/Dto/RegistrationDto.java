package com.parking.Dto;

import java.util.Date;

import lombok.Data;

@Data
public class RegistrationDto {
	private int indexNo;
	private String regCarNo;
	private String regInfo;
	private Date regDate;

}
