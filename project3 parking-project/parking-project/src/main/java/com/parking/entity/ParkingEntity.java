package com.parking.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.parking.Dto.ParkingDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "parking_info")
public class ParkingEntity {

	public ParkingEntity(ParkingDto parkingDto) {
		this.indexNo = parkingDto.getIndexNo();
		this.carNo = parkingDto.getCarNo();
		this.parkingType = parkingDto.getParkingType();
		this.exitTime = parkingDto.getExitTime();
	}

	public ParkingDto exportParkingDto() {
		ParkingDto parkingDto = new ParkingDto();
		parkingDto.setIndexNo(indexNo);
		parkingDto.setCarNo(carNo);
		parkingDto.setParkingType(parkingType);
		parkingDto.setEnterTime(enterTime);
		parkingDto.setExitTime(exitTime);

		return parkingDto;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int indexNo;

	@Column (nullable = false)
	private String carNo;

	@Builder.Default
	@Column (nullable = false)
	private String parkingType = "일반방문차량";
	
	@Builder.Default
	@Column
	private Date enterTime = new Date();

	@Column
	private Date exitTime;



}

















