<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container">
	<form id="search_form" name="userForm" action="" method="post">
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
					<th>科室名称</th>
					<td><input type="text" id="name" name="name:String:LIKE" maxlength="50" /></td>
					<th>科室类别</th>
					<td><hs:dic dicName="DEPARTMENT_TYPE" id="type" name="type"/></td>
					<th>科室级别</th>
					<td><hs:dic dicName="DEPARTMENT_LEVEL"  id="departmentLevel" name="departmentLevel"/></td>
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
			<%-- <sec:authorize access="hasRole('ORG_DEPARTMENT_ADD')"> --%>
			<a class="button_add" href="javascript:void(0);" onclick="edit(0);">新建</a>
			<%-- </sec:authorize>
			<sec:authorize access="hasRole('ORG_DEPARTMENT_DELETE')"> --%>
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/department/delete');">删除</a>
			<%-- </sec:authorize> --%>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 40px;">
			<col style="width: 150px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 100px;">
			<col style="width: 80px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>编号</th>
				<th>科室名称</th>
				<th>科室类别</th>
				<th>科室负责人</th>
				<th>联系电话</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
			<td style="text-align: center;">#rowCount#</td>
			<td>#name#</td>
			<td style="text-align: center;">#type#</td>
			<td style="text-align: center;">#leaderId#</td>
			<td>#tel#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<%-- <sec:authorize access="hasRole('ORG_DEPARTMENT_UPDATE')"> --%>
					<a href="javascript:void(0);" title="修改" class="option_edit" onclick="edit('#id#');"></a>
					<%-- </sec:authorize>
					<sec:authorize access="hasRole('ORG_DEPARTMENT_DELETE')"> --%>
					<a href="javascript:void(0);" title="删除" class="option_delete" onclick="helper.deleteObjects('#id#','/department/delete');"></a>
					<%-- </sec:authorize> --%>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
	var templateModel = {
			id:null,
			orgId:null,
			name:null,
			parentId:null,
			type:null,
			departmentLevel:null,
			leaderId:null,
			tel:null,
			description:null,
			sortNo:null
	};
	var validateModel = {
		name : { must : true, fieldName : "科室名称" }
	};
	var helper = new dataHelper(templateModel, validateModel);
	var search = function() {
		helper.postSearch('/department/search', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
	};
	var edit = function(id) {
		helper.basicPost('/department/edit', { 'id' : id }, 2, {
			containerId : 'editContainer',
			containerTitle : (id == 0 ? '新增科室' : '修改科室'),
			successMessage : (id == 0 ? '新增科室成功' : '修改科室成功'),
			editConfirmUrl : '/department/save',
			editFormId : 'editFormId',
			validate : true
		});
	};
	//make default search
	search();
</script>