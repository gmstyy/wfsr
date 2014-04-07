<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container">
	<form id="search_form1" name="userForm" action="" method="post">
		<table class="formtable" id="searchTable">
			
			<thead>
				<tr>
					 <th width="100px"> 具体许可选择</th>
					<td>
					<!-- <select id="app"  name="app" style="width:100px; ">
					     <option  value="appAdvertisement">医疗广告许可申请</option>
					    <option  value="appRestaurant">餐饮许可申请</option>
					    <option  value="appConstruction">建设项目许可申请</option>
					    <option  value="appDoctor">医师资格许可申请</option>
					    <option  value="appPublic">公共场所许可申请</option>
					    <option  value="appWater">生活饮用水许可申请</option>
					    <option  value="appRadiate">放射许可申请</option>
					    <option  value="appTransportation">病原运输许可申请</option> 
					   	
				    </select> -->
				    <select id="app"  name="app" style="width:200px; ">
					     <option  value="6">医疗广告许可申请</option>
					    <option  value="4">餐饮许可申请</option>
					    <option  value="1">建设项目许可申请</option>
					    <option  value="8">医师资格许可申请</option>
					    <option  value="2">公共场所许可申请</option>
					    <option  value="3">生活饮用水许可申请</option>
					    <option  value="5">放射许可申请</option>
					    <option  value="7">病原运输许可申请</option> 
					    <option  value="9">食盐许可申请</option> 
					   	
				    </select>
				    </td>
				    
				    <!-- <th width="100px"> 业务详细选择</th>
					<td><select id="appDetail"  name="appDetail" style="width:100px; ">
					    <option  value="1">审核</option>
					    <option  value="2">发放</option>
					    <option  value="3">备案</option>
					    <option  value="4">受理</option>
					    
					   	
				    </select>
				    </td> -->
					
					<td><input type="text" id="filterData" name="filterData" maxlength="200"  value="${filterData}" style = "display:none;"/></td>
				</tr>
				
				
				
			</thead>
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			<input class="button_search" onclick="search();" type="button" />
		</div>
	</form>
</div>
<div id="list_container">
	<table class="repeattable">
		
		<colgroup>
		    <col style="width: 10%;">
			<col style="width: 10%;">
			<col style="width: 10%;">
			<col style="width: 10%;">
			<col style="width: 7%;">
			<col style="width: 8%;">
			<col style="width: 7%;">
			<col style="width: 8%;">
			<col style="width: 7%;">
			<col style="width: 8%;">
			<col style="width: 7%;">
			<col style="width: 8%;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>创建时间</th>
				<th>创建人</th>
				<th>卫生许可编号</th>
				<th>申请单位</th>
				<th>审核状态</th>
				<th>审核人</th>
				<th>发放状态</th>
				<th>发放人</th>
				<th>备案状态</th>
				<th>备案人</th>
				<th>受理状态</th>
				<th>受理人</th>
			</tr>
		</thead>
		<tbody id="list_table1"></tbody>
		<tr id="template1" style="display: none;">
			<td>#createTime#</td>
			<td>#creatorName#</td>
			<td>#licenseNo#</td>
			<td>#applicant#</td>
			<td>#auditStatus#</td>
			<td>#auditorName#</td>
			<td>#grantStatus#</td>
			<td>#grantorName#</td>
			<td>#recordStatus#</td>
			<td>#recorderName#</td>
			<td>#handleStatus#</td>
			<td>#handlerName#</td>
			
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
	var templateModel = {
		id : null,
		createTime : null,
		creatorName : null,
		licenseNo : null,
		applicant : null,
		auditStatus : null,
		auditorName : null,
		grantStatus : null,
		grantorName : null,
		recordStatus : null,
		recorderName : null,
		handleStatus : null,
		handlerName : null
		
	};
	var helper1 = new dataHelper(templateModel);
	var search = function() {
		//licenseTypeTmp=$("#search_form").find("#licenseType").val();
		helper1.postSearch('/assessBusiness/view/app/search/', {
			formId : 'search_form1',
			containerId : 'list_table1',
			templateId : 'template1'
		});
	};
	
	//make default search

</script>





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<div id="tabs">
		<ul>
			<li class="tabs-1"><span>餐饮</span></li>
			<li class="tabs-2"><span>医疗广告</span></li>
			<!-- <li class="tabs-3"><span>医师资格</span></li>
			<li class="tabs-4"><span>公共场所</span></li>
			<li class="tabs-5"><span>生活饮用水</span></li>
			<li class="tabs-6"><span>放射</span></li>
			<li class="tabs-7"><span>建设项目</span></li> -->
			
			
			<!-- <li><a href="tabs-7">病原运输</a></li>    
			<li><a href="tabs-8">医师资格</a></li> -->
		</ul>
		<div id="tabs-1"><jsp:include page="appRestaurant.jsp"></jsp:include></div>
		<div id="tabs-2"><jsp:include page="appAdvertisement.jsp"></jsp:include></div>
		<div id="tabs-3"><jsp:include page="appDoctor.jsp"></jsp:include></div>
		<div id="tabs-4"><jsp:include page="appPublic.jsp"></jsp:include></div>
		<div id="tabs-5"><jsp:include page="appWater.jsp"></jsp:include></div>
		<div id="tabs-6"><jsp:include page="appRadiate.jsp"></jsp:include></div>
		<div id="tabs-7"><jsp:include page="appTransportation.jsp"></jsp:include></div>
	
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
</script> --%>