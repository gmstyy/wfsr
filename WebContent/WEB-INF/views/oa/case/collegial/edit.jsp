<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>

<form id="caseCollgialDetailFormId" name="caseCollgialDetailForm" action="" method="post">
	<input type="hidden" value="${entity.id}" name="caseId" />
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
				<th>案由：</th>
				<td>${casei.caseCause}</td>
			</tr>
			<tr>
				<th>主持人</th>
				<td>
					<input type="text" id="usersName1" name="usersName1" style="width:78.5%;"/>
					<input type="hidden" id="users1" name="users1" />
				</td>
			</tr>
			<tr>
				<th>参加合议人员</th>
				<td>
					<input type="text" id="usersName2" name="usersName2" style="width:78.5%;"/>
					<input type="hidden" id="users2" name="users2" />
				</td>
			</tr>	
			<tr>
				<th>合议地点</th>
				<td>
					<input type="text" name="collegialAddress" style="width:78.5%;"/>
				</td>
			</tr>											
			<tr>
				<th>违法事实</th>
				<td>
					<input type="text" id="caseIllegalNameId" name="caseIllegalName" style="width:78.5%"/>
					<input type="text" id="caseIllegalValueId" name="caseIllegal" value="${casei.caseIllegal}" style="display:none;"/>
				</td>
			</tr>
			<tr>
				<th>相关证据</th>				
				<td><textarea rows="3" name="evidence" maxlength="300" style="width:78.5%">${casei.evidence}</textarea></td>				
			</tr>
			<tr>
				<th>处罚依据</th>				
				<td><textarea rows="5" name="basisPunish" maxlength="500" style="width:78.5%"></textarea></td>				
			</tr>
			<tr>
				<th>合议建议</th>				
				<td><textarea rows="3" name="collegialAdvice" maxlength="300" style="width:78.5%"></textarea></td>				
			</tr>																	
		</tbody>			
	</table>
</form>
<script type="text/javascript">
	var dicEmployee1 = new dictionary("employeeTree", "usersName1", {codeCtrlId:'users1', dicTitle : "主持人选择", orgId : "${orgId}", dynamic : false });
	var userList1 = [];
	dicEmployee1.setSelectedItems(userList1);
	
	var dicEmployee2 = new dictionary("employeeTree", "usersName2", {codeCtrlId:'users2', dicTitle : "参加合议人员选择", orgId : "${orgId}", dynamic : false });
	var userList2 = [];
	dicEmployee2.setSelectedItems(userList2);
	
	var dic = new dictionary("dictionary", "caseIllegalNameId", {codeCtrlId:'caseIllegalValueId', dicName : 'ILLEGAL_FACTORS', value1 : '${entity.caseType}', dicTitle : '违法事实' });
	var caseIllegalList = [];
	<c:forEach var="v" items="${caseIllegalList}">
	caseIllegalList.push({ code : '${v.code}', name : '${v.value}'});
	</c:forEach>
	dic.setSelectedItems(caseIllegalList);
</script>