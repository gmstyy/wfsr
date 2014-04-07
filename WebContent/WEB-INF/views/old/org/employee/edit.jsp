<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<div id="tabs">
	<form id="editFormId" action="" method="post">
		<input type='hidden' value='${employee.id}' id='id' name='id' />
		<ul>
			<li class="tabs-1"><span>基本信息</span></li>
			<li class="tabs-2"><span>专业信息</span></li>
			<li class="tabs-3"><span>其他职务</span></li>
			<li class="tabs-4"><span>教育经历</span></li>
			<li class="tabs-5"><span>工作经历</span></li>
			<li class="tabs-6"><span>家庭成员</span></li>
		</ul>
		<div id="tabs-1"><jsp:include page="baseInfo.jsp"></jsp:include></div>
		<div id="tabs-2"><jsp:include page="proInfo.jsp"></jsp:include></div>
	</form>
		<div id="tabs-3"><jsp:include page="deptInfo.jsp"></jsp:include></div>
		<div id="tabs-4"><jsp:include page="eduInfo.jsp"></jsp:include></div>
		<div id="tabs-5"><jsp:include page="jobInfo.jsp"></jsp:include></div>
		<div id="tabs-6"><jsp:include page="familyInfo.jsp"></jsp:include></div>
	</div>
<script type="text/javascript">
	tabs.createTabs("tabs");
	districtHelper.createDistrict('homeDistrictContainer', 'homeDistrict', { defaultValue : '${employee.homeDistrict}' });
	var addFamilyRow = function(formId) {
		$("#addfamilyNode").append($("<tbody>"+$("#familyTemplate").html()+"</tbody>"));
		DeleteOptions(formId);
	};
	var addEducation = function(fromId) {
		$("#addEducationNode").append($("<tbody>"+$("#educationTemplate").html()+"</tbody>"));
		DeleteOptions(fromId);
	};
	var addExperienceRow = function(fromId) {
		$("#addExperienceNode").append($("<tbody>"+$("#experienceTemplate").html()+"</tbody>"));
		DeleteOptions(fromId);
	};
	var addDepartmentRow = function(fromId) {
		$("#addDepartmentNode").append($("<tbody>"+$("#departmentTemplate").html()+"</tbody>"));
		DeleteOptions(fromId);
	};
	var deleteItem = function(obj,fromId) {
		$(obj).parent().parent().parent().remove();
		DeleteOptions(fromId);
	};
	var DeleteOptions = function(formId) {
		var optionDel = $(""+formId+" .option_del");
		if (optionDel.length == 2) {
			optionDel.hide();
		}
		if (optionDel.length > 2) {
			optionDel.show();
		}
	};
	if($("#editEducationFormId .option_del").length > 2){
		$("#editEducationFormId .option_del").show();
	}
	if($("#editExperienceFormId .option_del").length > 2){
		$("#editExperienceFormId .option_del").show();
	}
	if($("#editFamilyFormId .option_del").length > 2){
		$("#editFamilyFormId .option_del").show();
	}
	if($("#editDepartmentFormId .option_del").length > 2){
		$("#editDepartmentFormId .option_del").show();
	}
</script>