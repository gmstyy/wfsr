<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<form id="editFamilyFormId" action="" method="post">
	<input type='hidden' value='${employeeId}' id='employeeId' name='employeeId' />
	<table class="edittable">
		<tr>
			<th colspan="7">添加家庭关系<a class="option_add" onclick="addFamilyRow('#editFamilyFormId');"></a></th>
		</tr>
		<tbody id="familyTemplate" style="display: none">
			<tr>
				<th>家庭关系</th><td><input type='text' name="relationship" maxlength="10"/></td>
				<th>姓名</th><td><input type="text" name="name" maxlength="30"></td>
				<th>工作单位</th><td><input type='text' name="workUnit" maxlength="200"/></td>
			</tr>
			<tr>
				<th>联系电话</th><td><input type="text" name="telephone" maxlength="20"></td>
				<th></th><td></td><th></th><td></td>
				<th><a title="删除" href="javascript:void(0);" class="option_del" style="display:none;" onclick="deleteItem(this,'#editFamilyFormId');"></a></th>
			</tr>
		</tbody>
	</table>
	<table class="edittable" id="addfamilyNode">
		<c:if test="${empty employeeFamilyList}">
			<tbody>
				<tr>
					<th>家庭关系</th><td><input type='text' name="relationship" maxlength="10"/></td>
					<th>姓名</th><td><input type="text" name="name" maxlength="30"></td>
					<th>工作单位</th><td><input type='text' name="workUnit" maxlength="200"/></td>
				</tr>
				<tr>
					<th>联系电话</th><td><input type='text' name="telephone" maxlength="20"/></td>
					<th></th><td></td><th></th><td></td>
					<th><a title="删除" href="javascript:void(0);" class="option_del" style="display:none;" onclick="deleteItem(this,'#editFamilyFormId');"></a></th>
				</tr>
			</tbody>
		</c:if>
		<c:if test="${not empty employeeFamilyList}">
			<c:forEach var="employeeFamilyList" items="${employeeFamilyList}">
				<tbody>
					<tr>
						<th>家庭关系</th><td><input type='text' name="relationship" value="${employeeFamilyList.relationship}" maxlength="10"/></td>
						<th>姓名</th><td><input type="text" name="name" value="${employeeFamilyList.name}" maxlength="30"></td>
						<th>工作单位</th><td><input type='text' name="workUnit" value="${employeeFamilyList.workUnit}" maxlength="200"></td>
					</tr>
					<tr>
						<th>联系电话</th><td><input type="text" name="telephone" value="${employeeFamilyList.telephone}" maxlength="20"></td>
						<th></th><td></td><th></th><td></td>
						<th><a title="删除" href="javascript:void(0);" class="option_del" style="display:none;" onclick="deleteItem(this,'#editFamilyFormId');"></a></th>
					</tr>
				</tbody>
			</c:forEach>
		</c:if>
	</table>
</form>
