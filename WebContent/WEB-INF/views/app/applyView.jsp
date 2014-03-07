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
	<form id="editFormId" action="" method="post">
		<div id="tabs-1">
			<jsp:include page="relativeInfoView.jsp"/>
		</div>
		<div id="tabs-2">
			<jsp:include page="/WEB-INF/views/app/${licensePath}/view.jsp"/>
		</div>
	</form>
	<div id="tabs-3">
		<%@ include file="/WEB-INF/views/app/materialView.jsp"%>
	</div>
	<c:if test="${hasOthers}">
		<div id="tabs-4">
			<jsp:include page="/WEB-INF/views/app/${licensePath}/othersView.jsp"/>
		</div>
	</c:if>
</div>
<script type="text/javascript">
	tabs.createTabs("tabsApp");
</script>