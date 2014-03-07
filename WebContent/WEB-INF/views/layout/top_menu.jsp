<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
<div class="navigator">
	<div class="menu_group">
		<div class="menu_move">
		<c:forEach var="menu" items="${topMenus}" varStatus="status">
			<div class="menu_item <c:if test="${status.index==0}">focus_item</c:if>">
				<div class="right">&nbsp;</div>
				<div class="middle">
					<div onclick="menu.loadLeftMenu(this, '${menu.id}')">${menu.name}</div>
				</div>
				<div class="left">&nbsp;</div>
			</div>
		</c:forEach>
		</div>
	</div>
	<div class="datetime">
		<div class="right">&nbsp;</div>
		<div class="middle" onclick="gotoDefaultPage();" title="进入个人首页">
			<span>今天是：</span><span id="today"></span>
		</div>
		<div class="left">&nbsp;</div>
	</div>
	<div class="menu_helper">
		<a class="move_left" href="javascript:void(0);" onclick="scrollNavigator(false);">|&lt;&lt;</a>
		<a class="move_right" href="javascript:void(0);" onclick="scrollNavigator(true);">&gt;&gt;|</a>
	</div>
</div>