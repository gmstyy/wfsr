<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../layout/taglibs.jsp"%>
<table class="repeattable">
	<colgroup>
		<col style="width: 30px;">
		<col style="width: 50px;">
		<col>
		<col style="width: 200px;">
		<col style="width: 220px;">
	</colgroup>
	<thead>
		<tr class="row_header">
			<th><input type="checkbox" id="dicSelectAll" onclick="selectAll(this);" /></th>
			<th>编号</th>
			<th>部门名称</th>
			<th>角色类别</th>
			<th>角色名称</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="role" items="${roleList}" varStatus="status">
		<tr class="<c:if test="${status.index%2==0}">row_odd</c:if><c:if test="${status.index%2==1}">row_even</c:if>">
	 		<td style="text-align: center;"><input type="checkbox" class="dicCheckItem" value="${role.code}" onclick="selectItem(this);" /></td>
	 		<td style="text-align: center;">${status.index+1}</td>
			<td><hs:v dicName="DEPT" code="${role.departmentId}"></hs:v></td>
			<td><hs:v dicName="ROLE_TYPE" code="${role.type}"></hs:v></td>
			<td class="role_name">${role.name}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<script type="text/javascript">
var selectAll = function(obj) {
	$(".dicCheckItem").each(function(index, item) {
		item.checked = obj.checked;
	});
};
var selectItem = function(obj) {
	var allChecked = true;
	$(".dicCheckItem").each(function(index, item) {
		if (!item.checked) {
			allChecked = false;
		}
	});
	$("#dicSelectAll").get(0).checked = allChecked;
};
var setSelectedValues = function(selectedValues) {
	if (selectedValues == null || selectedValues == "") {
		return;
	}
	var values = selectedValues.split(",");
	var allSelected = true;
	$(".dicCheckItem").each(function(index, item) {
		if (values.indexOf(item.value) > -1) {
			item.checked = true;
		} else {
			allSelected = false;
		}
	});
	if (allSelected) {
		$("#dicSelectAll").get(0).checked = true;
	}
};
var getSelectedValues = function() {
	var values = [];
	$(".dicCheckItem").each(function(index, item) {
		if (item.checked) {
			values.push(item.value);
		}
	});
	return values.join(',');
};
var getSelectedNames = function() {
	var values = [];
	$(".dicCheckItem").each(function(index, item) {
		if (item.checked) {
			values.push($(item).parent().parent().children(".role_name").html());
		}
	});
	return values.join(';');
};
</script>