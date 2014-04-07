<%--@elvariable id="app" type="com.founder.oa.entity.business.AppSalt"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<table class="edittable">
	<colgroup>
		<col style="width: 100px;" />
		<col />
		<col style="width: 100px;" />
		<col />
	</colgroup>
	<tbody>
	<tr>
		<th>申请项目<span class="must_field">*</span></th>
		<td><input type="text" name="applyItem" value="${app.applyItem}"/></td>
	</tr>
	<tr>
		<th>实际生产地址<span class="must_field">*</span></th>
		<td colspan="3"><input type='text' value='${app.actualProductionAddress}' id='actualProductionAddress'
		                       name='actualProductionAddress' maxlength='200' style="width: 80%"/></td>
	</tr>
	<tr>
		<th>生产项目<span class="must_field">*</span></th>
		<td><input type='text' value='${app.productionProject}' id='productionProject' name='productionProject'
		           maxlength='100'/></td>
		<th>生产方式<span class="must_field">*</span></th>
		<td><input type='text' value='${app.productionMode}' id='productionMode' name='productionMode'
		           maxlength='100'/></td>
	</tr>
	<tr>
		<th>生产类别<span class="must_field">*</span></th>
		<td><input type='text' value='${app.productionCategory}' id='productionCategory' name='productionCategory'
		           maxlength='50'/></td>
		<th>邮编</th>
		<td><input type='text' value='${app.zipCode}' id='zipCode' name='zipCode'/></td>
	</tr>
	<%--<tr>
		<th>业务六处意见</th>
		<td colspan="3"><textarea name="sixBusinessOpinion" id="sixBusinessOpinion" cols="70" rows="5">${app.sixBusinessOpinion}</textarea></td>
	</tr>
	<tr>
		<th>业务六处经办人</th>
		<td><input type='text' value='${app.sixBusinessAgent}' id='sixBusinessAgent' name='sixBusinessAgent'
		           maxlength='50'/></td>
		<th>业务六处负责人</th>
		<td><input type='text' value='${app.sixBusinessHead}' id='sixBusinessHead' name='sixBusinessHead'
		           maxlength='50'/></td>
	</tr>
	<tr>
		<th>业务一处意见</th>
		<td colspan="3"><textarea name="oneBusinessOpinion" id="oneBusinessOpinion" cols="70" rows="5">${app.oneBusinessOpinion}</textarea></td>
	</tr>
	<tr>
		<th>业务一处经办人</th>
		<td><input type='text' value='${app.oneBusinessAgent}' id='oneBusinessAgent' name='oneBusinessAgent'
		           maxlength='50'/></td>
		<th>业务一处负责人</th>
		<td><input type='text' value='${app.oneBusinessHead}' id='oneBusinessHead' name='oneBusinessHead'
		           maxlength='50'/></td>
	</tr>
	<tr>
		<th>分管领导意见</th>
		<td colspan="3"><textarea name="chargeLeadershipOpinion" id="chargeLeadershipOpinion" cols="70" rows="5">${app.chargeLeadershipOpinion}</textarea></td>
	</tr>
	<tr>
		<th>局领导意见</th>
		<td colspan="3"><textarea name="bureauLeadershipOpinion" id="bureauLeadershipOpinion" cols="70" rows="5">${app.bureauLeadershipOpinion}</textarea></td>
	</tr>
	<tr>
		<th>厅领导意见</th>
		<td colspan="3"><textarea name="hallLeadershipOpinion" id="hallLeadershipOpinion" cols="70" rows="5">${app.hallLeadershipOpinion}</textarea></td>
	</tr>--%>
	<tr>
		<th>批准文号</th>
		<td><input type='text' value='${app.approvalNumber}' id='approvalNumber' name='approvalNumber'
		           maxlength='30' style="width: 100%"/></td>
	</tr>
	<tr>
		<th>批准日期</th>
		<td><tag:dateInput date='${app.approvalDate}' id='approvalDate' name='approvalDate'/></td>
		<th>截止日期</th>
		<td><tag:dateInput date='${app.endDate}' id='endDate' name='endDate' /></td>
	</tr>
	</tbody>
</table>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/oa/app.js"></script>
<script type="text/javascript">
	var getAppParams = function(formData) {
		formData.licenseMaterialList = appMaterialCheckedData("appMaterialList", ".appMaterial");
		var prms = {};
		prms.json=$.toJSON(formData);
		prms.licenseType=$("#relativeInfoForm #licenseType").val();
		return prms;
	}
</script>