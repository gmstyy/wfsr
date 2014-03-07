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
		<col style="width: 120px;">
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
			<td style="text-align: center;">${status.count}</td>
			<td>${app.updaterName}</td>
			<td><fmt:formatDate value="${app.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><hs:v dicName="WORKFLOW_NODE" code="${app.currentNodeId}"/></td>
			<td align="left">${app.remark}</td>
		</tr>
	</c:forEach>	 
</table>
<br>
<form id="approveFormId" name="approveForm" action="" method="post">
	<input type="hidden" name="${CSRFTokenName}" value="${CSRFToken}">
	<input type="text" value="${approveId}" name="approveId" style="display:none;"/>
	<input type="text" value="${workflowId}" name="workflowId" style="display:none;"/>
	<input type="text" value="${currentNodeId}" name="currentNodeId"  style="display:none;"/>
	<input type="text" name="nextNodeId" id="nextNodeId" style="display:none;"/>
	
	<table class="edittable">
		<tr>
			<th align="left">任务数量:</th>
			<td align="left"><a href="javascript:void(0);" onclick="queryTasks('${approveId}','${categoryCode}');"><span id="taskCount">${taskCount}</span></a>&nbsp;&nbsp;<a class="option_add" href="javascript:void(0);" title="新建任务" onclick="addTask();"></a></td>
		</tr>
		<tr>
			<th align="left" style="width:150px;">您的处理意见:</th>			
			<td align="left">
				<textarea rows="3" name="remark" style="width:80%;"></textarea>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
$(function() {
	var data = new Object();
	data.sourceType = '${taskSource}';
	data.taskType = '${taskType}';
	data.categoryCode = '${categoryCode}';
	data.relationId = "${approveId}";
	data.relativePersonSn = '${entity.relativePersonSn}';
	data.address = '${entity.address}';
	//data.chargePerson = '${entity.chargePerson}';
	//data.chargePersonTel = '${entity.chargePersonTel}';
	data.place = '${entity.place}';
	passParams(data);
	taskCount();
});
</script>
