package com.nantian.foo.web;

import com.nantian.foo.web.util.web.BaseInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class FooWebConfig extends WebMvcConfigurerAdapter{
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new BaseInterceptor())
				.addPathPatterns("/**/*.action")
				.excludePathPatterns("/**/*.do")
				.excludePathPatterns("/login.html")
				.excludePathPatterns("/login.action")
				.excludePathPatterns("/logOut.action")
				.excludePathPatterns("/mobile/findByCondition.action")
				.excludePathPatterns("/loanJournal/findByLoanId4Mobile.action")
				.excludePathPatterns("/login")
				.excludePathPatterns("loginPrompt.html")
				.excludePathPatterns("/");
		super.addInterceptors(registry);
	}

	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("forward:/login/login.html");
		registry.addViewController("/login.html").setViewName("forward:/login/login.html");
		registry.addViewController("/login").setViewName("forward:/login/login.html");
	}

	/*@Bean
	public EmbeddedServletContainerFactory servletContainer() {
		TomcatEmbeddedServletContainerFactory tomcat = new TomcatEmbeddedServletContainerFactory() {
			@Override
			protected void postProcessContext(Context context) {
				SecurityConstraint securityConstraint = new SecurityConstraint();
				securityConstraint.setUserConstraint("CONFIDENTIAL");
				SecurityCollection collection = new SecurityCollection();
				collection.addPattern("/*");
				securityConstraint.addCollection(collection);
				context.addConstraint(securityConstraint);
			}
		};

		tomcat.addAdditionalTomcatConnectors(initiateHttpConnector());
		return tomcat;
	}

	private Connector initiateHttpConnector() {
		Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
		connector.setScheme("http");
		//需要重定向的http端口
		connector.setPort(8080);
		connector.setSecure(false);
		//设置重定向到https端口
		connector.setRedirectPort(8443);
		return connector;
	}*/
}
