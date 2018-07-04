package com.nantian.foo.web.util.pools;

import com.nantian.foo.web.util.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class BaseTaskServer {

	private BaseService baseService;

	@Autowired
	public BaseTaskServer(BaseService baseService){
		this.baseService = baseService;
	}

	@PostConstruct
	public void init() {
		baseService.baseDataInit();
	}
}
