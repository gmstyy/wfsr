<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<table class="edittable">
	<colgroup>
		<col style="width: 80px;" />
		<col />
		<col style="width: 80px;" />
		<col />
		<col style="width: 80px;" />
		<col />
	</colgroup>
	<tbody>
		<tr>
			<th>编制科室<span class="must_field">*</span></th>
			<td><hs:dic dicName="DEPT" defalt="${employee.departmentId}" id='departmentId' name='departmentId' value1="${loginUser.orgId}"/></td>
			<th>胸牌号</th>
			<td><input type='text' value='${employee.healthSupercisorCard}'
				id='healthSupercisorCard' onblur="syncWorkNo()" name='healthSupercisorCard' maxlength='6'/></td>
			<th>工号<span class="must_field">*</span></th>
			<td><input type='text' value='${employee.workNo}' id='workNo' name='workNo' maxlength='30' /></td>
		</tr>
		<tr>
			<th>人员状态</th>
			<td><hs:dic dicName='EMPLOYEE_STATUS' defalt="${employee.status}" id='status' name='status'></hs:dic></td>
			<th>人员类别</th>
			<td><hs:dic dicName='EMPLOYEE_TYPE' defalt="${employee.employeeType}" id='employeeType'
					name='employeeType'></hs:dic></td>
			<th>人员职务</th>
			<td><input type='text' value='${employee.positionId}'
				id='positionId' name='positionId' maxlength='20' /></td>
		</tr>
		<tr>
			<th>参加工作日期</th>
			<td><tag:dateInput onlypast="false" id='startWorkDatetime' name='startWorkDatetime' date="${employee.startWorkDatetime}"/></td>
			<th>参加卫生监督工作年份</th>
			<td><input type='text' id='proWorkDatetime' name='proWorkDatetime' value="${employee.proWorkDatetime}" maxlength='4'/></td>
			<th>行政职级</th>
			<td><hs:dic dicName='ADMIN_LEVEL' defalt="${employee.positionLevel}" id='positionLevel'
					name='positionLevel'></hs:dic></td>
		</tr>
		<tr>
			<th>技术职称</th>
			<td><input type='text' value='${employee.technicalTitle}'
				id='technicalTitle' name='technicalTitle' maxlength='20' /></td>
			<th>专业技术资格</th>
			<td><hs:dic dicName='TECHNICAL_LEVEL' defalt="${employee.technicalQualification}"
					id='technicalQualification' name='technicalQualification'></hs:dic></td>
			<th>专业技术职务</th>
			<td><hs:dic dicName='TECHNICAL_POSITION' defalt="${employee.technicalPosition}" id='technicalPosition'
					name='technicalPosition'></hs:dic></td>
		</tr>
		<tr>
			<th>行政执法证号</th>
			<td><input type='text'
				value='${employee.enforcementCertificate}'
				id='enforcementCertificate' name='enforcementCertificate'
				maxlength='10' /></td>
			<th>执业范围代码</th>
			<td><hs:dic dicName='EMPLOYEE_BUSINESS_TYPE' defalt="${employee.businessScopesCode}"
					id='businessScopesCode' name='businessScopesCode'></hs:dic></td>
			<th>行政/业务管理职务代码</th>
			<td><hs:dic dicName='ADMIN_POSITION' defalt="${employee.managementPositionCode}"
					id='managementPositionCode' name='managementPositionCode'></hs:dic></td>
		</tr>
		<tr>
			<th>年内接受培训次数</th>
			<td><input type='text' value='${employee.yearTrainningTimes}'
				id='yearTrainningTimes' name='yearTrainningTimes' maxlength='10' /></td>
			<th>年内接受培训学时数</th>
			<td><input type='text' value='${employee.yearTrainningHours}'
				id='yearTrainningHours' name='yearTrainningHours' maxlength='10' /></td>
			<th>出国留学学习时间（累计月数）</th>
			<td><input type='text'
				value='${employee.oveaseasStudyingMonths}'
				id='oveaseasStudyingMonths' name='oveaseasStudyingMonths'
				maxlength='10' /></td>
		</tr>
		<tr>
			<th>进入本单位类型代码</th>
			<td><hs:dic dicName='EMPLOYEE_MOVE' defalt="${employee.enterOrgType}" value1="1" id='enterOrgType'
					name='enterOrgType'></hs:dic></td>
			<th>离开本单位类型代码</th>
			<td><hs:dic dicName='EMPLOYEE_MOVE' defalt="${employee.leaveOrgType}" value1="2" id='leaveOrgType'
					name='leaveOrgType'></hs:dic></td>
			<th>职称级别</th>
			<td><input type='text' value='${employee.titleLevel}' id='titleLevel' name='titleLevel' maxlength='10' /></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th>进入本单位日期</th>
			<td><tag:dateInput onlypast="false" id='enterOrgDate' name='enterOrgDate' date="${employee.enterOrgDate}"/></td>
			<th>离开本单位日期</th>
			<td><tag:dateInput onlypast="false" id='leaveOrgDate' name='leaveOrgDate' date="${employee.leaveOrgDate}"/></td>
			<th>&nbsp;</th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th>国家级奖励情况</th>
			<td><input type='text' value='${employee.nationalReward}'
				id='nationalReward' name='nationalReward' maxlength='100' /></td>
			<th>奖励情况-省级</th>
			<td><input type='text' value='${employee.provinceReward}'
				id='provinceReward' name='provinceReward' maxlength='1' /></td>
			<th>奖励情况-市（厅）级</th>
			<td><input type='text' value='${employee.cityReward}'
				id='cityReward' name='cityReward' maxlength='1' /></td>
		</tr>
	</tbody>
</table>
<script type="text/javascript">
function syncWorkNo() {
	$("#editFormId").find("#workNo").val($("#healthSupercisorCard").val());
}
</script> 