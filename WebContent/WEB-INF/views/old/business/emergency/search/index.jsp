<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
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
					<th>突发事件名称</th>
					<td><input type="text" id="name" name="name:String:LIKE" maxlength="100" /></td>
					<th>状态</th>
					<td><hs:dic dicName="EMERGENCY_STATUS" name="status:Integer:EQ"></hs:dic></td>
					<%-- <th>事件来源</th>
					<td><hs:dic dicName="EMERGENCY_SOURCE" name="emergencyResource:Integer:EQ"></hs:dic></td>
					<th>省厅事件编号</th>
					<td><input type="text" id="eventNo" name="eventNo:String:LIKE" maxlength="30" /></td> --%>
					<th>登记日期</th>
					<td><tag:dateInput onlypast="false" name="registerStartDate" />~<tag:dateInput onlypast="false" name="registerEndDate" /></td>
				</tr>
				<tr>
					<%-- <c:choose>
						<c:when test="${from == 'home'}">
						</c:when>
						<c:otherwise>
							<th>受理人</th>
							<td><input type="text" id="handlerName" name="handlerName:String:LIKE" maxlength="50" /></td>
				       </c:otherwise>
					</c:choose> --%>
					
					
					<%-- <th>结果录入人</th>
					<td><input type="text" id="finisherName" name=":String:LIKE" maxlength="50" /></td>
					<th>结果录入时间</th>
					<c:choose>
						<c:when test="${from == 'home'}">
							<td colspan="3"><tag:dateInput onlypast="false" name="finishStartDate" />~<tag:dateInput onlypast="false" name="finishEndDate" /></td>
						</c:when>
						<c:otherwise>
							<td><tag:dateInput onlypast="false" name="finishStartDate" />~<tag:dateInput onlypast="false" name="finishEndDate" /></td>
				       </c:otherwise>
					</c:choose> --%>
				</tr>
				<%-- <tr>
					<th>上报状态</th>
					<td><hs:dic dicName="REPORT_STATUS" name="isReported:Integer:EQ"></hs:dic></td>
					<th>上报人</th>
					<td><input type="text" id="reporterName" name="reporterName:String:LIKE" maxlength="50" /></td>
					<th>上报时间</th>
					<td colspan="3"><tag:dateInput onlypast="false" name="reportStartDate" />~<tag:dateInput onlypast="false" name="reportEndDate" /></td>
				</tr> --%>
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
			<!-- 			<a class="button_add" href="javascript:void(0);" onclick="add();">新建</a> -->
			<%-- </sec:authorize>
			<sec:authorize access="hasRole('OA_ROLE_DELETE')"> --%>
			<!-- 			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/emergency/delete');">删除</a> -->
			<%-- </sec:authorize> --%>
			<a class="button_add" href="javascript:void(0);" onclick="add();">登记</a>
			<!-- <a class="button_add" href="javascript:void(0);" onclick="accept();">受理</a>  -->
			<!-- <a class="button_reprot" href="javascript:void(0);" id="btn_emergency_report" onclick="report();">上报</a> -->
		</caption>
		<colgroup>
			<!-- <col style="width: 50px;"> -->
			<col>
			<col style="width: 180px;">
			<col style="width: 120px;">
			<col style="width: 150px;">
			<col style="width: 80px;">
			<col style="width: 120px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<!-- <th>编号</th> -->
				<th>突发事件名称</th>
				<th>发生场所</th>
				<th>登记人</th>
				<th>登记时间</th>				
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<!-- <td style="text-align: center;">#rowCount#</td> -->
			<td>#name#</td>
			<td>#place#</td>
			<!--<td>#eventNo#</td> -->
			<td>#handlerName#</td>
			<td>#registerDatetime#</td>			
			<td>#acceptStatus#</td>
			<!--<td>#reportStatus#</td> -->
			<td style="text-align: center;">
				<div class="option_container">
					<a class="show_#status# option_view" href="javascript:void(0);" title="查看" onclick="viewEmergency('#id#');"></a>
					<!-- <a style="display: none;" class="edit_#status# option_edit" href="javascript:void(0);" title="修改" onclick="edit('#id#');"></a> -->
					<a name="handle" class="handle_#handleStatus# option_process" href="javascript:void(0);" title="处理" onclick="handle('#id#');"></a>
					<!--<a name="report" class="report_#isReported#" href="javascript:void(0);" title="上报" onclick="report('#id#','#isReported#');">上报</a>-->
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
	var templateModel = {
		id : null,
		name : null,
		content : null,
		place : null,
		//eventNo : null,
		registerDatetime : {
			type : "timestamp"
		},
		acceptStatus:null,
		//handleOrgId : null,
		//handlerLoginName : null,
		status : null,
		//result : null,
		finishDatetime : {
			type : "timestamp"
		},
		//finisherLoginName : null,
		//isReported : null,
		//reportStatus : null,
		//reporterLoginName : null,
		//reportDatetime : {
			//type : "timestamp"
		//},
		//reporterName : null,
		handlerName : null,
		//finisherName : null,
		handleStatus:null

	};

	var validateModel = {
		name : {must : true,fieldName : "突发事件名称"},
		place : {must : true,fieldName : "发生场所"},
		address : {must : true,fieldName : "发生地点"}
		//result : {must : true,fieldName : "事件结果"}
	};

	var helper = new dataHelper(templateModel, validateModel);
	var page = 1;
	var handler = function(e, pageList) {
		page = pageList.page.currentPage;
		$(".edit_0").show();
		$(".handle_1").hide();
		var handle = $("a[name='handle']").attr("class");
		if(handle != "handle_1"){
			$(".report_0").hide();
		}
		$(".report_1").hide();
	};
	helper.addListener("afterFillData", handler, "list_table","emergency");

	var search = function() {
		var url = '/emergency/search';
		if("${from}" == "home"){
			url = '/emergency/homedirect';
		}
		helper.postSearch(url, {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
	};
	
	var edit = function(id) {
		helper.basicPost('/emergency/edit', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '修改登记信息',
			editConfirmUrl : '/emergency/saveUpdateRegister',
			editFormId : 'registerEditFormId',
			successMessage : '修改成功',
			validate : true,
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
				return prms;
			}
		});
	};
	
	var add = function() {
		helper.postForm('/emergency/add', 2, {
			containerId : 'editContainer',
			containerTitle : '应急处置',
			editConfirmUrl : '/emergency/saveAdd',
			editFormId : 'editFormId',
			successMessage : '登记成功',
			validate : true,
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
				return prms;
			}
		});
	};
	
	var handle = function(id) {
		helper.basicPost('/emergency/handle', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '应急处置',
			editConfirmUrl : '/emergency/saveHandle',
			editFormId : 'editFormId',
			successMessage : '保存成功',
			validate : true,
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
				return prms;
			},
			height:530,
			width:800
		});
	};
	
	var report = function(id, report) {
		helper.operateObjects(id,"/emergency/report","上报");
	};

	//make default search
	$(function() {
		search();
	});
</script>