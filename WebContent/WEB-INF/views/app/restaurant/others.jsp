<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="edittable">
	<tr>
		<th colspan="9">添加填加食品安全设施<a class="option_add" onclick="addRow('appRestaurantEquList','appRestaurantEquTemplate')"></a></th>
	</tr>
	<tr id="appRestaurantEquTemplate" style="display: none">
		<th>名称</th>
		<td><input type='text' name='name' maxlength='50' /></td>
		<th>数量</th>
		<td><input type='text' name='count' maxlength='10' /></td>
		<th>位置</th>
		<td><input type='text'  name='position' maxlength='30' /></td>
		<th>备注</th>
		<td><input type='text' name='remark' maxlength='100' /></td>
		<th><a title="删除" href="javascript:void(0);" class="option_del" onclick="deleteItem($(this).parents('tr').eq(0),'appRestaurantEquDelIds');"></a></th>
	</tr>
	<tbody id="appRestaurantEquList">
	<c:forEach var="appRestaurantEqu" items="${app.appRestaurantEquList}" varStatus="status">
		<tr>
			<th>名称</th>
			<td><input type='text' value='${appRestaurantEqu.name}' name='name' maxlength='50' /></td>
			<th>数量</th>
			<td><input type='text' value='${appRestaurantEqu.count}' name='count' maxlength='10' /></td>
			<th>位置</th>
			<td><input type='text' value='${appRestaurantEqu.position}' name='position' maxlength='30' /></td>
			<th>备注</th>
			<td><input type='text' value='${appRestaurantEqu.remark}' name='remark' maxlength='100' /></td>
			<th><a title="删除" href="javascript:void(0);" class="option_del"  onclick="deleteItem($(this).parents('tr').eq(0),'appRestaurantEquDelIds','${appRestaurantEqu.id}');"></a></th>
		</tr>
	</c:forEach>
	</tbody>
</table>