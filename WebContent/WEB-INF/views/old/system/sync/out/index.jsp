<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container">
	<form id="search_form"  action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 100px;"/>
				<col style="width: 160px;"/>
				<col style="width: 80px;"/>
				<col style="width: 160px;"/>
				<col style="width: 100px;"/>
				<col style="width: 160px;"/>
			</colgroup>
			<thead>
				<tr>
					<th>内容关键字</th>
					<td><input type="text" id="jsonData" name="jsonData:String:LIKE" maxlength="50" /></td>
					<th>数据类型</th>
					<td><input type="text" id="type" name="type:String:LIKE" maxlength="50" /></td>
					<th>错误关键字</th>
					<td><input type="text" id="message" name="message:String:LIKE" maxlength="50" /></td>
				</tr>
				<tr>
					<th>时间</th>
					<td colspan="5"><tag:dateInput onlypast="false" name="startDate" cssClass="date_input" />~<tag:dateInput onlypast="false" name="endDate" cssClass="date_input" /></td>
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
			<%-- <sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
			<a class="button_sync" href="javascript:void(0);" onclick="syncData('Organization');">同步机构信息</a>
			<%-- </sec:authorize> --%>
			<%-- <sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
			<a class="button_sync" href="javascript:void(0);" onclick="syncData('OrgLicense');">同步许可种类</a>
			<%-- </sec:authorize> --%>
			<%-- <sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
			<a class="button_sync" href="javascript:void(0);" onclick="resyncData();">重发</a>
			<%-- </sec:authorize> --%>
			<%-- <sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/sync/out/delete');">删除</a>
			<%-- </sec:authorize> --%>
		</caption>
		<colgroup>
			<col style="width: 30px;"/>
			<col style="width: 80px;"/>
			<col style="width: 80px;"/>
			<col style="width: 150px;"/>
			<col style="width: 60px;"/>
			<col style="width: 90px;"/>
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>操作时间</th>
				<th>类型</th>
				<th>数据</th>
				<th>同步标志</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td align="center"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
			<td align="center">#version#</td>
			<td align="center">#type#</td>
			<td>#jsonData#</td>
			<td align="center">#flag#</td>
			<td align="center">
				<div class="option_container">
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" title="查看" class="option_view" onclick="view('#id#');"></a>
					<a href="javascript:void(0);" title="重发" class="option_edit" onclick="resyncData('#id#');"></a>
					<%-- </sec:authorize> --%>
					<%-- <sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
					<a href="javascript:void(0);" title="删除" class="option_delete" onclick="helper.deleteObjects('#id#','/sync/out/delete');"></a>
					<%-- </sec:authorize> --%>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
var templateModel = {
		id : null,
		orgId : null,
		type : null,
		jsonData : { maxLength : 60 },
		version : { type : "timestamp" },
		flag : null,
		message : null
	};
	var helper = new dataHelper(templateModel);
var syncData = function(type) {
	top.Dialog.confirm("你确定要同步吗？", function() {
		helper.basicPost("/sync/out/syncWithType", { type : type }, 3, null, function(response) {
			top.Dialog.alert("同步成功");
		});
	}, null, 300, 120);
};
var search = function() {
	helper.postSearch('/sync/out/search', {
		formId : 'search_form',
		containerId : 'list_table',
		templateId : 'template'
	});
};
var view = function(id) {
	helper.basicPost('/sync/out/view', {
		'id' : id
	}, 2, {
		containerId : 'editContainer',
		containerTitle : '查看'
	});
};
var resyncData = function(id) {
	helper.operateObjects(id, "/sync/out/reSync", "重发");
};
//make default search
search();
</script>
