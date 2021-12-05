package com.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = { "com.app" })
public class EventManagementApplication {

	public static void main(String[] arg) {
		SpringApplication.run(EventManagementApplication.class, arg);
	}

}
