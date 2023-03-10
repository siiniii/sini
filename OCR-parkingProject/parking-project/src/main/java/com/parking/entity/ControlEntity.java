package com.parking.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.parking.Dto.ControlDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="car_control")
public class ControlEntity {

	public ControlEntity(ControlDto controlDto) {
		this.no = controlDto.getNo();
		this.carNo = controlDto.getCarNo();
		this.enterTime = controlDto.getEnterTime();
		this.exitTime = controlDto.getExitTime();
		this.reg = controlDto.getReg();
	}

	public ControlDto exportControlDto() {
		ControlDto controlDto = new ControlDto();

		controlDto.setNo(no);
		controlDto.setCarNo(carNo);
		controlDto.setEnterTime(enterTime);
		controlDto.setExitTime(exitTime);
		controlDto.setReg(reg);

		return controlDto;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int no;

	@Column(nullable = false)
	private String carNo;

	@Builder.Default
	@Column(nullable = false)
	private Date enterTime = new Date();

	@Column(nullable = true)
	private Date exitTime;

	@Column(nullable = false)
	private boolean reg;

}
