<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div class="edit_section">
	<div class="title">使用权限</div>
<div id="tabsUse">  
	<ul>
		<c:forEach var="accessTab" items="${accessTab}" varStatus="groupStatus">
			<li class="tabs-1${accessTab.key}"><span><hs:v dicName="ACCESS_TYPE" code="${accessTab.key}"></hs:v></span></li>    
		</c:forEach>
	</ul>
	<c:forEach var="accessTab" items="${accessTab}" varStatus="groupStatus">
		<div id="tabs-1${accessTab.key}">
			<c:forEach var="accessGroup" items="${accessTab.value}" varStatus="groupStatus">
				<fieldset>
					<legend><input type='checkbox' onclick='dicCheckBoxSelectAll(this)'/>${accessGroup.key}<!-- <input type="button" onclick='dicCheckBoxShowAll(this)'/> --></legend>
					<c:forEach var="accezz" items="${accessGroup.value}" varStatus="status">
						<div class="checkListItem"><input type="checkbox" <c:if test="${useAccezzMap[accezz.id]!=null}"> checked='checked'</c:if> name="accessIds" class="InputCheck" value="${accezz.id}" /> ${accezz.name}</div>
					</c:forEach>
				</fieldset>
			</c:forEach>
		</div>
	</c:forEach>
</div>
</div>
<div class="edit_section">
	<div class="title">管理权限</div>
<div id="tabsManage">  
	<ul>
		<c:forEach var="accessTab" items="${accessTab}" varStatus="groupStatus">
			<li class="tabs-2${accessTab.key}"><span><hs:v dicName="ACCESS_TYPE" code="${accessTab.key}"></hs:v></span></li>    
		</c:forEach>
	</ul>
	<c:forEach var="accessTab" items="${accessTab}" varStatus="groupStatus">
		<div id="tabs-2${accessTab.key}">
			<c:forEach var="accessGroup" items="${accessTab.value}" varStatus="groupStatus">
				<fieldset>
					<legend><input type='checkbox' onclick='dicCheckBoxSelectAll(this)'/>${accessGroup.key}<!-- <input type="button" onclick='dicCheckBoxShowAll(this)'/> --></legend>
					<c:forEach var="accezz" items="${accessGroup.value}" varStatus="status">
						<div class="checkListItem"><input type="checkbox" <c:if test="${useAccezzMap[accezz.id]!=null}"> checked='checked'</c:if> name="powerIds" class="InputCheck" value="${accezz.id}" /> ${accezz.name}</div>
					</c:forEach>
				</fieldset>
			</c:forEach>
		</div>
	</c:forEach>
</div>
</div>
<div style="display: none; clear: both;"></div>
<script type="text/javascript">
tabs.createTabs("tabsUse");
tabs.createTabs("tabsManage");
</script>
