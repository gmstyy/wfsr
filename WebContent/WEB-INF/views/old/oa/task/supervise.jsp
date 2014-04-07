<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="edittable">
	<colgroup>
		<col style="width: 80px;" />
		<col />
		<col style="width: 80px;" />
		<col />
		<col style="width: 80px;" />
		<col />		
	</colgroup>
	<tbody>
		<tr>
			<th>总分</th>
			<td>${totalScore}</td>
			<th>实际得分</th>
			<td>${factScore}</td>
			<th>核定等级</th>
			<td>${reportClass}</td>
		</tr>
		<tr>
			<th>扣分详情</th>	
			<td colspan="5"></td>
		</tr>
		<c:if test="${empty deductList}">
		<tr>
			<th></th>
			<td colspan="5">无</td>
		</tr>
		</c:if>	
		<c:forEach items="${deductList}" var="str" varStatus="status">
		<tr>
			<th></th>
			<td colspan="5">${str}</td>
		</tr>
		</c:forEach>
	</tbody>				
</table>

