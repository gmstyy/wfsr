<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="userFormId" name="userForm" action="" method="post">
	<input type="hidden" name='userId' value="${user.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr style="line-height: 30px;">
				<th>机构</th>
				<td>
					<c:if test="${orgList.size() == 1}">
					<span>${orgList[0].name}</span>
					</c:if>
					<c:if test="${orgList.size() > 1}">
					<select id="orgId" name="orgId" onchange="updateDeptList(this, 'deptId');">
						<c:forEach var="org" items="${orgList}">
							<option value="${org.id}" <c:if test="${org.id==user.orgId}">selected="selected"</c:if>><c:if test="${org.orgAdminLevel==3}">&nbsp;&nbsp;</c:if><c:if test="${org.orgAdminLevel==4}">&nbsp;&nbsp;&nbsp;&nbsp;</c:if>${org.name}</option>
						</c:forEach>
					</select>
					</c:if>
				</td>
			</tr>
			<tr style="line-height: 30px;">
				<th>科室</th>
				<td>
					<select id="deptId" name="deptId">
						<c:forEach var="dept" items="${deptList}">
							<option value="${dept.id}" <c:if test="${dept.id==user.departmentId}">selected="selected"</c:if>>${dept.name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</tbody>
	</table>
</form>
