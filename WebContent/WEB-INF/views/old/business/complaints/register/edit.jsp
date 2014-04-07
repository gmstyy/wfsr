<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="registerEditFormId" action="" method="post">
	<input type="hidden" id="CSRFTokenName" value="${CSRFTokenName}"/>
	<input type="hidden" id="CSRFToken" value="${CSRFToken}"/>
	<input type='hidden' value='${complaints.id}' id='id' name='id' />
	<table class="edittable">
		<colgroup>
			<col style="width: 130px;" />
			<col />
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>受理投诉机构<span class="must_field">*</span></th>
				<td><hs:dic dicName="ORG" id='targetOrgId' name='targetOrgId' defalt="${complaints.targetOrgId}"/></td>
				<th>投诉对象<span class="must_field">*</span></th>
				<td><hs:dic name="type" id="type" dicName="COMPLAINTS_TYPE" defalt="${complaints.type}" /></td>
			</tr>
			<tr>
				<th>举报人<span class="must_field">*</span></th>
				<td><input type="text" name="complaintsName" id="complaintsName" value="${complaints.complaintsName}" maxlength='20'></td>
				<th>举报人电话<span class="must_field">*</span></th>
				<td><input type="text" name="complaintsTelephone" id="complaintsTelephone" value="${complaints.complaintsTelephone}" maxlength='12'></td>
			</tr>
			<tr>
				<th>举报方式<span class="must_field">*</span></th>
				<td><input readonly="readonly" type="text" value="<hs:v dicName="COMPLAINTS_MODE" code="${complaints.complaintsMode}"/>	"></td>
				<th>被举报人<span class="must_field">*</span></th>
				<td><input type="text" name="targetName" id="targetName" value="${complaints.targetName}"/></td>
			</tr>
			<tr>
				<th>被举报人地址</th>
				<td colspan="4"><textarea rows="2" style="width:79%;" id='targetAddress' name='targetAddress'>${complaints.targetAddress}</textarea></td>
			</tr>
			<tr>
				<th>举报内容类别</th>
				<td><hs:dic dicName="LICENSE_TYPE" id="complaintsSort" name="complaintsSort" defalt="${complaints.complaintsSort}"/></td>
			</tr>
			<tr>
				<th>举报标题<span class="must_field">*</span></th>
				<td colspan="4"><input style="width: 79%;" type='text' value='${complaints.title}' id='title' name='title' maxlength='100' /></td>
			</tr>
			<tr>
				<th>举报内容<span class="must_field">*</span></th>
				<td colspan="4"><textarea rows="5" style="width: 79%" id='content' name='content' maxlength='2000'>${complaints.content}</textarea></td>
			</tr>
		</tbody>
	</table>
</form>