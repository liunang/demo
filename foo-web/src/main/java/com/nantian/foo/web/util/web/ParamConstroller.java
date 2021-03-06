package com.nantian.foo.web.util.web;

import com.nantian.foo.web.util.entity.Param;
import com.nantian.foo.web.util.service.ParamService;
import com.nantian.foo.web.util.vo.ParamBean;
import com.nantian.foo.web.util.vo.ResultInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@RequestMapping(value = "/param")
@Controller
public class ParamConstroller
{
	private static Logger log = LoggerFactory.getLogger(ParamConstroller.class.getName());
	
	private final ParamService paramService;

	@Autowired
	public ParamConstroller(ParamService paramService) {
		this.paramService = paramService;
	}

	@RequestMapping("/findParam.action")
	@ResponseBody
	public ResultInfo findParam(int page, int size, Param param)
	{
		ResultInfo resultInfo = new ResultInfo();
		try {
            Page<Param> pages = paramService.findParamByCondition(page, size,param);
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
	
	@RequestMapping("/addParam.action")
	@ResponseBody
	public ResultInfo addParam(Param param)
	{
		ResultInfo resultInfo = new ResultInfo();
		try
		{
			Param paramRet = paramService.addParam(param);
			resultInfo.setData(paramRet);
			resultInfo.setSuccess("true");
		} 
		catch (Exception e) {
			log.error(e.getMessage());
			resultInfo.setSuccess("false");
			resultInfo.setData(e.getMessage());
		}
		return resultInfo;
	}
	
	@RequestMapping("/findParamById.action")
	@ResponseBody
	public ResultInfo findParamById(Param param)
	{
		ResultInfo resultInfo = new ResultInfo();
		try
		{
			Param paramRet =paramService.findParamById(param.getParamName());
			resultInfo.setData(paramRet);
			resultInfo.setSuccess("true");
		} 
		catch (Exception e) {
			log.error(e.getMessage());
			resultInfo.setSuccess("false");
			resultInfo.setData(e.getMessage());
		}
		return resultInfo;
	}
	
	@RequestMapping("/updateParam.action")
	@ResponseBody
	public ResultInfo updateParam(Param param)
	{
		ResultInfo resultInfo = new ResultInfo();
		try
		{
			Param paramRet=paramService.updateParam(param);
			resultInfo.setData(paramRet);
			resultInfo.setSuccess("true");
		} 
		catch (Exception e) {
			log.error(e.getMessage());
			resultInfo.setSuccess("false");
			resultInfo.setData(e.getMessage());
		}
		return resultInfo;
	}
	
	@RequestMapping("/removeParam.action")
	@ResponseBody
	public ResultInfo removeParam(Param param)
	{
		ResultInfo resultInfo=new ResultInfo();
		try
		{
			paramService.removeParam(param.getParamName());
			resultInfo.setData(param);
			resultInfo.setSuccess("true");
		} 
		catch (Exception e) {
			log.error(e.getMessage());
			resultInfo.setSuccess("false");
			resultInfo.setData(e.getMessage());
		}
		return resultInfo;
	}
	
	@RequestMapping("/removeParams.action")
	@ResponseBody
	public ResultInfo removeParams(ParamBean paramBean)
	{
		ResultInfo resultInfo=new ResultInfo();
		try
		{
			paramService.removeParams(paramBean.getParamNames());
			resultInfo.setData(paramBean);
			resultInfo.setSuccess("true");
		} 
		catch (Exception e) {
			log.error(e.getMessage());
			resultInfo.setSuccess("false");
			resultInfo.setData(e.getMessage());
		}
		return resultInfo;
	}
}
