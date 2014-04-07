<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div class="edit_section">
	<div class="title">使用角色设定</div>
	<c:forEach var="roleGroup" items="${roleMap}" varStatus="groupStatus">
		<fieldset>
			<legend><input type='checkbox' onclick='dicCheckBoxSelectAll(this)'/>${roleGroup.key}</legend>
			<c:forEach var="role" items="${roleGroup.value}" varStatus="status">
				<input type="checkbox" <c:if test="${useRoleMap[role.id]!=null}"> checked='checked'</c:if> name="roleIds" class="InputCheck" value="${role.id}" /> ${role.name}
			</c:forEach>
		</fieldset>
	</c:forEach>
</div>
<div class="edit_section">
	<div class="title">授权角色设定</div>
	<c:forEach var="roleGroup" items="${roleMap}" varStatus="groupStatus">
		<fieldset>
			<legend><input type='checkbox' onclick='dicCheckBoxSelectAll(this)'/>${roleGroup.key}</legend>
			<c:forEach var="role" items="${roleGroup.value}" varStatus="status">
				<input type="checkbox" <c:if test="${setRoleMap[role.id]!=null}"> checked='checked'</c:if> name="powerIds" class="InputCheck" value="${role.id}" /> ${role.name}
			</c:forEach>
		</fieldset>
	</c:forEach>
</div>
<div style="display: none; clear: both;"></div>
