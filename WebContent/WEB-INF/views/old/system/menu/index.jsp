<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container">
	<form id="search_form" name="userForm" action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 80px;">
				<col style="width: 160px;">
			</colgroup>
			<thead>
				<tr>
					<th>菜单名称</th>
					<td><input type="text" id="code" name="name:String:LIKE" maxlength="50" /></td>
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
			<col style="width: 160px;">
			<col>
			<col style="width: 100px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>编号</th>
				<th>菜单名称</th>
				<th>菜单URL</th>
				<th>父菜单</th>
				<th>排序号</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;">#rowCount#</td>
			<td style="text-align: center;">#name#</td>
			<td>#url#</td>
			<td style="text-align: center;">#parentName#</td>
			<td style="text-align: center;">#sortNo#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<%-- <sec:authorize access="hasRole('OA_MENU_EDIT')"> --%>
					<a href="javascript:void(0);" title="修改" class="option_edit" onclick="edit('#id#');"></a>
					<%-- </sec:authorize> --%>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
	var templateModel = {
		id : null,
		name : null,
		url : null,
		menuLevel : null,
		parentName : null,
		sortNo : null
	};
	var validateModel = {
			name : { must : true, fieldName : "菜单名称" },
			url : { must : true, fieldName : "菜单URL" },
			sortNo : { must : true, fieldName : "排序号" }
		};
	var helper = new dataHelper(templateModel, validateModel);
	var search = function() {
		helper.postSearch('/menu/search', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
	};
	var edit = function(id) {
		helper.basicPost('/menu/update', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '修改',
			editConfirmUrl : '/menu/saveUpdate',
			editFormId : 'editFormId',
			validate : true,
			width: 600,
			height: 260
		});
	};
	//make default search
	search();
</script>