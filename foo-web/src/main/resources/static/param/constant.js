//查询参数信息
var queryGridUrl = "../titlePost/queryTitlePostInfoByName.action";
//添加参数
var optDataUrl = "../titlePost/optRegionInfo.action"; 

var findById= "../titlePost/findById.action";
	
var findConstantFlag="../titlePost/queryConstantFlag.action";

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
		$("#action").html('新增常量');
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
	
	queryConstantFlag();
	
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
	headParam.push("constantFlag");
	headParam.push("constantName");
	
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
	gridObj["pk"] = "titlePostId";
	gridObj["page"] = true;
	
	var constantFlagFormat = function(val){
		if(val=="1"){
			return "职称";
		}
		
		if(val=="2"){
			return "职务";
		}
		return "";
	};
	
	var headFormat = {"constantFlag":constantFlagFormat};
	gridObj["headFormat"] = headFormat;
	
	var nTGridBean = new NTGridBean();
	nTGridBean.init(gridObj);
	nTGridBean.loadGrid();
};

/**
 * 获得查询列表参数
 */
var getQueryGridParam = function(){
	var Qflag = $("#query_constantFlag").val();
	var Qname = $("#query_constantName").val();
	var param = {
		'constantFlag' : Qflag,
		'constantName' : Qname
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
	/*if(nowOperate=="edit"){
		$("#addParamName").attr("disabled",true);
	}
	else{
		$("#addParamName").attr("disabled",false);
	}*/
	
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
	operateUtil.addData(optDataUrl,param,addOrEditCompleteFun);
};

/**
 * 详细
 */
var viewData = function(param,viewSuccessFun){
	operateUtil.viewData(findById,param,viewSuccessFun);
};

/**
 * 编辑
 */
var editData = function(param){
	operateUtil.editData(optDataUrl,param,addOrEditCompleteFun);
};

/**
 * 删除
 */
var removeData = function(param){
	operateUtil.removeData(optDataUrl,param,addOrEditCompleteFun);
};

/**
 * 批量删除
 */
var removeDataOfNumbers = function(param){
	operateUtil.removeData(optDataUrl,param,addOrEditCompleteFun);
	
};


/**
 * 删除
 */
var removeBtn = function(btn){
	var pk = getPk(btn);
	var param = {"deleteIds[0]":pk};
	removeData(param);
};



/**
 * 编辑回填
 */
var editDataFill=function(pk){
	var param = {"id":pk};
	viewData(param,dataFill);
	
};

/**
 * 编辑
 */
var editBtn = function(btn){
	nowOperate = "edit";
	$("#action").html('编辑常量');
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
	var add_constantFlag = $("#addConstantFlag").val();
	var add_constantName = $("#addConstantName").val();
	if(add_constantFlag=='0'||add_constantFlag==''){
		util.sysTips("常量类型不能为空！","addConstantFlag");
		return ;
	}
    else
    {
		var param = {
			'constantFlag' : add_constantFlag,
			'constantName' : add_constantName,
			'OpFlag' : '1'
		};
		return param;
    }
};

/**
 * 获得编辑的参数
 * @return
 */
var getEditParam = function(){
	var add_constantFlag = $("#addConstantFlag").val();
	var add_constantName = $("#addConstantName").val();
	var add_titlePostId = $("#addTitlePostId").val();
	if(add_constantFlag=='0'||add_constantFlag==''){
		util.sysTips("常量类型不能为空！","addConstantFlag");
		return ;
	}
    else
    {
		var param = {
			'id' : add_titlePostId,
			'constantFlag' : add_constantFlag,
			'constantName' : add_constantName,
			'OpFlag' : '2'
		};
		store_new['titlePostId']=add_titlePostId;
		store_new['constantFlag']=add_constantFlag;
		store_new['constantName']=add_constantName;
		return param;
    }
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
		param+="\"OpFlag\":\"-1\",";
		for(var i=0;i<pks.length;i++)
			{
				param=param+('\"deleteIds['+i+']\":\"'+pks[i]+'\",');
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
 * 编辑回调回填
 * @param data
 * @return
 */
var dataFill = function(data){
	var object = util.str2Json(data).data;
	$("#addTitlePostId").val(object.titlePostId);
	$("#addConstantFlag").val(object.constantFlag);
	$("#addConstantName").val(object.constantName);
	
	store_old['titlePostId']=object.titlePostId;
	store_old['constantFlag']=object.constantFlag;
	store_old['constantName']=object.constantName;
};

/**
 * 查询常量类型
 */
var queryConstantFlag = function()
{
	var param=[];
	var selectObj = {};
	selectObj["url"] = findConstantFlag;
	selectObj["id"] = 'query_constantFlag';
	selectObj["param"] = param;
	selectObj["valueParam"] = 'code';
	selectObj["htmlParam"] = 'name';
	selectObj["defaultSelectedValue"] = null;
	var selectOption = new SelectOption();
	selectOption.clear('query_constantFlag');
	selectOption.loadOption(selectObj);
	
	var selectObj2 = {};
	selectObj2["url"] = findConstantFlag;
	selectObj2["id"] = 'addConstantFlag';
	selectObj2["param"] = param;
	selectObj2["valueParam"] = 'code';
	selectObj2["htmlParam"] = 'name';
	selectObj2["defaultSelectedValue"] = null;
	var selectOption2 = new SelectOption();
	selectOption2.clear('addConstantFlag');
	selectOption2.loadOption(selectObj2);
};

/**
 *将json字符串转化为json对象
 */
function str2Json(jsonStr){
	var json = eval("(" + jsonStr + ")"); 
	return json;
};
