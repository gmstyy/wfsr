<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<form id="addSentDocFormId" action="" method="post">
	<input type="hidden" name='id' value="${ReceivedDocument.id}">
	<table class=edittable>
		<colgroup>
			<col style="width: 130px;" />
			<col />
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>发送机构</th>
				<td><input type="text" readonly="readonly" value="${ReceivedDocument.senderOrgName}"/></td>
				<th>发送时间</th>
				<td><input type="text" readonly="readonly" value="<fmt:formatDate value="${ReceivedDocument.sentDatetime}" pattern="yyyy-MM-dd HH:mm:ss"/>"/></td>
			</tr>
			<tr>
				<th>发送者</th>
				<td><input type="text" readonly="readonly" value="${ReceivedDocument.senderUserName}"/></td>
				<th>重要标识</th>
				<td><input type="text" readonly="readonly" value="<hs:v dicName="DOCUMENT_IMPORTANCE_STATUS" code="${ReceivedDocument.importance}"/>"/></td>
			</tr>
			<tr>
				<th>紧急程度</th>
				<td><input type="text" readonly="readonly" value="<hs:v dicName="DOCUMENT_URGENT_STATUS" code="${ReceivedDocument.urgentStatus}"/>"/></td>
				<th>公文编号</th>
				<td><input type="text" readonly="readonly" value="${ReceivedDocument.documentNo}"/></td>
			</tr>
			<tr>
				<th>公文类型</th>
				<td><input type="text" readonly="readonly" value="<hs:v dicName="DOC_TYPE" code="${ReceivedDocument.documentType}"/>"></td>
				<th>公文保密</th>
				<td><input type="text" readonly="readonly" value='<hs:v dicName="BOOLEAN_TYPE" code="${ReceivedDocument.isSecret}"/>'></td>
			</tr>
			<tr>
				<th>标题</th>
				<td colspan="4"><input style="width: 79%" type="text" readonly="readonly" value="${ReceivedDocument.title}"/></td>
			</tr>
			<tr>
				<th>内容</th>
				<td colspan="4">${ReceivedDocument.content}</td>
			</tr>
		</tbody>
	</table>
</form>
<div style="margin-left:100px;text-align: left;">
	<table>
		<tr>
			<th style="width: 50px;vertical-align: top;">附件</th>
			<td>
				<c:if test="${not empty attachmentList}">
					<c:forEach var="attachment" items="${attachmentList}">
						${attachment.originName}&nbsp;&nbsp;<input class="button_download" onclick="file.download(${attachment.id})" value="下 载" type="button" /><br/>
					</c:forEach>
				</c:if>
			</td>
		</tr>
	</table>
</div>