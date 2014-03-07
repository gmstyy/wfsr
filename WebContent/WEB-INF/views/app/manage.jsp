<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ page language="java" import="com.founder.hs.constant.HSCV" %>

<div id="search_container">
	<form id="search_form" name="userForm" action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 100px;">
				<col>
				<col style="width: 100px;">
				<col>
				<col style="width: 100px;">
				<col>
			</colgroup>
			<thead>
			<tr>
				<th>许可类型</th>
				<td><hs:dic dicName="LICENSE_TYPE" id="licenseType" name="licenseType" limitedMap="${licenseTypeMap}" style="width:172px;"/></td>
				<th>卫生许可编号</th>
				<td><input type="text" id="licenseNo" name="licenseNo" maxlength="30" /></td>
				<th>申请单位</th>
				<td><input type="text" id="applicant" name="name:String:LIKE" maxlength="200" /></td>
			</tr>
			<tr>
				<th>申请人</th>
				<td><input type="text" id="name" name="name:String:LIKE" maxlength="200" /></td>
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
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 120px;">
			<col>
			<col style="width: 220px;">
			<col style="width: 150px;">
			<col style="width: 120px;">
		</colgroup>
		<thead>
		<tr class="row_header">
			<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
			<th>许可类型</th>
			<th>申请单位</th>
			<th>卫生许可编号</th>
			<th>申请日期</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;"><input type="checkbox" name="cancel_checkbox_#status#" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
			<td>#licenseTypeName#</td>
			<td>#name#</td>
			<td>#licenseNo#</td>
			<td style="text-align: center;">#applyDatetime#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<a href="javascript:void(0);" class="option_edit" title="变更" onclick="alter('#licenseType#', '#appId#');"></a>
					<a href="javascript:void(0);" class="option_edit" title="换证" onclick="renew('#licenseType#', '#appId#');"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/oa/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/oa/appValidate.js"></script>
<script type="text/javascript">
	var templateModel = {
		id : null,
		licenseType : null,
		licenseTypeName : null,
		licenseNo : null,
		orgId : null,
		applyItem : null,
		name : null,
		applyStatus : null,
		grantorId : null,
		/* grantDatetime : {type : 'timestamp'}, */
		status : null,
		statusDesc : null,
		applyDatetime : {type : 'timestamp'},
		legalPersonName : null,
		appId : null
	};
	var helper = new dataHelper(templateModel);
	var search = function() {
		helper.postSearch('/app/manageSearch', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template',
			additionalConditions : {
				status : '5' //审核通过的
			}
		});
	};

	var alter = function(licenseType, id) {
		helper.validateModel = getAppValidate(licenseType);
		helper.basicPost('/app/alter', {
			'id' : id,
			'licenseType' : licenseType
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '许可变更申请',
			successMessage : '操作成功',
			editConfirmUrl : '/app/saveAlter',
			editFormId : 'relativeInfoForm',
			validateMultiForms: true,
			validateFormIds: ["relativeInfoForm", "appForm"],
			preProcess : function(prms) {
				prms = helper.getFormData("appForm", prms);
				prms.businessTypeaName = $("#businessTypea :selected").html();
				if (typeof (getAppParams) != "undefined") {
					return getAppParams(prms);
				}
				return prms;
			}
		});
	};

	var renew = function(licenseType, id) {
		helper.validateModel = getAppValidate(licenseType);
		helper.basicPost('/app/alter', {
			'id' : id,
			'licenseType' : licenseType
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '许可换证申请',
			successMessage : '操作成功',
			editConfirmUrl : '/app/saveRenew',
			editFormId : 'relativeInfoForm',
			validateMultiForms: true,
			validateFormIds: ["relativeInfoForm", "appForm"],
			preProcess : function(prms) {
				prms = helper.getFormData("appForm", prms);
				prms.businessTypeaName = $("#businessTypea :selected").html();
				if (typeof (getAppParams) != "undefined") {
					return getAppParams(prms);2
				}
				return prms;
			}
		});
	};

	//make default search
	$(function() {
		search();
	});
</script>