<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>贵州省卫生监督执法综合管理平台</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" /> 
	<meta http-equiv='Cache-Control' content='no-cache, must-revalidate' />
	<meta http-equiv='expires' content='0' />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/login.css" />
	<script type="text/javascript">
		if (top.location.pathname != window.location.pathname) {
			top.location.href = document.location.href;
		};
	</script>
</head>
<body>
<div class="login_container">
	<div class="logo"></div>
	<div class="title"></div>
	<div class="message_container">
		<div class="message" id="message">
			<c:if test='${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"]!= null}'>用户信息不存在或密码错误，请重新登录！</c:if>
		</div>
	</div>
	<form id="loginId" action='<c:url value="/login/check"/>' method="post">
		<div class="sub_container">
			<b class="icon_username">&nbsp;</b>
			<input class="username" type="text" id="username" name="username" />
		</div>
		<div class="sub_container">
			<b class="icon_password">&nbsp;</b>
			<input class="password" type="password" id="password" name="password" />
		</div>
		<div class="sub_container">
			<input class="login" type="button" value="" id="login" name="login" />
		</div>
	</form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/ajax.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	document.onkeydown = function(e) { 
	    var ev = document.all ? window.event : e;
	    if(ev.keyCode == 13) {
	    	$("#login").click();
	    }
	};
	$("#login").click(function() {
		if($('#username').val() == "" ) {  
			$("#message").html("请输入用户名！");
			return;
		}
		if($('#password').val() == ""){
			$("#message").html("请输入密码！");
			return;
		}
		$("#loginId")[0].submit();
	});
	$("#username").focus();
});
</script>
</body>
</html>