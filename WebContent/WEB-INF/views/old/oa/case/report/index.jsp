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
					<th>案件类型</th>
					<td><hs:dic dicName="CASE_INVESTIGATE" name="caseInvestigate"></hs:dic></td>
					<th>案件来源</th>
					<td><hs:dic dicName="CASE_SOURCE" name="caseSource"  style="width:180px;"></hs:dic></td>
					<td>
						&nbsp;&nbsp;
						<input type="radio" name="status" value="<%=OACV.CASE_STATUS.NONE%>"/>全部&nbsp;
						<input type="radio" name="status" value="<%=OACV.CASE_STATUS.REPORT%>"/>已上报&nbsp;  
						<input type="radio" name="status" value="<%=OACV.CASE_STATUS.FINISH%>" checked/>未上报
					</td>	
				</tr>
				<tr>											
					<th>发案日期</th>
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
		</caption>
		<colgroup>
			<col style="width: 50px;">
			<col style="width: 150px;">
			<col style="width: 180px;">
			<col>
			<col style="width: 150px;">
			<col style="width: 90px;">
			<col style="width: 80px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>编号</th>
				<th>案件类型</th>
				<th>案件来源</th>
				<th>案发单位（人）</th>
				<th>发案日期</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display:none;">	 		
	 		<td style="text-align: center;">#rowCount#</td>
	 		<td>#caseTypeDesc#</td>
	 		<td>#caseSource#</td>
			<td>#casePlace#</td>
			<td style="text-align: center;">#caseDate#</td>
			<td style="text-align: center;">#statusDesc#</td>
	 		<td style="text-align: center;">
	 			<div class="option_container">
	 				<a href="javascript:void(0);" title="查看" class="option_view" name="view_button_#status#" onclick="viewReport('#id#');"></a>
					<a href="javascript:void(0);" title="上报" class="option_report" name="report_button_#status#" onclick="report('#id#');"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>

<script type="text/javascript">
var templateModel = {
	id : null,
	caseTypeDesc : null,
	caseType : null,
	caseSource : null,
	casePlace : null,
	caseDate : {type:'date'},
	statusDesc : null,
	status : null
};

var helper = new dataHelper(templateModel);

var search = function() {
	helper.postSearch('/case/report/search',{formId:'search_form',containerId:'data_table',templateId:'template'});
	helper.addListener("afterFillData", handler, "data_table", "case");
};

var handler = function(e,pageList){
	$("a[name='view_button_<%=OACV.CASE_STATUS.FINISH%>']").remove();
	$("a[name='report_button_<%=OACV.CASE_STATUS.REPORT%>']").remove();
};

var report = function(id) {
	helper.basicPost('/case/report/edit', {id:id}, 2, {		
		containerId : 'editContainer',		
		containerTitle : '案件上报',
		successMessage : '案件上报成功',
		editConfirmUrl : '/case/report/save',
		editFormId : 'reportDetailFormId',
		defaultButtons: {
			okText : '上 报',
		}
	});				
};

var viewReport = function(id) {
	viewHelper.basicPost('/case/report/view', {id:id}, 2, {
		containerId : 'editContainer',		
		containerTitle : '查看',
		defaultButtons: {
			okEnabled : false
		}
	});
};

//make default search
$(function() {
	search();
});
</script>
