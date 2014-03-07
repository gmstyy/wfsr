<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editFormId" action="" method="post">
	<input type="hidden" name='id' value="${syncData.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>类型</th>
				<td>${syncData.type}</td>
			</tr>
			<tr>
				<th>版本</th>
				<td>${syncData.version}</td>
			</tr>
			<tr>
				<th>同步标识</th>
				<td>${syncData.flag}</td>
			</tr>
			<tr>
				<th>数据</th>
				<td style="word-break: break-all;">${syncData.jsonData}</td>
			</tr>
			<tr>
				<th>错误信息</th>
				<td>${syncData.message}</td>
			</tr>
		</tbody>
	</table>
</form>

