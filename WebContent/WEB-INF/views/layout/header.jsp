<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
<div class="header">
	<div class="logo">
		<div class="title">
			<div class="options">
				<div class="opt" style="width: 55px;">
					<div class="right">&nbsp;</div>
					<div class="middle logoff" onclick="Dialog.confirm('确定要注销吗？', function() {window.location.href='<c:url value="/j_spring_security_logout"/>';});" title="退出系统">注销</div>
					<div class="left">&nbsp;</div>
				</div>
				<div class="opt" style="width: 160px;">
					<div class="right">&nbsp;</div>
					<div class="middle welcome" onclick="viewInformation();" title="查看个人信息">
						<div class="user_icon"></div>
						<span style="font-weight: bold;">欢迎：</span><span id="login_user_name">${user.nickName}</span>
					</div>
					<div class="left">&nbsp;</div>
				</div>
				<div class="opt" style="width: 300px;">
					<div class="right">&nbsp;</div>
					<div class="middle department" onclick="switchDepartment();" title="切换当前科室">
						<span style="font-weight: bold;">当前科室：</span><hs:v dicName="ORG" code="${user.orgId}" /> - <hs:v dicName="DEPT" code="${user.departmentId}" />
					</div>
					<div class="left">&nbsp;</div>
				</div>
			</div>
		</div>
	</div>
</div>