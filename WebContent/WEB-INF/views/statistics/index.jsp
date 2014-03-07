<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<div id="search_container">
	<form id="search_form" name="userForm" action="" method="post">
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
					<th>报表名称</th>
					<td><input type="text" id="statName" name="statName" maxlength="30" /></td>
					<th>类别</th>
					<td><input type="text" id="type" name="type" maxlength="30" /></td>
					<th></th>
					<td></td>
				</tr>
			</thead>
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			<input class="button_reset" onclick="$('form')[0].reset();" type="button" /> <input class="button_search" onclick="search();" type="button" /> <input class="button_export"
				onclick="doExport();" type="button" />
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
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/statistics/delete');">删除</a>
			<%-- </sec:authorize> --%>
		</caption>
		<colgroup>
			<col style="width: 50px;" />
			<col style="width: 100px;" />
			<col style="width: 100px;" />
			<col style="width: 100px;" />
			<col style="width: 100px;" />
			<col style="width: 100px;" />
			<col style="width: 180px;" />
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>编号</th>
				<th>报表名称</th>
				<th>机构级别</th>
				<th>字符1</th>
				<th>字符2</th>
				<th>字符3</th>
				<th>时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center">#rowCount#</td>
			<td>#statName#</td>
			<td>#orgLevel#</td>
			<td>#str1Def#</td>
			<td>#str2Def#</td>
			<td>#str3Def#</td>
			<td>#runDate#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" title="修改" class="option_edit" onclick="edit('#id#');"></a>
					<%-- </sec:authorize> --%>
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" title="执行" class="option_edit" onclick="run('#id#');"></a>
					<%-- </sec:authorize> --%>
					<%-- <sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
					<a href="javascript:void(0);" title="删除" class="option_delete" onclick="helper.deleteObjects('#id#','/statistics/delete');"></a>
					<%-- 	</sec:authorize> --%>

				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
	var licenseTypeTmp;
	var templateModel = {
		id : null,
		orgLevel : null,
		str1Def : null,
		str2Def : null,
		str3Def : null,
		statName : null,
		runDate : null

	};
	var helper = new dataHelper(templateModel, null);
	var search = function() {
		helper.postSearch('/statistics/configSearch', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
	}
	var add = function() {
		helper.postForm('/statistics/add', 2, {
			containerId : 'editContainer',
			containerTitle : '新增',
			editConfirmUrl : '/statistics/saveAdd',
			editFormId : 'editFormId',
			validate : true,
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()] = $("#CSRFToken").val();
				return prms;
			}
		});
	};
	var edit = function(id) {
		helper.basicPost('/statistics/update', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '修改',
			editConfirmUrl : '/statistics/saveUpdate',
			editFormId : 'editFormId',
			validate : true,
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()] = $("#CSRFToken").val();
				return prms;
			}
		});
	};
	var run = function(id) {
		helper.basicPost('/statistics/run', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '修改',
			editConfirmUrl : '/statistics/saveRun',
			editFormId : 'editFormId',
			validate : true,
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()] = $("#CSRFToken").val();
				return prms;
			}
		});
	};
	//make default search
	search();
</script>