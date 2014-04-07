<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ page language="java" import="com.founder.oa.common.constant.OACV" %>

<div id="search_container">
	<form id="search_form" name="userForm" action="" method="post">
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
					<th>发案日期</th>
					<td><tag:dateInput onlypast="false" name="startDate" />~<tag:dateInput onlypast="false" name="endDate" /></td>										
				</tr>
				<tr><th>机构</th>
				<td>
					<hs:dic dicName="ORG" limitedMap="${orgSet}" defalt="${loginUser.orgId}" id="orgId" name="orgId"></hs:dic>
				</td></tr>
			</thead> 
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			<input class="button_reset" onclick="$('form')[0].reset();" type="button" />
			<input class="button_search" onclick="search();" type="button" />
			<input class="button_export" onclick="doExport();" type="button" />
		</div>		
	</form>
</div>
<div id="list_container">
	<table class="repeattable">
		<caption>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 50px;">
			<col style="width: 200px;">
			<col style="width: 280px;">
			<col style="width: 150px;">
			<col style="width: 120px;">
			<col style="width: 60px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>编号</th>
				<th>案件来源</th>
				<th>案发单位（人）</th>
				<th>发案日期</th>
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
			<td>#caseDate#</td>
			<td>#statusDesc#</td>
	 		<td>
	 			<div class="option_container">
	 				<a href="javascript:void(0);" title="查看" class="option_view" name="view_button" onclick="viewRegistCase('#id#');"></a>
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
	caseDate : {type:'date'},
	statusDesc : null,
	status : null,
	punishAppStatus : null
};

var helper = new dataHelper(templateModel);

var search = function() {
	helper.postSearch('/case/statistics/search',{formId:'search_form',containerId:'data_table',templateId:'template'});	
};

var doExport = function() {
	file.exportExcel(helper.getFormData("search_form"), "CASE_REPORT", "案件报表");
};

//make default search
$(function() {
	search();
});
</script>
