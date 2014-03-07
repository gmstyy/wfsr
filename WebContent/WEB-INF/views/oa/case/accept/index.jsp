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
			</colgroup>		
			<thead>
				<tr>			
					<th>案件来源</th>
					<td><hs:dic dicName="CASE_SOURCE" name="caseSource"  style="width:180px;"></hs:dic></td>											
					<th>受理日期</th>
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
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/case/accept/delete');">删除</a>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 50px;">
			<col style="width: 200px;">
			<col style="width: 280px;">
			<col style="width: 150px;">
			<col style="width: 120px;">
			<col>
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>编号</th>
				<th>案件来源</th>
				<th>案发单位（人）</th>
				<th>受理时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display:none;">
	 		<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
	 		<td style="text-align: center;">#rowCount#</td>
	 		<td>#caseSource#</td>
			<td>#casePlace#</td>
			<td>#acceptTime#</td>
			<td>#statusDesc#</td>
	 		<td>
	 			<div class="option_container">
	 				<a href="javascript:void(0);" title="查看" class="option_view" name="view_button" onclick="viewAcceptCase('#id#');"></a>
	 				<a href="javascript:void(0);" title="申请立案" class="option_process" name="regist_button_#status#" onclick="regist('#id#');"></a>
					<a href="javascript:void(0);" title="删除" class="option_delete" name="delete_button" onclick="helper.deleteObjects('#id#','/case/accept/delete');"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>

<script type="text/javascript">
var templateModel = {
	id : null,
	caseSource : null,
	casePlace : null,
	acceptTime : {type:'timestamp'},
	statusDesc : null,
	status : null
};

var validateModel = {
	caseSource : { must : true, fieldName : "案件来源" },
	casePlace : { must : true, fieldName : "案发单位（人）" },
	casePersonTel : { type : "telephone", fieldName : "负责人电话" },
	usersName : { must : true, fieldName : "经办人" }
};


var helper = new dataHelper(templateModel,validateModel);

var search = function() {
	var url = '/case/accept/search';
	helper.postSearch(url,{formId:'search_form',containerId:'data_table',templateId:'template'});
	helper.removeAllListener("data_table", "caseAccept");
	helper.addListener("afterFillData", handler, "data_table", "caseAccept");
};

var handler = function(e,pageList){	
	$("a[name='regist_button_<%=OACV.CASE_ACCEPT_STATUS.APPLAY%>']").remove();
	$("a[name='regist_button_<%=OACV.CASE_ACCEPT_STATUS.DISAGREE%>']").remove();
};

var edit = function(id) {
	helper.basicPost('/case/accept/edit', {id:id}, 2, {		
		containerId : 'editContainer',		
		containerTitle : '申请受理案件',
		successMessage : '申请受理案件成功',
		editConfirmUrl : '/case/accept/save',
		editFormId : 'caseAcceptDetailFormId',
		validate : true,
		defaultButtons: {
			okText : '申请受理',
		}
	});
};

var regist = function(id) {
	helper.basicPost('/case/regist/edit', {aId:id}, 2, {		
		containerId : 'editContainer',		
		containerTitle : '申请立案',
		successMessage : '申请立案成功',
		editConfirmUrl : '/case/regist/save',
		editFormId : 'caseRegistDetailFormId',
		validate : true,
		defaultButtons: {
			okText : '申请立案',
		}
	});
};

//make default search
$(function() {
	search();
});
</script>
