<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="tree_container"></div>
<div id="data_container" style="float: left;">
<div id="search_container">
	<form id="search_form" method="post">
		<table id="searchTable" class="formtable">
			<colgroup>
				<col style="width: 200px"/>
				<col/>
				<col style="width: 200px"/>
				<col/>
			</colgroup>
			<thead>
			<tr>
				<th>关键字</th>
				<td><input type="text" id="keywords" name="words" maxlength="150"/></td>
				<th>作者</th>
				<td><input type="text" id="author" name="creatorName:String:LIKE" maxlength="150"/></td>
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
			<a class="button_add" href="javascript:void(0);" onclick="edit()">添加词条</a>
		</caption>
		<colgroup>
			<col style="width: 50px"/>
			<col style="width: 150px"/>
			<col/>
			<col style="width: 100px"/>
			<col style="width: 150px"/>
			<col style="width: 80px"/>
			<col style="width: 120px"/>
		</colgroup>
		<thead>
		<tr class="row_header">
			<th>编号</th>
			<th>标题</th>
			<th>内容</th>
			<th>作者</th>
			<th>更新时间</th>
			<th>浏览次数</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none">
			<td style="text-align: center">#rowCount#</td>
			<td>#title#</td>
			<td>#content#</td>
			<td style="text-align: center">#creatorName#</td>
			<td style="text-align: center">#updateTime#</td>
			<td style="text-align: center">#readTimes#</td>
			<td style="text-align: center">
				<div class="option_container">
					<a href="javascript:void(0);" title="查看" class="option_view" onclick="view('#id#')"></a>
					<a href="javascript:void(0);" title="修改" class="option_edit" onclick="edit('#id#')"></a>
					<a href="javascript:void(0);" title="删除" class="option_delete" onclick="helper.deleteObjects('#id#', '/knowledge/manage/delete')"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
</div>
<script type="text/javascript">
	var globalContext = "oa";
	var myTree = new tree();
	var showSearchCategoryTree = function() {
		$("#searchCategory").show();
	};
	var confirmSearchCategory = function() {
		$("#searchCategory").hide();
	};
	var templateModel = {
		id : null,
		orgId : null,
		categoryId : null,
		title : null,
		content : { type : "html", maxLength : 100 },
		creatorName : null,
		readTimes : null,
		updateTime : {type : "timestamp", nullField : "createTime" },
		createTime : null
	};
	var validateModel = {
		title : {must : true, fieldName : "标题"},
		categoryId : {must : true, fieldName : "词条分类"}
	};
	var helper = new dataHelper(templateModel, validateModel);

	var search = function() {
		var args = {containerId: "list_table", templateId:"template", formId: "search_form"};
		if (typeof(myTree) != "undefined" && myTree.selectedNode != null) {
			args.additionalConditions = { categoryId : myTree.selectedNode.code };
		}
		helper.postSearch("/knowledge/manage/search", args);
	};
	var editor;
	var edit = function(id) {
		var title;
		if (id == null) {
			title = "添加词条";
		} else {
			title = "修改词条";
		}
		helper.basicPost("/knowledge/manage/edit", {id: id}, 2, {
			containerId: "editContainer",
			containerTitle: title,
			successMessage : '保存成功',
			editConfirmUrl: "/knowledge/manage/save",
			editFormId: "editKnowledgeForm",
			validate: true,
			afterDialogOpen : function() {
				editor = new htmlEditor("content");
			},
			preProcess: function(form) {
				form.content = editor.getHtml();
				form = constructUploadPrams(form);
				form.knowledgeUploadFile = null;
				return form;
			}
		});
	};
	var view = function(id) {
		helper.basicPost("/knowledge/manage/detail", {id: id}, 2, {
			containerId: "editContainer",
			containerTitle: "查看词条",
			defaultButtons: {
				okEnabled : false,
				cancelText : "关闭"
			}
		});
	};
	var resizeTreeContainer = function() {
		var pageContainer = $("#page_container");
		var treeContainer = $("#tree_container");
		var dataContainer = $("#data_container");
		var containerHeight = $(pageContainer).height();
		var containerWidth = $(pageContainer).width();
		$(treeContainer).height(containerHeight);
		$(dataContainer).height(containerHeight);
		$(dataContainer).width(containerWidth - $(treeContainer).width() - 25);
	};
	if (typeof(resizeFunctions) != "undefined") {
		resizeFunctions.push(resizeTreeContainer);
	}
	menu.hide();
	search();
	var treeNodeClick = function(code, name) {
		$("#keywords").val("");
		$("#author").val("");
		search();
	};
	helper.basicPost("/knowledge/manage/categoryTree", null, 1, null, function(response) {
		myTree.buildJQueryTree(response.categoryTree, "tree_container", {
			callback : treeNodeClick,
			folderSearchable : true
		});
	});
</script>