<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editFormId" action="" method="post">
	<input type="hidden" name='id' value="${menu.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;" />
			<col />
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>父菜单</th>
				<td><hs:v code="${menu.parentId}" dicName="OA_MENUS" /></td>
				<th>菜单名称<span style='color: red'>*</span></th>
				<td><input type='text' value='${menu.name}' id='name' name='name' maxlength='50' /></td>
			</tr>
			<tr>
				<th>菜单URL<span style='color: red'>*</span></th>
				<td colspan="3"><input type='text' value='${menu.url}' id='url' name='url' maxlength='200' style="width:380px;" /></td>
			</tr>
			<tr>
				<th>菜单图标</th>
				<td>${menu.imagePath}</td>
				<th>排序号<span style='color: red'>*</span></th>
				<td><input type='text' value='${menu.sortNo}' id='sortNo' name='sortNo' maxlength='3' /></td>
			</tr>
		</tbody>
	</table>
</form>

