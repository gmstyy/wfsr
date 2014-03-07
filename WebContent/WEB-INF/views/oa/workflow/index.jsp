<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<div id="search_container">
	<form id="search_form" name="search_form" action="" method="POST">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 80px;">
				<col>				
			</colgroup>		
			<tr>		
				<th>流程种类</th>
				<td>
					<hs:dic dicName="WORKFLOW_CATEGORY" name="categoryCode" id="workflowCategory_1" onChange="selectCategory(1)"></hs:dic>
					<hs:dic dicName="LICENSE_TYPE" name="ltype" id="business_1_1" style="display:none;" onChange="selectBusiness(1,1)"></hs:dic>
					<hs:dic dicName="CASE_STEP" name="cstep" id="business_1_2" style="display:none;" onChange="selectBusiness(1,2)"></hs:dic>
					<input type="text" name="businessCode" id="businessCode_1" style="display:none;"/>
				</td>
				<th>状态</th>
				<td>
					<hs:dic dicName="WORKFLOW_STATUS" name="status"></hs:dic>
				</td>
			</tr> 
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			<input class="button_search" onclick="search();" type="button" />
		</div>		
	</form>
</div>
<div id="list_container">
	<table class="repeattable">
		<caption>
			<a class="button_add" href="javascript:void(0);" onclick="edit(0);">新建</a>
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/workflow/delete');">删除</a>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 50px;">
			<col style="width: 150px;">
			<col style="width: 200px;">
			<col>
			<col style="width: 90px;">
			<col style="width: 170px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>编号</th>
				<th>流程种类</th>
				<th>流程名称</th>
				<th>流程描述</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display:none;">
	 		<td><input type="checkbox" class="#checkItem#" value="#id#" name="delete_checkbox_#isUsed#" onclick="helper.selectItem(this);" /></td>
	 		<td>#rowCount#</td>
	 		<td>#categoryCode#</td>
			<td>#name#</td>
			<td>#description#</td>
			<td>#statusDesc#</td>
	 		<td>
	 			<div class="option_container">
	 				<a href="javascript:void(0);" title="查看" class="option_view" onclick="view('#id#','#name#');"></a>
					<a href="javascript:void(0);" title="修改" class="option_edit" name="used_button_#isUsed#" onclick="edit('#id#');"></a>
					<a href="javascript:void(0);" title="流程节点设置" class="option_procedure" name="used_button_#isUsed#" onclick="set('#id#')"></a>
					<a href="javascript:void(0);" title="禁用" class="option_stop" name="forbid_button_#status#" onclick="forbid('#id#');"></a>
					<a href="javascript:void(0);" title="删除" class="option_delete" name="used_button_#isUsed#" onclick="helper.deleteObjects('#id#','/workflow/delete');"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
var templateModel = {
	id : null,
	categoryCode : null,
	isUsed : null,
	name : null,
	status : null,
	statusDesc : null,
	description : null
};

var validateModel = {	
	categoryCode : { must : true, fieldName : "流程种类"},
	name : { must : true, fieldName : "流程名称"},
	successNode : { must : true, fieldName : "审批通过终点节点"},
	failNode : { must : true, fieldName : "审批不通过终点节点"}
};

var helper = new dataHelper(templateModel, validateModel);

var search = function() {
	helper.postSearch('/workflow/search',{formId:'search_form',containerId:'data_table',templateId:'template'});
	helper.addListener("afterFillData", handler, "data_table", "workflow");
};

var handler = function(e,pageList){ 
	$("input[name='delete_checkbox_1']").remove();
	$("a[name='used_button_1']").remove();
	$("a[name='forbid_button_0']").remove();
	$("a[name='forbid_button_2']").remove();
};

var edit = function(pk) {
	helper.basicPost('/workflow/edit', {id : pk}, 2, {
		containerId : 'editContainer',
		containerTitle : (pk == 0) ? '创建流程' : '修改流程',
		successMessage : (pk == 0) ? '创建流程成功，请设置流程' : '修改流程成功，请设置流程',
		editConfirmUrl : '/workflow/save',
		editFormId : 'workflowDetailFormId',
		validate : true ,
		afterDialogOpen : function() {
			selectCategory(2);
		},
		preProcess : function(prms) {
			prms.json = $.toJSON(getDataList("addWorkflowNode", "tr"));
			return prms;
		},
		validateList : {
			containerId : "addWorkflowNode",
			repeatTagName : "tr",
			model : {
				workflowNodeName : { must : true, fieldName : "节点名称" },
				chargeRole : { must : true, fieldName : "角色" }
			}
		} 
	});
};

var set = function(pk) {
	helper.basicPost('/workflow/set', {id : pk}, 2, {
		containerId : 'editContainer',
		containerTitle : '流程设置',
		editConfirmUrl : '/workflow/set/save',
		successMessage : '设置流程成功',
		editFormId : 'setFormId',
		preProcess : function(prms) {
			prms.json = $.toJSON(getDataList("setWorkflowNode", "tbody"));
			return prms;
		}
	});
};

var view = function(id,name) {
	viewHelper.basicPost('/workflow/view', {'id' : id}, 2, {
		height:280,
		containerId : 'editContainer',
		containerTitle : name,
		defaultButtons: {
			okEnabled : false,
			cancelText : '关 闭'
		},
		afterDialogOpen : function() {
			main(document.getElementById('graphContainer'));
		}
	}); 
	//AjaxHelper.post(getContextUrl("/workflow/view"), {id:id}, function(response) {}, 'html');
};

var forbid = function(id){
	Dialog.confirm("您确定要禁用该流程吗？", function() {
		helper.basicPost('/workflow/forbid', {id:id}, null, null, function(response) {
			helper.redirectPage(1);
			Dialog.alert("禁用流程成功");
		});
	}, null, 300, 120);
};

//make default search
$(function() {
	search();
});
</script>
