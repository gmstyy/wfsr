<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>

<div id="search_container">
	<form id="search_form" action="" method="post">
		<input type="hidden" id = "orgId" name="orgId" value="${users.orgId}">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 100px;">
				<col>
				<col style="width: 100px;">
				<col>
				<col style="width: 100px;">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>标题</th>
					<td><input type="text" id="TITLE" name="TITLE:String:LIKE" maxlength="100" /></td>
					<th>处理状态</th>
					<td><hs:dic name="status:Integer:LIKE" id="status" dicName="COMPLAINTS_STATUS"></hs:dic></td>
					<th>投诉状态</th>
					<td><hs:dic name="invalidMark:Integer:LIKE" id="invalidMark" dicName="INVALID_MARK" style="width:172px;"></hs:dic></td>
				</tr>
			</thead>
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			<input class="button_reset" onclick="$('form')[0].reset();" type="button" /> 
			<input class="button_search" onclick="search();" type="button"/>
		</div>
	</form>
</div>
<div id="list_container">
	<table class="repeattable">
		<caption>
			<a class="button_regist" href="javascript:void(0);" onclick="add();">登记</a>
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/complaints/delete');">删除</a>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col>
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 70px;">
			<col style="width: 70px;">
			<col style="width: 190px;">		
		</colgroup>
		<thead>
			<tr class="row_header">		
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>标题</th>
				<th>举报人</th>
				<th>被举报人</th>
				<th>登记人</th>
				<th>登记时间</th>				
				<th>处理状态</th>
				<th>投诉状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
			<td>#title#</td>
			<td>#complaintsName#</td>
			<td>#targetName#</td>
			<td>#handlerName#</td>
			<td>#registerDatetime#</td>
			<td>#acceptStatus#</td>
			<td>#mark#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<a href="javascript:void(0);" title="查看" class="option_view show_#status#" onclick="viewComplaints('#id#','#invalidMark#');"></a>
					<!-- <a href="javascript:void(0);" title="修改" class="option_edit edit_#status# invalid_#invalidMark#" style="display: none;" onclick="edit('#id#');"></a> -->
					<a href="javascript:void(0);" title="处理" name="#status#"  class="option_process #handleOrgId# invalid_#invalidMark#" onclick="handle('#id#','#status#');"></a>
					<a href="javascript:void(0);" title="退回" name="#status#"  class="option_rollback #handleOrgId# invalid_#invalidMark#" onclick="goBack('#id#');"></a>
					<a href="javascript:void(0);" title="移交" name="#status#" dateName="#transferStatus#" class="option_handover #handleOrgId# invalid_#invalidMark#" onclick="transfer('#id#');"></a>
					<a href="javascript:void(0);" title="投诉有效性修改" name="#status#" class="option_hearing" onclick="invalidData('#id#','#invalidMark#')"></a>
					<a href="javascript:void(0);" title="删除" class="option_delete"  onclick="helper.deleteObjects('#id#','/complaints/delete');"></a>
				</div>
			</td> 
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
	var templateModel = {
		id:null,
		title:null,
		transferStatus:null,
		typeName:null,
		acceptStatus:null,
		handOrgName:null,
		handleStatus:null,
		registerDatetime:{
			type:"timestamp"
		},
		type:null,
		handleOrgId:null,
		handleUserId:null,
		handlerName:null,
		status:null,
		invalidMark:null,
		mark:null,
		handlerName:null,
		complaintsName:null,
		targetName:null
	};
	
	var validateModel = {
		//targetOrgId : { must : true, fieldName : "投诉机构"},
		//type : {must : true, fieldName : "投诉对象"},			
		complaintsName:{must : true, fieldName : "举报人"},
		complaintsTelephone :{must : true,type : "telephone",fieldName : "举报人电话"},
		targetName:{must : true, fieldName : "被举报人"},
		targetAddress :{must : true,fieldName : "被举报人地址"},
		title : { must : true, fieldName : "标题"},
		content:{must : true,fieldName : "举报内容"}
		//replyContent:{must : true,fieldName : "回复内容"},
	};
	
	var helper = new dataHelper(templateModel, validateModel);
	var page = 1;
	var handler = function(e, pageList) {
		page = pageList.page.currentPage;
	};
	
	var search = function() {
		helper.postSearch('/complaints/search',{
			formId:'search_form',
			containerId:'list_table',
			templateId:'template'
		});
		helper.addListener("afterFillData", handler, "list_table");
	};
	
	 var handler = function(e,pageList){
		$(".edit_0").show();
		$("a[dateName='1']").hide();
		$("a[name='2']").hide();
		$("a[name='3']").hide();
		$("a[name='4']").hide();
		var orgId = $("#orgId").val();
		$("a[name='4']").each(function (){
			var handleOrgId = $(this).attr("class");
			if(handleOrgId == orgId){//不相同 查看  ；相同 查看 处理 退回 移交
				$(this).show();
			}
		});
		$(".invalid_0").hide();
	}; 
	
	var add = function() {
		helper.postForm('/complaints/add', 2, {
			containerId : 'editContainer',
			containerTitle : '投诉举报信息登记',
			editConfirmUrl : '/complaints/saveAdd',
			editFormId : 'complaintsEditFormId',
			successMessage : '登记成功',
			validate : true,
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
				return prms;
			}
		});
	};
	
	var edit = function(id) {
		helper.basicPost('/complaints/edit', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '修改登记信息',
			editConfirmUrl : '/complaints/saveUpdateRegister',
			editFormId : 'registerEditFormId',
			successMessage : '修改成功',
			validate : true,
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
				return prms;
			}
		});
	};
	
	var handle = function(id,status) {
		var args = {
				containerId : 'editContainer',
				containerTitle : '投诉举报处理',
				height:550,
				width:800
		};
		if(status == "0" || status == "1" || status =="4"){
			args.editConfirmUrl = '/complaints/saveHandle';
			args.editFormId = 'handleEditFormId';
			args.validate = true;
			args.preProcess = function(prms){
				prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
				return prms;
			};
			args.successMessage = "保存成功";
		}else{
			args.buttons = {"关闭":function(){Dialog.close();}};
			args.defaultButtons = {okEnabled:false,cancelEnabled:false};
		}
		helper.basicPost('/complaints/handle', {'id' : id}, 2, args);
	}; 
	
	var goBack = function(id) {
		helper.basicPost('/complaints/goBack', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '投诉举报退回',
			editConfirmUrl : '/complaints/saveGoBack',
			editFormId : 'goBackEditFormId',
			successMessage : '退回成功',
			validate : true,
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
				return prms;
			},
			defaultButtons:{
				okEnabled:true,
				okText:"退回",
				cancelEnabled:true,
				cancelText:"取消"
			},
		});
	};
	
	var transfer = function(id){
		helper.basicPost('/complaints/transfer', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '投诉举报移交',
			editConfirmUrl : '/complaints/saveTransfer',
			editFormId : 'transferEditFormId',
			successMessage : '移交成功',
			validate : true,
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
				return prms;
			},
			defaultButtons:{
				okEnabled:true,
				okText:"移交",
				cancelEnabled:true,
				cancelText:"取消"
			},
		});
	};
	
	var invalidData = function(id,mark){
		if(mark == 1){//打开状态
			msg = "是否修改为无效投诉举报？";
			responseMsg = "修改成功，该投诉无效！";
		}else{
			msg = "是否修改为有效投诉举报？";
			responseMsg = "修改成功，该投诉有效！";
		}
		Dialog.confirm(msg, function() {
    		helper.basicPost('/complaints/invalidData', {id:id}, 3,null, function(response) {
    			helper.redirectPage(1);
				Dialog.alert(responseMsg);
			});
		}, null, 300, 120);
	};
	
	$(function() {
		search();
	});
</script>