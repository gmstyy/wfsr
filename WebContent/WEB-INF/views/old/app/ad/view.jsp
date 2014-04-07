<%--@elvariable id="app" type="com.founder.hs.entity.business.AppAdvertisement"--%>
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
		<th>申请项目</th>
		<td><input type="text" name="applyItem" value="${app.applyItem}" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>《医疗机构执业许可证》登记号<span class="must_field">*</span></th>
		<td><input type='text' value='${app.registerNumber}' id='registerNumber' name='registerNumber'
		           maxlength='30' readonly="readonly"/></td>
		<th>发证卫生行政部门<span class="must_field">*</span></th>
		<td><input type='text' value='${app.issuingDepartment}' id='issuingDepartment' name='issuingDepartment'
		           maxlength='100' readonly="readonly"/></td>
	</tr>
	<tr>
		<th>申请机构类别<span class="must_field">*</span></th>
		<td><hs:dic type="radio" dicName="AD_ORG_TYPE" name="applyOrgType" defalt="${app.applyOrgType}" blank="false" disabled="true"/></td>
		<th>所有制形式</th>
		<td><input type='text' value='${app.ownershipPattern}' id='ownershipPattern' name='ownershipPattern'
		           maxlength='50' readonly="readonly"/></td>
	</tr>
	<tr>
		<th>校验有效期开始</th>
		<td><tag:dateInput date='${app.checkValidityPeriodBegin}' id='checkValidityPeriodBegin'
		                   name='checkValidityPeriodBegin' disabled="true"/></td>
		<th>校验有效期结束</th>
		<td><tag:dateInput date='${app.checkValidityPeriodEnd}' id='checkValidityPeriodEnd'
		                   name='checkValidityPeriodEnd' disabled="true"/></td>
	</tr>
	<tr>
		<th>医疗机构类别<span class="must_field">*</span></th>
		<td><hs:dic dicName='ORG_TYPE' id='institutionsCategories' name='institutionsCategories' defalt="${app.institutionsCategories}" disabled="true"/></td>
		<th>诊疗科目<span class="must_field">*</span></th>
		<td><input type='text' value='${app.diagnosisTreatmentSubject}' id='diagnosisTreatmentSubject'
		           name='diagnosisTreatmentSubject' maxlength='50' readonly="readonly"/></td>
	</tr>
	<tr>
		<th>床 位 数</th>
		<td><input type='text' value='${app.bedNumber}' id='bedNumber' name='bedNumber' maxlength='11' readonly="readonly"/></td>
		<th>接诊时间</th>
		<td><tag:dateInput date='${app.acceptsTime}' id='acceptsTime' name='acceptsTime' disabled="true"/></td>
	</tr>
	<tr>
		<th>发布媒体类别<span class="must_field">*</span></th>
		<td colspan="3"><hs:dic type="checkbox" defalt="${app.publishMediaCategory}" dicName='PUBLISH_MEDIA_TYPE' id='publishMediaCategory' name='publishMediaCategory' disabled="true"/></td>
	</tr>
	<tr>
		<th>广告时长(影视、声音)</th>
		<td><input type='text' value='${app.advertisTime}' id='advertisTime' name='advertisTime' maxlength='11' readonly="readonly"/>
		</td>
	</tr>
	<tr>
		<th>经办人</th>
		<td><input type='text' value='${app.agent}' id='agent' name='agent' maxlength='50' readonly="readonly"/></td>
		<th>经办人身份证号</th>
		<td><input type='text' value='${app.agentIdNo}' id='agentIdNo' name='agentIdNo' maxlength='18' readonly="readonly"/></td>
	</tr>
	</tbody>
</table>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/oa/app.js"></script>
<script type="text/javascript">
	var getAppParams = function(formData) {
		formData.licenseMaterialList = appMaterialCheckedData("appMaterialList", ".appMaterial");
		var prms = {};
		prms.json=$.toJSON(formData);
		prms.licenseType=$("#editFormId #licenseType").val();
		return prms;
	};
</script>