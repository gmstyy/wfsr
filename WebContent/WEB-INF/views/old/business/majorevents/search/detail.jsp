<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" import="com.founder.hs.constant.HSCV" %>

<form id="editFormId" action="" method="post">
	<input type="hidden" name='id' value="${majorEvents.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 150px;" />
			<col style="width: 200px;" />
			<col style="width: 150px;" />
			<col />
		</colgroup>
		<tbody>		
			<tr>
				<th>活动名称</th>
				<td colspan="3"><input type="text" value="${majorEvents.name}" name="name" readonly="readonly" style="width:78.5%"/></td>
			</tr>
			<tr>
				<th>预案</th>
				<td>
					<input type="text" readonly="readonly" value="${preplan.customName}">
					<c:if test="${not empty preplan}">
						<span><a href="javascript:void(0);" class="option_view" title="查看" onclick="top.viewPreplan(${preplan.id});"></a></span>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>活动场所</th>
				<td colspan="3"><input type="text" value="${majorEvents.place}" name="place" readonly="readonly" style="width:78.5%"/></td>
			</tr>
			<tr>
				<th>活动地址</th>
				<td colspan="3"><input type="text" value="${majorEvents.address}" name="address" readonly="readonly" style="width:78.5%"/></td>
			</tr>	
			<tr>
				<th>活动开始日期</th>
				<td><input type="text" value="<fmt:formatDate value='${majorEvents.startDate}' pattern='yyyy-MM-dd' />" name="startDate" readonly="readonly"/></td>
				<th>活动结束日期</th>
				<td><input type="text" value="<fmt:formatDate value='${majorEvents.endDate}' pattern='yyyy-MM-dd' />" name="endDate" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>活动内容</th>
				<td colspan="3">
					<textarea rows="6" style="width: 78.5%" id='content' name='content' maxlength='2000' readonly="readonly">${majorEvents.content}</textarea>
				</td>
			</tr>														
			<tr>
				<th>登记人</th>
				<td><input type="text" value="${majorEvents.handlerName}" name="handlerName" readonly="readonly"/></td>			
				<th>登记日期时间</th>
				<td><input type="text" value="<fmt:formatDate value='${majorEvents.registerDatetime}' pattern='yyyy-MM-dd HH:mm:ss' />" name="registerDatetime" readonly="readonly"/></td>
			</tr>
			<tr>	
				<th>处理状态</th>
				<td>
					<input type="radio" disabled="disabled" name="status" ${majorEvents.status eq 1? 'checked':''} value="1">已完成
					<input type="radio" disabled="disabled" name="status" ${majorEvents.status eq 0? 'checked':''} value="0">未完成
				</td>				
				<th>任务</th>
				<td><a href="javascript:void(0);" onclick="queryTasks('${majorEvents.id}','<%=HSCV.WORKFLOW_CATEGORY.MAJOREVENTS%>');"><span id="taskCount"></span></a></td>		
			</tr>
			<tr>
				<th>活动记录</th>
				<td colspan="3">
					<textarea rows="6" style="width: 78.5%" id='result' name='result' readonly="readonly">${majorEvents.result}</textarea>
				</td>		
			</tr>						
		</tbody>
	</table>
</form>
<script type="text/javascript">
$(function() {
	var data = new Object();
	data.categoryCode = '<%=HSCV.WORKFLOW_CATEGORY.MAJOREVENTS%>';
	data.relationId = '${majorEvents.id}';
	passParams(data);
	//workflowCount();
	taskCount();
});
top.viewPreplan = function(id) {
	file.download(id);
};
</script>
