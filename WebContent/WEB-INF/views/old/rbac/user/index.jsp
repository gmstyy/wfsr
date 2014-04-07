<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container">
	<form id="search_form" name="userForm" action="" method="post">
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
					<th>科室</th>
					<td><hs:dic dicName="DEPT" id="departmentId" name="departmentId" value1="${loginUser.orgId}" defalt="${loginUser.departmentId}"/></td>
					<th>登录名</th>
					<td><input type="text" id="loginName" name="loginName:String:LIKE" maxlength="100" /></td>
					<th>监督员</th>
					<td><input type="text" id="nickName" name="nickName:String:LIKE" maxlength="50" /></td>
				</tr>
				<tr>
					<th>手机号</th>
					<td><input type="text" id="telephone" name="telephone:String:LIKE" maxlength="30" /></td>
					<th>电子邮箱</th>
					<td><input type="text" id="email" name="email:String:LIKE" maxlength="11" /></td>
					<th>状态</th>
					<td><hs:dic dicName="USER_STATUS"></hs:dic></td>
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
			<%-- <sec:authorize access="hasRole('OA_USER_ADD')"> --%>
			<a class="button_add" href="javascript:void(0);" onclick="addUser();">新增</a>
			<%-- </sec:authorize>
			<sec:authorize access="hasRole('OA_USER_UPDATE')"> --%>
			<a class="button_role_set" href="javascript:void(0);" onclick="batchSetRole();">角色设定</a>
			<%-- </sec:authorize>
			<sec:authorize access="hasRole('OA_USER_DELETE')"> --%>
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/user/delete');">删除</a>
			<%-- </sec:authorize> --%>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 50px;">
			<col >
			<col style="width: 120px;">
			<col style="width: 130px;">
			<col style="width: 60px;">
			<col style="width: 140px;">
			<col style="width: 130px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>编号</th>
				<th>用户名</th>
				<th>监督员</th>
				<th>科室</th>
				<th>状态</th>
				<th>上次登录时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display:none;">
			<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
			<td style="text-align: center;">#rowCount#</td>
			<td>#loginName#</td>
			<td style="text-align: center;">#nickName#</td>
			<td style="text-align: center;">#deptName#</td>
			<td style="text-align: center;">#statusName#</td>
			<td style="text-align: center;">#lastLoginDatetime#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<%-- <sec:authorize access="hasRole('OA_USER_UPDATE')"> --%>
					<a href="javascript:void(0);" title="修改" class="option_edit" onclick="editUser('#id#');"></a>
					<%-- </sec:authorize>
					<%-- <sec:authorize access="hasRole('OA_USER_CHANGE_PASSWORD')"> --%>
					<a href="javascript:void(0);" title="密码重置" class="option_reset_password" onclick="changeUserPassword('#id#');"></a>
					<%-- </sec:authorize>
					<sec:authorize access="hasRole('OA_USER_DELETE')"> --%>
					<a href="javascript:void(0);"title="删除"  class="option_delete" onclick="helper.deleteObjects('#id#','/user/delete');"></a>
					<%-- </sec:authorize> --%>

				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
	var templateModel = {
		id : null,
		loginName : null,
		nickName : null,
		departmentId : null,
		deptName : null,
		telephone : null,
		email : null,
		status : null,
		statusName : null,
		lastLoginDatetime : {type:'timestamp'}
	};
	
	var validateModel = {
		departmentId : { must : true, fieldName : "科室" },
		loginName : { must : true, fieldName : "登录名" },
		nickName : { must : true, fieldName : "监督员" }
	};
	
	var helper = new dataHelper(templateModel,validateModel);
	var search = function() {
		helper.postSearch('/user/search', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
	};
	var addUser = function() {
		helper.postForm('/user/add', 2, {
			containerId : 'editContainer',
			containerTitle : '新增用户',
			successMessage : '新增用户成功',
			editConfirmUrl : '/user/saveAdd',
			validate : true,
			editFormId : 'userFormId',
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
				return prms;
			}
		});
	};
	var editUser = function(id) {
		helper.basicPost('/user/update', {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '修改用户',
			successMessage : '修改用户成功',
			editConfirmUrl : '/user/saveUpdate',
			validate : true,
			editFormId : 'userFormId',
			preProcess : function(prms) {
				prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
				return prms;
			}
		});
	};
	var batchSetRole = function() {
		var ids = helper.getSelectedValues();
		if(isNull(ids)||ids==""){
			Dialog.alert("请选择用户");
			return;
		}
		helper.basicPost('/user/batchSetRole', {
			'ids' : ids
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '角色设定',
			successMessage : '角色设定成功',
			editConfirmUrl : '/user/batchSave',
			editFormId : 'userFormId'
		});
	};
	//make default search
	search();
</script>