<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ page language="java" import="com.founder.hs.constant.HSCV" %>

<form id="editFormId" action="" method="post">
	<input type="hidden" name="${CSRFTokenName}" value="${CSRFToken}">
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
				<th>突发事件名称<span class="must_field">*</span></th>
				<td colspan="3"><input type="text" style="width:79.5%" name="name" maxlength='100' value="${emergency.name}"/></td>
			</tr>
			<tr>
				<th>预案</th>
				<td colspan="3">
					<%-- <input type="text" value="${preplan.customName}"/>
					<c:if test="${not empty preplan}">
						<span><a href="javascript:void(0);" class="option_view" title="查看" onclick="viewPreplan(${preplan.id});"></a></span>
					</c:if> --%>
					<select name="preplanId" id="preplan_sel">
						<option value='' class='option'></option>
						<c:if test="${not empty preplans}">
							<c:forEach var="preplan" items="${preplans}">
								<option value='${preplan.id}' ${emergency.preplanId eq preplan.id? 'selected=selected':'' } class='option'>${preplan.customName}</option>
							</c:forEach>
						</c:if>
					</select>					
				</td>	
			</tr>
			<tr>
				<th>发生场所<span class="must_field">*</span></th>
				<td colspan="3"><input type='text' name="place" value="${emergency.place}" style="width: 80%;" maxlength='100'/></td>
			</tr>
			<tr>
				<th>发生地点<span class="must_field">*</span></th>
				<td colspan="3"><input type='text' name="address" value="${emergency.address}" style="width: 80%;" maxlength='100'/></td>
			</tr>			
			<tr>
				<th>发生日期</th>
				<td colspan="3"><tag:dateInput onlypast="false" name="occurrenceDate" date="${emergency.occurrenceDate}"/></td>
			</tr>						
			<tr>
				<th>突发事件内容</th>
				<td colspan="3"><textarea rows="5" name="content" style="width: 80%">${emergency.content}</textarea></td>
			</tr>
			<tr>
				<th>登记人</th>
				<td><input type="text" readonly="readonly" value="${emergency.handlerName}"></td>
				<th>登记日期时间</th>
				<td><input type="text" readonly="readonly" value="<fmt:formatDate value="${emergency.registerDatetime}" pattern="yyyy-MM-dd HH:mm:ss" />"></td>
			</tr>
<%-- 			<tr>
				<th>事件来源</th>
				<td><input type="text" value="<hs:v dicName="EMERGENCY_SOURCE" code="${emergency.emergencyResource}" />"></td>
			</tr> --%>
			<tr>
				<th>处理状态</th>
				<td>
					<input type="radio" name="handleStatus" ${emergency.handleStatus eq 1? 'checked':''} value="1">已完成
					<input type="radio" name="handleStatus" ${emergency.handleStatus eq 0? 'checked':''} value="0">未完成
				</td>
				<th>任务</th>
				<td><a href="javascript:void(0);" onclick="queryTasks('${emergency.id}','<%=HSCV.WORKFLOW_CATEGORY.EMERGENCY%>');"><span id="taskCount"></span></a><a class="option_add" href="javascript:void(0);" onclick="addTask();"></a></td>
			</tr>
			<%-- <tr id="showOrHideResult" style='${emergency.handleStatus eq 0 or empty emergency.handleStatus? "display: none":""}'> --%>
		    <tr>
				<th>结果记录</th>
				<td colspan="3"><textarea rows="5" style="width: 80%" id='result' name='result' maxlength='1000'>${emergency.result}</textarea></td>
			</tr>
		</tbody>
	</table>
</form>
<div id="emergency_workflows"></div>
<script type="text/javascript">
var viewPreplan = function(id) {
	file.download(id);
};
var showOrHide = function(status){
	if(status == 1){
		$("#showOrHideResult").show();
		$("#result").attr('name','result');
	}else{
		$("#showOrHideResult").hide();
		$("#result").attr('name','');
		$("#result").val("");
	}
};
$(function() {
	var data = new Object();
	data.sourceType = 3; //任务来源：应急处置
	data.taskType = 3; //临时性监督
	data.categoryCode = '<%=HSCV.WORKFLOW_CATEGORY.EMERGENCY%>';
	data.relationId = '${emergency.id}';
	data.title = '${emergency.name}';
	data.description = '${emergency.content}';
	data.address = '${emergency.address}';
	data.place = '${emergency.place}';
	passParams(data);
	//workflowCount();
	taskCount();
});
</script>

