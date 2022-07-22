package com.reportMicroService;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class ReportMicroServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(ReportMicroServiceApplication.class, args);
	}

}