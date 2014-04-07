<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="userFormId" name="userForm" action="" method="post">
	<input type="hidden" name='id' value="${user.id}">
	<input type="hidden" id="CSRFTokenName" value="${CSRFTokenName}"/>
	<input type="hidden" id="CSRFToken" value="${CSRFToken}"/>
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
				<th>登录名<span class="must_field">*</span></th>
				<td><input type="text" value="${user.loginName}" id="loginName" name="loginName" readonly="readonly" maxlength="100" /></td>
				<th>昵称<span class="must_field">*</span></th>
				<td><input type="text" value="${user.nickName}" id="nickName" name="nickName" maxlength="50" /></td>
				<th>默认登录科室<span class="must_field">*</span></th>
				<td><hs:dic dicName="DEPT" defalt="${user.departmentId}" id="departmentId" name="departmentId" value1="${loginUser.orgId}"/></td>
			</tr>
			<tr>
				<th>手机号</th>
				<td><input type="text" value="${user.telephone}" id="telephone" name="telephone" maxlength="11" /></td>
				<th>邮箱</th>
				<td><input type="text" value="${user.email}" id="email" name="email" maxlength="100" /></td>
				<th>状态</th>
				<td><hs:dic dicName="USER_STATUS" defalt="${user.status}" id="status" name="status"></hs:dic></td>
			</tr>
		</tbody>
	</table>
	<%@include file="roleSet.jsp"%>
</form>

