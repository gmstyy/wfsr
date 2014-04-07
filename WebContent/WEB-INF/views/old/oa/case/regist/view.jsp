<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<form id="caseAcceptDetailFormId" name="caseAcceptDetailForm" action="" method="post">
	<table class="edittable">
		<colgroup>
			<col style="width: 150px;" />
			<col style="width: 200px;" />
			<col style="width: 150px;" />
			<col />
		</colgroup>
		<tbody>	
			<tr>
				<th>案件来源</th>
				<td colspan="3">
					<hs:dic dicName="CASE_SOURCE" name="caseSource" defalt="${entity.caseSource}"></hs:dic>
				</td>
			</tr>
			<tr>
				<th>案件类别</th>
				<td colspan="3"><hs:dic dicName="ILLEGAL_FACTORS" name="caseType" defalt="${entity.caseType}" value1="0"></hs:dic></td>
			</tr>					
			<tr>
				<th>案发单位（人）</th>
				<td colspan="3"><input type="text" value="${entity.casePlace}" name="casePlace" maxlength="100" style="width:78.5%"/></td>
			</tr>
			<tr>
				<th>经济类型</th>
				<td colspan="3"><input type="hidden" id="ecmcode" name="ecmcode" value="${entity.ecmcode}"/></td>
			</tr>			
			<tr>
				<th>案发地点</th>
				<td colspan="3"><input type="text" value="${entity.caseAddress}" name="caseAddress" style="width:78.5%"/></td>
			</tr>
			<tr>
				<th>案发日期</th>
				<td colspan="3">
					<input type="text" value="<fmt:formatDate value='${entity.caseDate}' pattern='yyyy-MM-dd' />" name="caseDate"/>
				</td>
			</tr>						
			<tr>
				<th>负责人</th>
				<td colspan="3"><input type="text" value="${entity.casePerson}" name="casePerson" maxlength="50"/></td>
			</tr>
			<tr>
				<th>性别</th>			
				<td colspan="3"><hs:dic dicName='GENDER' defalt="${entity.casePersonSex}" name="casePersonSex" value1="1" /></td>					
			</tr>
			<tr>
				<th>负责人电话</th>
				<td colspan="3">
					<input type="text" value="${entity.casePersonTel}" name="casePersonTel" maxlength="30"/>
				</td>		
			</tr>			
			<tr>
				<th>案情摘要</th>				
				<td colspan="3"><textarea rows="5" name="summary" maxlength="500" style="width:78.5%">${entity.summary}</textarea></td>				
			</tr>
			<tr>
				<th>违反规定</th>				
				<td colspan="3"><textarea rows="3" name="breakRule" maxlength="200" style="width:78.5%">${entity.breakRule}</textarea></td>				
			</tr>			
			<tr>
				<th>经办人</th>
				<td colspan="3">
					<input type="text" name="usersName" value="${entity.usersName}" style="width:78.5%;"/>
				</td>
			</tr>
			<tr>
				<th>受理时间</th>
				<td colspan="3">
					<input type="text" value="<fmt:formatDate value='${entity.acceptTime}' pattern='yyyy-MM-dd hh:mm:ss' />" name="acceptTime"/>
				</td>
			</tr>																	
		</tbody>			
	</table>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/oa/secondarySeletect.js"></script>
<script type="text/javascript">
	secondarySelect.createSelect('ecmcode', ${ecmcodeJson}, '${entity.ecmcode}');
</script>