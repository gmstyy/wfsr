<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editFormId" action="" method="post">
	<input type="hidden" name='id' value="${config.id}">
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
				<td><input type='text' value='${config.key}' id='code' name='code' maxlength='50' /></td>
				<th>值<span style='color: red'>*</span></th>
				<td><input type='text' value='${config.value}' id='type' name='type' maxlength='3' /></td>
			</tr>
		</tbody>
	</table>
</form>

