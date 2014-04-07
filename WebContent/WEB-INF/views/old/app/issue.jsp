<%--@elvariable id="relativePerson" type="com.founder.hs.entity.business.RelativePerson"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<form id="editForm" action="" method="post">
	<input type="hidden" name="id" value="${relativePerson.id}"/>
	<input type="hidden" name="licenseType" value="${relativePerson.licenseType}"/>
	<input type="hidden" name="domain" value="${relativePerson.domain}"/>
	<table class="edittable">
		<colgroup>
			<col style="width: 150px"/>
			<col />
			<col style="width: 150px"/>
			<col />
		</colgroup>
		<tbody>
		<tr>
			<th>许可种类</th>
			<td><hs:v dicName="LICENSE_TYPE" code="${relativePerson.licenseType}"/></td>
			<th>申请人</th>
			<td>${relativePerson.name}</td>
		</tr>
		<tr>
			<th>申请项目</th>
			<td>${relativePerson.applyItem}</td>
			<th>单位负责人</th>
			<td>${relativePerson.legalPersonName}</td>
		</tr>
		<tr>
			<th>申请类型</th>
			<td colspan="3">
				<hs:v dicName="APPLY_TYPE" code="${relativePerson.applyType}" />
				<input type="hidden" name="applyType" value="${relativePerson.applyType}"/>
			</td>
		</tr>
		<tr>
			<th>卫生许可编号<span class="must_field">*</span></th>
			<td colspan="3">
				<input type="text" id="location" style="width: 50px" value="${licensePart[0]}"/> 卫
				<input type="text" id="licType" style="width: 50px" value="${licensePart[1]}"/> 证
				字（<input type="text" id="year" maxlength="4" style="width: 50px" value="${licensePart[2]}"/>）
				第 [<input type="text" id="district" maxlength="6"  style="width: 60px" value="${fn:substring(licensePart[3], 0, 6)}"/>-
				<input type="text" id="number" maxlength="6"  style="width: 60px" value="${fn:substring(licensePart[3], 6, 12)}"/>] 号
				<input type="button" value="生成编号" onclick="generateNo()" style="width: 80px" ${relativePerson.licenseNo ne null ? 'diabled="disabled"' : ''}/>
				<input type="hidden" id="licenseNo" name="licenseNo" value="${relativePerson.licenseNo}"/>
			</td>
		</tr>
		<tr>
			<th>有效开始日期<span class="must_field">*</span></th>
			<td><tag:dateInput name="validBeginDatetime" date="${relativePerson.validBeginDatetime}"/></td>
			<th>有效结束日期<span class="must_field">*</span></th>
			<td><tag:dateInput name="validEndDatetime" date="${relativePerson.validEndDatetime}"/></td>
		</tr>
		</tbody>
	</table>
</form>
<script type="text/javascript">
	var getLicenseData = function(formData) {
		var licenseNo = $("#location").val() + "卫" + $("#licType").val() + "证字" + $("#year").val() + "第" + $("#district").val() + $("#number").val() + "号";
		formData.licenseNo = licenseNo;
		return formData;
	};

	var licenseHelper = new dataHelper();
	var generateNo = function() {
		var licenseType = ${relativePerson.licenseType};
		var district = ${relativePerson.domain};
		licenseHelper.basicPost("/app/generateLicenseNo", {
			licenseType : licenseType
		}, 0, null, function(data) {
			$("#licenseNo").val(data.licenseNo);
			var arr = data.licensePart;
			$("#location").val(arr[0]);
			$("#licType").val(arr[1]);
			$("#year").val(arr[2]);
			$("#district").val(arr[3].substring(0, 6));
			$("#number").val(arr[3].substring(6, 12));
		})
	};
</script>