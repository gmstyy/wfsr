<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ page language="java" import="com.founder.hs.constant.HSCV" %>

<form id="editFormId" action="" method="post">
	<input type="hidden" name="${CSRFTokenName}" value="${CSRFToken}">
	<input type="hidden" name='id' value="${majorEvents.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 130px;" />
			<col />
			<col style="width: 85px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>活动名称<span class="must_field">*</span></th>
				<td colspan="3"><input type="text" value="${majorEvents.name}" name="name" style="width:79.5%"/></td>
			</tr>
			<tr>
				<th>预案</th>
				<td colspan="3">
					<select name="preplanId" id="preplan_sel">
						<option value='' class='option'></option>
						<c:if test="${not empty preplan}">
							<c:forEach var="preplan" items="${preplan}">
								<option value='${preplan.id}' ${majorEvents.preplanId eq preplan.id? 'selected=selected':'' } class='option'>${preplan.customName}</option>
							</c:forEach>
						</c:if>
					</select>
					<%-- <span id="preplan_view" ${empty majorEvents.preplanId? "style=display:none;":""}><a href="javascript:void(0);" class="option_view" title="查看" onclick="viewPreplan();"></a></span> --%>
				</td>
			</tr>
			<tr>
				<th>活动场所<span class="must_field">*</span></th>
				<td colspan="3"><input type="text" value="${majorEvents.place}" name="place" style="width:79.5%"/></td>
			</tr>	
			<tr>
				<th>活动地址<span class="must_field">*</span></th>
				<td colspan="3"><input type="text" value="${majorEvents.address}" name="address" style="width:79.5%"/></td>
			</tr>	
			<tr>
				<th>活动开始日期</th>
				<td><tag:dateInput onlypast="false" name="startDate" date="${majorEvents.startDate}"/></td>
				<th>活动结束日期</th>
				<td><tag:dateInput onlypast="false" name="endDate" date="${majorEvents.endDate}"/></td>
			</tr>						
			<tr>
				<th>活动内容</th>
				<td colspan="3">
					<textarea rows="6" style="width: 79.5%" id='content' name='content' maxlength='1500' >${majorEvents.content}</textarea>
				</td>
			</tr>
			<tr>
				<th>登记人</th>
				<td><input type="text" value="${majorEvents.handlerName}" name="handlerName" disabled/></td>
				<th>登记日期时间</th>
				<td><input type="text" value="<fmt:formatDate value='${majorEvents.registerDatetime}' pattern='yyyy-MM-dd HH:mm:ss' />" name="content" disabled/></td>
			</tr>
			<tr>
				<th>处理状态</th>
				<td>
					<input type="radio" name="status" ${majorEvents.status eq 1? 'checked':''} value="1">已完成
					<input type="radio" name="status" ${majorEvents.status eq 0? 'checked':''} value="0">未完成
				</td>
				<th>任务</th>
				<td colspan="3"><a href="javascript:void(0);" onclick="queryTasks('${majorEvents.id}','<%=HSCV.WORKFLOW_CATEGORY.MAJOREVENTS%>');"><span id="taskCount"></span></a><a class="option_add" href="javascript:void(0);" onclick="addTask();"></a>				
			</tr>
			<tr>
				<th>活动记录</th>
				<td colspan="3">
					<textarea rows="6" style="width: 79.5%" id='result' name='result' maxlength="1500">${majorEvents.result}</textarea>
				</td>
			</tr>									
		</tbody>
	</table>
</form>
<div id="emergency_workflows"></div>
<script type="text/javascript">
$(function() {
	var data = new Object();
	data.sourceType = 4;//任务来源：重大活动
	data.taskType = 3; //临时性监督
	data.categoryCode = '<%=HSCV.WORKFLOW_CATEGORY.MAJOREVENTS%>';
	data.relationId = '${majorEvents.id}';
	data.title = '${majorEvents.name}';
	data.description = '${majorEvents.content}';
	data.address = '${majorEvents.address}';
	data.place = '${majorEvents.place}';
	passParams(data);
	//workflowCount();
	taskCount();
});
$("#preplan_sel").change(function(){
	if($("#preplan_sel").val() != ''){
		$("#preplan_view").show();
	}else{
		$("#preplan_view").hide();
	}
});
var viewPreplan = function() {
	if($("#preplan_sel").val() != '')
		file.download($("#preplan_sel").val());
};
</script>

