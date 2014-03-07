<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="transferEditFormId" action="" method="post">
	<input type="hidden" id="CSRFTokenName" value="${CSRFTokenName}"/>
	<input type="hidden" id="CSRFToken" value="${CSRFToken}"/>
	<input type='hidden' value='${complaints.id}' id='id' name='id' />
	<table class="edittable">
		<colgroup>
			<col style="width: 130px;" />
			<col />
			<col style="width: 130px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>举报人</th>
				<td><input readonly="readonly" type="text" value="${complaints.complaintsName}"></td>
				<th>举报人电话</th>
				<td><input readonly="readonly" type="text" value="${complaints.complaintsTelephone}"></td>
			</tr>
			<tr>
				<th>举报对象</th>
				<td><input readonly="readonly" type="text" value="<hs:v dicName="COMPLAINTS_TYPE" code="${complaints.type}"/>"></td>
				<th>举报方式</th>
				<td><input readonly="readonly" type="text" value="<hs:v dicName="COMPLAINTS_MODE" code="${complaints.complaintsMode}"/>	"></td>
			</tr>
			<tr>
				<th>被举报人</th>
				<td colspan="3"><input readonly="readonly" type="text" value="${complaints.targetName}" style="width:83%;"/></td>
			</tr>
			<tr>
				<th>被举报人地址</th>
				<td colspan="3"><textarea rows="2" readonly="readonly" style="width:83%;">${complaints.targetAddress}</textarea></td>
			</tr>
			<tr>
				<th>标题</th>
				<td colspan="3"><input readonly="readonly" style="width: 83%;" type='text' value='${complaints.title}'/></td>
			</tr>			
			<tr>
				<th>举报内容类别</th>
				<td colspan="3"><input type="text" readonly="readonly" value="<hs:v dicName="LICENSE_TYPE" code="${complaints.complaintsSort}"/>"></td>
			</tr>
			<tr>
				<th>举报内容</th>
				<td colspan="3"><textarea readonly="readonly" rows="5" style="width: 83%">${complaints.content}</textarea></td>
			</tr>
<%-- 			<tr>
				<th>受理状态</th>
				<td><input readonly="readonly" type='text' value="<hs:v dicName="COMPLAINTS_STATUS" code="${complaints.status}"/>"/></td>
			</tr> --%>
			<tr>
				<th>登记人</th>
				<td><input readonly="readonly" type='text' value='${complaints.handlerName}'/></td>
				<th>登记时间</th>
				<td><input readonly="readonly" type="text" value="<fmt:formatDate value="${complaints.registerDatetime}" pattern="yyyy/MM/dd HH:mm:ss"/>"></td>				
			</tr>			
			<tr>
				<th>发送机构</th>
				<td><input readonly="readonly" type='text' value="<hs:v dicName="ORG" code="${complaints.handleOrgId}"/>"/></td>
				<th>接收机构<span class="must_field">*</span></th>
				<td><hs:dic dicName="ORG" id='handleOrgId' name='handleOrgId' blank="false"/></td>
			</tr>
			<tr>
				<th>填写备注</th>
				<td colspan="3"><textarea rows="5" style="width:83%" id="remark" name="remark" maxlength='1000'>${complaints.remark}</textarea></td>
			</tr>
		</tbody>
	</table>
</form>