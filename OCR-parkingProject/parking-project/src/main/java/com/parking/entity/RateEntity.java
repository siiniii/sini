package com.parking.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.parking.Dto.RateDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "rate")
public class RateEntity {

	public RateEntity(RateDto rateDto) {
		this.customerRate = rateDto.getCustomerRate();
		this.visitorRate = rateDto.getVisitorRate();
		this.residentRate = rateDto.getResidentRate();
	}

	public RateDto exportRegistrationDto() {
		RateDto rateDto = new RateDto();
		rateDto.setVisitorRate(visitorRate);
		rateDto.setCustomerRate(customerRate);
		rateDto.setResidentRate(residentRate);

		return rateDto;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int indexNo;

	@Column (nullable = false)
	private int visitorRate;

	@Builder.Default
	@Column (nullable = false)
	private int customerRate = 0;

	@Builder.Default
	@Column (nullable = false)
	private int residentRate = 0;


}

















