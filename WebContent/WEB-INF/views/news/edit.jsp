<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editFormId" action="" method="post">
	<input type="hidden" name='id' value="${foodList.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;" />
			<col />
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>参数名<span style='color: red'>*</span></th>
				<td><input type='text' value='${foodList.name}' id='name' name='name' maxlength='50' /></td>
				<th>值<span style='color: red'>*</span></th>
				<hs:dic dicName="MENU" value1="3" defalt="${foodList.menuId}"></hs:dic>
			</tr>
			<tr>
				<td><img alt="" src="${foodList.path}" /></td>
				<td><input type="file"  id='path' name='path' maxlength='3' /></td>
			</tr>
			<tr>
				<th>描述<span style='color: red'></span></th>
				<td colspan="3"><textarea rows="3" cols="10">${foodList.remark}</textarea></td>
			</tr>
		</tbody>
	</table>
</form>

