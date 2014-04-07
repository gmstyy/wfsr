<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../layout/taglibs.jsp"%>
<table class="repeattable">
	<colgroup>
		<col style="width: 30px;">
		<col style="width: 50px;">
		<col>
		<col style="width: 120px;">
		<col style="width: 200px;">
	</colgroup>
	<thead>
		<tr class="row_header">
			<th><input type="checkbox" id="dicSelectAll" onclick="selectAll(this);" /></th>
			<th>编号</th>
			<th>机构名称</th>
			<th>组织机构代码</th>
			<th>行政区划代码</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="org" items="${orgList}" varStatus="status">
		<tr class="<c:if test="${status.index%2==0}">row_odd</c:if><c:if test="${status.index%2==1}">row_even</c:if>">
	 		<td style="text-align: center;"><input type="checkbox" class="dicCheckItem" value="${org.id}" onclick="selectItem(this);" /></td>
	 		<td style="text-align: center;">${status.index+1}</td>
			<td class="org_name">${org.name}</td>
			<td>${org.orgCode}</td>
			<td>${org.adminDivisionCode}</td>
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
			values.push($(item).parent().parent().children(".org_name").html());
		}
	});
	return values.join(';');
};
</script>