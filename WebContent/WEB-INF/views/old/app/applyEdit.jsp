<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>

<div id="tabsApp">
	<ul>
		<li class="tabs-1"><span>申请人</span></li>
		<li class="tabs-2"><span>申请项目</span></li>
		<li class="tabs-3"><span>申请材料</span></li>
		<c:if test="${hasOthers}">
			<li class="tabs-4"><span>其他信息</span></li>
		</c:if>
	</ul>
	<div id="tabs-1">
		<form action="" id="relativeInfoForm"><jsp:include page="relativeInfo.jsp"/></form>
	</div>
	<div id="tabs-2">
		<form action="" id="appForm"><jsp:include page="/WEB-INF/views/app/${licensePath}/edit.jsp"/></form>
		<c:choose>
			<c:when test="${licenseType eq '5'}">
				<div id="appRadiateItemList" class="edit_section">
					<div class="title">申请项目</div>
					<hs:dic dicName="APPLY_ITEM" type="checkbox" defalt="${app.appRadiateItemMap}" groupIndex="1" name='itemCode' displayProperty="name" divClass="appRadiateItemDiv" hiddenPropertiy="id"/>
				</div>
			</c:when>
		</c:choose>
	</div>
	<div id="tabs-3">
		<%@ include file="/WEB-INF/views/app/material.jsp"%>
	</div>
	<c:if test="${hasOthers}">
		<div id="tabs-4">
			<jsp:include page="/WEB-INF/views/app/${licensePath}/others.jsp"/>
		</div>
	</c:if>
</div>
<script type="text/javascript">
	tabs.createTabs("tabsApp");
</script>