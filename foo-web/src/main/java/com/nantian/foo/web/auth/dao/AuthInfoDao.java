package com.nantian.foo.web.auth.dao;

import com.nantian.foo.web.auth.entity.AuthInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;


public interface AuthInfoDao extends JpaRepository<AuthInfo, Long>, JpaSpecificationExecutor<AuthInfo> {

}
