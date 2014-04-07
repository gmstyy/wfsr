<%@page contentType="text/html;charset=UTF-8"%>
<head>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ include file="/WEB-INF/views/layout/csslibs.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>王府涮肉欢迎您</title>
</head>

<div class="header">
<div class="logo"></div>
<ul class="menu">
	<c:forEach var="menu" items="${topMenuList}" varStatus="status">
		<li><a href="${pageContext.request.contextPath}/${menu.url}">${menu.name}</a></li>
	</c:forEach>
</ul>
</div>