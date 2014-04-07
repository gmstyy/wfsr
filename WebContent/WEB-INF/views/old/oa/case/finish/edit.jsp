<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<form id="caseFinishDetailFormId" name="caseFinishDetailForm" action="" method="post">
	<input type="hidden" value="${entity.id}" name="caseId" />
	<input type="hidden" value="${entity.casePlace}" name="casePlace" />
	<table class="edittable">
		<colgroup>
			<col style="width: 150px;" />
			<col />
		</colgroup>
		<tbody>			
			<tr>
				<th>当事人：</th>
				<td>${entity.casePlace}</td>	
			</tr>
			<tr>
				<th>案件来源：</th>
				<td>
					<hs:v dicName="CASE_SOURCE" code="${entity.caseSource}"></hs:v>
				</td>
			</tr>	
			<tr>
				<th>立案日期：</th>
				<td>
					<fmt:formatDate value='${entity.acceptTime}' pattern='yyyy-MM-dd' />
				</td>
			</tr>						
			<tr>
				<th>案由：</th>
				<td>${casei.caseCause}</td>
			</tr>
			<tr>
				<th>行政处罚决定书文号：</th>
				<td>${entity.documentNo}</td>
			</tr>					
			<tr>
				<th>执行方式</th>
				<td>
					<hs:dic dicName="EXECUTE_METHOD" name="executeMethod" defalt="${casef.executeMethod}" type="radio"></hs:dic>
				</td>	
			</tr>	
			<tr>
				<th>执行日期</th>
				<td>
					<tag:dateInput onlypast="false" name="executeDate" date="${casef.executeDate}"/>
				</td>
			</tr>
			<tr>
				<th>执行结果</th>
				<td>					
					<hs:dic dicName="EXECUTE_RESULT" name="executeResult" defalt="${casef.executeResult}" type="radio"></hs:dic>
				</td>
			</tr>
			<tr>
				<th>实际罚款金额</th>
				<td>
					<input type="text" value="${casef.actualPenalty}" name="actualPenalty" maxlength="10"/>元
				</td>		
			</tr>			
			<tr>
				<th>不作行政处罚的理由</th>				
				<td><textarea rows="3" name="noPunishReason" maxlength="300" style="width:78.5%">${casef.noPunishReason}</textarea></td>				
			</tr>
			<tr>
				<th>备注</th>				
				<td><textarea rows="3" name="remark" maxlength="300" style="width:78.5%">${casef.remark}</textarea></td>				
			</tr>
			<tr>
				<th>经办人</th>
				<td>
					<input type="text" id="usersName" name="usersName" style="width:78.5%;"/>
					<input type="hidden" id="users" name="users" value="${users}" />
				</td>
			</tr>									
			<tr>
				<th>审核流程</th>
				<td>
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
</script>