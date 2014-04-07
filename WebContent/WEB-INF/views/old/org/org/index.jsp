<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container">
	<form id="search_form" name="userForm" action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 100px;">
				<col style="width: 160px;">
				<col style="width: 100px;">
				<col style="width: 160px;">
				<col style="width: 100px;">
				<col>				
			</colgroup>
			<thead>
				<tr>
					<th>机构名称</th>
					<td><input type="text" id="name" name="name:String:LIKE" maxlength="50" /></td>
					<th>机构编码</th>
					<td><input type="text" id="orgCode" name="orgCode:String:LIKE" maxlength="20" /></td>
					<th>机构行政级别</th>
					<td><hs:dic dicName='ORG_LEVEL' id='orgAdminLevel' name='orgAdminLevel'></hs:dic></td>					
				</tr>
				<tr>
					<th>行政区划代码</th>
					<td><input type="text" id="adminDivisionCode" name="adminDivisionCode:String:LIKE" maxlength="10" /></td>
				</tr>
			</thead>
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			<input class="button_reset" onclick="$('form')[0].reset();" type="button" />
			<input class="button_search" onclick="search();" type="button" />
		</div>
	</form>
</div>
<div id="list_container">
	<table class="repeattable">
		<caption>
			<%-- <sec:authorize access="hasRole('ORG_ORG_ADD')"> --%>
			<a class="button_add" href="javascript:void(0);" onclick="edit(0);">新建</a>
			<%-- </sec:authorize>
			<sec:authorize access="hasRole('ORG_ORG_DELETE')"> --%>
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/org/delete');">删除</a>
			<%-- </sec:authorize> --%>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 40px;">
			<col style="width: 80px;">
			<col style="width: 200px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>编号</th>
				<th>机构行政级别</th>
				<th>机构名称</th>
				<th>行政区划代码</th>
				<th>机构负责人</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
			<td style="text-align: center;">#rowCount#</td>
			<td style="text-align: center;">#orgAdminLevel#</td>
			<td>#name#</td>
			<td style="text-align: center;">#adminDivisionCode#</td>
			<td style="text-align: center;">#unitLeader#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<%-- <sec:authorize access="hasRole('ORG_ORG_UPDATE')"> --%>
					<a href="javascript:void(0);" title="修改" class="option_edit" onclick="edit('#id#');"></a>
					<%-- </sec:authorize>
					<sec:authorize access="hasRole('ORG_ORG_DELETE')"> --%>
					<a href="javascript:void(0);" title="删除" class="option_delete" onclick="helper.deleteObjects('#id#','/org/delete');"></a>
					<%-- 	</sec:authorize> --%>

				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
	var templateModel = {
		id : null,
		parentId : null,
		name : null,
		accessDomain : null,
		orgCode : null,
		unitLeader : null,
		submitDate : null,
		fillPersonId : null,
		adminDivisionCode : null,
		economicNatureCode : null,
		healthOrgCategoryCode : null,
		orgClassManageCode : null,
		orgResidentDistrict : null,
		orgVillageName : null,
		orgAdminDivisionCode : null,
		isNationalAutonomy : null,
		address : null,
		zipcode : null,
		dutyTelephone : null,
		complainsTelephone : null,
		fax : null,
		email : null,
		selfWebsiteDomain : null,
		orgFoundDate : null,
		orgNature : null,
		orgMembershipCode : null,
		orgAdminLevel : null,
		legalRepresent : null,
		orgSecondName : null,
		lawType1 : null,
		lawType2 : null,
		isIndependetSchoolClinical : null,
		isIndependetProClinical : null,
		directlyUnderOrgNum : null,
		isFoodSafeWork : null,
		isFoodStandardRecordWork : null,
		isFoodStandardDrawWork : null,
		foodSecurity : null,
		cateringRegulation : null,
		healthRegulation : null,
		establishmentCount : null,
		civilServantsCount : null,
		civilCareerCount : null,
		generalCareerCount : null,
		skillsCount : null,
		employeeCount : null,
		supervisorsCount : null,
		supervisorsDirectCount : null,
		supervisorsMenegmentCount : null,
		healthSupervisorsCount : null,
		otherSupervisorsCount : null,
		retireesCount : null,
		recentlyRetireesCount : null,
		assisSupervisorsCount : null,
		houseArea : null,
		businessArea : null,
		logisticsArea : null,
		dangerousArea : null,
		rentArea : null,
		approveConstructionCount : null,
		approveArea : null,
		investmentThisYear : null,
		investmentFinancial : null,
		investmentOwn : null,
		investmentCredit : null,
		completionArea : null,
		investmentFixedNew : null,
		equipmentValue : null,
		tenThousandEquipCount : null,
		oneThousandEquipCount : null,
		smallCount : null,
		middleCount : null,
		bigCount : null,
		serverCount : null,
		internetConnection : null,
		deskComputerCount : null,
		laptopCount : null,
		handheldDeviceCount : null,
		system1 : null,
		system2 : null,
		system3 : null,
		system4 : null,
		system5 : null,
		dvCount : null,
		cameraCount : null,
		recorderCount : null,
		rapidTestVehicleCount : null,
		carCount : null,
		motorbikeCount : null,
		boatCount : null,
		otherTraffic : null,
		fleetCheckEquipCount : null,
		totalIncome : null,
		finalcialSubsidies : null,
		undertakingRevenue : null,
		totalExpenditure : null,
		personalExpenditure : null,
		pension : null,
		trainingCost : null,
		liabilities : null,
		ownInfoDivision : null,
		fullTimeCount : null,
		partTimeCount : null,
		investmentInYears : null,
		inputBudgetThisYear : null,
		infoworkPayThisYear : null,
		capitalGrantThisYear : null,
		independentMachineRoom : null,
		lan : null,
		developmentProgram : null,
		infoSysTraining : null,
		qualifyingExamCount : null,
		qualifyingExamPassCount : null,
		newHealthSupervisorCount : null,
		orgPeParticipate : null,
		orgPeResult : null,
		personalPeCheck1 : null,
		peAppraisalCount722 : null,
		peCompetentCount722 : null,
		peJustCount722 : null,
		peIncompetentCount722 : null,
		personalPeCheck2 : null,
		peAppraisalCount731 : null,
		peCompetentCount731 : null,
		peJustCount731 : null,
		peIncompetentCount731 : null,
		orgPeCheck : null,
		specialSetCheck : null,
		fulltimeInspectorsCount : null,
		parttimeInspectorsCount : null,
		acceptanceComplainsCount : null,
		investigationComplainsCount : null,
		sameLevelInspectorsCount : null,
		lowerLevelInspectorsCount : null,
		numberOfAuditOpinion : null,
		correctiveActionsCount : null,
		afterInspectorsCaseCount : null,
		afterInspectorsStaffCount : null,
		carryOutReviewCheck : null,
		faultLowerLevelCount : null,
		faultDutyOfficerCount : null,
		punishPeolpleCount : null,
		gotPunishmentCount : null,
		nationalReward : null,
		nationalRewardRemark : null,
		provincialReward : null,
		cityRewardRemark : null
	};
	var validateModel = {
		name : { must : true, fieldName : "机构名称" },
		orgCode : { must : true, fieldName : "机构编码" },
		unitLeader : { must : true, fieldName : "单位负责人" },
		orgAdminLevel : { must : true, fieldName : "机构行政级别" },
		address : { must : true, fieldName : "地址" },
		zipcode : { must : true, fieldName : "邮政编码" }
	};
	var helper = new dataHelper(templateModel, validateModel);
	var search = function() {
		helper.postSearch('/org/search', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
	};
	var edit = function(id) {
		helper.basicPost('/org/edit', { 'id' : id }, 2, {
			containerId : 'editContainer',
			containerTitle : (id == 0 ? '新增机构' : '修改机构'),
			successMessage : (id == 0 ? '新增机构成功' : '修改机构成功'),
			editConfirmUrl : '/org/save',
			editFormId : 'editFormId',
			validate : true
		});
	};
	//make default search
	search();
</script>