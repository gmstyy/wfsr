<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ include file="/WEB-INF/views/layout/csslibs.jsp"%>

<div id="search_container">
	<form id="search_form" name="userForm" action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 80px;">
				<col style="width: 160px;">
			</colgroup>
			<thead>
				<tr>
					<th>名称</th>
					<td><input type="text" id="name" name="name:String:LIKE" maxlength="50" /></td>
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
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/config/delete');">删除</a>
			<%-- </sec:authorize> --%>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 135px;">
			<col style="width: 180px;">
			<col style="width: 180px;">
			<col style="width: 80px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th style=''>名称</th>
				<th style=''>菜单分类</th>
				<th style=''>描述</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
			<td>#name#</td>
			<td>#menuId#</td>
			<td>#remark#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" title="修改" class="option_edit" onclick="edit('#id#');"></a>
					<%-- </sec:authorize>
					<sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
					<a href="javascript:void(0);" title="删除" class="option_delete" onclick="helper.deleteObjects('#id#','/config/delete');"></a>
					<%-- 	</sec:authorize> --%>

				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<%@ include file="/WEB-INF/views/layout/scriptlibs.jsp"%>
<script type="text/javascript">
	var templateModel = {
		id : null,
		name : null,
		menuId : null,
		remark : null
	};

	var helper = new dataHelper(templateModel, validateModel);
	var search = function() {
		helper.postSearch('/foodList/search', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
	}
	var add = function() {
		helper.postForm('/foodList/add', 2, {
			containerId : 'editContainer',
			containerTitle : '新增',
			editConfirmUrl : '/foodList/saveAdd',
			editFormId : 'editFormId',
			validate : true
		});
	};
	var edit = function(id) {
		helper.basicPost('/foodList/update', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '修改',
			editConfirmUrl : '/foodList/saveUpdate',
			editFormId : 'editFormId',
			validate : true
		});
	};
	
	//make default search
	$(function() {
		search();
	});
</script>
