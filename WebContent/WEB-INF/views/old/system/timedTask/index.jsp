<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
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
					<th>名称</th>
					<td><input type="text" id="statName" name="statName" maxlength="30" /></td>
					<th>类别</th>
					<td><hs:dic dicName="TIMED_TASK_TYPE" name='type' /></td>
				</tr>
			</thead>
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			<input class="button_reset" onclick="$('form')[0].reset();" type="button" /> <input class="button_search" onclick="search();" type="button" />
		</div>
	</form>
</div>
<div id="list_container">
	<table class="repeattable">
		<caption>
			<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
			<a class="button_add" href="javascript:void(0);" onclick="add();">新建</a>
			<%-- </sec:authorize>--%>
			<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
			<a class="button_add" href="javascript:void(0);" onclick="run();">执行</a>
			<%-- </sec:authorize>--%>
			<%--<sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/timedTask/delete');">删除</a>
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
				<th>名称</th>
				<th>类型</th>
				<th>时间</th>
				<th>服务名</th>
				<th>运行数据ID</th>
				<th>上次时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center">#rowCount#</td>
			<td>#name#</td>
			<td>#type#</td>
			<td>#runDate#</td>
			<td>#serviceName#</td>
			<td>#configId#</td>
			<td>#lastRunDate#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" title="修改" class="option_edit" onclick="edit('#id#');"></a>
					<%-- </sec:authorize> --%>
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" title="执行" class="option_edit" onclick="run('#id#');"></a>
					<%-- </sec:authorize> --%>
					<%-- <sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
					<a href="javascript:void(0);" title="删除" class="option_delete" onclick="helper.deleteObjects('#id#','/timedTask/delete');"></a>
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
		name : null,
		type : null,
		runDate : null,
		serviceName : null,
		configId : null,
		lastRunDate : null

	};
	var helper = new dataHelper(templateModel, null);
	var search = function() {
		helper.postSearch('/timedTask/search', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
	}
	var add = function() {
		helper.postForm('/timedTask/add', 2, {
			containerId : 'editContainer',
			containerTitle : '新增',
			editConfirmUrl : '/timedTask/saveAdd',
			editFormId : 'editFormId',
			validate : true,
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()] = $("#CSRFToken").val();
				return prms;
			}
		});
	};
	var edit = function(id) {
		helper.basicPost('/timedTask/update', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '修改',
			editConfirmUrl : '/timedTask/saveUpdate',
			editFormId : 'editFormId',
			validate : true,
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()] = $("#CSRFToken").val();
				return prms;
			}
		});
	};
	var run = function(id) {
		helper.operateObjects(id, '/timedTask/run', "执行");
	};
	//make default search
	search();
</script>