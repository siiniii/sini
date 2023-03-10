package com.parking;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@EntityScan(basePackages = { "com.parking.entity" })
@SpringBootApplication
public class ParkingProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(ParkingProjectApplication.class, args);
	}

}
