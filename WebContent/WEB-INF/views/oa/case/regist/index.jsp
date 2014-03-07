<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ page language="java" import="com.founder.oa.common.constant.OACV" %>

<div id="search_container">
	<form id="search_form" name="search_form" action="" method="POST">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 100px;">
				<col>
				<col style="width: 100px;">
				<col>				
			</colgroup>		
			<thead>
				<tr>			
					<th>案件来源</th>
					<td><hs:dic dicName="CASE_SOURCE" name="caseSource"  style="width:180px;"></hs:dic></td>											
					<th>发案日期</th>
					<td><tag:dateInput onlypast="false" name="startDate" />~<tag:dateInput onlypast="false" name="endDate" /></td>										
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
			<a class="button_add" href="javascript:void(0);" onclick="edit(0);">新建</a>
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/case/regist/delete');">删除</a>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 50px;">
			<col style="width: 200px;">
			<col style="width: 280px;">
			<col style="width: 150px;">
			<col style="width: 120px;">
			<col>
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>编号</th>
				<th>案件来源</th>
				<th>案发单位（人）</th>
				<th>发案日期</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display:none;">
	 		<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
	 		<td style="text-align: center;">#rowCount#</td>
	 		<td>#caseSource#</td>
			<td>#casePlace#</td>
			<td>#caseDate#</td>
			<td>#statusDesc#</td>
	 		<td>
	 			<div class="option_container">
	 				<a href="javascript:void(0);" title="查看" class="option_view" name="view_button" onclick="viewRegistCase('#id#');"></a>	 
	 				<a href="javascript:void(0);" title="申请立案" class="option_start_case" name="start_button_#status#" onclick="registCase('#id#');"></a>
	 				<a href="javascript:void(0);" title="调查终结报告" class="option_edit" name="investigate_button_#status#" onclick="investigate('#id#');"></a>	
	 				<a href="javascript:void(0);" title="合议" class="option_collegial" name="collegial_button_#status#" onclick="collegial('#id#');"></a>
	 				<a href="javascript:void(0);" title="听证" class="option_hearing" name="hear_button_#status#" onclick="hear('#id#');"></a>
	 				<a href="javascript:void(0);" title="行政处罚审批" class="option_grant" name="punish_button_#status#" onclick="punish('#id#');"></a>	
	 				<a href="javascript:void(0);" title="结案" class="option_record" name="finish_button_#punishAppStatus#" onclick="finish('#id#');"></a>			
					<a href="javascript:void(0);" title="删除" class="option_delete" name="delete_button" onclick="helper.deleteObjects('#id#','/case/regist/delete');"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>

<script type="text/javascript">
var templateModel = {
	id : null,
	caseSource : null,
	casePlace : null,
	caseDate : {type:'date'},
	statusDesc : null,
	status : null,
	punishAppStatus : null
};

var validateModel = {
	caseSource : { must : true, fieldName : "案件来源" },
	caseType : { must : true, fieldName : "案件类别" },
	casePlace : { must : true, fieldName : "案发单位（人）" },
	casePersonTel : { type : "telephone", fieldName : "负责人电话" },
	usersName : { must : true, fieldName : "经办人" }
};


var helper = new dataHelper(templateModel,validateModel);

var search = function() {
	var url = '/case/regist/search';
	helper.postSearch(url,{formId:'search_form',containerId:'data_table',templateId:'template'});
	helper.removeAllListener("data_table", "caseRegist");
	helper.addListener("afterFillData", handler, "data_table", "caseRegist");
};

