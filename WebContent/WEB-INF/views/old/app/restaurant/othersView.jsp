<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="edittable">
	<tr>
		<th colspan="9">填加食品安全设施</th>
	</tr>
	<tbody id="appRestaurantEquList">
	<c:forEach var="appRestaurantEqu" items="${app.appRestaurantEquList}" varStatus="status">
		<tr>
			<th>名称</th>
			<td><input type='text' value='${appRestaurantEqu.name}' name='name' maxlength='50' readonly="readonly" /></td>
			<th>数量</th>
			<td><input type='text' value='${appRestaurantEqu.count}' name='count' maxlength='10' readonly="readonly" /></td>
			<th>位置</th>
			<td><input type='text' value='${appRestaurantEqu.position}' name='position' maxlength='30' readonly="readonly" /></td>
			<th>备注</th>
			<td><input type='text' value='${appRestaurantEqu.remark}' name='remark' maxlength='100' readonly="readonly" /></td>
			<th></th>
		</tr>
	</c:forEach>
	</tbody>
</table>