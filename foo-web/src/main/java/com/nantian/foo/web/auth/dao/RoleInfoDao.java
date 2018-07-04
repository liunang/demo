package com.nantian.foo.web.auth.dao;

import java.util.List;

import com.nantian.foo.web.auth.entity.MenuAuth;
import com.nantian.foo.web.auth.entity.RoleInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import org.springframework.stereotype.Repository;

@Repository
public interface RoleInfoDao extends JpaRepository<RoleInfo, Long>, JpaSpecificationExecutor<RoleInfo> {

	
	@Query("select distinct(ai.authId) from AuthInfo ai order by ai.authId")
	public List<Long> findAllAuthIds();
	
	@Query("select distinct(ai.authId) from UserInfo ui,RoleInfo ri,UserRole ur,RoleAuth ra,AuthInfo ai "
			+ "where ui.userName=?1 and ur.userName=ui.userName and ur.roleId=ri.roleId and ri.roleId=ra.roleId and ra.authId=ai.authId")
	public List<Long> findAuthorityIdsByUserName(String userName);
	
	@Query("select distinct(ai.authId) from UserInfo ui,RoleInfo ri,UserRole ur,RoleAuth ra,AuthInfo ai "
			+ "where ui.userName=?1 and ur.userName=ui.userName and ur.roleId=ri.roleId and ri.roleId=ra.roleId and ra.authId=ai.authId")
	public List<MenuAuth> findMenuAuthorityAll();
	
	@Query("from RoleInfo ri where ri.roleName=?1")
	public List<RoleInfo> findByRoleName(String roleName);
	
	@Query("from RoleInfo ri where ri.roleCreator=?1")
	public List<RoleInfo> findRoleByCreator(String userName);
	
}
