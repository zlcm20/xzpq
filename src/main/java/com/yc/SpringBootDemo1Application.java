package com.yc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class SpringBootDemo1Application {
    public static void main(String[] args) {
        SpringApplication.run(SpringBootDemo1Application.class, args);
    }
}
