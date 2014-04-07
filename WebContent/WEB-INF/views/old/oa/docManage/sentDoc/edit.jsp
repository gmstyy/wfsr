<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="com.founder.hs.constant.HSCV" %>

<form id="addSentDocFormId" action="" method="post">
	<input type="hidden" name='id' value="${sentDocument.id}">
	<input type="hidden" name="${CSRFTokenName}" value="${CSRFToken}">
	<c:set var="pass" value="<%=HSCV.DOCUMENT_STATUS.PASS%>" scope="request"/>
	<table class=edittable>
		<colgroup>
			<col style="width: 80px;"/>
			<col />
			<col style="width: 80px;"/>
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>接收人<span class="must_field">*</span></th>
				<td>
					<input type="text" id="receiverName" name="receiverName" />
				</td>
				<th>重要标识<span class="must_field">*</span></th>
				<td>
					<hs:dic name="importance" id="importance" dicName="DOCUMENT_IMPORTANCE_STATUS" defalt="${sentDocument.importance}"/>
				</td>
			</tr>
			<tr>
				<th>公文编号<span class="must_field">*</span></th>
				<td><input type='text' value='${sentDocument.documentNo}' id='documentNo' name='documentNo' maxlength="20" /></td>
				<th>紧急程度<span class="must_field">*</span></th>
				<td>
					<hs:dic name="urgentStatus" id="urgentStatus" dicName="DOCUMENT_URGENT_STATUS" defalt="${sentDocument.urgentStatus}"/>
				</td>
			</tr>
			<tr>
				<th>公文类型</th>
				<td><hs:dic name="documentType" id="documentType" dicName="DOC_TYPE" defalt="${sentDocument.documentType}"/></td>
				<th>公文保密<span class="must_field">*</span></th>
				<td><hs:dic name="isSecret" id="isSecret" dicName="BOOLEAN_TYPE" defalt="${sentDocument.isSecret}"></hs:dic></td>
			</tr>
			<tr>
				<th>标题</th>
				<td colspan="3"><input style="width: 80.5%;" type='text' value='${sentDocument.title}' id='title' name='title' maxlength="200"/></td>
			</tr>
			<tr>
				<th>内容</th>
					<td colspan="3"><textarea id='content' name='content'  maxlength="2000">${sentDocument.content}</textarea>
				</td>
			</tr>
			<c:if test="${sentDocument.status != pass}">
			<tr>
				<th>审核流程</th>
				<td colspan="3">
					<select name="workflowId" id="workflowId" style="width:150px;">
						<option value=""></option>
						<c:forEach items="${workflowList}" var="wf">
						<option value="${wf.id}">${wf.name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			</c:if>
		</tbody>
	</table>
</form>
<div style="margin-left:50px;text-align: left;">
	<table>
		<tr>
			<th>附件</th>
			<td>
				<input type="file" id="docSentUploadfile" name="docSentUploadfile"/>
				<input class="button_upload" onclick="file.doUploadFile();" value="上 传" type="button" />
			</td>
		</tr>
	</table>
	<table id="attachment">
		<c:if test="${not empty attachmentList}">
			<c:forEach var="attachment" items="${attachmentList}">
				<tr id='${attachment.id}'>
					<td>
						<input type='hidden' class='newFileName' value='${attachment.name}'><input type='hidden' class='originFileName' value='${attachment.originName}'>${attachment.originName}<a href='javascript:void(0);' title='删除' class='option_del' onclick="file.deleteAttach(${attachment.id},'${attachment.name}',1);"></a>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</div>
<script type="text/javascript">
	file._attId = -1;
	file._attName = '';
	file._isSingal = 'false';
	file._type = 'document';
	file._file = 'docSentUploadfile';
	
	var dicOrg = new dictionary("employeeTree", "receiverName", { dicTitle : "接收人选择" });
	var receiverList = [];
	<c:forEach var="receiver" items="${receiverList}">
		receiverList.push({ code : '${receiver.receiverUserLoginName}', name : '${receiver.receiverUserName}' });
	</c:forEach>
	dicOrg.setSelectedItems(receiverList);
</script>