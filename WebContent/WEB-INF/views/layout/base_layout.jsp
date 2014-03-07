<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="taglibs.jsp"%>
	<title>贵州省卫生监督执法综合管理平台</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv='Cache-Control' content='no-cache, must-revalidate' />
	<meta http-equiv='expires' content='0' />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
	<%@ include file="/WEB-INF/views/layout/csslibs.jsp"%>
</head>
<body>
<div id="waitingContainer" style="display: none; position: absolute; width: 300px; height: 60px;">
	<div class="waiting"></div>
</div>
<div class="wrapper">
	<div class="top_left">
		<div class="top_right">
			<div class="top_middle"></div>
		</div>
	</div>
	<div class="center_left">
		<div class="center_right">
			<div class="content_wrapper">
				<tiles:insertAttribute name="header" />
				<tiles:insertAttribute name="topmenu" />
				<div class="content">
					<div class="menu_container">
						<div class="menu_group" id="leftMenuContainer"></div>
					</div>
					<div class="spliter_container">
						<div class="spliter"></div>
					</div>
					<div class="content_title">
						<div class="crumb"></div>
						<span class="current_page" id="current_page">个人首页</span>
					</div>
					<iframe class="page_container" id="page_iframe" style="display: none;"></iframe>
					<div class="page_container" id="page_container" style="display: none;"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom_left">
		<div class="bottom_right">
			<div class="bottom_middle"></div>
		</div>
	</div>
</div>
<div id="editContainer" style="display: none;"></div>
<div id="taskContainer" style="display: none;"></div>
<div id="taskListContainer" style="display: none;"></div>
<div id="taskViewDetailContainer" style="display: none;"></div>
<div id="workflowContainer" style="display: none;"></div>
<div id="workflowListContainer" style="display: none;"></div>
<div id="workflowViewDetailContainer" style="display: none;"></div>
<div id="dictionaryContainer" style="display: none;"></div>
<div id="passwordContainer" style="display: none;"></div>
<div id="superviseContainer" style="display: none;"></div>
<%@ include file="/WEB-INF/views/layout/scriptlibs.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	resetContentSize();
	window.onresize = resetContentSize;
	$(".spliter").click(function() {
		if ($(".menu_container").css("display") == "none") {
			menu.show();
		} else {
			menu.hide();
		}
	});
	$(".navigator .middle").eq(0).children().click();
	$("#today").html(new Date().format("c"));
	// 加载首页
	gotoDefaultPage();
});
</script>
</body>
</html>

