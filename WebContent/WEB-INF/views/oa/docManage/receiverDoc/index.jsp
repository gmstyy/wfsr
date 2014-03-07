<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<div id="search_container">
	<form id="search_form"  action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 80px;">
				<col style="width: 160px;">
				<col style="width: 80px;">
				<col style="width: 160px;">
				<col style="width: 80px;">
				<col style="width: 160px;">
			</colgroup>
			<thead>
				<tr>
					<th>公文编号</th>
					<td><input type="text" id="documentNo" name="documentNo:String:LIKE" maxlength="50" /></td>
					<th>重要标识</th>
					<td><hs:dic name="importance:Integer:LIKE" id="importance" dicName="DOCUMENT_IMPORTANCE_STATUS"></hs:dic></td>
					<th>已读状态</th>
					<td><hs:dic name="status:Integer:LIKE" id="importance" dicName="READ_STATUS"></hs:dic></td>
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
				<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/docManage/receiver/delete');">删除</a>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 100px;">
			<col style="width: 80px;">
			<col>
			<col style="width: 100px;">
			<col style="width: 90px;">
			<col style="width: 90px;">
			<col style="width: 70px;">
			<col style="width: 70px;">
			<col style="width: 80px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>公文编号</th>
				<th>重要标识</th>
				<th>公文标题</th>
				<th>发送机构</th>
				<th>发送时间</th>
				<th>接收时间</th>
				<th>保密状态</th>
				<th>已读状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display:none;">
	 		<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
	 		<td style="text-align: center;">#documentNo#</td>
			<td>#importance#</td>
			<td>#title#</td>
			<td>#senderOrgId#</td>
			<td>#sentDatetime#</td>
			<td>#receiveDatetime#</td>
			<td class='mark_#isSecret#'>#secretStatus#</td>
			<td style="text-align: center;">#status#</td>
	 		<td style="text-align: center;">
	 			<div class="option_container">
	 				<a href="javascript:void(0);" title="查看" class="option_view" onclick="view('#id#');"></a>					
					<a href="javascript:void(0);" title="删除" class="option_delete" onclick="helper.deleteObjects('#id#','/docManage/receiver/delete');"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
var templateModel = {
		id: null,
		sentDocumentId: null,
		documentType: null,
		urgentStatus: null,
		importance: null,
		documentNo: null,
		title: null,
		content: null,
		senderOrgId: null,
		senderOrgName: null,
		senderUserId: null,
		senderUserName: null,
		sentDatetime: { type : "timestamp" },
		receiverId: null,
		receiverName: null,
		receiverUserId: null,
		receiverUserName: null,
		receiveDatetime: { type : "timestamp" },
		status: null,
		isSecret:null,
		secretStatus:null
	};
var helper = new dataHelper(templateModel);
var search = function() {
	helper.postSearch('/docManage/receiver/search',{formId:'search_form',containerId:'data_table',templateId:'template'});
	helper.addListener("afterFillData", handler, "data_table");
};

var handler = function(e,pageList){
	$(".mark_1").attr("style","color: red;");
};

var view = function(id) {
	helper.basicPost('/docManage/receiver/view', {
		'id' : id
	}, 2, {
		containerId : 'editContainer',
		containerTitle : '公文查看',
		afterDialogOpen : function() {
			helper.redirectPage(1);
		},
		defaultButtons:{
			okEnabled:false,
			cancelText:"关 闭"
		}
	});
};
$(function() {
	search();
});
</script>