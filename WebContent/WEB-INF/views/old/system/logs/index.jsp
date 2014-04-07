<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container">
	<form id="search_form"  action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 80px;">
				<col style="width: 160px;">
				<col style="width: 80px;">
				<col style="width: 160px;">
				<col style="width: 80px;">
				<col style="width: 160px;">
			</colgroup>
			<thead>
				<tr>
					<th>数据表名</th>
					<td><input type="text" id="tableName" name="tableName:String:LIKE" maxlength="50" /></td>
					<th>数据ID</th>
					<td><input type="text" id="dataId" name="dataId" maxlength="30" /></td>
					<th>操作内容</th>
					<td><input type="text" id="content" name="content:String:LIKE" maxlength="2000" /></td>
				</tr>
				<tr>
					<th>操作者</th>
					<td><input type="text" id="operatorLoginName" name="operatorLoginName:String:LIKE" maxlength="30" /></td>
					<th>操作时间</th>
					<td colspan="3" style="text-align:left;"><tag:dateInput onlypast="false" name="startDate" />~<tag:dateInput onlypast="false" name="endDate" /></td>
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
		<caption></caption>
		<colgroup>
			<col style="width: 50px;">
			<col style="width: 180px;">
			<col style="width: 60px;">
			<col>
			<col style="width: 100px;">
			<col style="width: 140px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>编号</th>
				<th>数据表名</th>
				<th>数据ID</th>
				<th>操作内容</th>
				<th>操作者</th>
				<th>操作时间</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;">#rowCount#</td>
			<td style="text-align: center;">#tableName#</td>
			<td style="text-align: center;">#dataId#</td>
			<td>#content#</td>
			<td style="text-align: center;">#operatorName#</td>
			<td style="text-align: center;">#operateDatetime#</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
	var templateModel = {
		id : null,
		tableName : null,
		dataId : null,
		content : { maxLength : 50 },
		operatorId : null,
		operatorName : null,
		operateDatetime : { type : "timestamp" }
	};
	var helper = new dataHelper(templateModel);
	var search = function() {
		helper.postSearch('/logs/search', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
	};
	//make default search
	search();
</script>