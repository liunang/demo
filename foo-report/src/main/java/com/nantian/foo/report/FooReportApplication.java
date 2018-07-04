package com.nantian.foo.report;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class FooReportApplication implements CommandLineRunner {

    public static void main(String[] args) {
        SpringApplication.run(FooReportApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {

    }
}
