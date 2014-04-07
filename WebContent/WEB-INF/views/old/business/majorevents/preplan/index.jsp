<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<div id="search_container">
	<form id="search_form" name="preplanForm" action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 100px;">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>预案名称</th>
					<td><input type="text" id="customName" name="customName:String:LIKE" maxlength="30" /></td>
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
			<a class="button_add" href="javascript:void(0);" onclick="add();">新建</a>
		</caption>
		<colgroup>
			<col style="width: 80px;">
			<col>
			<col style="width: 150px;">
			<col style="width: 200px;">
			<col style="width: 100px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>编号</th>
				<th>预案名称</th>
				<th>上传人</th>
				<th>上传时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;">#rowCount#</td>
			<td>#customName#</td>
			<td>#uploadUserName#</td>
			<td>#uploadDatetime#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<a href="javascript:void(0);" class="option_view" title="查看" onclick="file.download('#id#');"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
	var templateModel = {
		id : null,
		customName : null,
		uploadUserName : null,
		uploadDatetime : {type:'timestamp'}
	};

	var validateModel = {
		customName : {must : true,fieldName : "预案名称"},
		preplanFile :{must : true,fieldName : "附件"}
	};

	var helper = new dataHelper(templateModel, validateModel);

	var search = function() {
		var url = '/majorevents/preplan/search';
		helper.postSearch(url, {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
	};

	var add = function() {
		helper.basicPost("/majorevents/preplan/add", null, 2, {
			containerId: "editContainer",
			containerTitle: '新增',
			successMessage : '新增应急预案成功',
			editConfirmUrl: '/majorevents/preplan/save',
			editFormId: "editFormId",
			validate: true,
			preProcess: function(form) {
				form[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
				form = constructUploadPrams(form);
				form.preplanUploadFile = null;
				return form;
			}
		});
	};

	//make default search
	$(function() {
		search();
	});
</script>