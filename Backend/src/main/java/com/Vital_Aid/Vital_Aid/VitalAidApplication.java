package com.Vital_Aid.Vital_Aid;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication()
public class VitalAidApplication {
	public static void main(String[] args) {
		SpringApplication.run(VitalAidApplication.class, args);
	}

	// @Bean
	// public BCryptPasswordEncoder bCryptPasswordEncoder() {
	// return new BCryptPasswordEncoder();
	// }

}
