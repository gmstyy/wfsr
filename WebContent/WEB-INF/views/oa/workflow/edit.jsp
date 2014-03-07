<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>

<form id="workflowDetailFormId" name="detailForm" action="" method="post">
	<input type="text" value="${entity.id}" name="id" style="display:none;"/>
	<table class="edittable">
		<colgroup>
			<col style="width: 130px;" />
			<col style="width: 100px;" />
			<col style="width: 130px;" />
			<col style="width: 100px;"/>
			<col style="width: 80px;" />
			<col />
		</colgroup>			
		<tr>
			<th>流程种类<span class="must_field">*</span></th>
			<td colspan="5">
				<hs:dic dicName="WORKFLOW_CATEGORY" name="categoryCode" defalt="${entity.categoryCode}" id="workflowCategory_2" onChange="selectCategory(2)"></hs:dic>
				<hs:dic dicName="LICENSE_TYPE" name="ltype" id="business_2_1" defalt="${entity.businessCode}" blank="false" onChange="selectBusiness(2,1)"></hs:dic>
				<hs:dic dicName="CASE_STEP" name="cstep" id="business_2_2" defalt="${entity.businessCode}" blank="false" onChange="selectBusiness(2,2)"></hs:dic>
				<input type="text" name="businessCode" id="businessCode_2" value="${entity.businessCode}" style="display:none;"/>	
			</td>
		</tr>		
		<tr>
			<th>流程名称<span class="must_field">*</span></th>		
			<td><input type="text" value="${entity.name}" name="name" maxlength="60"/></td>
			<th>流程描述</th>			
			<td colspan="3">
				<textarea rows="2" name="description" maxlength="180">${entity.description}</textarea>
			</td>					
		</tr>
		<tr>
			<th>审批通过终点节点<span class="must_field">*</span></th>		
			<td><input type="text" value="${entity.successNode}" name="successNode" maxlength="60"/></td>
			<th>审批不通过终点节点<span class="must_field">*</span></th>		
			<td><input type="text" value="${entity.failNode}" name="failNode" maxlength="60"/></td>
			<td></td>
			<td>添加审批流程节点<a class="option_add" onclick="addRow()"></a></td>
		</tr>
	</table>
	<table class="edittable" id="addWorkflowNode">
		<colgroup>
			<col style="width: 80px;" />
			<col style="width: 100px;" />
			<col style="width: 80px;" />
			<col style="width: 100px;"/>
			<col style="width: 80px;" />
			<col />
		</colgroup>	
		<c:forEach items="${workflownodeList}" var="wfn" varStatus="status">
		<tr id="node_${status.count}">
			<th>节点名称<span class="must_field">*</span></th>		
			<td><input type="text" value="${wfn.workflowNodeName}" name="workflowNodeName" maxlength="60"/></td>
			<th>角色<span class="must_field">*</span></th>		
			<td>
				<select name="chargeRole">
					<option value=""></option>
					<c:forEach items="${roleList}" var="re">
					<option value="${re.code}" <c:if test="${re.code == wfn.chargeRole}">selected</c:if>>${re.name}</option>
					</c:forEach>
				</select>
			</td>
			<th>限时</th>
			<td>
				<input type="text" value="${wfn.deadline}" name="deadline" style="width:50px;" maxlength="3"/>天	
				<a href="javascript:void(0);" class="option_del" onclick="removeRow('node_${status.count}')"></a>						
			</td>	
		</tr>	
		</c:forEach>
		<tbody id="addNodeId"></tbody>
	</table>
</form>
<script type="text/javascript">
var roleSelect = null;
var num = 0;
var addRow = function() {
	if(roleSelect == null){
		roleSelect = '<select name="chargeRole"><option value=""></option>'; 
		$.each(${roles}, function(index, data){
			roleSelect += '<option value="'+data.code+'">'+data.name+'</option>';          
	    });       
		roleSelect += '</select>';	
	}
	num = num + 1;
	var rowId = 'row_'+num;
	var html = '<tr id="'+rowId+'"><th>节点名称<span class="must_field">*</span></th><td><input type="text" name="workflowNodeName" maxlength="60"/></td>';
	html += '<th>角色<span class="must_field">*</span></th><td>'+roleSelect+'</td>';
	html += '<th>限时</th><td><input type="text" name="deadline" style="width:50px;" maxlength="3"/>天&nbsp;<a class="option_del" onclick="removeRow(\''+rowId+'\')"></a></td></tr>';
	$("#addNodeId").append(html);
};

var removeRow = function(rowId) {
	$("#"+rowId).html('');
};
</script>

