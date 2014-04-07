<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ page language="java" import="com.founder.oa.common.constant.OACV" %>

<div id="search_container">
	<form id="search_form" name="search_form" action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 100px;">
				<col>
				<col style="width: 100px;">
				<col>
				<col style="width: 100px;">
				<col>					
			</colgroup>		
			<thead>
				<tr>			
					<th>任务来源</th>
					<td><hs:dic dicName="TASK_SOURCE" name="taskSource"></hs:dic></td>
					<th>任务状态</th>
					<td><hs:dic dicName="TASK_STATUS" name="status"></hs:dic></td>												
					<th>创建日期</th>
					<td><tag:dateInput onlypast="false" name="startDate" />~<tag:dateInput onlypast="false" name="endDate" /></td>
				</tr>
			</thead> 
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			<input class="button_reset" onclick="$('form')[0].reset();" type="button" />
			<input class="button_search" onclick="search();" type="button" />
		</div>	
	</form>
</div>
<div id="list_container">
	<table class="repeattable">
		<colgroup>
			<col style="width: 50px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 130px;">
			<col style="width: 90px;">
			<col style="width: 90px;">
			<col >
			<col style="width: 80px;">
			<col style="width: 90px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>序号</th>
				<th>任务来源</th>
				<th>任务类别</th>
				<th>场所名称</th>	
				<th>创建人</th>			
				<th>创建日期</th>		
				<th>任务执行人</th>		
				<th>任务状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display:none;">
	 		<td style="text-align: center;">#rowCount#</td>
			<td>#sourceType#</td>
			<td>#taskType#</td>
			<td>#place#</td>
			<td>#creatorName#</td>
			<td>#createTime#</td>
			<td>#selectUsers#</td>
			<td style="text-align: center;">#statusDesc#</td>
	 		<td style="text-align: center;">
	 			<div class="option_container">
	 				<a href="javascript:void(0);" title="查看" class="option_view" onclick="viewTaskDeail('#id#');"></a>
<!-- 				<a href="javascript:void(0);" title="领取" class="option_gain_task" name="gain_button_#flagGain#" onclick="gain('#id#');"></a>	-->
					<a href="javascript:void(0);" title="执行" class="option_execute" name="action_button_#status#" onclick="action('#id#');"></a> 
					<a href="javascript:void(0);" title="填报结果" class="option_process" name="process_button_#status#" onclick="process('#id#');"></a>	
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
var templateModel = {
	id : null,
	sourceType : null,
	taskType : null,
	place : null,
	createTime : {type:'timestamp'},
	status : null,
	statusDesc : null,
	creatorName : null,
	selectUsers : null,
	chargeRole : null
}

var helper = new dataHelper(templateModel);

var search = function() {
	var url = '/task/mine/search';
	if("${from}" == "home"){
		url = '/task/homedirect';
	}
	helper.postSearch(url,{formId:'search_form',containerId:'data_table',templateId:'template'});
	helper.addListener("afterFillData", handler, "data_table", "task");
};

var handler = function(e,pageList){
	//$("a[name='gain_button_0']").remove();
	$("a[name='action_button_<%=OACV.TASK_STATUS.ACTION%>']").remove();
	$("a[name='action_button_<%=OACV.TASK_STATUS.COMPLETE%>']").remove();
	$("a[name='action_button_<%=OACV.TASK_STATUS.CANCEL%>']").remove();

	$("a[name='process_button_<%=OACV.TASK_STATUS.CREATE%>']").remove();
	$("a[name='process_button_<%=OACV.TASK_STATUS.CANCEL%>']").remove();
}; 

var process = function(id) {
	helper.basicPost('/task/mine/result', {id:id}, 2, {
		height : 150,
		containerId : 'taskContainer',
		containerTitle : '填报任务结果',
		successMessage : '填报任务结果成功',
		editConfirmUrl : '/task/mine/result/save',
		editFormId : 'taskResultFormId'
	});
};

/* var gain = function(id){
	Dialog.confirm("你确定要领取该任务吗？", function() {
		helper.basicPost(getContextUrl("/task/mine/gain"), {id:id}, null, null, function(response) {
			helper.redirectPage(1);
			Dialog.alert('领取任务成功');
		});
	}, null, 300, 120);
}; */

var action = function(id){
	Dialog.confirm("你确定要开始执行该任务吗？", function() {
		helper.basicPost(getContextUrl("/task/mine/action"), {id:id}, null, null, function(response) {
			helper.redirectPage(1);
			Dialog.alert('开始执行任务成功');
		});
	}, null, 300, 120);
};

//make default search
$(function() {
	search();
});
</script>
