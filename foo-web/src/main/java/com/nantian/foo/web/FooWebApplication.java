package com.nantian.foo.web;

import com.nantian.foo.web.util.dao.BaseDaoFactoryBean;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement //启注解事务管理
@EnableJpaRepositories(basePackages = {"com.nantian.foo.web"},
        repositoryFactoryBeanClass = BaseDaoFactoryBean.class)
@SpringBootApplication
public class FooWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(FooWebApplication.class, args);
    }
}
