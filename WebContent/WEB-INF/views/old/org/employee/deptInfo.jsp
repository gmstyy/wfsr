<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<form id="editDepartmentFormId" action="" method="post">
	<input type='hidden' value='${employeeId}' id='employeeId' name='employeeId' />
	<table class="edittable">
		<tr>
			<th colspan="7">新增其他职务<a class="option_add" onclick="addDepartmentRow('#editDepartmentFormId');"></a></th>
		</tr>
		<tbody id="departmentTemplate" style="display: none">
			<tr>
				<th>科室</th><td><hs:dic dicName='DEPT' name='departmentId' value1="${loginUser.orgId}"></hs:dic></td>
				<th>行政职务</th><td><hs:dic dicName='ADMIN_POSITION' name='positionCode'></hs:dic></td>
				<th><a title="删除" href="javascript:void(0);" class="option_del" style="display:none;" onclick="deleteItem(this,'#editDepartmentFormId');"></a></th>
			</tr>
		</tbody>
	</table>
	<table class="edittable" id="addDepartmentNode">
		<c:if test="${empty deptList}">
			<tbody>
				<tr>
					<th>科室</th><td><hs:dic dicName='DEPT' name='departmentId' value1="${loginUser.orgId}"></hs:dic></td>
					<th>行政职务</th><td><hs:dic dicName='ADMIN_POSITION' name='positionCode'></hs:dic></td>
					<th><a title="删除" href="javascript:void(0);" class="option_del" style="display:none;" onclick="deleteItem(this,'#editDepartmentFormId');"></a></th>
				</tr>
			</tbody>
		</c:if>
		<c:if test="${not empty deptList}">
			<c:forEach var="deptList" items="${deptList}">
				<tbody>
					<tr>
						<th>科室</th><td><hs:dic dicName='DEPT' name='departmentId' defalt="${deptList.departmentId}" value1="${loginUser.orgId}"></hs:dic></td>
						<th>行政职务</th><td><hs:dic dicName='ADMIN_POSITION' name='positionCode' defalt="${deptList.positionCode}"></hs:dic></td>
						<th><a title="删除" href="javascript:void(0);" class="option_del" style="display:none;" onclick="deleteItem(this,'#editDepartmentFormId');"></a></th>
					</tr>
				</tbody>
			</c:forEach>
		</c:if>
	</table>
</form>
