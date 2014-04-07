<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ page language="java" import="com.founder.oa.common.constant.OACV" %>

<div id="search_container">
	<form id="search_form" name="majoreventsForm" action="" method="post">
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
					<th>活动名称</th>
					<td><input type="text" id="name" name="name:String:LIKE" maxlength="100" /></td>
					<th>状态</th>
					<td><hs:dic dicName="MAJOREVENT_STATUS" name="status:Integer:EQ"></hs:dic></td>					
					<th>登记日期</th>
					<td><tag:dateInput onlypast="false" name="registerStartDate" />~<tag:dateInput onlypast="false" name="registerEndDate" /></td>
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
			<a class="button_add" href="javascript:void(0);" onclick="add();">登记</a>
		</caption>
		<colgroup>
			<!-- <col style="width: 30px;"> -->
			<col>
			<col style="width: 200px;">
			<col style="width: 100px;">
			<col style="width: 150px;">
			<col style="width: 80px;">
			<col style="width: 100px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<!-- <th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th> -->
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
			<!-- <td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td> -->
			<td>#name#</td>			
			<td>#place#</td>
			<td>#handlerName#</td>
			<td>#registerDatetime#</td>
			<td style="text-align: center;">#statusDesc#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<a href="javascript:void(0);" title="查看" class="option_view" onclick="viewMajorevents('#id#');"></a>
					<a href="javascript:void(0);" title="处理" class="option_process" name="handle_button_#status#" onclick="handle('#id#');"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
var templateModel = {
	id:null,
	name:null,
	place:null,
	registerDatetime:{type : "timestamp"},
	handlerName:null,
	status:null,
	statusDesc:null
};

var validateModel = {
	name : {must : true, fieldName : "活动名称"},
	place : {must : true, fieldName : "活动场所"},
	address : {must : true, fieldName : "活动地址"}
};

var helper = new dataHelper(templateModel, validateModel);

var search = function() {
	var url = '/majorevents/search';
	if("${from}" == "home"){
		url = '/majorevents/homedirect';
	}
	helper.postSearch(url, {formId : 'search_form', containerId : 'list_table', templateId : 'template'});
	helper.addListener("afterFillData", handler, "list_table", "majorevents");
};

var handler = function(e, pageList) {
	$("a[name='handle_button_<%=OACV.MAJOREVENT_STATUS.FINISHED%>']").remove();
};

var add = function() {
	helper.postForm('/majorevents/add', 2, {
		containerId : 'editContainer',
		containerTitle : '重大活动保障',
		successMessage : '登记成功',
		editConfirmUrl : '/majorevents/saveAdd',
		editFormId : 'editFormId',
		validate : true,
		preProcess : function(prms) {
			prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
			return prms;
		}
	});
};

var handle = function(id) {
	helper.basicPost('/majorevents/handle', {'id' : id}, 2, {
		containerId : 'editContainer',
		containerTitle : '重大活动保障',
		successMessage : '保存成功',
		editConfirmUrl : '/majorevents/saveHandle',
		editFormId : 'editFormId',
		validate : true,
		height:520,
		width:800,
		preProcess : function(prms) {
			prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
			return prms;
		}
	});
};

//make default search
$(function() {
	search();
});
</script>