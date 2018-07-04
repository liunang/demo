package com.nantian.foo.web.auth.dao;

import com.nantian.foo.web.auth.entity.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import org.springframework.stereotype.Repository;

@Repository
public interface UserInfoDao extends JpaRepository<UserInfo, String>,JpaSpecificationExecutor<UserInfo>{
//    public  UserInfo findFirstByUserType(String userType);
//    
//    public  List<UserInfo> findByUserType(String userType);
}
