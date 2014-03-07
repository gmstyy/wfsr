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
				<col style="width: 100px;">
				<col style="width: 160px;">
			</colgroup>
			<thead>
				<tr>
					<th>科室</th>
					<td><hs:dic dicName="DEPT" id="departmentId" name="departmentId" value1="${loginUser.orgId}" defalt="${loginUser.departmentId}" /></td>
					<th>角色名称</th>
					<td><input type="text" id="name" name="name:String:LIKE" maxlength="50" /></td>
					<th>角色类别</th>
					<td><hs:dic dicName='ROLE_TYPE' id="type" name="type" ></hs:dic></td>
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
			<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
				<a class="button_add" href="javascript:void(0);" onclick="addRole();">新建</a>
			<%-- </sec:authorize>
			<sec:authorize access="hasRole('OA_ROLE_UPDATE')"> --%>
				<a class="button_power_set" href="javascript:void(0);" onclick="batchSetAccess();">权限设定</a>
			<%-- </sec:authorize>
			<sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
				<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/role/delete');">删除</a>
			<%-- </sec:authorize> --%>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 80px;">
			<col >
			<col style="width: 180px;">
			<col style="width: 180px;">
			<col style="width: 150px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>编号</th>
				<th>角色名称</th>
				<th>科室</th>
				<th>角色类别</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
			<td style="text-align: center;">#rowCount#</td>
			<td>#name#</td>
			<td style="text-align: center;">#departmentId#</td>
			<td style="text-align: center;">#type#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" title="复制" class="option_record" onclick="duplicateRole('#id#');"></a>
					<%-- </sec:authorize> --%>
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" title="修改" class="option_edit" onclick="editRole('#id#');"></a>
					<%-- </sec:authorize>
					<sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
					<a href="javascript:void(0);" title="删除" class="option_delete" onclick="helper.deleteObjects('#id#','/role/delete');"></a>
					<%-- 	</sec:authorize> --%>

				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
	var templateModel = {
		id : null,
		orgId : null,
		code : null,
		name : null,
		departmentId : null,
		type : null
	};
	
	var validateModel = {
		name : { must : true, fieldName : "角色名称" }
	//,code : { must : true, fieldName : "角色代码" }
	};
	
	var helper = new dataHelper(templateModel,validateModel);
	var search = function() {
		helper.postSearch('/role/search', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
	};
	var addRole = function() {
		helper.postForm('/role/add', 2, {
			containerId : 'editContainer',
			containerTitle : '新建角色',
			successMessage : '新建角色成功',
			editConfirmUrl : '/role/saveAdd',
			validate : true,
			editFormId : 'userFormId',
			width: 1000
		});
	};
	var editRole = function(id) {
		helper.basicPost('/role/update', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '角色修改',
			successMessage : '角色修改成功',
			editConfirmUrl : '/role/saveUpdate',
			validate : true,
			editFormId : 'userFormId',
			width: 1000
		});
	};
	var duplicateRole = function(id) {
		helper.basicPost('/role/duplicate', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '新建角色',
			successMessage : '新建角色成功',
			editConfirmUrl : '/role/saveAdd',
			validate : true,
			editFormId : 'userFormId'
		});
	};
	var batchSetAccess = function() {
		var ids = helper.getSelectedValues();
		if(isNull(ids)||ids==""){
			Dialog.alert("请选择角色");
			return;
		}
		helper.basicPost('/role/batchSetAccess', {
			'ids' : ids
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '角色权限设定',
			successMessage : '角色权限设定成功',
			editConfirmUrl : '/role/batchSave',
			editFormId : 'userFormId',
			width: 1000
		});
	};
	//make default search
	$(function() {
		search();
	});
</script>