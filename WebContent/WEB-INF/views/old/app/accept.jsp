<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container" style="padding: 0;height: 90px;">
	<form id="search_form" name="userForm" action="" method="post">
		<ul class="small_license_list">
			<c:forEach var="licenseType" items="${licenseType}" varStatus="status">
				<li class="license_item">
					<a class="license_type_${licenseType.key}" href="javascript:search('${licenseType.key}');" ></a>
					<div onclick="search('${licenseType.key}');">${licenseType.value.value}</div>
				</li>
			</c:forEach>
		</ul>
	</form>
</div>
<div id="list_container">
	<table class="repeattable">
		<caption>
			<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
			<a class="button_accept" href="javascript:void(0);" onclick="accept();">受理</a>
			<%-- </sec:authorize>
			<sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
			<a class="button_refuse" href="javascript:void(0);" onclick="refuse();">拒绝</a>
			<%-- </sec:authorize> --%>
			<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
			<%--<a class="button_add" href="javascript:void(0);" onclick="accept();">下达任务</a>--%>
			<%-- </sec:authorize> --%>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 80px;">
			<col style="width: 90px;">
			<col >
			<col style="width: 90px;">
			<col style="width: 70px;">
			<col style="width: 70px;">
			<col style="width: 90px;">
			<col style="width: 145px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>许可种类</th>
				<!-- <th>卫生许可编号</th> -->
				<th>申请单位</th>
				<th>申请许可项目</th>
				<th>单位负责人</th>	
				<th>申请日期</th>
				<th>申请类型</th>
				<th>流程</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#appId#" onclick="helper.selectItem(this);" /></td>
			<td>#licenseTypeName#</td>
			<td>#name#</td>
			<td>#applyItem#</td>			
			<td>#legalPersonName#</td>	
			<td style="text-align: center;">#applyDatetime#</td>
			<td>#applyTypeName#</td>
			<td style="text-align: center;">#wolkflowId#
				<%--<select class="wolkflowId">
					<c:forEach var="workflow" items="${workflowList}" varStatus="status">
						<option value="${workflow.id}" title="${workflow.description}">${workflow.name}</option>
					</c:forEach>
				</select>--%>
			</td>
			
			<td style="text-align: center;">
				<div class="option_container">
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" class="option_edit" title="修改" onclick="edit('#licenseType#','#appId#');"></a>
					<%-- </sec:authorize> --%>
					<%-- <sec:authorize access="hasRole('OA_ROLE_ADD')"> --%>
					<a href="javascript:void(0);" class="option_accept" title="受理" onclick="accept('#licenseType#','#appId#',this);"></a>
					<%-- </sec:authorize> --%>
					<%-- <sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
					<a href="javascript:void(0);" class="option_refuse" title="拒绝" onclick="refuse('#licenseType#','#appId#');"></a>
					<%-- 	</sec:authorize> --%>
					<a href="javascript:void(0);" class="option_accept_doc" title="受理文书" onclick="printC('#licenseType#','#appId#');"></a>
					<a href="javascript:void(0);" class="option_refuse_doc" title="拒绝文书" onclick="printD('#licenseType#','#appId#');"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<div id="refuseDiv" style="display: none;">
	<textarea id="refuseReason" cols="50" rows="5"></textarea>
</div>
<div id="printC"></div>
<div id="printD"></div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/oa/appValidate.js"></script>
<script type="text/javascript">
	var templateModel = {
		id : null,
		appId : null,
		licenseType : null,
		licenseTypeName : null,
		licenseNo : null,
		applyDatetime : {type:'timestamp'},
		orgId : null,
		legalPersonName : null,
		applyItem : null,
		name : null,
		applyStatus : null,
		grantorId : null,
		grantDatetime : null,
		grantStatus : null,
		applyType : null,
		applyTypeName : null,
		wolkflowId : { formatter :function(value, data, allData) {
			return dropdown.createHtml(allData.workflowList, "id", "name", null, { className : 'workflowId'});
		}}
	};
	var helper = new dataHelper(templateModel);
	var licenseTypeTmp;
	var search = function(licenseType) {
		licenseTypeTmp=licenseType;
		helper.searchUrl = '/app/search';
		var searchCondition = {
			'licenseType' : licenseType,
			'handleStatus' : 0,
			'currentPage' : 1
		};
		helper.containers.dataTable = 'list_table';
		helper.containers.rowTemplate = 'template';
		helper.postSearch('/app/acceptSearch', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template',
			additionalConditions : searchCondition
		});
	};
	
	var accept = function(licenseType, id,button) {
		var workflowId = [];
		if(isNull(id)){
			$(".checkItem").each(function(index, item) {
				if (item.checked) {
					workflowId.push($($(item.parentNode.parentNode).find('.workflowId')).val());
				}
			});
		}else{
			workflowId.push($($(button.parentNode.parentNode.parentNode).find('.workflowId')).val());
		}
		
		helper.operateObjects(id, "/app/accept?licenseType=" + licenseTypeTmp, "受理",{'workflowId':workflowId.join(',')});
	};
	var refuse = function(licenseType, id) {
/* 		if (defaultButtons != null) {
			userCallbacks.defaultButtons = defaultButtons;
		}
		if (buttons != null) {
			userCallbacks.buttons = buttons;
		} */
		var idList = "";
		if (!isNull(id) && id != "") {
			// operate one
			idList = id;
		} else {
			// operate list
			idList = helper.getSelectedValues();
		}
		if (idList == "") {
			Dialog.alert("请选择要拒绝的记录！");
			return;
		}
		$("#editContainer").html($("#refuseDiv").html());
		Dialog.open("editContainer", "填写拒绝原因", 500, 300, { okCallback : function(){
			var reason=$("#editContainer #refuseReason").val();
			helper.operateObjects(id, "/app/refuse", "拒绝",{
				licenseType : licenseTypeTmp,
				reason : reason
			},function(){
				Dialog.close();
				Dialog.alert("拒绝成功");
			});
		} });
	};
	var edit = function(licenseType, id) {
		helper.validateModel = getAppValidate(licenseType);
		helper.basicPost('/app/update', {
			'licenseType' : licenseType,'id':id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '许可详细',
			editConfirmUrl : '/app/saveUpdate',
			successMessage : '许可修改成功',
			editFormId : 'relativeInfoForm',
			validateMultiForms: true,
			validateFormIds: ["relativeInfoForm", "appForm"],
			preProcess : function(prms) {
				prms = helper.getFormData("appForm", prms);
				prms.businessTypeaName = $("#businessTypea :selected").html();
				if(!isNull(getAppParams)){
					return getAppParams(prms);
				}
				return prms;
			}
		});
	};
	
	var printC = function(licenseType, id) {
		helper.basicPost('/app/print', {
			'licenseType' : licenseType,'id':id,'type':'c'
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
	var printD = function(licenseType, id) {
		helper.basicPost('/app/print', {
			'licenseType' : licenseType,'id':id,'type':'d'
		}, 2, {
			containerId : 'printD',
			containerTitle : '拒绝文书',
			defaultButtons: {
				okEnabled : false
			},
			buttons : {
				'打 印' : function() {jqPrint("printD");}
			}
		});
	}
</script>