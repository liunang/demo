var LoadRegionTree = function(){
	var queryRegionTreeUrl = "../region/queryRegionInfoByParentId.action";
	
	function filter(treeId, parentNode, childNodes) {
		var data = childNodes.data;
		var array = [];
		if (!data) return null;
		for (var i=0; i<data.length; i++) {
			var obj = {id:data[i].id,text:data[i].text,treeId:data[i].treeId,regionCode:data[i].regionCode,regionLevel:data[i].regionLevel,isParent:!data[i].leaf,pId:data[i].parentId};
			array.push(obj);
		}
		return array;
	}

	
	function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
		
	}
	
	function onAsyncSuccess(event, treeId, treeNode, msg) {
		
	}
	
	this.loadRegionTree = function(treeId,regionSelect_o,regionAsyncId){
		var regionSelect = function(e,treeId, treeNode){
			regionSelect_o(e,treeId, treeNode);
		};
		
		var beforeClick = function(treeId, treeNode) {
			return true;
		};
		
		var beforeAsync = function(treeId, treeNode) {
			if(treeNode!=null){
				$("#"+regionAsyncId).val(treeNode.id);
			}
			
			return true;
		};
		
		var setting = {
		        view: {
		            selectedMulti: false,
		            showLine: false
		        },
		        async: {
					enable: true,
					url:queryRegionTreeUrl,
					autoParam:{},
					otherParam:{"id": function(){ return $("#"+regionAsyncId).val()}},
					dataFilter: filter
				},
				callback: {
					beforeClick: beforeClick,
					beforeAsync: beforeAsync,
					onAsyncError: onAsyncError,
					onAsyncSuccess: onAsyncSuccess,
					onClick: regionSelect
				},
		        check: {
		            enable: false
		        },
		        data: {
		            simpleData: {
		                enable: true
		            },
		            key: {
		            	name: "text",
		            	children: "data"
		            }
		            
		        }
		    };
		
		$.fn.zTree.init($("#"+treeId), setting);
	};
	

};

$(function(){
	$($(".regionCodeClass")[0]).click(function() {
		regionLayerSetting("add",this);
	});
	$($(".regionIdClass")[0]).click(function() {
		regionLayerSetting("add",this);
	});
	$($(".regionLevelClass")[0]).click(function() {
		regionLayerSetting("add",this);
	});
	
	$($(".regionNameClass")[0]).click(function() {
		regionLayerSetting("add",this);
	});
	
	$($(".queryRegionCodeClass")[0]).click(function() {
		regionLayerSetting("query",this);
	});
	
	$($(".queryRegionTreeIdClass")[0]).click(function() {
		regionLayerSetting("query",this);
	});
	
	$($(".queryRegionIdClass")[0]).click(function() {
		regionLayerSetting("query",this);
	});
	
	$($(".queryRegionLevelClass")[0]).click(function() {
		regionLayerSetting("query",this);
	});
	
	$($(".queryRegionNameClass")[0]).click(function() {
		regionLayerSetting("query",this);
	});
	//级联查询时选择后需要出发change事件
	$($(".connectRegionNameClass")[0]).click(function() {
		regionLayerSetting("connect",this);
	});
	$($(".connectRegionIdClass")[0]).click(function() {
		regionLayerSetting("connect",this);
	});
	
	var regionLayerSetting = function(queryOrAdd,input){
		var html = '<div class="regionTreeDiv">'+
					'<input class="regionIdClass" id="regionId" hidden>'+
					'<input id="inputRegionAsyncId" hidden>'+
					'<ul id="inputTreeDemo" class="ztree"></ul>'+
				'</div>';
		var regionLayer = layer.open({
			type: 1,
			skin: 'layui-layer-demo',
			offset: '20px',
			title:["区域","background:#D4D4D4;color:#000000;font-weight:bold"],
			area: ['322px', '520px'],
			content: html //这里content是一个DOM
		});
		
		var loadRegionTreeBean_input = new LoadRegionTree();
		var regionSelect_o = function(e,treeId, treeNode){
			if(queryOrAdd=="add"){
				//$($(".regionNameClass")[0]).val(treeNode.regionCode);
				$($(".regionNameClass")[0]).attr("parentRegionLevel",treeNode.regionLevel);
				$($(".regionNameClass")[0]).attr("parentRegionId",treeNode.id);
				$($(".regionNameClass")[0]).attr("parentRegionName",treeNode.text);
				$($(".regionIdClass")[0]).val(treeNode.id);
				$($(".regionNameClass")[0]).val(treeNode.text);
				$($(".regionLevelClass")[0]).val(treeNode.regioinLevel);
			}
			
			if(queryOrAdd=="query"){
				$($(".queryRegionCodeClass")[0]).val(treeNode.regionCode);
				$($(".queryRegionIdClass")[0]).val(treeNode.id);
				$($(".queryRegionNameClass")[0]).val(treeNode.text);
				$($(".queryRegionLevelClass")[0]).val(treeNode.regioinLevel);
				$($(".queryRegionTreeIdClass")[0]).val(treeNode.treeId);
			}
			//级联查询时选择后需要出发change事件
			if(queryOrAdd=="connect"){
				$($(".connectRegionIdClass")[0]).val(treeNode.id).change();
				$($(".connectRegionNameClass")[0]).val(treeNode.text);
			}
			
			RegionId=treeNode.id;
			layer.close(regionLayer);
			$($(input)).focus();
		};
		loadRegionTreeBean_input.loadRegionTree("inputTreeDemo", regionSelect_o,"inputRegionAsyncId");
	};
});
/*queryDevInfoByOrgId*/


    