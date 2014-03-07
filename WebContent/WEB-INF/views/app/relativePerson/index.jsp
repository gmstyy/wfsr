<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container">
	<form id="search_form" name="userForm" action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 100px;">
				<col style="width: 160px;">
				<col style="width: 100px;">
				<col style="width: 160px;">
				<col style="width: 100px;">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>业务类型</th>
					<td colspan="3">
						<hs:dic dicName="RELATIVE_PERSON_BUSINESS_TYPE" id="bizType1" name="businessTypea" limitedMap="${bizTypeMap}" value1="0" style="width:172px;" onChange="bizType()"/>
						<select id="bizType2" name="businessTypeb" style="display: none;">
							<option value=""></option>
						</select>
					</td>
				</tr>
				<tr>
					<th>业务关键字</th>
					<td><input type="text" name="businessTypeName"/></td>
					<th>名称</th>
					<td><input type="text" name="name:String:LIKE" /></td>
					<th>许可证号</th>
					<td><input type="text" name="licenseNo:String:LIKE" /></td>
				</tr>
				<tr>
					<th>地址</th>
					<td><input type="text" name="address:String:LIKE" /></td>
					<th>单位负责人</th>
					<td><input type="text" name="legalPersonName:String:LIKE"/></td>
					<th>是否有证</th>
					<td><hs:dic dicName="BOOLEAN_TYPE" name="licType" /></td>
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
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/relativePerson/delete');">删除</a>
			<%-- </sec:authorize> 
			<a class="button_import" href="javascript:void(0);" onclick="importRelativePerson();">导入</a>--%>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 150px;">
			<col style="width: 180px;">
			<col style="width: 200px;"/>
			<col >
			<col style="width: 90px;">
			<col style="width: 70px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>业务类别</th>
				<th>许可证号</th>
				<th>名称</th>
				<th>地址</th>
				<th>负责人</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
			<td>#businessTypeaDisplay#</td>
			<td>#licenseNo#</td>
			<td>#name#</td>
			<td>#address#</td>
			<td>#legalPersonName#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" class="option_edit" onclick="edit('#id#');"></a>
					<%-- </sec:authorize>
					<sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
					<a href="javascript:void(0);" class="option_delete" onclick="helper.deleteObjects('#id#','/relativePerson/delete');"></a>
					<%-- 	</sec:authorize> --%>

				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>

<div id="importRelativePerson" style="display: none;">
	<table>
		<tr>
			<td>
				<input type="file" id="importRelativePersonExcel" name="importRelativePersonExcel"/>
				<input type="button" value="导入数据" onclick="doImport()"/>
			</td>
			<td><a href="${pageContext.request.contextPath}/exceltemplates/relativePerson/template.xls" target="_blank">下载模板</a></td>
		</tr>
	</table>
</div>

<script type="text/javascript">
	var templateModel = {
			id:null,
			orgId:null,
			name:null,
			address:null,
			telephone:null,
			type:null,
			legalPersonIdCard:null,
			legalPersonName:null,
			businessTypeaDisplay:{formatter: function(value, data) {
				var typeb = data.businessTypebDisplay;
				if (!isNull(typeb)) {
					value += "-" + typeb;
				}
				return value;
			}},
			licenseNo:null
	};
	var validateModel = {
		businessType : {must : true, fieldName : "业务类型"},
		name : {must : true, fieldName : "名称（单位/个人）"},
		type : {must : true, fieldName : "类别"},
		ecmcode : {must : true, fieldName : "经济类型"},
		//telephone : {must : true, fieldName : "联系电话"},
		address : {must : true, fieldName : "地址"},
		regaddr : {must : true, fieldName : "注册地址"},
		//postcode : {must : true, fieldName : "邮编"},
		legalPersonName : {must : true, fieldName : "法人姓名"},
		legalIdType : {must : true, fieldName : "法人证件类型"},
		legalIdNo : {fieldName : "法人证件号码", customValidate : function(value, container) {
			var message = "";
			if (value == null || value == "") {
				return message;
			}
			var idType = $(container).find("#legalIdType").val();
			if (idType == "01") {
				var result = analyzeCardNo(value);
				if (!result.valid) {
					message = "[法人证件号码]" + result.message;
				}
			}
			return message;
		}}
	};
	var helper = new dataHelper(templateModel, validateModel);
	var search = function() {
		helper.postSearch('/relativePerson/search', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
	};
	var add = function() {
		helper.postForm('/relativePerson/add', 2, {
			containerId : 'editContainer',
			containerTitle : '新增',
			successMessage : '新建管理相对人成功',
			editConfirmUrl : '/relativePerson/saveAdd',
			editFormId : 'editFormId',
			validate : true
		});
	};
	var edit = function(id) {
		helper.basicPost('/relativePerson/update', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '修改',
			successMessage : '修改管理相对人成功',
			editConfirmUrl : '/relativePerson/saveUpdate',
			editFormId : 'editFormId',
			validate : true
		});
	};

	var importRelativePerson = function() {
		$("#editContainer").html($("#importRelativePerson").html());
		Dialog.open("editContainer", "导入相对人", 500, 150);
	};

	var doImport = function() {
		$.ajaxFileUpload({
			url : getContextUrl('/relativePerson/import?fileElementId=importRelativePersonExcel'),
			secureuri : false,
			fileElementId : 'editContainer #importRelativePersonExcel',
			dataType : 'json',
			success : function(response, status) {
				Dialog.alert(response.message);
			},
			error : function(data, status, e) {
				Dialog.alert(data.responseText);
			}
		});
	};

	var bizType = function() {
		var type = $("#bizType1").val();
		helper.basicPost("/relativePerson/getBizType", {type : type}, 0, null, function(data) {
			var types = data.bizTypes;
			$("#bizType2").show();
			var html = "<option value=''></option>";
			var i = 0;
			for (var code in types) {
				html += "<option value='" + code + "'>" + types[code].value + "</option>";
				i++;
			}
			if (i > 0) {
				$("#bizType2").html(html);
			} else {
				$("#bizType2").hide();
			}
		});
	};

	//make default search
	$(function() {
		search();
	});
</script>