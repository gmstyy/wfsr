<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>

<table class="repeattable">
	<colgroup>
		<col style="width: 50px;">
		<col style="width: 120px;">
		<col style="width: 100px;">
		<col style="width: 100px;">
		<col style="width: 150px;">
		<col>
		<col style="width: 60px;">
		<col style="width: 50px;">
	</colgroup>
	<thead>
		<tr class="row_header">
			<th>序号</th>
			<th>业务种类</th>
			<th>流程名</th>
			<th>处理人</th>
			<th>处理时间</th>
			<th>备注</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
	</thead>
	<c:forEach items="${approveList}" var="app" varStatus="status">
	<tr class='<c:choose><c:when test="${status.count % 2 == 0}">row_odd</c:when><c:otherwise>row_even</c:otherwise></c:choose>'>
		<td style="text-align: center;">${status.count}</td>
		<td align="left"><hs:v dicName="WORKFLOW_CATEGORY" code="${app.categoryCode}"/></td>
		<td align="left">${app.workflowName}</td>
		<td align="left">${app.updaterName}</td>
		<td><fmt:formatDate value="${app.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<td align="left">${app.remark}</td>
		<td><hs:v dicName="WORKFLOW_NODE" code="${app.currentNodeId}"/></td>
		<td style="text-align: center;">
 			<div class="option_container">
 				<a href="javascript:void(0);" title="查看" class="option_view" onclick="viewWorkflowDetail('${app.id}');"></a>	
			</div>
		</td>	
	</tr>
	</c:forEach>
</table>

