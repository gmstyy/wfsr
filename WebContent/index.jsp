<%@page contentType="text/html;charset=UTF-8"%>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>王府涮肉欢迎您</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/layout.css" />
<script src="${pageContext.request.contextPath}/js/jquery/jquery-1.9.1.js" type="text/javascript"></script> 
</head>

<body>
<div class="logo"></div>
<ul class="menu">
	<c:forEach var="menu" items="${menuList}" varStatus="status">
		<li><a href="${pageContext.request.contextPath}/${menu.url}" >${menu.name}</a></li>
	</c:forEach>
</ul>
<div class="content"></div>
<div class="best move_up"></div>
<div class="info move_up"></div>
<div class="footer" align="center"><p>© 2012 版权所有 王府涮肉</p></div>
<script type="text/javascript">
	$(".move_up").mouseover(function(){
		$(this).css("top","200px");
	});
	$(".move_up").mouseout(function(){
		$(this).css("top","376px");
	});
</script>
</body>
</html>
