<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container" style="padding:0;">
	<ul class="license_list">
		<c:forEach var="licenseType" items="${licenseType}" varStatus="status">
			<li class="license_item">
				<a class="license_type_${licenseType.key}" href="javascript:add('${licenseType.key}','${licenseType.value.value}申请');"></a>
				<div onclick="add('${licenseType.key}','${licenseType.value.value}申请');">${licenseType.value.value}</div>
			</li>
		</c:forEach>
	</ul>
	<div style="clear:both;"></div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/oa/appValidate.js"></script>
<script type="text/javascript">
	var templateModel = {};
	var validateModel = {
		applicant : {must : true, fieldName : "申请单位/个人"},
		telephone : {must : true, fieldName : "联系电话"},
		unitAddress : {must : true, fieldName : "地址"},
		legalPersonIdCard : {must : true, fieldName : "身份证号"}
	};
	var helper = new dataHelper(templateModel, validateModel);
	var add = function(licenseType, title) {
		helper.validateModel = getAppValidate(licenseType);
		helper.basicPost('/app/add', {
			'licenseType' : licenseType
		}, 2, {
			containerId : 'editContainer',
			containerTitle : title,
			editConfirmUrl : '/app/saveAdd',
			successMessage : '许可申请成功',
			editFormId : 'relativeInfoForm',
			refreshList:false,
			validateMultiForms: true,
			validateFormIds: ["relativeInfoForm", "appForm"],
			preProcess : function(prms) {
				prms = helper.getFormData("appForm", prms);
				prms.businessTypeaName = $("#businessTypea :selected").html();
				if(typeof (getAppParams) != "undefined"){
					var prms = getAppParams(prms);
					prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
					return prms;
				}
				return prms;
			}
		});
	};


</script>

