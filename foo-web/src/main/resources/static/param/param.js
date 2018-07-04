//查询参数信息
var queryGridUrl = "../param/findParam.action";
//添加参数
var addDataUrl = "../param/addParam.action"; 
//修改参数
var editDataUrl = "../param/updateParam.action";
//删除参数
var removeDataUrl = "../param/removeParam.action";
//批量删除参数
var removesDataUrl = "../param/removeParams.action";
//查询参数详细信息
var querDetialUrl = "../param/findParamById.action";

var nowOperate;
var store_old={};
var store_new={};
function compareStore(){
	var returnValue=1;
	$.each(store_new,function(key,ele){
		var valueOld=store_old[key];
		if(ele!=valueOld){
			returnValue=0;
		}
	   }
	);
	return returnValue;
}

function sortArr(arr){
	for(var i=0;i<arr.length;i++){
		for(var j=i+1;j<arr.length;j++){
			if(arr[i]>arr[j]){
				var temp=arr[i];
				arr[i]=arr[j];
				arr[j]=temp;
			}
		}
	}
	return arr;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$(function(){
	window.checkForm.openFun().init({path:webPath,form:'addOrEditForm'}); 
	$("#addBtn").click(function(){
		nowOperate = "add";
		$("#action").html('新增参数');
		showModel(nowOperate);
	});
	
	$("#removeOfNumbersBtn").click(function(){
		var param = getRemoveDataOfNumbersParam();
		if(param!=undefined){
			removeDataOfNumbers(param);
		}
	});
	
	
	$("#addOrEditSaveBtn").click(function(){
		var returnValue=window.checkForm.openFun().onSubmit();
		if(nowOperate=="add"&&returnValue ){
			var param = getAddParam();
			if(param!=undefined){
				addData(param);
			}
		}else if(nowOperate=="edit"&&returnValue ){
			var param = getEditParam();
			if(param!=undefined){
				var returnValue=compareStore();
				if(returnValue==0){
					if(param!=null){
						editData(param);
					}
				}else{
					util.sysAlert("您尚未更改任何内容，保存失败！");
				}
			}
		}

	});
	
	$("#queryGridBtn").click(function(){
		loadData();
	});
	
	loadData();	
	
});

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/**
 * 加载数据
 */
var loadData = function(){
	var headParam = [];
	headParam.push("paramName");
	headParam.push("paramDesc");
	headParam.push("paramValue");
	headParam.push("paramRemark");
	
	var url = queryGridUrl;
	
	var defaultBtns = {"viewBtn":"hide","editBtn":"show","removeBtn":"hidden"};
	var operateBtns = [];
	var querParam = getQueryGridParam();
	var gridObj = {};
	gridObj["url"] = url;
	gridObj["headParam"] = headParam;
	gridObj["queryParam"] = querParam;
	gridObj["defaultBtns"] = defaultBtns;
	gridObj["operateBtns"] = operateBtns;
	gridObj["pk"] = "paramName";
	gridObj["page"] = true;
	
	var nTGridBean = new NTGridBean();
	nTGridBean.init(gridObj);
	nTGridBean.loadGrid();
};

/**
 * 获得查询列表参数
 */
var getQueryGridParam = function(){
	var Qname = $("#query_paramName").val();
	var param = {
		'paramName' : Qname
	};
	return param;
};


/**
 * 获得pk
 */
var getPk = function(btn){
	var pk = $(btn).parent().parent().parent().attr("pk");
	return pk;
};


/**
 * 显示模态框
 */
var  showModel = function(nowOperate){
	resetAddOrEditForm();
	$("#addOrEditModal").modal("show");
	if(nowOperate=="edit"){
		$("#addParamName").attr("disabled",true);
	}
	else{
		$("#addParamName").attr("disabled",false);
	}
	
};
/**
 * 关闭模态框
 */
var hideModel = function(){
	$("#addOrEditModal").modal("hide");
};

/**
 * 清空form
 */
var resetAddOrEditForm = function(){
	$("#addOrEditForm")[0].reset();
	$('span[id="errormsg"]').remove();
};

/**
 * 新增或修改成功之后的事件
 * @return
 */
var addOrEditCompleteFun = function(){
	hideModel();
	loadData();
};



/**
 * 新增
 * @return
 */
var addData = function(param){
	operateUtil.addData(addDataUrl,param,addOrEditCompleteFun);
};

/**
 * 详细
 */
var viewData = function(param,viewSuccessFun){
	operateUtil.viewData(querDetialUrl,param,viewSuccessFun);
};

/**
 * 编辑
 */
var editData = function(param){
	operateUtil.editData(editDataUrl,param,addOrEditCompleteFun);
};

/**
 * 删除
 */
var removeData = function(param){
	operateUtil.removeData(removeDataUrl,param,addOrEditCompleteFun);
};

/**
 * 批量删除
 */
var removeDataOfNumbers = function(param){
	operateUtil.removeData(removesDataUrl,param,addOrEditCompleteFun);
	
};


/**
 * 删除
 */
var removeBtn = function(btn){
	var pk = getPk(btn);
	var param = {"paramName":pk};
	removeData(param);
};

/**
 * 获得批量删除的参数
 * @return
 */
var getRemoveDataOfNumbersParam = function(){
	var checkboxs = $("#table").find("tbody").find("input[type='checkbox']");
	var pks = new Array();
	
	$(checkboxs).each(function(index,ele){
		if($(this).is(":checked")){
			var pk = getPk($(this).parent());
			pks.push(pk);
		}
	});

	if(pks.length>0){
		var param="{";
		for(var i=0;i<pks.length;i++)
			{
				param=param+('\"paramNames['+i+']\":\"'+pks[i]+'\",');
			}
		param = param.substring(0, param.length - 1);
		param += '}';
		param=util.str2Json(param);
		//var param = {"paramNames":pks};
		return param;
	}
	else{
		util.sysTips("请选择需要删除的数据！ ","selectremove");
	}
};


/**
 * 编辑回填
 */
var editDataFill=function(pk){
	var param = {"paramName":pk};
	viewData(param,dataFill);
};

/**
 * 编辑
 */
var editBtn = function(btn){
	nowOperate = "edit";
	$("#action").html('编辑参数');
	showModel(nowOperate);
	var pk = getPk(btn);
	editDataFill(pk);
};

/**
 * 详情
 */
var viewBtn = function(btn){
	
};

/**
 * 获得增加的参数
 * @return
 */
var getAddParam = function(){
	var add_name = $("#addParamName").val();
	var add_value = $("#addParamValue").val();
	var add_desc = $("#addParamDesc").val();
	var add_remark = $("#addParamRemark").val();
	/*var param='{'
	param=param+('\"paramName\":\"'+add_name+ '\",');
	param=param+('\"paramValue\":\"'+add_value+ '\",');
	param=param+('\"paramDesc\":\"'+add_desc+ '\",');
	param=param+('\"paramRemark\":\"'+add_remark+ '\",');
	param = param.substring(0, param.length - 1);
	param += '}';
	param=str2Json(param);*/
	var param = {
		'paramName' : add_name,
		'paramValue' : add_value,
		'paramDesc' : add_desc,
		'paramRemark' : add_remark
	};
	return param;
};

/**
 * 获得编辑的参数
 * @return
 */
var getEditParam = function(){
	var add_name = $("#addParamName").val();
	var add_value = $("#addParamValue").val();
	var add_desc = $("#addParamDesc").val();
	var add_remark = $("#addParamRemark").val();
	/*var param='{'
	param=param+('\"paramName\":\"'+add_name+ '\",');
	param=param+('\"paramValue\":\"'+add_value+ '\",');
	param=param+('\"paramDesc\":\"'+add_desc+ '\",');
	param=param+('\"paramRemark\":\"'+add_remark+ '\",');
	param = param.substring(0, param.length - 1);
	param += '}';
	param=str2Json(param);*/
	var param = {
			'paramName' : add_name,
			'paramValue' : add_value,
			'paramDesc' : add_desc,
			'paramRemark' : add_remark
		};
	store_new['paramName']=add_name;
	store_new['paramValue']=add_value;
	store_new['paramDesc']=add_desc;
	store_new['paramRemark']=add_remark;
	return param;
	
};

/**
 * 编辑回调回填
 * @param data
 * @return
 */
var dataFill = function(data){
	var object = util.str2Json(data).data;
	$("#addParamName").val(object.paramName);
	$("#addParamValue").val(object.paramValue);
	$("#addParamDesc").val(object.paramDesc);
	$("#addParamRemark").val(object.paramRemark);
	
	store_old['paramName']=object.paramName;
	store_old['paramValue']=object.paramValue;
	store_old['paramDesc']=object.paramDesc;
	store_old['paramRemark']=object.paramRemark;
};

/**
 *将json字符串转化为json对象
 */
function str2Json(jsonStr){
	var json = eval("(" + jsonStr + ")"); 
	return json;
};
