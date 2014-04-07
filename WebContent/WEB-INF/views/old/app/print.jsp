<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container">
	<form id="search_form" name="userForm" action="" method="post">
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
					<th>许可类型</th>
					<td><hs:dic dicName="LICENSE_TYPE" id="licenseType" name="licenseType" limitedMap="${licenseTypeMap}" blank="false" style="width:172px;"/></td>
					<th>卫生许可编号</th>
					<td><input type="text" id="licenseNo" name="licenseNo" maxlength="30" /></td>
					<th>申请项目</th>
					<td><input type="text" id="applyItem" name="applyItem:String:LIKE" maxlength="200" /></td>
				</tr>
				<tr>
					<th>申请单位</th>
					<td><input type="text" id="name" name="name:String:LIKE" maxlength="200" /></td>
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
			打印文书类别：<hs:dic dicName="DOCUMENT_TYPE" id='documentType' name='documentType' style="width:160px;"/>
			<a class="button_start_case" href="javascript:void(0);" style="visibility:hidden;"></a>
		</caption>
		<colgroup>
			<col style="width: 50px;">
			<col style="width: 100px;">
			<col style="width: 90px;">
			<col >
			<col style="width: 110px;">
			<col style="width: 110px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 70px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>编号</th>
				<th>许可种类</th>				
				<th>申请单位</th>
				<th>申请许可项目</th>
				<th>卫生许可编号</th>
				<th>单位负责人</th>				
				<th>发放状态</th>
				<th>发放时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;">#rowCount#</td>
			<td>#licenseTypeName#</td>
			<td>#name#</td>
			<td>#applyItem#</td>
			<td>#licenseNo#</td>
			<td>#legalPersonName#</td>
			<td style="text-align: center;">#grantStatusName#</td>
			<td style="text-align: center;">#grantDatetime#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" class="option_view" title="查看" onclick="view('#licenseType#','#appId#');"></a>
					<a href="javascript:void(0);" class="option_print" title="打印" onclick="print('#licenseType#','#appId#');"></a>
					<%-- </sec:authorize>  --%>

				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<div id="printC"></div>
<div id="printD"></div>
<script type="text/javascript">
	var templateModel = {
		id : null,
		appId : null,
		licenseType : null,
		licenseTypeName : null,
		licenseNo : null,
		orgId : null,
		legalPersonName : null,
		applyItem : null,
		name : null,
		grantDatetime : {type : 'timestamp'},
		grantStatus : null,
		grantStatusName : null,
		applyDatetime : null
	};
	var helper = new dataHelper(templateModel);
	var licenseTypeTmp;
	var search = function() {
		licenseTypeTmp = $("#search_form").find("#licenseType").val();
		helper.postSearch('/app/search', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
	};
	var view = function(licenseType, id) {
		helper.basicPost('/app/view', {
			'licenseType' : licenseType,
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '许可详细',
			editFormId : 'editFormId'
		});
	};

	var print = function(licenseType, id) {
		if ($('#documentType').hasClass("validate_error")) {
			$('#documentType').removeClass("validate_error");
		}
		var documentType = $('#documentType').val();
		if(documentType == ''){
			Dialog.alert("请选择打印文书类别");
			$('#documentType').addClass("validate_error");
			return;
		}
		helper.basicPost('/app/print', {
			'licenseType' : licenseType,
			'id' : id,
			'type' : documentType
		}, 2, {
			containerId : 'printC',
			containerTitle : '受理文书',
			defaultButtons: {
				okEnabled : false
			},
			buttons : {
				'打 印' : function() {jqPrint("printC");}
			}
		});
	}
</script>