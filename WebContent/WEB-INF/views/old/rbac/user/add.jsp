<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="userFormId" name="userForm" action="" method="post">
    <input type="hidden" id="CSRFTokenName" value="${CSRFTokenName}"/>
	<input type="hidden" id="CSRFToken" value="${CSRFToken}"/>
	<input type="hidden" name='id' value="${user.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;" />
			<col />
			<col style="width: 80px;" />
			<col />
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>默认登录科室<span class="must_field">*</span></th>
				<td><hs:dic dicName="DEPT" defalt="${loginUser.departmentId}" id="departmentId" name="departmentId" value1="${loginUser.orgId}" onChange="loadEmployee(this)" /></td>
				<th>人员</th>
				<td><select id='employeeList' name="employeeId" onChange="changeEmp(this)"></select></td>
				<th>登录名<span class="must_field">*</span></th>
				<td><input type="text" value="${user.loginName}" id="loginName" name="loginName" maxlength="100" /></td>
			</tr>
			<tr>
				<th>监督员<span class="must_field">*</span></th>
				<td><input type="text" value="${user.nickName}" id="nickName" name="nickName" maxlength="50" /></td>
				<th>手机号</th>
				<td><input type="text" value="${user.telephone}" id="telephone" name="telephone" maxlength="11" /></td>
				<th>邮箱</th>
				<td><input type="text" value="${user.email}" id="email" name="email" maxlength="100" /></td>
			</tr>
		</tbody>
	</table>
	<%@include file="roleSet.jsp"%>
</form>
<script type="text/javascript">
	var loadEmployee = function(obj) {
		if(isNull($(obj).val())){
			return;
		}
		refreshEmployeeList($(obj).val());
		$("#userFormId").find("#nickName").val("");
		$("#userFormId").find("#loginName").val("");
	};
	var refreshEmployeeList = function(deptId) {
		helper.basicPost("/employee/getEmployeeListByDept", { deptId : deptId }, 0, null, function(data) {
			var list = data.employeeList;
			var empSelect=$("#employeeList");
			empSelect.empty();
			empSelect.append($("<option></option>"));
			for ( var i = 0; i < list.length; i++) {
				var hidden = "<input type='hidden' id='property' value='"+list[i]+"' >";
				empSelect.append($("<option value='"+list[i].id+"'>" + list[i].name + "(" + list[i].workNo + ")" + "</option>"));
			}
		});
	};
	var changeEmp = function(obj) {
		var editForm = $("#userFormId");
		var empId=$(obj).val();
		//editForm.find("#empId").val(empId);
		if(isNull(empId)){
			return;
		}
		helper.basicPost("/employee/getEmployee", { id : empId }, 0, null, function(result) {
			var data = result.employee;
			editForm.find("#loginName").val(data.workNo);
			editForm.find("#nickName").val(data.name);
			editForm.find("#telephone").val(data.mobile);
			editForm.find("#email").val(data.email);
		});
	};
	refreshEmployeeList('${loginUser.departmentId}');
</script>

