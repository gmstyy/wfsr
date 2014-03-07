<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="userFormId" name="userForm" action="" method="post">
	<div>
		<ul class="">
		<c:forEach var="user" items="${users}" varStatus="status">
           <li class="user_${user.id}"><input type="hidden" name='userIds' value="${user.id}">${user.loginName}(${user.nickName})<a class="option_del" onclick="$('.user_${user.id}').remove();"></a></li>
		</c:forEach>
		</ul>
	</div>
	<%@include file="roleSet.jsp"%>
</form>

