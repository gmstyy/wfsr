<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editFormId" action="" method="post">
	<input type="hidden" id="CSRFTokenName" value="${CSRFTokenName}" /> <input type="hidden" id="CSRFToken" value="${CSRFToken}" /> <input type="hidden" name='statisticsId'
		value="${statisticsConfig.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>SQL</th>
				<td colspan="3"><textarea rows="5" cols="70"  id="runSql" name="runSql" >${statisticsConfig.runSql}</textarea></td>
			</tr>
			<c:forEach var="p" items="${params}">
			<tr>
				<th>${p} =</th>
				<td><input type='text' id='${p}' name='${p}' maxlength='50' /></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</form>

