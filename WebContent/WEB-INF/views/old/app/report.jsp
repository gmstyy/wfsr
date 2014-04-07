<%@ page import="com.founder.hs.constant.HSCV" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
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
					<td><hs:dic dicName="LICENSE_TYPE" name="licenseType" limitedMap="${licenseTypeMap}" blank="false" style="width:172px;"/></td>
					<th>卫生许可编号</th>
					<td><input type="text" name="licenseNo" maxlength="30" /></td>
					<th>申请项目</th>
					<td><input type="text" name="applyItem:String:LIKE" maxlength="200" /></td>
				</tr>
				<tr>
					<th>申请单位</th>
					<td><input type="text" name="name:String:LIKE" maxlength="200" /></td>
					<th>发放状态</th>
					<td><hs:dic dicName="GRANT_STATUS" name="grantStatus" style="width:172px;"/></td>
<%-- 				<th>上报状态</th>
					<td><hs:dic dicName="REPORT_STATUS" id="reportStatus" name="reportStatus"/></td> --%>
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
			<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')">  --%>
			<a class="button_grant" href="javascript:void(0);" onclick="grant(null);">发放</a>
			<%-- </sec:authorize>--%>
			<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> 
			<a class="button_report" href="javascript:void(0);" onclick="report();">上报</a> --%>
			<%-- </sec:authorize>--%>
			<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')">  --%>
			<%--<a class="button_record" href="javascript:void(0);" onclick="record();">备案</a>--%>
			<%-- </sec:authorize>--%>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 100px;">
			<col>
			<col style="width: 100px;">
			<col style="width: 100px;">
			<col style="width: 100px;">
			<col style="width: 80px;">
			<col style="width: 100px;">
			<col style="width: 100px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>许可种类</th>				
				<th>申请单位</th>				
				<th>申请许可项目</th>
				<th>卫生许可编号</th>
				<th>单位负责人</th>
				<th>发放状态</th>
				<th>发放时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
			<td>#licenseTypeName#</td>			
			<td>#name#</td>
			<td>#applyItem#</td>
			<td>#licenseNo#</td>
			<td>#legalPersonName#</td>			
			<td style="text-align: center;">#grantStatusName#</td>
			<td style="text-align: center;">#grantDatetime#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<a href="javascript:void(0);" class="option_edit" name="issue_button_#grantStatus#" title="许可生成" onclick="issue('#id#');"></a>
				<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" class="option_grant" name="grant_button_#licenseNo#" title="发放" onclick="grant('#id#');"></a>
					<%-- </sec:authorize> --%>
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')">
					<a href="javascript:void(0);" class="option_report" title="上报" onclick="report('#licenseType#','#appId#');"></a> --%>
					<%-- </sec:authorize> --%>
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<%--<a href="javascript:void(0);" class="option_record" title="备案" onclick="record('#licenseType#','#appId#');"></a>--%>
					<%-- </sec:authorize> --%>
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> 
					<a href="javascript:void(0);" class="option_off" title="注销" onclick="off('#licenseType#','#appId#');"></a>--%>
					<%-- </sec:authorize> --%>
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" class="option_view" title="详细信息" onclick="viewLicense('#appId#', '#licenseType#');"></a>
					<%-- </sec:authorize> --%>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/oa/app.js"></script>
<script type="text/javascript">
	var templateModel = {
		id : null,
		appId : null,
		licenseType : null,
		licenseTypeName : null,
		licenseNo : null,
		applyItem : null,
		name : null,
		legalPersonName : null,
		grantDatetime : {type : 'timestamp'},
		grantStatus : null,
		grantStatusName : null
	};
	var helper = new dataHelper(templateModel);
	var search = function() {
		helper.postSearch('/app/reportSearch', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
		helper.addListener("afterFillData", handler, "list_table", "licenseReport");
	};

	var handler = function(e,pageList){
		$("a[name='issue_button_<%=HSCV. GRANT_STATUS.GRANT%>']").remove();
		$("a[name='grant_button_']").remove();
	};

	var issue = function(id) {
		helper.validateModel = {
			licenseNo : {must : true, fieldName : "卫生许可编号"},
			validBeginDatetime : {must : true, fieldName : "有效开始日期"},
			validEndDatetime : {must : true, fieldName : "有结束日期"}
		};
		helper.basicPost('/app/licenseIssue', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '许可生成',
			successMessage : '操作成功',
			editConfirmUrl : '/app/issue',
			editFormId : 'editForm',
			validate : true,
			preProcess : function(formData) {
				if (typeof getLicenseData != "undefined") {
					return getLicenseData(formData);
				}
				return formData;
			}
		});
	};

	var grant = function(id) {
		helper.operateObjects(id, "/app/grant", "发放");
	};
	var report = function(licenseType, id) {
		helper.operateObjects(id, "/app/report?licenseType=" + licenseType, "上报");
	};
	var record = function(licenseType, id) {
		helper.operateObjects(id, "/app/record?licenseType=" + licenseType, "备案");
	};
	var off = function(licenseType, id) {
		helper.operateObjects(id, "/app/off?licenseType=" + licenseType, "注销");
	};

	//make default search
	$(function() {
		search();
	});
</script>