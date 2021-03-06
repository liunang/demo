package com.nantian.foo.web.auth.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nantian.foo.web.auth.service.OrgService;
import com.nantian.foo.web.auth.vo.OrgTreeNode;
import com.nantian.foo.web.util.vo.GridData;
import com.nantian.foo.web.util.vo.LoginBean;
import com.nantian.foo.web.util.vo.ResultInfo;


@Controller
@RequestMapping("/org")
public class OrgController
{

	private static Logger log = LoggerFactory.getLogger(OrgController.class.getName());
	private OrgService orgService;
    @Autowired
    public OrgController(OrgService orgService) {
        this.orgService = orgService;
    }
	//private OrgTreeNode orgTreeNode = new OrgTreeNode();

	@RequestMapping("/checkIsRemoveOrg.action")
    @ResponseBody
	public ResultInfo checkIsRemoveOrg(OrgTreeNode orgTreeNode) throws Exception
	{
		ResultInfo resultInfo = new ResultInfo();
		try
		{
			orgService.checkIsRemoveOrg(Long.parseLong(orgTreeNode.getId()));
			//resultInfo.setData(resultInfo);
            resultInfo.setSuccess("true");
		}
		catch (Exception e)
		{
			log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
		}
		return resultInfo;
	}
	/**
	 * 新增机构信息
	 * 
	 * @throws Exception
	 */
	@RequestMapping("/addOrgInfo.action")
    @ResponseBody
	public ResultInfo addOrgInfo(HttpServletRequest request,OrgTreeNode orgTreeNode) throws Exception
	{
		ResultInfo resultInfo = new ResultInfo();
		try
		{
			LoginBean loginBean=(LoginBean)request.getSession().getAttribute("loginInfo");
			OrgTreeNode orgTreeNodeRet = orgService.addOrgInfo(orgTreeNode,loginBean);
			
			resultInfo.setData(orgTreeNodeRet);
            resultInfo.setSuccess("true");
		}
		catch (Exception e)
		{
			log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
		}
		return resultInfo;
	}

	/**
	 * 更新机构信息
	 * 
	 * @throws Exception
	 */
	@RequestMapping("/updateOrgInfo.action")
    @ResponseBody
	public ResultInfo updateOrgInfo(HttpServletRequest request,OrgTreeNode orgTreeNode) throws Exception
	{
		ResultInfo resultInfo = new ResultInfo();
		try
		{
			LoginBean loginBean=(LoginBean)request.getSession().getAttribute("loginInfo");
			OrgTreeNode orgTreeNodeRet = orgService.updateOrgInfo(orgTreeNode,loginBean);
			
			resultInfo.setData(orgTreeNodeRet);
            resultInfo.setSuccess("true");
			
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
		}
		return resultInfo;
	}

	/**
	 * 删除机构信息
	 * 
	 * @throws Exception
	 */
	@RequestMapping("/removeOrgInfo.action")
    @ResponseBody
	public ResultInfo removeOrgInfo(HttpServletRequest request,OrgTreeNode orgTreeNode) throws Exception
	{
		ResultInfo resultInfo = new ResultInfo();
		try
		{
			LoginBean loginBean=(LoginBean)request.getSession().getAttribute("loginInfo");
			orgService.removeOrgInfo(orgTreeNode,loginBean);
			//OrgPool.getInstance().syncRemove(orgTreeNode);
			//orgTreeNode.setAccessType(BmsConst.ACCESS_DELETE);
			resultInfo.setData(orgTreeNode);
            resultInfo.setSuccess("true");
		}
		catch (Exception e)
		{
			log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
		}
		return resultInfo;
	}
	
	/**
	 * 获得机构树
	 * 
	 * @throws Exception
	 */
	@RequestMapping("/getOrgTreeSync.action")
    @ResponseBody
	public ResultInfo getOrgTreeSync(HttpServletRequest request) throws Exception
	{
		ResultInfo resultInfo = new ResultInfo();
		try
		{
			
			Long userOrgId = ((LoginBean) request.getSession().getAttribute("loginInfo")).getOrgId();
			OrgTreeNode orgTreeNode = orgService.getApproveOrgTree(userOrgId);
			resultInfo.setData(orgTreeNode);
			resultInfo.setSuccess("true");
		}
		catch (Exception e)
		{
			log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
		}
		return resultInfo;
	}

	
	/**
	 * 获得某机构下已审批的机构信息列表
	 * 
	 * @throws Exception
	 */ 
	@RequestMapping("/queryApprovedOrgInfos.action")
    @ResponseBody
	public ResultInfo queryApprovedOrgInfos(int page, int size,OrgTreeNode orgTreeNode) throws Exception
	{
		ResultInfo resultInfo = new ResultInfo();
		try
		{
			GridData gridData = orgService.findByCondition(page,size,Long.parseLong(orgTreeNode.getId()));
			resultInfo.setNumber(gridData.getNumber());
			resultInfo.setData(gridData.getData());
			resultInfo.setSuccess("true");
			
		}
		catch (Exception e)
		{
			log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
		}
		return resultInfo;
	}

	@RequestMapping("/queryOrgInfo.action")
    @ResponseBody
	public ResultInfo queryOrgInfo(OrgTreeNode orgTreeNode) throws Exception
	{
		ResultInfo resultInfo = new ResultInfo();
		try
		{
			OrgTreeNode orgTreeNodeRet = orgService.queryOrgInfoById(Long.parseLong(orgTreeNode.getId()));
			resultInfo.setData(orgTreeNodeRet);
			resultInfo.setSuccess("true");
		}
		catch (Exception e)
		{
			log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
		}
		return resultInfo;
	}

	@RequestMapping("/getOrgTree.action")
    @ResponseBody
	public ResultInfo getOrgTree() throws Exception
	{
		ResultInfo resultInfo = new ResultInfo();
		try
		{
			OrgTreeNode orgTreeNode = orgService.getRootOrgTree();
			resultInfo.setData(orgTreeNode);
			resultInfo.setSuccess("true");
		}
		catch (Exception e)
		{
			log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
		}
		return resultInfo;
	}
	
	
	@RequestMapping("/queryOrgInfoByParentId.action")
    @ResponseBody
	public ResultInfo queryOrgInfoByParentId(HttpServletRequest request,OrgTreeNode orgTreeNode) throws Exception
	{
		ResultInfo resultInfo = new ResultInfo();
		try
		{
			
			Long userOrgId = ((LoginBean) request.getSession().getAttribute("loginInfo")).getOrgId();
			
			List<OrgTreeNode> list = orgService.queryOrgInfoByParentId(orgTreeNode.getId(),userOrgId);
			resultInfo.setData(list);
			resultInfo.setSuccess("true");
		}
		catch (Exception e)
		{
			log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
		}
		return resultInfo;
	}
}