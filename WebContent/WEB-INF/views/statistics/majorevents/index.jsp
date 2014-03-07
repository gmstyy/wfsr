<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@page import="com.founder.hs.constant.HSDV"%>
	<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
	<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
	<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
	<%@ page language="java" import="com.founder.oa.common.constant.OACV" %>
	<title>贵州省卫生监督执法综合管理平台</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv='Cache-Control' content='no-cache, must-revalidate' />
	<meta http-equiv='expires' content='0' />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
	<%@ include file="/WEB-INF/views/layout/csslibs.jsp"%>
</head>
<body style="background-color:transparent;margin:0;overflow-y:auto;">
<div id="search_container">
	<form id="search_form" name="majoreventsForm" action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 100px;" />
				<col />
				<col style="width: 100px;" />
				<col />
				<col style="width: 100px;" />
				<col />
			</colgroup>
			<thead>
				<tr>
					<th>活动名称</th>
					<td><input type="text" id="name" name="name:String:LIKE" maxlength="100" /></td>
					<th>状态</th>
					<td><hs:dic dicName="MAJOREVENT_STATUS" name="status:Integer:EQ"></hs:dic></td>					
					<th>登记日期</th>
					<td><tag:dateInput onlypast="false" name="registerStartDate" />~<tag:dateInput onlypast="false" name="registerEndDate" /></td>
				</tr>
				<tr><th>机构</th>
				<td>
					<hs:dic dicName="ORG" limitedMap="${orgSet}" defalt="${loginUser.orgId}" id="orgId" name="orgId"></hs:dic>
				</td></tr>
			</thead>
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			<input class="button_reset" onclick="$('form')[0].reset();" type="button" /> 
			<input class="button_search" onclick="search();" type="button" />
			<input class="button_export" onclick="doExport();" type="button" />
		</div>
	</form>
</div>
<div id="list_container">
	<table class="repeattable">
		<caption>
			<a class="button_regist" href="javascript:void(0);" onclick="count();">统计查看</a>
		</caption>
		<colgroup>
			<col style="width: 50px;" /> 
			<col />
			<col style="width: 200px;"/>
			<col style="width: 100px;"/>
			<col style="width: 150px;"/>
			<col style="width: 80px;" />
			<col style="width: 100px;"/>
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>序号</th>
				<th>活动名称</th>	
				<th>活动场所</th>						
				<th>登记人</th>
				<th>登记时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">			
			<td style="text-align: center;">#rowCount#</td>
			<td>#name#</td>			
			<td>#place#</td>
			<td>#handlerName#</td>
			<td>#registerDatetime#</td>
			<td style="text-align: center;">#statusDesc#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<a href="javascript:void(0);" title="查看" class="option_view" onclick="viewMajorevents('#id#');"></a>					
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
	var protocol = window.location.protocol;
	var domain = window.location.host;
	var ctx = "${pageContext.request.contextPath}";
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery.json-2.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/global.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/controls.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/ajax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/dateFormat.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/dataHelper.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/file.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/tab.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/common/business.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<%@ include file="/WEB-INF/views/layout/statics.jsp"%>
<script type="text/javascript">
var templateModel = {
	id:null,
	name:null,
	place:null,
	registerDatetime:{type : "timestamp"},
	registerOrgId:null,
	handlerName:null,
	statusDesc:null
};

var helper = new dataHelper(templateModel);

var search = function() {
	helper.postSearch('/majorevents/search', {formId : 'search_form', containerId : 'list_table', templateId : 'template'});
};

var count = function() {
	helper.basicPost('/majorevents/countView',null, 2, {
		containerId : 'editContainer',
		containerTitle : '重大活动统计信息',
		height:530,
		width:680,
		defaultButtons:{
			okEnabled:false,
			cancelText:"关 闭"
		}
	});
};
var doExport = function() {
	file.exportExcel(helper.getFormData("search_form"), "MAJOREVENTS_REPORT", "重大活动报表");
};

//make default search
	search();
</script>
</body>
</html>