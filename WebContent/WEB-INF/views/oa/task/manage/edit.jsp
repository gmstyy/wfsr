<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>

<form id="taskDetailFormId" name="taskDetailForm" action="" method="post">
    <input type="hidden" id="CSRFTokenName" value="${CSRFTokenName}"/>
	<input type="hidden" id="CSRFToken" value="${CSRFToken}"/>
	<input type="text" value="${entity.id}" name="id" style="display:none;"/>
	<input type="text" value="${entity.relationId}" name="relationId" style="display:none;"/>
	<input type="text" value="${entity.categoryCode}" name="categoryCode" style="display:none;"/>
	<input type="text" value="${entity.relativePersonSn}" name="relativePersonSn" id='relativePersonSn' style="display:none;"/>
	<input type="text" value="${entity.superviseId}" name="superviseId" id='superviseId' style="display:none;"/>
	<input type="text" value="${entity.status}" name="status" id='status' style="display:none;"/>
	<input type="text" value="${entity.taskResult}" name="taskResult" id='taskResult' style="display:none;"/>
	<table class="edittable">
		<colgroup>
			<col style="width: 150px;" />
			<col style="width: 200px;" />
			<col style="width: 150px;" />
			<col />
		</colgroup>
		<tbody>	
			<tr>
				<th>任务来源<span class="must_field">*</span></th>
				<td align="left">
					<hs:dic dicName="TASK_SOURCE" name="sourceType" defalt="${entity.sourceType}"></hs:dic>
				</td>
				<th>任务类别<span class="must_field">*</span></th>
				<td align="left">
					<hs:dic dicName="TASK_TYPE" name="taskType" defalt="${entity.taskType}"></hs:dic>
				</td>			
			</tr>
			<c:if test="${not empty rp.licenseType}">
			<tr>
				<th>业务类别</th>		
				<td align="left" colspan="3">					
					<input type='text' value='<hs:v dicName="LICENSE_TYPE" code="${rp.licenseType}" />' readonly="readonly"/>
				</td>
			</tr>			
			</c:if>
			<tr>
				<th>场所<span class="must_field">*</span></th>		
				<td align="left" colspan="3">
					<input type='text' value='${entity.place}' id='place' name='place' maxlength='100' />
				</td>
			</tr>
			<tr>
				<th>地址<span class="must_field">*</span></th>			
				<td align="left" colspan="3"><input type="text" value="${entity.address}"  id="address" name="address" maxlength="300" style="width:78.5%;"/></td>
			</tr>			
			<%-- <tr>
				<th>负责人</th>		
				<td align="left"><input type="text" value="${entity.chargePerson}" id="chargePerson" name="chargePerson" maxlength="50"/></td>
				<th>联系电话</th>			
				<td align="left"><input type="text" value="${entity.chargePersonTel}" id="chargePersonTel" name="chargePersonTel" maxlength="30"/></td>
			</tr> --%>	
			<tr>
				<th>任务描述</th>		
				<td colspan="3">
					<textarea rows="5" name="description" maxlength="200" style="width:78.5%;">${entity.description}</textarea>
				</td>
			</tr>
			<tr>
				<th>负责人<span class="must_field">*</span></th>
				<td colspan="3">
					<input type="text" id="usersName" name="usersName" style="width:78.5%;"/>
					<input type="hidden" id="users" name="users" value="${users}" />
				</td>
			</tr>			
		</tbody>			
	</table>
</form>
<script type="text/javascript">
var dicEmployee = new dictionary("employeeTree", "usersName", {codeCtrlId:'users', dicTitle : "负责人选择", orgId : "${orgId}", dynamic : false });
var userList = [];
<c:forEach var="user" items="${userList}">
userList.push({ code : '${user.receiveUserLoginName}', name : '${user.receiveUserName}' });
</c:forEach>
dicEmployee.setSelectedItems(userList);
</script>

