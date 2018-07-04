package com.nantian.foo.web.util.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.nantian.foo.web.util.entity.Param;

public interface ParamDao extends JpaRepository<Param, String>,JpaSpecificationExecutor<Param>{

}