var handler = function(e,pageList){	
	$("a[name='start_button_<%=OACV.CASE_STATUS.APPLY%>']").remove();
	$("a[name='start_button_<%=OACV.CASE_STATUS.CREATE%>']").remove();
	$("a[name='start_button_<%=OACV.CASE_STATUS.NOCREATE%>']").remove();
	$("a[name='start_button_<%=OACV.CASE_STATUS.FINISH%>']").remove();
	$("a[name='start_button_<%=OACV.CASE_STATUS.REPORT%>']").remove();
	
	$("a[name='investigate_button_<%=OACV.CASE_STATUS.NOCREATE%>']").remove();
	$("a[name='investigate_button_<%=OACV.CASE_STATUS.APPLY%>']").remove();
	$("a[name='investigate_button_<%=OACV.CASE_STATUS.NONE%>']").remove();
	
	$("a[name='collegial_button_<%=OACV.CASE_STATUS.NOCREATE%>']").remove();
	$("a[name='collegial_button_<%=OACV.CASE_STATUS.APPLY%>']").remove();
	$("a[name='collegial_button_<%=OACV.CASE_STATUS.NONE%>']").remove();
	
	$("a[name='punish_button_<%=OACV.CASE_STATUS.NOCREATE%>']").remove();
	$("a[name='punish_button_<%=OACV.CASE_STATUS.APPLY%>']").remove();
	$("a[name='punish_button_<%=OACV.CASE_STATUS.NONE%>']").remove();
	
	$("a[name='hear_button_<%=OACV.CASE_STATUS.NOCREATE%>']").remove();
	$("a[name='hear_button_<%=OACV.CASE_STATUS.APPLY%>']").remove();
	$("a[name='hear_button_<%=OACV.CASE_STATUS.NONE%>']").remove();
	
	$("a[name='finish_button_<%=OACV.CASE_PUNISH_APP_STATUS.NONE%>']").remove();
	$("a[name='finish_button_<%=OACV.CASE_PUNISH_APP_STATUS.APPLAY%>']").remove();
	$("a[name='finish_button_<%=OACV.CASE_PUNISH_APP_STATUS.DISAGREE%>']").remove();
	$("a[name='finish_button_']").remove();
};

var edit = function(id) {
	helper.basicPost('/case/regist/edit', {id:id}, 2, {		
		containerId : 'editContainer',		
		containerTitle : '申请立案',
		successMessage : '申请立案成功',
		editConfirmUrl : '/case/regist/save',
		editFormId : 'caseRegistDetailFormId',
		validate : true,
		defaultButtons: {
			okText : '申请立案',
		}
	});
};

var registCase = function(id) {
	helper.basicPost('/case/regist/edit', {id:id}, 2, {		
		containerId : 'editContainer',		
		containerTitle : '申请立案',
		successMessage : '申请立案成功',
		editConfirmUrl : '/case/regist/save',
		editFormId : 'caseRegistDetailFormId',
		validate : true,
		defaultButtons: {
			okText : '申请立案',
		}
	});
};

var investigate = function(id) {
	helper.basicPost('/case/investigate/check', {id:id}, null, null, function(response) {
		if(response.id == '0') {
			helper.basicPost('/case/investigate/edit', {id:id}, 2, {		
				containerId : 'editContainer',		
				containerTitle : '调查终结',
				successMessage : '申请调查终结成功',
				editConfirmUrl : '/case/investigate/save',
				editFormId : 'caseInvestigateDetailFormId',
				validate : true,
				defaultButtons: {
					okText : '申请调查终结',
				}
			});				
		} else {
			viewInvestigateCase(response.id);
		}
	});
};

var collegial = function(id) {
	helper.basicPost('/case/collegial/query', {id:id}, 2, {
		containerId : 'workflowListContainer',
		containerTitle : '合议',
		defaultButtons: {
			okEnabled : false
		}
	});
};

var finish = function(id) {
	helper.basicPost('/case/finish/check', {id:id}, null, null, function(response) {
		if(response.id == '0') {
			helper.basicPost('/case/finish/edit', {id:id}, 2, {		
				containerId : 'editContainer',		
				containerTitle : '申请结案',
				successMessage : '申请结案成功',
				editConfirmUrl : '/case/finish/save',
				editFormId : 'caseFinishDetailFormId',
				defaultButtons: {
					okText : '申请结案',
				}
			});				
		} else {
			viewFinishCase(response.id);
		}
	});
};

var punish = function(id) {
	helper.basicPost('/case/punish/check', {id:id}, null, null, function(response) {
		if(response.id == '0') {
			helper.basicPost('/case/punish/edit', {id:id}, 2, {		
				containerId : 'editContainer',		
				containerTitle : '申请行政处罚',
				successMessage : '申请行政处罚成功',
				editConfirmUrl : '/case/punish/save',
				editFormId : 'casePunishDetailFormId',
				defaultButtons: {
					okText : '申请行政处罚',
				}
			});				
		} else {
			viewPunishCase(response.id);
		}
	});
};

var hear = function(id) {
	helper.basicPost('/case/hear/check', {id:id}, null, null, function(response) {
		if(response.id == '0') {
			helper.basicPost('/case/hear/edit', {id:id}, 2, {		
				containerId : 'editContainer',		
				containerTitle : '听证记录',
				successMessage : '听证记录成功',
				editConfirmUrl : '/case/hear/save',
				editFormId : 'caseHearDetailFormId'
			});				
		} else {
			viewHearCase(response.id);
		}
	});
};

//make default search
$(function() {
	search();
});
</script>
