<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<form id="caseCollgialDetailFormId" name="caseCollgialDetailForm" action="" method="post">
	<table class="edittable">
		<colgroup>
			<col style="width: 150px;" />
			<col />
		</colgroup>
		<tbody>			
			<tr>
				<th>当事人</th>
				<td>${entity.casePlace}</td>
			</tr>
			<tr>
				<th>主持人</th>
				<td>
					<input type="text" id="usersName1" name="usersName1" value='${casec.usersName1}' style="width:78.5%;"/>
				</td>
			</tr>
			<tr>
				<th>参加合议人员</th>
				<td>
					<input type="text" id="usersName2" name="usersName2" value='${casec.usersName2}' style="width:78.5%;"/>
				</td>
			</tr>	
			<tr>
				<th>合议时间</th>
				<td>
					<input type="text" value="<fmt:formatDate value='${casec.collegialTime}' pattern='yyyy-MM-dd hh:mm:ss' />" name="collegialTime"/>
				</td>
			</tr>
			<tr>
				<th>合议地点</th>
				<td>
					<input type="text" name="collegialAddress" value='${casec.collegialAddress}' style="width:78.5%;"/>
				</td>
			</tr>											
			<tr>
				<th>违法事实</th>
				<td>
					<input type="text" id="caseIllegalNameId" name="caseIllegalName" style="width:78.5%"/>
					<input type="text" id="caseIllegalValueId" name="caseIllegal" value="${casec.caseIllegal}" style="display:none;"/>
				</td>
			</tr>
			<tr>
				<th>相关证据</th>				
				<td><textarea rows="3" name="evidence" maxlength="300" style="width:78.5%">${casec.evidence}</textarea></td>				
			</tr>
			<tr>
				<th>处罚依据</th>				
				<td><textarea rows="5" name="basisPunish" maxlength="500" style="width:78.5%">${casec.basisPunish}</textarea></td>				
			</tr>
			<tr>
				<th>合议建议</th>				
				<td><textarea rows="3" name="collegialAdvice" maxlength="300" style="width:78.5%">${casec.collegialAdvice}</textarea></td>				
			</tr>																	
		</tbody>			
	</table>
</form>
<script type="text/javascript">
	var dic = new dictionary("dictionary", "caseIllegalNameId", {codeCtrlId:'caseIllegalValueId', dicName : 'ILLEGAL_FACTORS', value1 : '${entity.caseType}', dicTitle : '违法事实' });
	var caseIllegalList = [];
	<c:forEach var="v" items="${caseIllegalList}">
	caseIllegalList.push({ code : '${v.code}', name : '${v.value}'});
	</c:forEach>
	dic.setSelectedItems(caseIllegalList);
</script>