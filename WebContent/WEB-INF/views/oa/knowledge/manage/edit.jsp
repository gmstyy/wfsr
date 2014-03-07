<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editKnowledgeForm" name="editKnowledgeForm" method="post">
	<input type="hidden" id="id" name="id" value="${knowledge.id}"/>
	<input type="hidden" name="orgId" value="${knowledge.orgId}"/>
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;"/>
			<col />
		</colgroup>
		<tbody>
		<tr>
			<th>知识标题<span class="must_field">*</span></th>
			<td><input type="text" name="title" value="${knowledge.title}" style="width: 400px" maxlength="500px"/></td>
		</tr>
		<tr>
			<th>知识类别<span class="must_field">*</span></th>
			<td>
				<div style="position: relative">
					<a href="javascript:void(0);" onclick="showCategoryTree()">选择类别:</a>&nbsp;<span id="categoryChosen">${category.name}</span>
					<div id="chooseCategory" class="chooseFromTree">
						<jsp:include page="categoryTree.jsp"/>
						<input type="hidden" id="editCategoryId" name="categoryId" value="${knowledge.categoryId}"/>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th style="vertical-align: top;">知识内容</th>
			<td>
				<textarea name="content" id="content" cols="70" rows="25">${knowledge.content}</textarea>
				<table style="margin-left:-35px;text-align: left;">
					<tr>
						<th>附件</th>
						<td>
							<input type="file" id="knowledgeUploadFile" name="knowledgeUploadFile" style="width: 300px"/>
							<input class="button_upload" onclick="file.doUploadFile();" value="上 传" type="button" style="width: 50px" />
						</td>
					</tr>
				</table>
				<table id="attachment" style="margin-left:-35px;text-align: left;">
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
			</td>
		</tr>
		</tbody>
	</table>
</form>
<script type="text/javascript">
	file._attId = -1;
	file._attName = '';
	file._isSingal = 'false';
	file._type = 'knowledge';
	file._file = 'knowledgeUploadFile';

	var showCategoryTree = function() {
		$("#chooseCategory").show();
	};
	var confirmCategory = function() {
		$("#chooseCategory").hide();
	};
</script>