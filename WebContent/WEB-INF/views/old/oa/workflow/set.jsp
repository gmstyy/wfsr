<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form id="setFormId" name="setForm" action="" method="post">
	<input type="text" value="${workflowId}" name="workflowId" style="display:none;">
	<table class="edittable" id="setWorkflowNode">	
		<colgroup>
			<col style="width: 80px;" />
			<col style="width: 100px;" />
			<col style="width: 80px;" />
			<col style="width: 100px;"/>
			<col style="width: 80px;" />
			<col />
		</colgroup>		
		<c:forEach items="${workflownodeList}" var="wfn" >
		<tbody>
		<tr>
			<th>当前节点</th>
			<td align="left">
				<input type="text" value="${wfn.workflowNodeName}" name="workflowNodeName" readonly="readonly"/>
				<input type="text" value="${wfn.id}" name="currentNodeId" style="display:none;">
			</td>
			<th>下个节点</th>
			<td align="left">
				<select name="nextNodeId1" style="width:100px;">
					<option value="">请选择</option>
					<c:forEach items="${allWorkflownodeList}" var="wfnvar" >
						<c:if test="${wfnvar.id != wfn.id}">
						<option value="${wfnvar.id}" <c:if test="${wfn.workflowSet.nextNodeId1 == wfnvar.id}">selected</c:if>>${wfnvar.workflowNodeName}</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
			<td align="left">
				<select name="nextNodeId2" style="width:100px;">
					<option value="">请选择</option>
					<c:forEach items="${allWorkflownodeList}" var="wfnvar" >
						<c:if test="${wfnvar.id != wfn.id}">
						<option value="${wfnvar.id}" <c:if test="${wfn.workflowSet.nextNodeId2 == wfnvar.id}">selected</c:if>>${wfnvar.workflowNodeName}</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
			<td align="left">				
				<select name="nextNodeId3" style="width:100px;">
					<option value="">请选择</option>
					<c:forEach items="${allWorkflownodeList}" var="wfnvar" >
						<c:if test="${wfnvar.id != wfn.id}">
						<option value="${wfnvar.id}" <c:if test="${wfn.workflowSet.nextNodeId3 == wfnvar.id}">selected</c:if>>${wfnvar.workflowNodeName}</option>
						</c:if>
					</c:forEach>
				</select>								
			</td>
		</tr>
		<tr>
			<td colspan="2"></td>
			<th>按钮名称</th>
			<td align="left"><input type="text" value="${wfn.workflowSet.nextButton1}" name="nextButton1"/></td>
			<td align="left"><input type="text" value="${wfn.workflowSet.nextButton2}" name="nextButton2"/></td>
			<td align="left"><input type="text" value="${wfn.workflowSet.nextButton3}" name="nextButton3"/></td>
		</tr>
		</tbody>
		</c:forEach>
	</table>
</form>

