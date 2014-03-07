<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
	<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
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
	<form id="search_form" name="search_form" action="" method="post">
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
					<th>任务来源</th>
					<td><hs:dic dicName="TASK_SOURCE" name="taskSource"></hs:dic></td>
					<th>任务状态</th>
					<td><hs:dic dicName="TASK_STATUS" name="status"></hs:dic></td>											
					<th>创建日期</th>
					<td><tag:dateInput onlypast="false" name="startDate" />~<tag:dateInput onlypast="false" name="endDate" /></td>
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
			<col style="width: 50px;"  />
			<col style="width: 100px;" />
			<col style="width: 100px;" />
			<col style="width: 100px;" />
			<col style="width: 100px;" />
			<col style="width: 110px;" />
			<col />
			<col style="width: 80px;" />
			<col style="width: 60px;" />
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>序号</th>
				<th>任务来源</th>
				<th>任务类别</th>
				<th>场所名称</th>
				<th>创建人</th>			
				<th>创建日期</th>	
				<th>任务负责人</th>				
				<th>任务状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display:none;">			
	 		<td style="text-align: center;">#rowCount#</td>
			<td>#sourceType#</td>
			<td>#taskType#</td>
			<td>#place#</td>
			<td>#creatorName#</td>
			<td>#createTime#</td>
			<td>#selectUsers#</td>
			<td style="text-align: center;">#statusDesc#</td>
	 		<td style="text-align: center;">
	 			<div class="option_container">
	 				<a href="javascript:void(0);" title="查看" class="option_view" onclick="viewTaskDeail('#id#');"></a>
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
	id : null,
	sourceType : null,
	taskType : null,
	place : null,
	createTime : {type:'timestamp'},
	statusDesc : null,
	creatorName : null,
	selectUsers : null
};

var helper = new dataHelper(templateModel);

var search = function() {
	helper.postSearch('/task/manage/search',{formId:'search_form',containerId:'data_table',templateId:'template'});
};

var count = function() {
	helper.basicPost('/task/countView',null, 2, {
		containerId : 'editContainer',
		containerTitle : '执法任务统计信息',
		height:580,
		width:680,
		defaultButtons:{
			okEnabled:false,
			cancelText:"关 闭"
		}
	});
};

var doExport = function() {
	file.exportExcel(helper.getFormData("search_form"), "TASK_REPORT", "执法任务报表");
};

//make default search
$(function() {
	search();
});
</script>
</body>
</html>