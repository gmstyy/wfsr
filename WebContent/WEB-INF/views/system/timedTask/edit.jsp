<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editFormId" action="" method="post">
	<input type="hidden" id="CSRFTokenName" value="${CSRFTokenName}" /> <input type="hidden" id="CSRFToken" value="${CSRFToken}" /> <input type="hidden" name='id'
		value="${timedTask.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;" />
			<col />
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>名称</th>
				<td><input type='text' value='${timedTask.name}' id='name' name='name' maxlength='50' /></td>
				<th>类型</th>
				<td><hs:dic dicName="TIMED_TASK_TYPE" defalt="${timedTask.type}" id='type' name='type' ></hs:dic></td>
			</tr>
			<tr>
				<th>运行时间</th>
				<td><input type='text' value='${timedTask.runDate}' id='runDate' name='runDate' maxlength='50' /></td>
				<th>上次运行时间</th>
				<td><input type='text' value='${timedTask.lastRunDate}' id='lastRunDate' name='lastRunDate' maxlength='50' /></td>
			</tr>
				<tr>
				<th>服务名</th>
				<td><input type='text' value='${timedTask.serviceName}' id='serviceName' name='serviceName' maxlength='50' /></td>
				<th>数据ID</th>
				<td><input type='text' value='${timedTask.configId}' id='configId' name='configId' maxlength='50' /></td>
			</tr>
		</tbody>
	</table>
</form>

