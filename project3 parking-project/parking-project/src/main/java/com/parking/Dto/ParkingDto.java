package com.parking.Dto;

import java.util.Date;

import lombok.Data;

@Data
public class ParkingDto {
	private int indexNo;
	private String carNo;
	private String parkingType;
	private Date enterTime;
	private Date exitTime;
}
