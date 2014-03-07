<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="list_container">
	<table class="repeattable">
		<caption>
			<a class="button_add" href="javascript:void(0);" onclick="editCategory();">新增</a>
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null, '/knowledge/category/delete')">删除</a>
		</caption>
		<colgroup>
			<col style="width:30px;"/>
			<col style="width:50px;"/>
			<col style="width:300px;"/>
			<col style="width:100px;"/>
			<col style="width:200px;"/>
			<col/>
		</colgroup>
		<thead>
		<tr class="row_header">
			<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
			<th>编号</th>
			<th>级别</th>
			<th>名称</th>
			<th>排序号</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none">
			<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
			<td style="text-align: center;">#rowCount#</td>
			<td style="text-align: center;">#categoryLevel#</td>
			<td>#name#</td>
			<td style="text-align: center;">#sortNo#</td>
			<td style="text-align: center">
				<div class="option_container">
					<a href="javascript:void(0);" title="修改" class="option_edit" onclick="editCategory('#id#')"></a>
					<a href="javascript:void(0);" title="删除" class="option_delete" onclick="helper.deleteObjects('#id#', '/knowledge/category/delete')"></a>
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
		parentId : null,
		name : null,
		categoryLevel : null,
		sortNo : null
	};
	var validateModel = {
		name : {must : true, fieldName : "类别名称"},
		categoryLevel : {must : true, fieldName : "类别级别"}
	};
	var helper = new dataHelper(templateModel, validateModel);

	var search = function() {
		helper.postSearch("/knowledge/category/search", {containerId: "list_table", templateId:"template"});
	};

	var editCategory = function(id) {
		validateModel = {
			name : {must : true, fieldName : "类别名称"},
			categoryLevel : {must : true, fieldName : "类别级别"}
		};
		helper.validateModel = validateModel;
		var title;
		if (id == null) {
			title = "新增知识类别";
		} else {
			title = "修改知识类别";
		}
		helper.basicPost("/knowledge/category/edit", {id: id}, 2, {
			containerId: "editContainer",
			containerTitle: title,
			editConfirmUrl: "/knowledge/category/save",
			editFormId: "editCategoryForm",
			validate: true
		});
	};

	var delCategory = function(id) {
		helper.deleteObjects(id, "/knowledge/category/delete");
	};

	var parentCategoryList = function() {
		var level = $("#categoryLevel").val() * 1 - 1;
		if (level > 0) {
			helper.basicPost("/knowledge/category/getCategoryList", {categoryLevel: level}, null, null, function(response) {
				var list = response.list;
				if (list == null || list.length == 0) {
					return;
				}
				var html = "";
				for (var i = 0; i < list.length; i++) {
					html += "<option value='" + list[i].id + "'>" + list[i].name + "</option>";
				}
				$("#parentId").html(html);
				$("#parentCategory").show();
			});
		} else {
			$("#parentId").empty();
			$("#parentCategory").hide();
		}
	};
	search();
</script>