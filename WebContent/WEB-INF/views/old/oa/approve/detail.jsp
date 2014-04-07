<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" import="com.founder.oa.common.constant.OACV" %>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>

<table class="repeattable">
	<colgroup>
		<col style="width: 50px;">
		<col style="width: 120px;">
		<col style="width: 150px;">
		<col style="width: 100px;">
		<col>
	</colgroup>
	<thead>
		<tr class="row_header">
			<th>序号</th>
			<th>审批人</th>
			<th>审批时间</th>
			<th>状态</th>
			<th>备注</th>
		</tr>
	</thead>
	<c:forEach items="${approveLogList}" var="app" varStatus="status">
		<tr class='<c:choose><c:when test="${status.count % 2 == 0}">row_odd</c:when><c:otherwise>row_even</c:otherwise></c:choose>'>
			<td>${status.count}</td>
			<td>${app.updaterName}</td>
			<td><fmt:formatDate value="${app.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><hs:v dicName="WORKFLOW_NODE" code="${app.currentNodeId}"/></td>
			<td align="left">${app.remark}</td>
		</tr>
	</c:forEach>	 
</table>
