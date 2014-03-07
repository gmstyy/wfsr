<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>

<form id="startWorkflowFormId" name="startWorkflowForm" action="" method="POST">
	<input type="text" value="${relationId}" name="relationId" style="display:none;"/>
	<input type="text" value="${categoryCode}" name="categoryCode" style="display:none;"/>
	<input type="text" value="${title}" name="title" style="display:none;"/>
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;">
			<col>				
		</colgroup>	
		<tr>		
			<th>选择流程<span class="must_field">*</span></th>
			<td>
				<select name="workflowId" style="width:150px;">
					<option value=""></option>
					<c:forEach items="${workflowList}" var="wf">
					<option value="${wf.id}">${wf.name}</option>
					</c:forEach>
				</select>
			</td>
		</tr> 
	</table>	
</form>
