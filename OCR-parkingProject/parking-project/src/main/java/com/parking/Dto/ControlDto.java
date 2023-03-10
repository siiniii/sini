package com.parking.Dto;

import java.util.Date;

import lombok.Data;

@Data
public class ControlDto {
	private int no;
	private String carNo;
	private Date enterTime;
	private Date exitTime;
	private Boolean reg;
}
