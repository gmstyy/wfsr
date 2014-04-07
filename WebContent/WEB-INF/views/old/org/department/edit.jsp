<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editFormId" action="" method="post">
	<input type="hidden" name='id' value="${department.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 100px;" />
			<col />
			<col style="width: 100px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>科室名称<span style='color: red'>*</span></th>
				<td><input type='text' value='${department.name}' id='name' name='name' maxlength='11' /></td>
				<th>排序号</th>
				<td><input type='text' value='${department.sortNo}' id='sortNo' name='sortNo' maxlength='11' /></td>
			</tr>
			<tr>
				<th>科室类别</th>
				<td><hs:dic dicName="DEPARTMENT_TYPE" defalt="${department.type}" id='type' name='type'/></td>
				<th>科室级别</th>
				<td><hs:dic dicName="DEPARTMENT_LEVEL" defalt="${department.departmentLevel}" id='departmentLevel' name='departmentLevel' /></td>					
			</tr>
		<c:if test="${department.id!=null}">
			<tr>
				<th>科室负责人</th>
				<td><hs:dic id="leaderId" name="leaderId" dicName="EMP" value2="${department.id}" defalt="${department.leaderId}"></hs:dic></td>
			    <th>联系电话</th>
				<td><input type='text' value='${department.tel}'  id='tel' name='tel' maxlength='200' /></td>
			</tr>
		</c:if>
			<tr>
				<th>职责描述</th>
				<td colspan="3"><textarea id='description' name='description' rows="5" style="width:79.5%;">${department.description}</textarea></td>
			</tr>
		</tbody>
	</table>
</form>

