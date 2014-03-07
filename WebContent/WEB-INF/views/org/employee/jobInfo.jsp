<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<form id="editExperienceFormId" action="" method="post">
	<input type='hidden' value='${employeeId}' id='employeeId' name='employeeId' />
	<table class="edittable">
		<tr>
			<th colspan="7">添加工作经历<a class="option_add" onclick="addExperienceRow('#editExperienceFormId')"></a></th>
		</tr>
		<tbody id="experienceTemplate" style="display: none;">
			<tr>
				<th>起始日期</th><td><tag:dateInput onlypast="false" name="startDatetime" /></td>
				<th>终止日期</th><td><tag:dateInput onlypast="false" name="endDatetime" /></td>
				<th>工作单位</th><td><input type='text' name="workUnit" maxlength="200"/></td>
			</tr>
			<tr>
				<th>职位</th><td><input type="text" name="position" maxlength="10"></td>
				<th>职称</th><td><input type='text' name="title" maxlength="10"></td>
				<th>描述</th><td><input type="text" name="description" maxlength="200"></td>
				<th><a title="删除" href="javascript:void(0);" class="option_del" onclick="deleteItem(this,'#editExperienceFormId');"></a></th>
			</tr>
		</tbody>
	</table>
	<table class="edittable" id="addExperienceNode">
		<c:if test="${empty employeeExperienceList}">
			<tbody>
				<tr>
					<th>起始日期</th><td><tag:dateInput onlypast="false" name="startDatetime" /></td>
					<th>终止日期</th><td><tag:dateInput onlypast="false" name="endDatetime" /></td>
					<th>工作单位</th><td><input type='text' name="workUnit" maxlength="200"/></td>
				</tr>
				<tr>
					<th>职位</th><td><input type="text" name="position" maxlength="10"></td>
					<th>职称</th><td><input type='text' name="title" maxlength="10"></td>
					<th>描述</th><td><input type="text" name="description" maxlength="200"></td>
					<th><a title="删除" href="javascript:void(0);" class="option_del" style="display:none;" onclick="deleteItem(this,'#editExperienceFormId');"></a></th>
				</tr>
			</tbody>
		</c:if>
		<c:if test="${not empty employeeExperienceList}">
			<c:forEach var="employeeExperienceList" items="${employeeExperienceList}">
				<tbody>
					<tr>
						<th>起始日期</th><td><tag:dateInput onlypast="false" name="startDatetime" date="${employeeExperienceList.startDatetime}"/></td>
						<th>终止日期</th><td><tag:dateInput onlypast="false" name="endDatetime" date="${employeeExperienceList.endDatetime}"/></td>
						<th>工作单位</th><td><input type='text' name="workUnit" value="${employeeExperienceList.workUnit}" maxlength="200"/></td>
					</tr>
					<tr>
						<th>职位</th><td><input type="text" name="position" value="${employeeExperienceList.position}" maxlength="10"></td>
						<th>职称</th><td><input type='text' name="title" value="${employeeExperienceList.title}" maxlength="10"></td>
						<th>描述</th><td><input type="text" name="description" value="${employeeExperienceList.description}" maxlength="200"></td>
						<th><a title="删除" href="javascript:void(0);" class="option_del" style="display:none;" onclick="deleteItem(this,'#editExperienceFormId');"></a></th>
					</tr>
				</tbody>
			</c:forEach>
		</c:if>
	</table>
</form>