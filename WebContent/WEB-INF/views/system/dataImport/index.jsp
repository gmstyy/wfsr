<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container">
	<form id="search_form" name="userForm" action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 80px;">
				<col style="width: 160px;">
				<col style="width: 80px;">
				<col style="width: 160px;">
				<col style="width: 80px;">
				<col style="width: 160px;">
				<col style="width: 80px;">
				<col style="width: 160px;">
			</colgroup>
			<thead>
				<tr>
					<th>导入类型</th>
					<td><hs:dic dicName="IMPORT_TYPE"  name="tableName"></hs:dic></td>
					<th>表列名</th>
					<td><input type="text" id="columeName" name="columeName:String:LIKE" maxlength="50" /></td>
					<th>表列号</th>
					<td><input type="text" id="columeIndex" name="columeIndex" maxlength="50" /></td>
					<th>属性名</th>
					<td><input type="text" id="property" name="property:String:LIKE" maxlength="50" /></td>
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
			<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
			<a class="button_add" href="javascript:void(0);" onclick="add();">新建</a>
			<%-- </sec:authorize>
			<sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/dataImportConfig/delete');">删除</a>
			<%-- </sec:authorize> --%>
			<%-- <sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
			<a class="button_import" href="javascript:void(0);" onclick="importExcel();">导入</a>
			<%-- </sec:authorize> --%>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 135px;">
			<col style="width: 180px;">
			<col >
			<col style="width: 180px;">
			<col style="width: 80px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th style=''>导入类型</th>
				<th style=''>列名</th>
				<th style=''>列号</th>
				<th style=''>属性名</th>
				<th style=''>字典名</th>
				<th style=''>默认值</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
			<td>#tableName#</td>
			<td>#columeName#</td>
			<td>#columeIndex#</td>
			<td>#property#</td>
			<td>#dicName#</td>
			<td>#defaultValue#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" title="修改" class="option_edit" onclick="edit('#id#');"></a>
					<%-- </sec:authorize>
					<sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
					<a href="javascript:void(0);" title="删除" class="option_delete" onclick="helper.deleteObjects('#id#','/dataImportConfig/delete');"></a>
					<%-- 	</sec:authorize> --%>

				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<div id="importContainer" style="display: none;">
	<table>
		<colgroup>
			<col style="width: 100px;">
			<col style="width: 200px;">
			<col style="width: 150px;">
		</colgroup>
		<tr style="line-height: 40px;">
			<th>导入类型</th>
			<td><hs:dic dicName="IMPORT_TYPE" id='importType' name="importType" blank="false"></hs:dic></td>
			<td><a href="${pageContext.request.contextPath}/exceltemplates/relativePerson/template.xls" target="_blank">下载模板</a></td>
		</tr>
		<tr style="line-height: 40px;">
			<th>导入文件</th>
			<td><input type="file" id="importExcel" name="importExcel"/></td>
			<td><input type="button" value="导入数据" onclick="doImport()"/></td>
		</tr>
	</table>
</div>
<script type="text/javascript">
	var templateModel = {
		id : null,
		tableName : null,
		columeName : null,
		columeIndex : null,
		property : null,
		dateFormat : null,
		defaultValue : null,
		dicName: null
	};
	var validateModel = {
			property : { must : true, fieldName : "属性名" },
			tableName : { must : true, fieldName : "表名" }

		};
	var helper = new dataHelper(templateModel, validateModel);
	var search = function() {
		helper.postSearch('/dataImportConfig/search', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
	}
	var add = function() {
		helper.postForm('/dataImportConfig/add', 2, {
			containerId : 'editContainer',
			containerTitle : '新增',
			editConfirmUrl : '/dataImportConfig/saveAdd',
			editFormId : 'editFormId',
			validate : true,
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
				return prms;
			}
		});
	};
	var edit = function(id) {
		helper.basicPost('/dataImportConfig/update', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '修改',
			editConfirmUrl : '/dataImportConfig/saveUpdate',
			editFormId : 'editFormId',
			validate : true,
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
				return prms;
			}
		});
	};
	var importExcel = function() {
		$("#editContainer").html($("#importContainer").html());
		Dialog.open("editContainer", "导入数据", 500, 150);
	};

	var doImport = function() {
		var importType=$("#editContainer").find("#importType").val();
		$.ajaxFileUpload({
			url : getContextUrl('/dataImportConfig/import?fileElementId=importExcel&importType='+importType),
			secureuri : false,
			fileElementId : 'editContainer #importExcel',
			dataType : 'json',
			success : function(response, status) {
				Dialog.alert(response.message);
			},
			error : function(data, status, e) {
				Dialog.alert(data.responseText);
			}
		});
	};
	//make default search
	$(function() {
		search();
	});
</script>