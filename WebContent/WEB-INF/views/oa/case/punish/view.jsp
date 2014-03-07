<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>

<form id="casePunishDetailFormId" name="casePunishDetailForm" action="" method="post">
	<input type="hidden" value="${entity.id}" name="id" />
	<table class="edittable">
		<colgroup>
			<col style="width: 150px;" />
			<col style="width: 200px;" />
			<col style="width: 150px;" />
			<col />
		</colgroup>
		<tbody>	
			<tr>
				<th>处罚文号或编号</th>
				<td colspan="3"><input type="text" value="${entity.documentNo}" name="documentNo" maxlength="200" style="width:78.5%"/></td>
			</tr>		
			<tr>
				<th>案由</th>
				<td colspan="3"><input type="text" value="${casei.caseCause}" name="caseCause" maxlength="200" style="width:78.5%"/></td>
			</tr>		
			<tr>
				<th>案件来源</th>
				<td colspan="3"><hs:dic dicName="CASE_SOURCE" name="caseSource" defalt="${entity.caseSource}"></hs:dic></td>
			</tr>					
			<tr>
				<th>被处罚单位</th>
				<td colspan="3"><input type="text" value="${entity.casePlace}" name="casePlace" maxlength="100" style="width:78.5%"/></td>
			</tr>
			<tr>
				<th>经济性质</th>
				<td colspan="3"><input type="hidden" id="ecmcode" name="ecmcode" value="${entity.ecmcode}"/></td>
			</tr>								
			<tr>
				<th>法人代表/负责人</th>
				<td colspan="3"><input type="text" value="${entity.casePerson}" name="casePerson" maxlength="50"/></td>	
			</tr>
			<tr>
				<th>地址</th>
				<td colspan="3"><input type="text" value="${entity.caseAddress}" name="caseAddress" maxlength="100" style="width:78.5%"/></td>
			</tr>
			<tr>
				<th>电话</th>
				<td colspan="3">
					<input type="text" value="${entity.casePersonTel}" name="casePersonTel" maxlength="30"/>
				</td>		
			</tr>
			<tr>
				<th>违反规定</th>				
				<td colspan="3"><textarea rows="2" name="breakRule" maxlength="200" style="width:78.5%">${entity.breakRule}</textarea></td>				
			</tr>
			<tr>
				<th>处罚依据</th>
				<td colspan="3"><textarea rows="2" name="basisPunish" maxlength="200" style="width:78.5%">${casec.basisPunish}</textarea></td>
			</tr>	
			<tr>
				<th>行政处罚</th>
				<td colspan="3"><textarea rows="2" name="collegialAdvice" maxlength="200" style="width:78.5%">${casec.collegialAdvice}</textarea></td>
			</tr>								
			<tr>
				<th>经办人</th>
				<td colspan="3">
					<input type="text" value="${entity.usersName}" name="usersName" style="width:78.5%;"/>
				</td>
			</tr>
			<tr>
				<th>当前状态</th>
				<td colspan="3">
					<hs:v dicName='CASE_PUNISH_APP_STATUS' code="${entity.punishAppStatus}"/>
				</td>
			</tr>																	
		</tbody>			
	</table>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/oa/secondarySeletect.js"></script>
<script type="text/javascript">
	secondarySelect.createSelect('ecmcode', ${ecmcodeJson}, '${entity.ecmcode}');
</script>