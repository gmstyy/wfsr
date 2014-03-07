<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ page language="java" import="com.founder.hs.constant.HSCV" %>
<%@ page language="java" import="com.founder.oa.common.constant.OACV" %>
<div id="search_container">
	<form id="search_form" name="search_form" action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 80px;">
				<col style="width: 100px;">
				<col style="width: 20px;">
				<col style="width: 80px;">
				<col>				
			</colgroup>			
			<tr>
				<th>业务种类</th>
				<td>
					<hs:dic dicName="WORKFLOW_CATEGORY" name="categoryCode" id="workflowCategory_1" onChange="selectCategory(1)"></hs:dic>
				</td>
				<td>
					<hs:dic dicName="LICENSE_TYPE" name="ltype" id="business_1_1" style="display:none;" onChange="selectBusiness(1,1)"></hs:dic>
					<hs:dic dicName="CASE_STEP" name="cstep" id="business_1_2" style="display:none;" onChange="selectBusiness(1,2)"></hs:dic>
					<input type="text" name="businessCode" id="businessCode_1" style="display:none;"/>
				</td>				
				<th>日期</th>
				<td><tag:dateInput onlypast="false" name="startDate" />~<tag:dateInput onlypast="false" name="endDate" /></td>
			</tr> 
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			<input class="button_search" onclick="search();" type="button" />
		</div>		
	</form>
</div>
<div id="list_container">
	<table class="repeattable">
		<colgroup>
			<col style="width: 50px;">
			<col style="width: 150px;">
			<col style="width: 90px;">
			<col style="width: 110px;">
			<col style="width: 100px;">
			<col style="width: 120px;">
			<col style="width: 80px;">
			<col style="width: 100px;">
			<col style="width: 120px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>序号</th>
				<th>标题</th>
				<th>业务种类</th>
				<th>流程名</th>
				<th>最近一次处理人</th>
				<th>最近一次处理时间</th>
				<th>限时(天)</th>
				<th>当前状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display:none;">
	 		<td style="text-align: center;">#rowCount#</td>
	 		<td>#title#</td>
			<td>#categoryName#</td>
			<td>#workflowName#</td>
			<td>#updaterName#</td>
			<td>#updateTime#</td>
			<td style="text-align: center;" class="style_#deadLine#">#deadLine#</td>
			<td style="text-align: center;">#currentNodeName#</td>
	 		<td style="text-align: center;">
	 			<div class="option_container">
	 				<a href="javascript:void(0);" title="审批情况" class="option_view_process_status" onclick="viewWorkflowDetail('#id#')"></a>
					<a href="javascript:void(0);" title="业务查看" class="option_view_business" onclick="viewContent('#relationId#','#categoryCode#','#businessCode#')"></a>			
					<a href="javascript:void(0);" title="进入审批" class="option_do_approve" name="approve_button_#isAllow#" onclick="edit('#id#','#workflowId#','#currentNodeId#','#relationId#','#categoryCode#','#businessCode#')"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
var templateModel = {
	title : null,
	workflowName : null,
	id : null,
	categoryCode : null,
	businessCode : null,
	categoryName : null,
	updaterName : null,
	updateTime : {type:'timestamp'},
	remark : null,
	currentNodeName : null,
	currentNodeId : null,
	relationId : null,
	workflowId : null,
	isAllow : null,
	remark : null,
	deadLine : null
};

var helper = new dataHelper(templateModel);

var search = function() {
	var url = '/approve/search';
	if("${from}" == "home"){
		url = '/approve/homedirect';
	}
	helper.postSearch(url,{formId:'search_form',containerId:'data_table',templateId:'template'});
	helper.addListener("afterFillData", handler, "data_table", "approve");
};

var handler = function(e,pageList){
	$("a[name='approve_button_0']").remove();
	$("td[class='style_0']").css("color","red");
	$("td[class='style_1']").css("color","red");
	$("td[class='style_2']").css("color","red");
	$("td[class='style_3']").css("color","red");
};

var edit = function(id, workflowId, currentNodeId, relationId, categoryCode, businessCode) {
	helper.basicPost("/approve/process",{workflowId:workflowId,currentNodeId:currentNodeId},null,null,function(response){
		var nextNodeId1 = response.workflowset.nextNodeId1;
		var nextNodeId2 = response.workflowset.nextNodeId2;
		var nextNodeId3 = response.workflowset.nextNodeId3;
		var nextButton1 = response.workflowset.nextButton1;
		var nextButton2 = response.workflowset.nextButton2;
		var nextButton3 = response.workflowset.nextButton3;
		var btns = {};
		if(!isNull(nextNodeId1)){
			btns[nextButton1] = function() {approve(nextNodeId1);};
		}
		if(!isNull(nextNodeId2)){
			btns[nextButton2] = function() {approve(nextNodeId2);};
		}
		if(!isNull(nextNodeId3)){
			btns[nextButton3] = function() {approve(nextNodeId3);};
		}		
		var args = {
			containerId : 'editContainer',
			containerTitle : '流程审批',
			defaultButtons: {
				okEnabled : false,
				cancelText : '关闭'
			}
		};		
		args.buttons = btns;
		helper.basicPost('/approve/get', {id:id,workflowId:workflowId,relationId:relationId,categoryCode:categoryCode,businessCode:businessCode}, 2, args);
	});
};

var approve = function(nextNodeId) {
	$("#nextNodeId").val(nextNodeId);
	helper.basicPost("/approve/save", $("#approveFormId").formSerialize(), null, null, function(response) {
		helper.redirectPage(1);
		if(response.flag == 1) {
			Dialog.alert('本次审批已刚被别人审核过', function() {
				Dialog.close();			
			});
		} else {
			Dialog.alert('审批操作成功', function() {
				Dialog.close();			
			});
		}
	});
};

var viewContent = function(relationId, categoryCode, businessCode) {
	if (categoryCode == '<%=HSCV.WORKFLOW_CATEGORY.MAJOREVENTS%>') {
		viewMajorevents(relationId);
	} else if (categoryCode == '<%=HSCV.WORKFLOW_CATEGORY.EMERGENCY%>') {
		viewEmergency(relationId);
	} else if (categoryCode == '<%=HSCV.WORKFLOW_CATEGORY.COMPLAINTS%>') {
		viewComplaints(relationId);
	} else if (categoryCode == '<%=HSCV.WORKFLOW_CATEGORY.LICENSE%>') {
		viewLicense(relationId, businessCode);
	} else if (categoryCode == '<%=HSCV.WORKFLOW_CATEGORY.DOCUMENT%>') {
		viewDocument(relationId);
	} else if (categoryCode == '<%=HSCV.WORKFLOW_CATEGORY.CASE%>') {
		if(businessCode == '<%=OACV.CASE_STEP.ACCEPT%>'){
			viewAcceptCase(relationId);
		}else if(businessCode == '<%=OACV.CASE_STEP.REGISTER%>'){
			viewRegistCase(relationId);
		}else if(businessCode == '<%=OACV.CASE_STEP.INVESTIGATE%>'){
			viewInvestigateCase(relationId);
		}else if(businessCode == '<%=OACV.CASE_STEP.FINISH%>'){
			viewFinishCase(relationId);
		}else if(businessCode == '<%=OACV.CASE_STEP.PUNISH%>'){
			viewPunishCase(relationId);
		}		
	}
};

//make default search
$(function() {
	search();
});
</script>
