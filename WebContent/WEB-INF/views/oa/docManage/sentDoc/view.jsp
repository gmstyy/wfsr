<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<form id="addSentDocFormId" action="" method="post">
	<input type="hidden" name='id' value="${sentDocument.id}">
	<table class=edittable>
		<colgroup>
			<col style="width: 130px;" />
			<col />
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>接收人</th>
				<td><input type="text" id="receiverName" name="receiverName" /></td>
				<th>重要标识</th>
				<td><input type="text" readonly="readonly" value="<hs:v dicName="DOCUMENT_IMPORTANCE_STATUS" code="${sentDocument.importance}"/>"/></td>
			</tr>
			<tr>
				<th>紧急程度</th>
				<td><input type="text" readonly="readonly" value="<hs:v dicName="DOCUMENT_URGENT_STATUS" code="${sentDocument.urgentStatus}"/>"/></td>
				<th>公文编号</th>
				<td><input type="text" readonly="readonly" value="${sentDocument.documentNo}"/></td>
			</tr>
			<tr>
				<th>创建日期</th>
				<td><input type="text" readonly="readonly" value="<fmt:formatDate value="${sentDocument.createDatetime}" pattern="yyyy-MM-dd HH:mm:ss"/>"/></td>
				<th>发送日期</th>
				<td><input type="text" readonly="readonly" value="<fmt:formatDate value="${sentDocument.sentDatetime}" pattern="yyyy-MM-dd HH:mm:ss"/>"/></td>
			</tr>
			<tr>
				<th>公文类型</th>
				<td><input type="text" readonly="readonly" value="<hs:v dicName="DOC_TYPE" code="${sentDocument.documentType}"/>"></td>
				<th>公文保密</th>
				<td><input type="text" readonly="readonly" value='<hs:v dicName="BOOLEAN_TYPE" code="${sentDocument.isSecret}"/>'></td>
			</tr>
			<tr>
				<th>发送人</th>
				<td><input type="text" readonly="readonly" value="${sentDocument.senderUserName}"/></td>
			</tr>
			<tr>
				<th>标题</th>
				<td colspan="3"><input  style="width:82%" type="text" readonly="readonly" value="${sentDocument.title}"/></td>
			</tr>
			<tr>
				<th>内容</th>
				<td colspan="3">${sentDocument.content}</td>
			</tr>
		<tr>
			<th>附件</th>
			<td colspan="3">
				<c:if test="${not empty attachmentList}">
					<c:forEach var="attachment" items="${attachmentList}">
						${attachment.originName}&nbsp;&nbsp;<input class="button_download" onclick="file.download(${attachment.id})" value="下 载" type="button" style="width:50px;"/><br/>
					</c:forEach>
				</c:if>
			</td>
		</tr>			
		</tbody>
	</table>
</form>
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