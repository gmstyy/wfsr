<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="userFormId" name="userForm" action="" method="post">
	<input type="hidden" name='id' id='id' value="${user.id}">
	<input type="hidden" name='nickName' id='nickName' value="${user.nickName}">
	<input type="hidden" name='email' id='email' value="${user.email}">
	<input type="hidden" name='telephone' id='telephone' value="${user.telephone}">
	<input type="hidden" name='status' id='status' value="${user.status}">
	<input type="hidden" name='type' id='type' value="${user.type}">
	<input type="hidden" name='employeeId' id='employeeId' value="${employeeId}">
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;" />
			<col />
			<col style="width: 80px;" />
			<col />
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>监督员</th>
				<td>${employeeName}</td>
				<th>系统登录名</th>
				<td>${user.loginName}</td>
				<th>科室<span class="must_field">*</span></th>
				<td><hs:dic dicName="DEPT" defalt="${user.departmentId}" onChange="refreshRoles(this);" id="departmentId" name="departmentId" value1="${loginUser.orgId}"/></td>
			</tr>
		</tbody>
	</table>
	<div id="roleContainer"><%@include file="/WEB-INF/views/rbac/user/roleSet.jsp"%></div>
</form>
<script type="text/javascript">
	var refreshRoles = function(obj) {
		var deptId=$(obj).val();
		helper.basicPost('/user/roleSet', 
			{
				'deptId' : deptId,
				'userId' : $("#userFormId").find("#id").val()
			}, 2, null, 
			function(data) {
				$("#roleContainer").html(data);
			}
		);
	};
</script>

