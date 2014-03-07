<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<form id="editEducationFormId" action="" method="post">
	<input type='hidden' value='${employeeId}' id='employeeId' name='employeeId' />
	<table class="edittable">
		<tr>
			<th colspan="7">添加教育经历<a class="option_add" onclick="addEducation('#editEducationFormId')"></a></th>
		</tr>
		<tbody id="educationTemplate" style="display: none">
			<tr>
				<th>起始日期</th><td><tag:dateInput onlypast="false" name="startDatetime"/></td>
				<th>终止日期</th><td><tag:dateInput onlypast="false" name="endDatetime"/></td>
				<th>教育机构</th><td><input type='text' name="educationOrg"/></td>
			</tr>
			<tr>
				<th>专业</th><td><hs:dic dicName='MAJOR' name="major"></hs:dic></td>
				<th>学位</th><td><hs:dic dicName='DEGREE' name="degree"></hs:dic></td>
				<th>学历</th><td><hs:dic dicName='EDUCATION' name="education"></hs:dic></td>
				<th><a title="删除" href="javascript:void(0);" class="option_del" onclick="deleteItem(this,'#editEducationFormId');"></a></th>	
			</tr>
		</tbody>
	</table>
	<table class="edittable" id="addEducationNode">
		<c:if test="${empty educationList}">
			<tbody>
				<tr>
					<th>起始日期</th><td><tag:dateInput onlypast="false" name="startDatetime"/></td>
					<th>终止日期</th><td><tag:dateInput onlypast="false" name="endDatetime"/></td>
					<th>教育机构</th><td><input type='text' name="educationOrg" maxlength="100"/></td>
				</tr>
				<tr>
					<th>专业</th><td><hs:dic dicName='MAJOR' name="major"></hs:dic></td>
					<th>学位</th><td><hs:dic dicName='DEGREE' name="degree"></hs:dic></td>
					<th>学历</th><td><hs:dic dicName='EDUCATION' name="education"></hs:dic></td>
					<th><a title="删除" href="javascript:void(0);" class="option_del" style="display:none;" onclick="deleteItem(this,'#editEducationFormId');"></a></th>	
				</tr>
			</tbody>
		</c:if>
		<c:if test="${not empty educationList}">
			<c:forEach var="educationList" items="${educationList}">
				<tbody>
					<tr>
						<th>起始日期</th><td><tag:dateInput onlypast="false" name="startDatetime" date="${educationList.startDatetime}"/></td>
						<th>终止日期</th><td><tag:dateInput onlypast="false" name="endDatetime" date="${educationList.endDatetime}"/></td>
						<th>教育机构</th><td><input type='text' name="educationOrg" value="${educationList.educationOrg}" maxlength="100"/></td>
					</tr>
					<tr>
						<th>专业</th><td><hs:dic dicName='MAJOR' name="major" defalt="${educationList.major}"></hs:dic></td>
						<th>学位</th><td><hs:dic dicName='DEGREE' name="degree" defalt="${educationList.degree}"></hs:dic></td>
						<th>学历</th><td><hs:dic dicName='EDUCATION' name="education" defalt="${educationList.education}"></hs:dic></td>
						<th><a title="删除" href="javascript:void(0);" class="option_del" style="display:none;" onclick="deleteItem(this,'#editEducationFormId');"></a></th>	
					</tr>
				</tbody>
			</c:forEach>
		</c:if>
	</table>
</form>