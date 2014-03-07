<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="userFormId" name="userForm" action="" method="post">
	<input type="hidden" name='id' value="${user.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;" />
			<col />
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>登录名</th>
				<td><span>${user.loginName}</span></td>
				<th>昵称<span class="must_field">*</span></th>
				<td><input type="text" value="${user.nickName}" id="nickName" name="nickName" maxlength="50" /></td>
			</tr>
			<tr>
				<th>默认机构</th>
				<td>
					<select id="orgId" name="orgId" onchange="updateDeptList(this, 'departmentId');">
						<c:forEach var="org" items="${orgList}">
							<option value="${org.id}" <c:if test="${org.id==user.orgId}">selected="selected"</c:if>><c:if test="${org.orgAdminLevel==3}">&nbsp;&nbsp;</c:if><c:if test="${org.orgAdminLevel==4}">&nbsp;&nbsp;&nbsp;&nbsp;</c:if>${org.name}</option>
						</c:forEach>
					</select>
				</td>
				<th>默认科室</th>
				<td>
					<select id="departmentId" name="departmentId">
						<c:forEach var="dept" items="${deptList}">
							<option value="${dept.id}" <c:if test="${dept.id==user.departmentId}">selected="selected"</c:if>>${dept.name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>手机号</th>
				<td><input type="text" value="${user.telephone}" id="telephone" name="telephone" maxlength="11" /></td>
				<th>邮箱</th>
				<td><input type="text" value="${user.email}" id="email" name="email" maxlength="100" /></td>
			</tr>
			<tr>
				<th>登录次数</th>
				<td><span>${user.logingTimes}</span></td>
				<th>登录时间</th>
				<td><span>${user.lastLoginDatetime}</span></td>
			</tr>
			<tr>
				<th>站内消息</th>
				<td align="left">
					<input type="checkbox" <c:if test="${userConfig.useMessage==1}">checked='checked'</c:if> name="useMessage" class="userConfig"/>
				</td>
				<th>短信通知</th>
				<td align="left">
					<input type="checkbox" <c:if test="${userConfig.useSms==1}">checked='checked'</c:if> name="useSms" class="userConfig"/>
				</td>																
			</tr>
			<tr>
				<th>邮件通知</th>
				<td align="left">
					<input type="checkbox" <c:if test="${userConfig.useEmail==1}">checked='checked'</c:if> name="useEmail" class="userConfig"/>
				</td>	
				<td colspan="2"></td>												
			</tr>						
			<tr>
				<th colspan="4">&nbsp;</th>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td colspan="4" style="text-align:left;"><a href="javascript:void(0);" onclick="changeUserPassword();">密码修改</a></td>
			</tr>
		</tbody>
	</table>
</form>

