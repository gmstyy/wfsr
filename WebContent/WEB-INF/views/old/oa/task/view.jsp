<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ page language="java" import="com.founder.oa.common.constant.OACV" %>

<table class="edittable">
	<c:set var="COMPLETE" value="<%=OACV.TASK_STATUS.COMPLETE%>" scope="request"/>
	<colgroup>
		<col style="width: 150px;" />
		<col style="width: 200px;" />
		<col style="width: 150px;" />
		<col />
	</colgroup>
	<tbody>
		<tr>
			<th>当前状态</th>
			<td align="left"><hs:v dicName="TASK_STATUS" code="${entity.status}"/></td>
		</tr>
		<tr>
			<th>任务来源<span class="must_field">*</span></th>
			<td align="left">
				<hs:dic dicName="TASK_SOURCE" defalt="${entity.sourceType}" disabled="true"></hs:dic>
			</td>
			<th>任务类别<span class="must_field">*</span></th>
			<td align="left">
				<hs:dic dicName="TASK_TYPE" defalt="${entity.taskType}" disabled="true"></hs:dic>
			</td>			
		</tr>
		<c:if test="${not empty rp.licenseType}">
		<tr>
			<th>业务类别</th>		
			<td align="left" colspan="3">					
				<input type='text' value='<hs:v dicName="LICENSE_TYPE" code="${rp.licenseType}" />' readonly="readonly"/>
			</td>
		</tr>			
		</c:if>		
		<tr>
			<th>场所<span class="must_field">*</span></th>		
			<td align="left" colspan="3"><input type="text" value="${entity.place}" name="place" readonly="readonly" style="width:78.5%;"/></td>
		</tr>
		<tr>
			<th>地址<span class="must_field">*</span></th>			
			<td align="left" colspan="3"><input type="text" value="${entity.address}" name="address" readonly="readonly" style="width:78.5%;"/></td>
		</tr>		
		<%--<tr>
			<th>负责人</th>		
			<td align="left"><input type="text" value="${entity.chargePerson}" name="chargePerson" readonly="readonly"/></td>
			<th>联系电话</th>			
			<td align="left"><input type="text" value="${entity.chargePersonTel}" name="chargePersonTel" readonly="readonly"/></td>
		</tr> --%>
		<tr>
			<th>任务描述</th>		
			<td align="left" colspan="3">
				<textarea rows="5" name="description" readonly="readonly" style="width:78.5%;">${entity.description}</textarea>
			</td>
		</tr>
		<tr>
			<th>负责人<span class="must_field">*</span></th>		
			<td align="left" colspan="3">
				<textarea rows="3" name="selectUsers" readonly="readonly" style="width:78.5%;">${entity.selectUsers}</textarea>
			</td>
		</tr>
		<tr>
			<th>任务结果</th>		
			<td align="left" colspan="3">
				<textarea rows="6" name="users" readonly="readonly" style="width:78.5%;"><c:forEach items="${entity.taskAssignments}" var="taVar" ><c:if test="${not empty taVar.taskResult}">${taVar.receiveUserName}：${taVar.taskResult}&#13;&#10;&#13;&#10;</c:if></c:forEach></textarea>
			</td>			
		</tr>
		<c:if test="${'1' eq entity.taskType}">
		<c:if test="${not empty entity.superviseId}">
		<tr>
			<th>审核详细</th>		
			<td align="left" colspan="3">
				<a class="option_view" href="javascript:void(0);" onclick="viewSupervise('${entity.superviseId}');"></a>
			</td>			
		</tr>		
		</c:if>
		</c:if>
	</tbody>				
</table>
<script type="text/javascript">
var viewSupervise = function(id) {
	viewHelper.basicPost('/task/supervise', {
		'id' : id
	}, 2, {
		containerId : 'superviseContainer',
		containerTitle : '查看',
		defaultButtons: {
			okEnabled : false,
			cancelText : '关 闭'
		}
	});
};
</script>

