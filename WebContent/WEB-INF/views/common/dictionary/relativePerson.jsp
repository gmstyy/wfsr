<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../layout/taglibs.jsp"%>
<table class="repeattable">
	<colgroup>
		<col style="width: 30px;">
		<col style="width: 50px;">
		<col style="width: 120px;">
		<col style="width: 120px;">
		<col style="width: 120px;">
		<col style="width: 120px;">
		<col>
		<col style="width: 120px;">
	</colgroup>
	<thead>
		<tr class="row_header">
			<th>&nbsp;</th>
			<th>编号</th>
			<th>管理相对人</th>
			<th>类别</th>
			<th>法人及法定代表</th>
			<th>地址</th>
			<th>联系电话</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="relativePerson" items="${relativePersonList}" varStatus="status">
		<tr class="<c:if test="${status.index%2==0}">row_odd</c:if><c:if test="${status.index%2==1}">row_even</c:if>">
	 		<td style="text-align: center;"><input type="checkbox" class="dicCheckItem" value="${relativePerson.id}" onclick="selectItem(this);" /></td>
	 		<td style="text-align: center;">${status.index+1}</td>
			<td class="name">${relativePerson.name}</td>
			<td class="type"><hs:v dicName="RELATIVE_PERSON_TYPE" code="${relativePerson.type}"/></td>
			<td class="legalPersonName">${relativePerson.legalPersonName}</td>
			<td class="address">${relativePerson.address}</td>
			<td class="telephone">${relativePerson.telephone}</td>
			<td class="relativePersonSn" style="display:none;">${relativePerson.relativePersonNum}</td>
			<td class="legalPersonIdCard" style="display:none;">${relativePerson.legalIdNo}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<script type="text/javascript">
var rowClick = function(row) {
	var checkBox = $(row).find(".dicCheckItem").get(0);
	checkBox.checked = !checkBox.checked;
	selectItem(checkBox);
};
var selectItem = function(obj) {
	if (!obj.checked) {
		return;
	}
	$(".dicCheckItem").each(function(index, item) {
		if (item == obj) {
			return;
		}
		if (item.checked) {
			item.checked = false;
		}
	});
};
var setSelectedValues = function(selectedValues) {
	if (selectedValues == null || selectedValues == "") {
		return;
	}
	$(".dicCheckItem").each(function(index, item) {
		if (selectedValues == item.value) {
			item.checked = true;
		} else {
			allSelected = false;
		}
	});
};
var getSelectedValues = function() {
	var value = null;
	$(".dicCheckItem").each(function(index, item) {
		if (item.checked) {
			value = item.value;
		}
	});
	return value;
};
var getSelectedNames = function() {
	var value = null;
	$(".dicCheckItem").each(function(index, item) {
		if (item.checked) {
			var container = $(item).parent().parent();
			value = {
				relativePersonId : item.value,
				applicant : container.children(".name").html(),
				chargePerson : container.children(".chargePerson").html(),
				legalPerson : container.children(".legalPersonName").html(),
				legalPersonIdCard : container.children(".legalPersonIdCard").html(),
				telephone : container.children(".telephone").html(),
				unitAddress : container.children(".address").html(),
				relativePersonSn : container.children(".relativePersonSn").html()
			};
		}
	});
	return value;
};
</script>