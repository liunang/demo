package com.nantian.foo.web.auth.web;

import com.nantian.foo.web.auth.entity.RoleInfo;
import com.nantian.foo.web.auth.service.RoleInfoService;
import com.nantian.foo.web.auth.vo.RoleBean;
import com.nantian.foo.web.util.vo.CheckTreeNode;
import com.nantian.foo.web.util.vo.LoginBean;
import com.nantian.foo.web.util.vo.ResultInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/role")
public class RoleInfoController {
    private static Logger log = LoggerFactory.getLogger(RoleInfoController.class);
    private RoleInfoService roleInfoService;

    public RoleInfoController(RoleInfoService roleInfoService) {
        this.roleInfoService = roleInfoService;
    }

   

    @RequestMapping("/findById.action")
    @ResponseBody
    private ResultInfo findById(RoleBean roleBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
            Long roleId = roleBean.getRoleId();
            RoleBean roleBeanRet = roleInfoService.findById(roleId);
            resultInfo.setSuccess("true");
            resultInfo.setData(roleBeanRet);
        } catch (Exception e) {
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }

    @RequestMapping("/findByCondition.action")
    @ResponseBody
    private ResultInfo findByCondition(HttpServletRequest request, int page, int size, RoleBean roleBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
            HttpSession session = request.getSession();
            LoginBean loginBean = (LoginBean) session.getAttribute("loginInfo");
            Page<RoleInfo> pages = roleInfoService.findByCondition(page, size, roleBean, loginBean);
            resultInfo.setData(pages.getContent());
            resultInfo.setNumber(pages.getTotalElements());
            resultInfo.setPage(pages.getNumber());
            resultInfo.setTotalPage(pages.getTotalPages());
            resultInfo.setSuccess("true");
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }

    @RequestMapping("/addRole.action")
    @ResponseBody
    private ResultInfo addRole(HttpServletRequest request,RoleBean roleBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
        	 HttpSession session = request.getSession();
          	LoginBean loginBean=(LoginBean)session.getAttribute("loginInfo");
            RoleInfo roleInfo = roleInfoService.addRoleInfo(roleBean,loginBean);
            resultInfo.setSuccess("true");
            resultInfo.setData(roleInfo);
        } catch (Exception e) {
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }

    @RequestMapping("/updateRole.action")
    @ResponseBody
    private ResultInfo updateRole(RoleBean roleBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
        	RoleBean roleBeanRet = roleInfoService.updateRoleInfo(roleBean);
            resultInfo.setSuccess("true");
            resultInfo.setData(roleBeanRet);
        } catch (Exception e) {
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }

    @RequestMapping("/delRole.action")
    @ResponseBody
    private ResultInfo delRole(RoleBean roleBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
            roleInfoService.delRoleInfo(roleBean);
            resultInfo.setSuccess("true");
        } catch (Exception e) {
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }
    
    @RequestMapping("/loadAuthorityCheckTree.action")
    @ResponseBody
    private ResultInfo loadAuthorityCheckTree(HttpServletRequest request,RoleBean roleBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
        	 HttpSession session = request.getSession();
        	LoginBean loginBean=(LoginBean)session.getAttribute("loginInfo");
        	CheckTreeNode checkTreeNode = roleInfoService.loadAuthorityCheckTree(loginBean,roleBean.getRoleId());
            resultInfo.setData(checkTreeNode);
           
            resultInfo.setSuccess("true");
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }
    
    
    @RequestMapping("/beforeUpdateRole.action")
    @ResponseBody
    private ResultInfo beforeUpdateRole(HttpServletRequest request,RoleBean roleBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
        	 HttpSession session = request.getSession();
        	LoginBean loginBean=(LoginBean)session.getAttribute("loginInfo");
        	RoleBean roleBeanRet=roleInfoService.beforeUpdateRole(loginBean,roleBean.getRoleId());
            resultInfo.setData(roleBeanRet);
           
            resultInfo.setSuccess("true");
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }
    
    
    @RequestMapping("/checkCanRemoveRole.action")
    @ResponseBody
    private ResultInfo checkCanRemoveRole(HttpServletRequest request,RoleBean roleBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
        	 HttpSession session = request.getSession();
        	LoginBean loginBean=(LoginBean)session.getAttribute("loginInfo");
        	roleInfoService.checkCanRemoveRole(roleBean,loginBean);
            resultInfo.setData(roleBean.getAuthIds());
           
            resultInfo.setSuccess("true");
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }
    @RequestMapping("/isExitRoleByCreator.action")
    @ResponseBody
    public ResultInfo isExitRoleByCreator(RoleBean roleBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
        	
        	roleInfoService.findIsExitRoleByCreator(roleBean.getRoleCreator());
        	resultInfo.setData(roleBean.getRoleCreator());
           
            resultInfo.setSuccess("true");
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }
    
}
