<%--@elvariable id="app" type="com.founder.hs.entity.business.AppRadiate"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<table class="edittable">
	<colgroup>
		<col style="width: 120px;" />
		<col />
		<col style="width: 120px;" />
		<col />
	</colgroup>
	<tbody>
	<tr>
		<th>机构总人数</th>
		<td><input type='text' value='${app.employeeCount}' id='employeeCount' name='employeeCount' maxlength='9' /></td>
		<th>放射工作人员数</th>
		<td><input type='text' value='${app.radiatePersonCount}' id='radiatePersonCount' name='radiatePersonCount' maxlength='10' /></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td><input type='text' value='${app.contacter}' id='contacter' name='contacter' maxlength='50' /></td>
		<th>传真</th>
		<td><input type='text' value='${app.fax}' id='fax' name='fax' maxlength='20' /></td>
	</tr>
	<%--<tr>
		<th>审核机关意见</th>
		<td colspan="3"><textarea name="orgOpinion" id="orgOpinion" cols="75" rows="5">${app.orgOpinion}</textarea></td>
	</tr>
	<tr>
		<th>卫生行政部门审查意见</th>
		<td colspan="3"><textarea name="departmentOpinion" id="departmentOpinion" cols="75" rows="5">${app.departmentOpinion}</textarea></td>
	</tr>--%>
	<tr>
		<th>放射诊疗许可编号</th>
		<td><input type='text' value='${app.licenseNo}' id='licenseNo' name='licenseNo' maxlength='30' /></td>
		<th>单位类别<span class="must_field">*</span></th>
		<td><hs:dic dicName='RELATIVE_PERSON_BUSINESS_TYPE' id='businessTypeb' name='businessTypeb' defalt="${app.businessTypeb}" blank="false" value1 = "04"/></td>
	</tr>
	</tbody>
</table>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/oa/app.js"></script>
<script type="text/javascript">
	var getAppParams = function(formData) {
		formData.appRadiateEquList = getDataList("appRadiateEquList", ".detailList");
		formData.appRadiateSealIsotopeList = getDataList("appRadiateSealIsotopeList", ".detailList");
		formData.appRadiateUnsealIsotopeList = getDataList("appRadiateUnsealIsotopeList", ".detailList");
		formData.appRadiateSourceEquList = getDataList("appRadiateSourceEquList", ".detailList");
		formData.licenseMaterialList = appMaterialCheckedData("appMaterialList", ".appMaterial");
		formData.appRadiateItemList = getCheckedDataList("appRadiateItemList", ".appRadiateItemDiv");
		formData.businessTypebName = $("#businessTypeb :selected").html();
		var prms = {};
		prms.json = $.toJSON(formData);
		prms.licenseType = $("#relativeInfoForm #licenseType").val();
		return prms;
	}
</script>