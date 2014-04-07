<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>

<form id="caseInvestigateDetailFormId" name="caseInvestigateDetailForm" action="" method="post">
	<input type="hidden" value="${entity.id}" name="caseId" />
	<input type="hidden" value="${entity.casePlace}" name="casePlace" />
	<table class="edittable">
		<colgroup>
			<col style="width: 150px;" />
			<col style="width: 200px;" />
			<col style="width: 150px;" />
			<col />
		</colgroup>
		<tbody>			
			<tr>
				<th>当事人：</th>
				<td>${entity.casePlace}</td>
				<th>负责人：</th>
				<td>${entity.casePerson}</td>	
			</tr>
			<tr>
				<th>性别：</th>			
				<td><hs:v dicName='GENDER' code="${entity.casePersonSex}"/></td>
				<th>电话：</th>
				<td>${entity.casePersonTel}</td>		
			</tr>	
			<tr>
				<th>案由</th>
				<td colspan="3"><input type="text" value="${casei.caseCause}" name="caseCause" maxlength="200" style="width:78.5%"/></td>
			</tr>			
			<tr>
				<th>违法事实</th>
				<td colspan="3">
					<input type="text" id="caseIllegalNameId" name="caseIllegalName" style="width:78.5%"/>
					<input type="text" id="caseIllegalValueId" name="caseIllegal" value="${casei.caseIllegal}" style="display:none;"/>
				</td>
			</tr>		
			<tr>
				<th>案情</th>				
				<td colspan="3"><textarea rows="5" name="caseDesc" maxlength="500" style="width:78.5%">${casei.caseDesc}</textarea></td>				
			</tr>
			<tr>
				<th>相关证据</th>				
				<td colspan="3"><textarea rows="3" name="evidence" maxlength="500" style="width:78.5%">${casei.evidence}</textarea></td>				
			</tr>
			<tr>
				<th>争议要点</th>				
				<td colspan="3"><textarea rows="5" name="argueKey" maxlength="500" style="width:78.5%">${casei.argueKey}</textarea></td>				
			</tr>
			<tr>
				<th>处理建议</th>				
				<td colspan="3"><textarea rows="3" name="dealAdvice" maxlength="500" style="width:78.5%">${casei.dealAdvice}</textarea></td>				
			</tr>
			<tr>
				<th>经办人</th>
				<td colspan="3">
					<input type="text" id="usersName" name="usersName" style="width:78.5%;"/>
					<input type="hidden" id="users" name="users" value="${users}" />
				</td>
			</tr>									
			<tr>
				<th>审核流程</th>
				<td colspan="3">
					<select name="workflowId" id="workflowId" style="width:150px;">
						<c:forEach items="${workflowList}" var="wf">
						<option value="${wf.id}">${wf.name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>																	
		</tbody>			
	</table>
</form>
<script type="text/javascript">
	var dicEmployee = new dictionary("employeeTree", "usersName", {codeCtrlId:'users', dicTitle : "经办人选择", orgId : "${orgId}", dynamic : false });
	var userList = [];
	<c:forEach var="user" items="${userList}">
	userList.push({ code : '${user.userLoginName}', name : '${user.userName}' });
	</c:forEach>
	dicEmployee.setSelectedItems(userList);
	
	var dic = new dictionary("dictionary", "caseIllegalNameId", {codeCtrlId:'caseIllegalValueId', dicName : 'ILLEGAL_FACTORS', value1 : '${entity.caseType}', dicTitle : '违法事实' });
	var caseIllegalList = [];
	<c:forEach var="v" items="${caseIllegalList}">
	caseIllegalList.push({ code : '${v.code}', name : '${v.value}'});
	</c:forEach>
	dic.setSelectedItems(caseIllegalList);
</script>