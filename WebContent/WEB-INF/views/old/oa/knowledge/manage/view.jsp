<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h1>${knowledge.title}</h1>
<div style="text-align: left;margin-left: 100px;margin-right: 100px">${knowledge.content}</div>
<div style="text-align: left;margin-left: 100px;margin-right: 100px">
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