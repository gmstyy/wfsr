<%--@elvariable id="app" type="com.founder.oa.entity.business.AppConstruction"--%>
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
		<th>项目名称<span class="must_field">*</span></th>
		<td>
			<input type='text' value='${app.projectName}' id='projectName' name='projectName' maxlength='50' readonly="readonly" />
			<input type='hidden' value='${app.projectName}' name='applyItem' maxlength='50' readonly="readonly" />
		</td>
		<th>项目编号<span class="must_field">*</span></th>
		<td><input type='text' value='${app.projectNo}' id='projectNo' name='projectNo' maxlength='30' readonly="readonly" /></td>
	</tr>
	<tr>
		<th>工程地址<span class="must_field">*</span></th>
		<td><input type='text' value='${app.projectAddress}' id='projectAddress' name='projectAddress' maxlength='200' readonly="readonly" /></td>
		<th>邮编</th>
		<td><input type='text' value='${app.zipcode}' id='zipcode' name='zipcode' maxlength='10' readonly="readonly" /></td>
	</tr>
	<tr>
		<th>工程起始时间<span class="must_field">*</span></th>
		<td><tag:dateInput onlypast="false" id='projectStartDate' name='projectStartDate' date="${app.projectStartDate}" disabled="true"/></td>
		<th>工程终止时间<span class="must_field">*</span></th>
		<td><tag:dateInput onlypast="false" id='projectEndDate' name='projectEndDate' date="${app.projectEndDate}" disabled="true"/></td>
	</tr>
	<tr>
		<th>占地面积</th>
		<td><input type='text' value='${app.projectFloorArea}' id='projectFloorArea' name='projectFloorArea' maxlength='10' readonly="readonly" /></td>
		<th>建筑面积</th>
		<td><input type='text' value='${app.projectCoveredArea}' id='projectCoveredArea' name='projectCoveredArea' maxlength='10' readonly="readonly" /></td>
	</tr>
	<tr>
		<th>项目性质</th>
		<td><hs:dic dicName='CONSTRUCTION_NATURE' id='projectType' name='projectType' defalt="${app.projectType}" disabled="true"/></td>
		<th>设计单位</th>
		<td><input type='text' value='${app.designUnit}' id='designUnit' name='designUnit' maxlength='200' readonly="readonly" /></td>
	</tr>
	<tr>
		<th>建筑规模</th>
		<td><input type='text' value='${app.architecturalScale}' id='architecturalScale' name='architecturalScale' maxlength='10' readonly="readonly" /></td>
		<th>总投资</th>
		<td><input type='text' value='${app.grossInvestment}' id='grossInvestment' name='grossInvestment' maxlength='12' readonly="readonly" /></td>
	</tr>
	<tr>
		<th>建设用途</th>
		<td colspan="3"><input type='text' value='${app.projectPurpose}' id='projectPurpose' name='projectPurpose' maxlength='50' readonly="readonly" /></td>
	</tr>
	<tr>
		<th>卫生设施</th>
		<td><input type='text' value='${app.sanitaryFacilities}' id='sanitaryFacilities' name='sanitaryFacilities' maxlength='100' readonly="readonly" /></td>
		<th>专业类别</th>
		<td><hs:dic dicName='RELATIVE_PERSON_BUSINESS_TYPE' disabled="true" id='businessCategory' name='businessCategory' defalt="${app.businessCategory}" value1="0"/></td>
	</tr>
	<tr>
		<th>建设项目的职业病危害类别</th>
		<td><hs:dic dicName='DISEASE_CATEGORY' id='diseaseCategory' name='diseaseCategory' defalt="${app.diseaseCategory}" disabled="true"/></td>
		<th>职业病危害预评价卫生审核状态</th>
		<td><hs:dic dicName='AUDIT_STATUS' id='diseaseAuditStatus' name='diseaseAuditStatus' defalt="${app.diseaseAuditStatus}" disabled="true"/></td>
	</tr>
	<tr>
		<th>职业病危害预评价卫生审核日期</th>
		<td><tag:dateInput onlypast="false" id='diseaseAuditDate' name='diseaseAuditDate' date="${app.diseaseAuditDate}" disabled="true"/></td>
		<th>职业病危害预评价卫生备案日期</th>
		<td><tag:dateInput onlypast="false" id='diseaseRecordDate' name='diseaseRecordDate' date="${app.diseaseRecordDate}" disabled="true"/></td>
	</tr>
	<tr>
		<th>职业病防护设施设计卫生审查状态</th>
		<td><hs:dic dicName='AUDIT_STATUS' id='protectAuditStatus' name='protectAuditStatus' defalt="${app.protectAuditStatus}" disabled="true"/></td>
		<th>职业病防护设施设计卫生审查日期</th>
		<td><tag:dateInput onlypast="false" id='protectAuditDate' name='protectAuditDate' date="${app.protectAuditDate}" disabled="true"/></td>
	</tr>
	<tr>
		<th>职业病防护设施竣工卫生验收审核状态</th>
		<td><hs:dic dicName='AUDIT_STATUS' id='acceptAuditStatus' name='acceptAuditStatus' defalt="${app.acceptAuditStatus}" disabled="true"/></td>
		<th>职业病防护设施竣工卫生验收审核日期</th>
		<td><tag:dateInput onlypast="false" id='acceptAuditDate' name='acceptAuditDate' date="${app.acceptAuditDate}" disabled="true"/></td>
	</tr>
	<tr>
		<th>职业病防护设施竣工卫生验收备案日期</th>
		<td><tag:dateInput onlypast="false" id='acceptRecordDate' name='acceptRecordDate' date="${app.acceptRecordDate}" disabled="true"/></td>
	</tr>
	<tr>
		<th>选址卫生审查状态</th>
		<td><hs:dic dicName='AUDIT_STATUS' id='locationAuditStatus' name='locationAuditStatus' defalt="${app.locationAuditStatus}" disabled="true"/></td>
		<th>选址卫生审查日期</th>
		<td><tag:dateInput onlypast="false" id='locationAuditDate' name='locationAuditDate' date="${app.locationAuditDate}" disabled="true"/></td>
	</tr>
	<tr>
		<th>设计卫生审查状态</th>
		<td><hs:dic dicName='AUDIT_STATUS' id='designAuditStatus' name='designAuditStatus' defalt="${app.designAuditStatus}" disabled="true"/></td>
		<th>设计卫生审查日期</th>
		<td><tag:dateInput onlypast="false" id='designAuditDate' name='designAuditDate' date="${app.designAuditDate}" disabled="true"/></td>
	</tr>
	<tr>
		<th>竣工验收状态</th>
		<td><hs:dic dicName='COMPLETION_ACCEPT_STATUS' disabled="true" id='completionAuditStatus' name='completionAuditStatus' defalt="${app.completionAuditStatus}"/></td>
		<th>竣工验收日期</th>
		<td><tag:dateInput onlypast="false" id='completionAcceptDate' name='completionAcceptDate' date="${app.completionAcceptDate}" disabled="true"/></td>
	</tr>
	</tbody>
</table>

