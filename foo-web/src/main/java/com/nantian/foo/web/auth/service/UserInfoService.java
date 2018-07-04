package com.nantian.foo.web.auth.service;

import com.nantian.foo.web.util.ServiceException;
import com.nantian.foo.web.util.vo.GridData;
import com.nantian.foo.web.util.vo.LoginBean;

import java.util.List;

import com.nantian.foo.web.auth.entity.UserInfo;
import com.nantian.foo.web.auth.vo.UserBean;

public interface UserInfoService {
    /**
     * 通过用户名查询
     *
     * @param userName
     * @return UserBean
     * @throws ServiceException
     */
    public UserBean findByUserName(String userName, LoginBean loginBean) throws ServiceException;

    /**
     * 添加用户，并关联添加user_role
     *
     * @param userBean
     * @return UserBean
     * @throws ServiceException
     */
    public UserBean addUserInfo(UserBean userBean, LoginBean loginBean) throws ServiceException;

    /**
     * 更新用户信息
     *
     * @param userBean
     * @return UserBean
     * @throws ServiceException
     */
    public UserBean updateUserInfo(UserBean userBean, LoginBean loginBean) throws ServiceException;

    /**
     * 删除用户
     *
     * @param userBean
     * @throws ServiceException
     */
    public void delUserInfo(UserBean userBean, LoginBean loginBean) throws ServiceException;

    /**
     * 根据条件分页查询用户信息
     *
     * @param page
     * @param size
     * @param userBean
     * @return
     * @throws ServiceException
     */
    public GridData<UserBean> findByCondition(int page, int size, UserBean userBean, LoginBean loginBean) throws ServiceException;
    
    /**
	 * 重置密码
	 * @param userBean
	 * @return
	 * @throws ServiceException
	 */
	public UserBean resetUserPwd(UserBean userBean, LoginBean loginBean) throws ServiceException;
	public boolean queryIsInitPw(LoginBean loginBean) throws ServiceException;
	
	/**
	 * 个人信息修改
	 * @param userBean UserBean 用户信息
	 * @param userName String 登录用户名
	 * @param logBean 
	 * @return UserBean
	 */
	public UserBean updateUserSelf(UserBean userBean, String userName) throws ServiceException;
	
	
	public List<UserInfo> queryUserOptions(String loginUserName, String roleName) throws ServiceException ;
}
