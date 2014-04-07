<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="detailFormId"  action="" method="post">
		<table class=edittable>
			<colgroup>
				<col style="width: 130px;" />
				<col />
				<col style="width: 80px;" />
				<col />
			</colgroup>
			<thead>
				<tr>
				
					<th>选择模板</th>
					<!-- <td><a href="javascript:void(0);" title="选择模板" class="option_edit"  onclick="select();"></a></td> -->
					<td><select id="list"  name="list" style="width:180px; ">
				        <c:forEach  var="list" items="${list}" varStatus="status">
							<option value="${list.id}">${list.name}</option>
						</c:forEach>
				    </select>
				    </td>
					<th>考核名称</th>
					<td><input type="text" id="name" name="name" style="width:150px; "></td>
	
				</tr>
				
				<tr>
				    <th>考核者</th>
					<td>
					<input type="text" id="operatorName" name="operatorName" style="width:78.5%;"/>
					<input type="hidden" id="operators" name="operators" value="${operators}" />
					
					<!-- <input type="text" id="operatorName" name="operatorName" style="width:150px; "/> --></td>
					<th>被考核者</th>
					<td>
					<input type="text" id="targetName" name="targetName" style="width:78.5%;"/>
					<input type="hidden" id="targets" name="targets" value="${targets}" />
					
					<!-- <input type="text" id="targetName" name="targetName" style="width:150px; "/> --></td>
				</tr>
			</thead>
		</table>
	</form>
	<script type="text/javascript">
	/* $("#name").onfocus(
			$("#id").val($("#list").find("option:selected").val())
	); */
	
	var operator = new dictionary("employeeTree", "operatorName", {codeCtrlId:'operators', dicTitle : "负责人选择", orgId : "${orgId}", dynamic : false });
	var target = new dictionary("employeeTree", "targetName", {codeCtrlId:'targets', dicTitle : "被考核人选择", orgId : "${orgId}", dynamic : false });
	/* var operatorList = [];
	var targetList = [];
 	 <c:forEach var="operatorList" items="${operatorList}">
		receiverList.push({ code : '${operatorList.receiverUserLoginName}', name : '${operatorList.receiverUserName}' });
	</c:forEach>
	<c:forEach var="targetList" items="${targetList}">
	targetList.push({ code : '${targetList.receiverUserLoginName}', name : '${targetList.receiverUserName}' });
    </c:forEach> 
     
    operator.setSelectedItems(operatorList);
    target.setSelectedItems(targetList); */
	</script>
