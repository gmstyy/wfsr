<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="userFormId" name="userForm" action="" method="post">
	<input type="hidden" name='id' value="${role.id}">
	<input type="hidden" name='code' value="${role.code}">
	<table class="edittable">
			<colgroup>
			<col style="width: 80px;" />
			<col style="width: 250px;"/>
			<col style="width: 50px;" />
			<col />
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>角色名称<span style='color: red'>*</span></th>
				<td><input style="width: 250px;" type='text' value='${role.name}' id='name' name='name' maxlength='50' /></td>	
				<th>科室<span style='color: red'>*</span></th>
				<td><hs:dic dicName="DEPT" defalt="${role.departmentId}" id='departmentId' name='departmentId' value1="${loginUser.orgId}" blank="false"/></td>
				<th>角色类别</th>
				<td><hs:dic dicName="ROLE_TYPE" blank="true" defalt="${role.type}" id='type' name='type'/></td>
				<%-- <th>角色代码<span style='color: red'>*</span></th>
				<td><input type='text' value='${role.code}' id='code' name='code' maxlength='50' /></td>--%>	
			</tr>
		</tbody>
	</table>
	<%@include file="accessSet.jsp"%>
</form>
