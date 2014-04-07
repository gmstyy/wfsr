<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="userFormId" name="userForm" action="" method="post">
	<div>
		<ul class="">
		<c:forEach var="role" items="${roles}" varStatus="status">
           <li class="role_${role.id}"><input type="hidden" name='roleIds' value="${role.id}">${role.name}(${role.code})<a class="option_del" onclick="$('.role_${role.id}').remove();"></a></li>
		</c:forEach>
		</ul>
	</div>
</form>

