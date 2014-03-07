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
			</colgroup>
			<thead>
				<tr>
					<th>角色编码</th>
					<td><input type="text" name="code:String:LIKE" maxlength="50" /></td>
					<th>角色名称</th>
					<td><input type="text"  name="name:String:LIKE" maxlength="50" /></td>
				</tr>
				<tr>
					<th>角色类别</th>
					<td><hs:dic dicName='ROLE_TYPE' id="type" name="type" ></hs:dic></td>
					<th>操作类型</th>
					<td><input type="radio" checked="checked" name="operate" value="1"/>授予<input type="radio" name="operate" value="0"/>撤销</td>
				</tr>
			</thead>
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			<input class="button_reset" onclick="$('form')[0].reset();" type="button" />
			<input class="button_submit" onclick="commit();" type="button" />
		</div>
	</form>
</div>
<form id="roleAccessForm">
	<div class="roles_power">
	<%@include file="accessSet.jsp"%>
	</div>
</form>
<script type="text/javascript">
	var helper = new dataHelper(null,null);
	var commit = function() {
		var params = helper.getFormData('search_form');
		params = helper.getFormData('roleAccessForm', params);
		helper.basicPost('/role/customConfirm', params, 2, {
			containerId : 'editContainer',
			containerTitle : '确认角色',
			successMessage : '角色修改成功',
			editConfirmUrl : '/role/customSetSave',
			editFormId : 'userFormId'
		});
	};
</script>