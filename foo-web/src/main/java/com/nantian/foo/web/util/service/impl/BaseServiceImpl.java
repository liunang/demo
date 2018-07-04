package com.nantian.foo.web.util.service.impl;

import com.nantian.foo.web.util.pools.BaseObjPool;
import com.nantian.foo.web.util.service.BaseService;
import org.springframework.stereotype.Service;

@Service
public class BaseServiceImpl implements BaseService {

    @Override
    public void baseDataInit() {
        try {
            if (BaseObjPool.getApplicationStatus() == BaseObjPool.APPLICATION_DATAINIT) {
                BaseObjPool.setApplicationStatus(BaseObjPool.APPLICATION_NORMAL);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
