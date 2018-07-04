package com.nantian.foo.web.auth.service;


import com.nantian.foo.web.auth.entity.RoleInfo;
import com.nantian.foo.web.auth.vo.RoleBean;
import com.nantian.foo.web.util.ServiceException;
import com.nantian.foo.web.util.vo.CheckTreeNode;
import com.nantian.foo.web.util.vo.LoginBean;
import org.springframework.data.domain.Page;

public interface RoleInfoService {
    /**
     * 通过角色id查询
     *
     * @param roleId
     * @return RoleBean
     * @throws ServiceException
     */
    public RoleBean findById(Long roleId) throws ServiceException;

    /**
     * 添加角色，并关联添加role_auth
     *
     * @param roleBean
     * @return RoleBean
     * @throws ServiceException
     */
    public RoleBean addRoleInfo(RoleBean roleBean, LoginBean loginBean) throws ServiceException;

    /**
     * 更新角色信息
     *
     * @param roleBean
     * @return RoleBean
     * @throws ServiceException
     */
    public RoleBean updateRoleInfo(RoleBean roleBean) throws ServiceException;

    /**
     * 删除角色
     *
     * @param roleBean
     * @throws ServiceException
     */
   public void delRoleInfo(RoleBean roleBean) throws ServiceException;

    /**
     * 根据条件分页查询角色信息
     *
     * @param page int
     * @param size int
     * @param roleBean RoleBean
	 * @param loginBean LoginBean
     * @return Page<RoleInfo>
     * @throws ServiceException ServiceException
     */
    public Page<RoleInfo> findByCondition(int page, int size, RoleBean roleBean, LoginBean loginBean) throws ServiceException;
    
    /**
	 * 获取角色对应编辑的权限树
	 * @param roleId 角色ID
	 * @return CheckTreeNode 权限树
	 */
	public CheckTreeNode loadAuthorityCheckTree(LoginBean loginBean, Long roleId) throws ServiceException;
	
	/**
	 * 角色编辑前，查询授权和获取角色信息
	 * 
	 * @param roleId 角色ID
	 * @param loginBean 编辑者信息
	 * @return RoleBean
	 */
	public RoleBean beforeUpdateRole(LoginBean loginBean, Long roleId) throws ServiceException;
	
	
	/**
	 * 判断是否可以删除角色
	 * @param roleBean RoleBean 角色信息
	 * @param loginBean LoginBean 编辑者信息
	 */
	public void checkCanRemoveRole(RoleBean roleBean, LoginBean loginBean) throws ServiceException;
	
	public void findIsExitRoleByCreator(String userName) throws ServiceException, com.nantian.foo.web.util.ServiceException;
}
