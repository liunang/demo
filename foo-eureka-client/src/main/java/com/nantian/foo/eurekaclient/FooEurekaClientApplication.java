package com.nantian.foo.eurekaclient;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@EnableEurekaClient
@SpringBootApplication
public class FooEurekaClientApplication {

    public static void main(String[] args) {
        SpringApplication.run(FooEurekaClientApplication.class, args);
    }
}
