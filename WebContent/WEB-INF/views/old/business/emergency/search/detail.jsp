<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" import="com.founder.hs.constant.HSCV" %>

<form id="editFormId" action="" method="post">
	<input type="hidden" name='id' value="${emergency.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 130px;" />
			<col />
			<col style="width: 85px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>突发事件名称</th>
				<td colspan="3"><input type="text" readonly="readonly" style="width:79.5%;" value="${emergency.name}"></td>
			</tr>
			<tr>
				<th>预案</th>
				<td colspan="3">
					<input type="text" readonly="readonly" value="${preplan.customName}">
					<c:if test="${not empty preplan}">
						<span><a href="javascript:void(0);" class="option_view" title="查看" onclick="top.viewPreplan(${preplan.id});"></a></span>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>发生场所</th>
				<td colspan="3"><input type='text' readonly="readonly" value="${emergency.place}" style="width: 79.5%;"/></td>
			</tr>
			<tr>
				<th>发生日期</th>
				<td colspan="3"><input type="text" readonly="readonly" value="<fmt:formatDate value="${emergency.occurrenceDate}" pattern="yyyy-MM-dd" />"></td>
			</tr>						
			<tr>
				<th>发生地点</th>
				<td colspan="3"><input type='text' readonly="readonly" value="${emergency.address}" style="width: 79.5%;"/></td>
			</tr>
			<tr>
				<th>突发事件内容</th>
				<td colspan="3"><textarea readonly="readonly" rows="5" style="width: 79.5%">${emergency.content}</textarea></td>
			</tr>
			<tr>
				<th>登记人</th>
				<td><input type="text" readonly="readonly" value="${emergency.handlerName}"></td>
				<th>登记日期时间</th>
				<td><input type="text" readonly="readonly" value="<fmt:formatDate value="${emergency.registerDatetime}" pattern="yyyy-MM-dd HH:mm:ss" />"></td>
			</tr>
			<tr>
				<th>处理状态</th>
				<td>
					<input type="radio" disabled="disabled" name="handleStatus" ${emergency.handleStatus eq 1? 'checked':''}>已完成
					<input type="radio" disabled="disabled" name="handleStatus" ${emergency.handleStatus eq 0? 'checked':''}>未完成
				</td>
				<th>任务</th>
				<td><a href="javascript:void(0);" onclick="queryTasks('${emergency.id}','<%=HSCV.WORKFLOW_CATEGORY.EMERGENCY%>');"><span id="taskCount"></span></a></td>
			</tr>
<%-- 		<tr style='${emergency.handleStatus eq 0 or empty emergency.handleStatus? "display: none":""}'>
				<th>结果录入人</th>
				<td><input type="text" readonly="readonly" value="${emergency.finisherName}"></td>
				<th>结果录入时间</th>
				<td><input type="text" readonly="readonly" value="<fmt:formatDate value="${emergency.finishDatetime}" pattern="yyyy-MM-dd HH:mm:ss" />"></td>
			</tr> --%>
			<%-- <tr id="showOrHideResult" style='${emergency.handleStatus eq 0 or empty emergency.handleStatus? "display: none":""}'> --%>
			<tr>	
				<th>结果记录</th>
				<td colspan="3"><textarea readonly="readonly" rows="5" style="width: 79.5%">${emergency.result}</textarea></td>
			</tr>			
			<%-- <tr>
				<th>上报状态</th>
				<td><input type="text" readonly="readonly" value="<hs:v dicName="REPORT_STATUS" code="${emergency.isReported}" />"></td>
				<th>上报人</th>
				<td><input type="text" readonly="readonly" value="${emergency.reporterName}"></td>
			</tr>
			<tr>
				<th>上报时间</th>
				<td><input type="text" readonly="readonly" value="<fmt:formatDate value="${emergency.reportDatetime}" pattern="yyyy-MM-dd HH:mm:ss" />"></td>
			</tr> --%>
		</tbody>
	</table>
</form>
<script type="text/javascript">
top.viewPreplan = function(id) {
	file.download(id);
};

$(function() {
	var data = new Object();
	data.categoryCode = '<%=HSCV.WORKFLOW_CATEGORY.EMERGENCY%>';
	data.relationId = '${emergency.id}';
	passParams(data);
	//workflowCount();
	taskCount();
});
</script>
