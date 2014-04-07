<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<table class="edittable">
	<colgroup>
		<col style="width: 120px;" />
		<col />
		<col style="width: 120px;" />
		<col />
	</colgroup>
	<tbody>
	<tr>
		<th>申请项目<span class="must_field">*</span></th>
		<td><input type='text' value='${app.applyItem}' id='applyItem' name='applyItem' maxlength='200' /></td>
		<th>单位类别<span class="must_field">*</span></th>
		<td><hs:dic dicName='RELATIVE_PERSON_BUSINESS_TYPE' id='businessTypeb' name='businessTypeb' defalt="${app.businessTypeb}" blank="false" value1="01" /></td>
	</tr>
	<tr>
		<th>职工人数</th>
		<td><input type='text' value='${app.employeeCount}' id='employeeCount' name='employeeCount' maxlength='9' /></td>
		<th>应体检人数</th>
		<td><input type='text' value='${app.examPersonCount}' id='examPersonCount' name='examPersonCount' maxlength='9' /></td>
	</tr>
	<tr>
		<th>固定资产（万元）</th>
		<td><input type='text' value='${app.fixedAssets}' id='fixedAssets' name='fixedAssets' maxlength='10' /></td>
		<th>使用面积</th>
		<td><input type='text' value='${app.area}' id='area' name='area' maxlength='10' /></td>
	</tr>
	<tr>
		<th>竣工验收许可证号</th>
		<td><input type='text' value='${app.completeLicenseNo}' id='completeLicenseNo' name='completeLicenseNo' maxlength='30' /></td>
		<th>原卫生许可证号</th>
		<td><input type='text' value='${app.oldLicenseNo}' id='oldLicenseNo' name='oldLicenseNo' maxlength='20' /></td>
	</tr>
	<%--<c:if test="${app.id ne null}">
		<tr>
			<th>卫生许可编号</th>
			<td><input type='text' value='${app.licenseNo}' id='licenseNo' name='licenseNo' maxlength='30' /></td>
		</tr>
	</c:if>--%>
	<%--<tr>
		<th>审查结果——设备布局</th>
		<td><input type='text' value='${app.auditEquipment}' id='auditEquipment' name='auditEquipment' maxlength='200' /></td>
		<th>审查结果——工艺流程</th>
		<td><input type='text' value='${app.auditProcess}' id='auditProcess' name='auditProcess' maxlength='200' /></td>
	</tr>
	<tr>
		<th>审查结果——卫生设施</th>
		<td><input type='text' value='${app.auditFacility}' id='auditFacility' name='auditFacility' maxlength='200' /></td>
		<th>审查结果——内外环境情况</th>
		<td><input type='text' value='${app.auditEnvironment}' id='auditEnvironment' name='auditEnvironment' maxlength='200' /></td>
	</tr>
	<tr>
		<th>审查结果——产品质量保证</th>
		<td><input type='text' value='${app.auditQuality}' id='auditQuality' name='auditQuality' maxlength='200' /></td>
		<th>审查结果——消毒情况</th>
		<td><input type='text' value='${app.auditDisinfaction}' id='auditDisinfaction' name='auditDisinfaction' maxlength='200' /></td>
	</tr>
	<tr>
		<th>审查结果——其他</th>
		<td><input type='text' value='${app.auditOthers}' id='auditOthers' name='auditOthers' maxlength='200' /></td>
	</tr>--%>
	</tbody>
</table>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/oa/app.js"></script>
<script type="text/javascript">
	var getAppParams = function(formData) {
		formData.licenseMaterialList = appMaterialCheckedData("appMaterialList", ".appMaterial");
		formData.businessTypebName = $("#businessTypeb :selected").html();
		var prms = {};
		prms.json = $.toJSON(formData);
		prms.licenseType = $("#relativeInfoForm #licenseType").val();
		return prms;
	};
</script>
