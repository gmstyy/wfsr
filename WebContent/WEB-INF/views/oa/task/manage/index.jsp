<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ page language="java" import="com.founder.oa.common.constant.OACV" %>

<div id="search_container">
	<form id="search_form" name="search_form" action="" method="POST">
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
		<caption>
			<a class="button_add" href="javascript:void(0);" onclick="edit(0);">新建</a>
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/task/manage/delete');">删除</a>
		</caption>	
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 50px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 120px;">
			<col style="width: 90px;">
			<col style="width: 90px;">
			<col >
			<col style="width: 80px;">
			<col style="width: 100px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>序号</th>
				<th>任务来源</th>
				<th>任务类别</th>
				<th>场所名称</th>
				<th>创建人</th>			
				<th>创建日期</th>	
				<th>负责人</th>				
				<th>任务状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display:none;">
			<td style="text-align: center;"><input type="checkbox" class="#checkItem#" name="delete_checkbox_#status#" value="#id#" onclick="helper.selectItem(this);" /></td>
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
					<a href="javascript:void(0);" title="处理" class="option_process" name="edit_button_#status#" onclick="edit('#id#');"></a>
					<a href="javascript:void(0);" title="撤销" class="option_stop" name="cancel_button_#status#" onclick="cancel('#id#');">	</a>					
					<a href="javascript:void(0);" title="删除" class="option_delete" name="delete_button_#status#" onclick="helper.deleteObjects('#id#','/task/manage/delete');"></a>
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
	status:null,
	statusDesc : null,
	creatorName : null,
	selectUsers : null
};

var helper = new dataHelper(templateModel, taskValidateModel);

var search = function() {
	helper.postSearch('/task/manage/search',{formId:'search_form',containerId:'data_table',templateId:'template'});
	helper.addListener("afterFillData", handler, "data_table", "task");
};

var handler = function(e,pageList){
	//1 发起  2 执行  3 完成 4 撤销

	//1 可以删除
	<%-- $("input[name='delete_checkbox_<%=OACV.TASK_STATUS.ACTION%>']").remove();
	$("input[name='delete_checkbox_<%=OACV.TASK_STATUS.COMPLETE%>']").remove();
	$("input[name='delete_checkbox_<%=OACV.TASK_STATUS.CANCEL%>']").remove();
	$("a[name='delete_button_<%=OACV.TASK_STATUS.ACTION%>']").remove();
	$("a[name='delete_button_<%=OACV.TASK_STATUS.COMPLETE%>']").remove();
	$("a[name='delete_button_<%=OACV.TASK_STATUS.CANCEL%>']").remove(); --%>
	
	//1 可以修改
	$("a[name='edit_button_<%=OACV.TASK_STATUS.ACTION%>']").remove();
	$("a[name='edit_button_<%=OACV.TASK_STATUS.COMPLETE%>']").remove();
	$("a[name='edit_button_<%=OACV.TASK_STATUS.CANCEL%>']").remove();
	
	//2 可以撤销
	$("a[name='cancel_button_<%=OACV.TASK_STATUS.CREATE%>']").remove();
	$("a[name='cancel_button_<%=OACV.TASK_STATUS.COMPLETE%>']").remove();
	$("a[name='cancel_button_<%=OACV.TASK_STATUS.CANCEL%>']").remove();
};

var edit = function(id) {
	helper.basicPost('/task/manage/get', {id:id}, 2, {
		containerId : 'taskContainer',
		containerTitle : (id==0) ? '新建任务' : '修改任务',
		successMessage : (id==0) ? '新建任务成功' : '修改任务成功',
		editConfirmUrl : '/task/manage/save?from=1',
		editFormId : 'taskDetailFormId',
		validate : true,
		preProcess : function(prms) {
			prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
			return prms;
		}
	});
};

var cancel = function(id){
	Dialog.confirm("您确定要撤销该任务吗？", function() {
		helper.basicPost('/task/manage/cancel', {id:id}, null, null, function(response) {
			helper.redirectPage(1);
			Dialog.alert("撤销任务成功");
		});
	}, null, 300, 120);
};

/* var assign = function(id,role){
	helper.basicPost('/task/manage/assign', {id:id,role:role}, 2, {
		containerId : 'editContainer',
		containerTitle : '分配任务',
		successMessage : '分配任务成功',
		editConfirmUrl : '/task/manage/assign/save',
		editFormId : 'assignDetailFormId',
		afterDialogOpen : function() {
			$('#selectUsersId').multiSelect({ dblClick: true });
		},
		defaultButtons: {
			okText : '保 存'
		}
	});
}; */

//make default search
$(function() {
	search();
});
</script>
