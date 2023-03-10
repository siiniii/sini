package com.parking.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.parking.Dto.RegistrationDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "reg_info")
public class RegistrationEntity {

	public RegistrationEntity(RegistrationDto regDto) {
		this.regCarNo = regDto.getRegCarNo();
		this.regInfo = regDto.getRegInfo();
	}

	public RegistrationDto exportRegistrationDto() {
		RegistrationDto regDto = new RegistrationDto();
		regDto.setRegCarNo(regCarNo);
		regDto.setRegInfo(regInfo);
		regDto.setRegDate(regDate);

		return regDto;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int indexNo;

	@Column(nullable = false)
	private String regCarNo;

	@Column(nullable = false)
	private String regInfo;

	@Builder.Default
	@Column
	private Date regDate = new Date();



}

















