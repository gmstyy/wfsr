<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editFormId" action="" method="post">
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
				<td><input type='text' value='${config.code}' id='code' name='code' maxlength='50' /></td>
				<th>类别<span style='color: red'>*</span></th>
				<td><input type='text' value='${config.type}' id='type' name='type' maxlength='3' /></td>
			</tr>
			<tr>
				<th>参数值</th>
				<td><input type='text' value='${config.parmValue}' id='parmValue' name='parmValue' maxlength='50' /></td>
				<th>默认值</th>
				<td><input type='text' value='${config.defaultValue}' id='defaultValue' name='defaultValue' maxlength='50' /></td>

			</tr>
		</tbody>
	</table>
</form>
