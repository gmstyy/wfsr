<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editFormId" action="" method="post">
	<input type="hidden" id="CSRFTokenName" value="${CSRFTokenName}"/>
	<input type="hidden" id="CSRFToken" value="${CSRFToken}"/>
	<input type="hidden" name='id' value="${importConfig.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;" />
			<col />
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>表名<span style='color: red'>*</span></th>
				<td><hs:dic dicName="IMPORT_TYPE" id="tableName" name="tableName" defalt="${importConfig.tableName}" /></td>
				<th>属性名<span style='color: red'>*</span></th>
				<td><input type='text' value='${importConfig.property}' id='property' name='property' maxlength='50' /></td>
			</tr>
			<tr>
				<th>列名</th>
				<td><input type='text' value='${importConfig.columeName}' id='columeName' name='columeName' maxlength='50' /></td>
				<th>列号</th>
				<td><input type='text' value='${importConfig.columeIndex}' id='columeIndex' name='columeIndex' maxlength='50' /></td>

			</tr>
			<tr>
				<th>日期格式</th>
				<td><input type='text' value='${importConfig.dateFormat}' id='dateFormat' name='dateFormat' maxlength='50' /></td>
				<th>默认值</th>
				<td><input type='text' value='${importConfig.defaultValue}' id='defaultValue' name='defaultValue' maxlength='50' /></td>

			</tr>
			<tr>
				<th>字典名</th>
				<td><input type='text' value='${importConfig.dicName}' id='dicName' name='dicName' maxlength='50' /></td>

			</tr>
		</tbody>
	</table>
</form>

