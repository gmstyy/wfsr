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
					<th>业务类型</th>
					<td colspan="3">
						<hs:dic dicName="RELATIVE_PERSON_BUSINESS_TYPE" id="bizType1" name="businessTypea" limitedMap="${bizTypeMap}" value1="0" style="width:172px;" onChange="bizType()"/>
						<select id="bizType2" name="businessTypeb" style="display: none;">
							<option value=""></option>
						</select>
					</td>
					<th>卫生许可编号</th>
					<td><input type="text" id="licenseNo" name="licenseNo" maxlength="30" /></td>
				</tr>
				<tr>
					<th>申请项目</th>
					<td><input type="text" id="applyItem" name="applyItem:String:LIKE" maxlength="200" /></td>
					<th>申请人</th>
					<td><input type="text" id="name" name="name:String:LIKE" maxlength="200" /></td>
					<th>状态</th>
					<td><hs:dic dicName="LICENSE_STATUS" name="status" style="width:172px;"/></td>
<%-- 					<th>受理状态</th>
					<td><hs:dic dicName="ACCEPT_STATUS" id="handleStatus" name="handleStatus" /></td>
					<th>发放状态</th>
					<td><hs:dic dicName="GRANT_STATUS" id="grantStatus" name="grantStatus" /></td> --%>
				</tr>
				<tr>

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
			<%--<sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
			<a class="button_cancel" href="javascript:void(0);" onclick="cancel(null);">撤销</a>
			<%-- </sec:authorize> --%>
			<%--<sec:authorize access="hasRole('OA_ROLE_DELETE')"> 
			<a class="button_del_all" href="javascript:void(0);" onclick="deleteApp(null,null);">删除</a>--%>
			<%-- </sec:authorize> --%>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 90px;">			
			<col>
			<col style="width: 90px;">
			<col style="width: 90px;">
			<col style="width: 90px;">
			<col style="width: 90px;">
			<col style="width: 80px;">
			<col style="width: 120px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>业务类型</th>
				<th>申请单位</th>				
				<th>申请许可项目</th>
				<th>卫生许可编号</th>
				<th>单位负责人</th>
				<th>申请日期</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;"><input type="checkbox" name="cancel_checkbox_#status#" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
			<td>#businessTypeaName#</td>
			<td>#name#</td>
			<td>#applyItem#</td>
			<td>#licenseNo#</td>			
			<td>#legalPersonName#</td>
			<td style="text-align: center;">#applyDatetime#</td>
			<td style="text-align: center;">#statusDesc#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<a href="javascript:void(0);" class="option_view" title="详细信息" onclick="viewLicense('#appId#', '#licenseType#');"></a>
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" title="审批情况" class="option_do_approve" name="workflow_button_#status#" onclick="workflowDetail('#licenseType#','#appId#')"></a>
					<a href="javascript:void(0);" class="option_edit" title="修改" name="edit_button_#status#" onclick="edit('#licenseType#','#appId#');"></a>
					<%-- </sec:authorize> --%>
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" class="option_cancel" name="cancel_button_#status#" title="撤销" onclick="cancel('#id#');"></a>
					<%-- </sec:authorize> --%>
					<%-- <sec:authorize access="hasRole('OA_ROLE_DELETE')">
					<a href="javascript:void(0);" class="option_delete" name="delete_button_#status#" title="删除" onclick="deleteApp('#licenseType#','#appId#')"></a> --%>
					<%-- 	</sec:authorize> --%>

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
		appId : null,
		businessTypeaName : {formatter: function(value, data) {
			var typeb = data.businessTypebName;
			if (!isNull(typeb)) {
				value += "-" + typeb;
			}
			return value;
		}}
	};
	var helper = new dataHelper(templateModel);
	var search = function() {		
		helper.postSearch('/app/search', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
		helper.addListener("afterFillData", handler, "list_table", "license");
	};
	
	var handler = function(e,pageList){
		$("a[name='workflow_button_<%=HSCV.LICENSE_STATUS.APPLIED%>']").remove();
		$("a[name='workflow_button_<%=HSCV.LICENSE_STATUS.REJECTED%>']").remove();
		$("a[name='workflow_button_<%=HSCV.LICENSE_STATUS.CANCEL%>']").remove();

		$("a[name='edit_button_<%=HSCV.LICENSE_STATUS.REJECTED%>']").remove();
		$("a[name='edit_button_<%=HSCV.LICENSE_STATUS.CANCEL%>']").remove();
		$("a[name='edit_button_<%=HSCV.LICENSE_STATUS.AUDIT_FAILED%>']").remove();
		$("a[name='edit_button_<%=HSCV.LICENSE_STATUS.AUDIT_PASSED%>']").remove();
		$("a[name='edit_button_<%=HSCV.LICENSE_STATUS.GRANTED%>']").remove();
		
		$("a[name='cancel_button_<%=HSCV.LICENSE_STATUS.AUDIT_FAILED%>']").remove();
		$("a[name='cancel_button_<%=HSCV.LICENSE_STATUS.AUDIT_PASSED%>']").remove();
		$("a[name='cancel_button_<%=HSCV.LICENSE_STATUS.GRANTED%>']").remove();
		$("a[name='cancel_button_<%=HSCV.LICENSE_STATUS.CANCEL%>']").remove();
		
		$("input[name='cancel_checkbox_<%=HSCV.LICENSE_STATUS.AUDIT_FAILED%>']").remove();
		$("input[name='cancel_checkbox_<%=HSCV.LICENSE_STATUS.AUDIT_PASSED%>']").remove();
		$("input[name='cancel_checkbox_<%=HSCV.LICENSE_STATUS.GRANTED%>']").remove();
		$("input[name='cancel_checkbox_<%=HSCV.LICENSE_STATUS.CANCEL%>']").remove();
		
<%-- 	$("input[name='delete_checkbox_<%=HSCV.LICENSE_STATUS.ACCEPTED%>']").remove();
		$("input[name='delete_checkbox_<%=HSCV.LICENSE_STATUS.AUDIT_FAILED%>']").remove();
		$("input[name='delete_checkbox_<%=HSCV.LICENSE_STATUS.AUDIT_PASSED%>']").remove();
		$("a[name='delete_button_<%=HSCV.LICENSE_STATUS.ACCEPTED%>']").remove();
		$("a[name='delete_button_<%=HSCV.LICENSE_STATUS.AUDIT_FAILED%>']").remove();
		$("a[name='delete_button_<%=HSCV.LICENSE_STATUS.AUDIT_PASSED%>']").remove(); --%>
	};
	

	var cancel = function(id) {
		helper.operateObjects(id, "/app/cancel", "撤销");
	};
	var deleteApp = function(licenseType, id) {
		helper.operateObjects(id, "/app/delete?licenseType=" + licenseType, "删除");
	};
	/*var add = function() {
		helper.postForm('/app/add', 2, {
			containerId : 'editContainer',
			containerTitle : '新增',
			editConfirmUrl : '/app/saveAdd',
			editFormId : 'editFormId',
			validate : true,
			processData : function(prms) {
				prms.licenseType = $("#licenseType").val();
				return prms;
			}
		});
	};*/
	var edit = function(licenseType, id) {
		helper.validateModel = getAppValidate(licenseType);
		helper.basicPost('/app/update', {
			'id' : id,
			'licenseType' : licenseType
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '修改',
			successMessage : '许可修改成功',
			editConfirmUrl : '/app/saveUpdate',
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
	
	var workflowDetail = function(licenseType,id) {
		workflowHelper.basicPost('/approve/view1', {licenseType:licenseType,id:id}, 2, {
			containerId : 'workflowViewDetailContainer',
			containerTitle : '查看审批情况',
			defaultButtons: {
				okEnabled : false,
				cancelText : '关 闭'
			}
		});
	};

	var bizType = function() {
		var type = $("#bizType1").val();
		helper.basicPost("/relativePerson/getBizType", {type : type}, 0, null, function(data) {
			var types = data.bizTypes;
			$("#bizType2").show();
			var html = "<option value=''></option>";
			var i = 0;
			for (var code in types) {
				html += "<option value='" + code + "'>" + types[code].value + "</option>";
				i++;
			}
			if (i > 0) {
				$("#bizType2").html(html);
			} else {
				$("#bizType2").hide();
			}
		});
	};

	//make default search
	$(function() {
		search();
	});
</script>