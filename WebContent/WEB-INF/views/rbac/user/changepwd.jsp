<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="changePasswordFormId" name="userForm" action="" method="post">
	<input type="hidden" name='id' value="${user.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>用户名</th>
				<td>${user.loginName}</td>
			</tr>
			<c:if test="${admin==false}">
				<tr>
					<th>旧密码<span class="must_field">*</span></th>
					<td><input type="password" id="password" name="password" maxlength="20"/></td>
				</tr>
			</c:if>
			<tr>
				<th>新密码<span class="must_field">*</span></th>
				<td><input type="password" id="newPassword" name="newPassword" maxlength="20"/></td>
			</tr>
			<tr>
				<th>确认密码<span class="must_field">*</span></th>
				<td><input type="password" id="confirmPwd" name="confirmPwd" maxlength="20"/></td>
			</tr>
		</tbody>
	</table>
</form>
