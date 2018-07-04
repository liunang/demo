package com.nantian.foo.web.util.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bms_param")
public class Param implements Serializable {
	
	/*参数名称（英文）*/
	@Id
	@Column(name="param_name")
	private String paramName;
	/*参数值*/
	@Column(name="param_value")
	private String paramValue;
	/*参数名称（中文）*/
	@Column(name="param_desc")
	private String paramDesc;
	/*参数备注*/
	@Column(name="param_remark")
	private String paramRemark;
	// Constructors

	/** default constructor */
	public Param()
	{
	}

	/** minimal constructor */
	public Param(String paramName)
	{
		this.paramName = paramName;
	}

	/** full constructor */
	public Param(String paramName, String paramValue, String paramDesc,String paramRemark)
	{
		this.paramName = paramName;
		setParamValue(paramValue);
		setParamDesc(paramDesc);
		setParamRemark(paramRemark);
	}

	// Property accessors
	public String getParamName()
	{
		return this.paramName;
	}

	public void setParamName(String paramName)
	{
		this.paramName = paramName;
	}
	
	public String getParamValue()
	{
		return this.paramValue;
	}

	public void setParamValue(String paramValue)
	{
		this.paramValue = (paramValue!=null && paramValue.trim().length()>0)?paramValue:null;
	}
	
	public String getParamDesc()
	{
		return this.paramDesc;
	}

	public void setParamDesc(String paramDesc)
	{
		this.paramDesc = (paramDesc!=null && paramDesc.trim().length()>0)?paramDesc:null;
	}

	public String getParamRemark() {
		return paramRemark;
	}

	public void setParamRemark(String paramRemark) {
		this.paramRemark = paramRemark;
	}
	

}