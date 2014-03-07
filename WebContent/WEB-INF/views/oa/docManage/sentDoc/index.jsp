<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ page language="java" import="com.founder.hs.constant.HSCV" %>

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
					<th>状态</th>
					<td><hs:dic name="status:Integer:LIKE" id="status" dicName="DOCUMENT_SEND_STATUS"></hs:dic></td>
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
			<a class="button_add" href="javascript:void(0);" onclick="edit(0,'<%=HSCV.DOCUMENT_STATUS.DRAFT%>');">新建</a>
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/docManage/delete');">删除</a>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 80px;">
			<col style="width: 70px;">
			<col >
			<col style="width: 100px;">
			<col style="width: 100px;">
			<col style="width: 100px;">
			<col style="width: 60px;">
			<col style="width: 60px;">
			<col style="width: 100px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>公文编号</th>
				<th>重要标识</th>
				<th>公文标题</th>
				<th>创建日期</th>
				<th>发送日期</th>
				<th>发送人</th>
				<th>保密状态</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display:none;">
	 		<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
	 		<td style="text-align: center;">#documentNo#</td>
			<td>#importance#</td>
			<td>#title#</td>
			<td>#createDatetime#</td>
			<td>#sentDatetime#</td>
			<td>#senderUserName#</td>
			<td>#isSecret#</td>
			<td style="text-align: center;">#statusDesc#</td>
	 		<td style="text-align: center;">
	 			<div class="option_container">
	 				<a href="javascript:void(0);" title="查看" class="option_view" onclick="viewDocument('#id#');"></a>	
	 				<a name = "#status#" href="javascript:void(0);" title="处理" class="option_process" onclick="edit('#id#','#status#');"></a>	 					
					<a href="javascript:void(0);" title="删除" class="option_delete" onclick="helper.deleteObjects('#id#','/docManage/delete');"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
var globalContext = "oa";
var templateModel = {
	id: null,
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
	sentDatetime: {type:"timestamp"},
	createDatetime:{type:"timestamp"},
	status: null,
	statusDesc: null,
	isSecret:null
};

var validateModel = {
	documentNo : { must : true, fieldName : "公文编号"},
	senderOrgName : { must : true, fieldName : "接收人"},
	importance : { must : true, fieldName : "重要性标识"},
	urgentStatus : { must : true, fieldName : "紧急状况"},
	isSecret:{ must : true, fieldName : "公文保密"}
};
var helper = new dataHelper(templateModel,validateModel);
var search = function() {
	helper.postSearch('/docManage/search',{formId:'search_form',containerId:'data_table',templateId:'template'});
	helper.addListener("afterFillData", handler, "data_table");
};
var handler = function(e,pageList){
	$("a[name='<%=HSCV.DOCUMENT_STATUS.SENT%>']").remove();
};

var editor;
var edit = function(id, status) {
	var btns = {};
	if(status == '<%=HSCV.DOCUMENT_STATUS.DRAFT%>' || status == '<%=HSCV.DOCUMENT_STATUS.UNPASS%>'){
		btns['发起审核'] = function() {startApproveDoc();};
	}
	if(status == <%=HSCV.DOCUMENT_STATUS.PASS%>){
		btns['发送'] = function() {sentDoc();};
	}
	var args = {
		containerId : 'editContainer',
		containerTitle : (id==0) ? '新建公文' : '修改公文',
		successMessage : (id==0) ? '新建公文成功' : '修改公文成功',
		editConfirmUrl : '/docManage/save',
		editFormId : 'addSentDocFormId',
		height:565,
		width:850,
		validate : true,		
		defaultButtons:{
			okText : "保 存"
		},
		afterDialogOpen : function() {
			editor = new htmlEditor("content");
		},
		preProcess : function(form) {			
			form.receiverIdList = dicOrg.getSelectedValues();
			form.receiverNameList = dicOrg.getSelectedNames();
			form.content = editor.getHtml();
			
			form = constructUploadPrams(form);
			form.status = status;
			form.docSentUploadfile = null;
			return form;
		}
	};	
	args.buttons = btns;
	helper.basicPost('/docManage/edit', {id : id}, 2, args);
};

var startApproveDoc = function(){
	var workflowId = $("#workflowId").val();
	if(workflowId == null || workflowId == ''){
		Dialog.alert('请选择审核流程。如果没有流程选择，请联系管理员先创建流程。');
		return;
	}
	
	var form = helper.getFormData("addSentDocFormId");
	
	form.workflowId = workflowId;
	
	form.receiverIdList = dicOrg.getSelectedValues();
	form.receiverNameList = dicOrg.getSelectedNames();
	form.content = editor.getHtml();
	
	var newFileNames = [];
	$(".newFileName").each(function(index, item) {
		newFileNames.push($(item).val());
	});
	form.newFileNames = newFileNames.join(",");
	
	var originFileNames = [];
	$(".originFileName").each(function(index, item) {
		originFileNames.push($(item).val());
	});
	form.originFileNames = originFileNames.join(",");
	form.status = '<%=HSCV.DOCUMENT_STATUS.APPROVING%>';
	form.docSentUploadfile = null;
	
	helper.basicPost("/docManage/save", form, 3, { validate : true, editFormId : "addSentDocFormId" }, function(response) {
		helper.redirectPage(1);
		Dialog.alert('发起审核成功', function() {
			Dialog.close();			
		});
	});
};

var sentDoc = function(){
	var form = helper.getFormData("addSentDocFormId");
	form.receiverIdList = dicOrg.getSelectedValues();
	form.receiverNameList = dicOrg.getSelectedNames();
	form.content = editor.getHtml();
	
	var newFileNames = [];
	$(".newFileName").each(function(index, item) {
		newFileNames.push($(item).val());
	});
	form.newFileNames = newFileNames.join(",");
	
	var originFileNames = [];
	$(".originFileName").each(function(index, item) {
		originFileNames.push($(item).val());
	});
	form.originFileNames = originFileNames.join(",");
	form.status = '<%=HSCV.DOCUMENT_STATUS.SENT%>';
	form.docSentUploadfile = null;
	
	helper.basicPost("/docManage/save", form, 3, { validate : true, editFormId : "addSentDocFormId" }, function(response) {
		helper.redirectPage(1);
		Dialog.alert('发送成功', function() {
			Dialog.close();			
		});
	});
};

$(function() {
	search();
});
</script>