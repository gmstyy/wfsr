<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<fieldset id="appMaterialList">
	<div class="title">材料</div>
	<c:forEach var="appMaterial" items="${appMaterialDic}" varStatus="groupStatus">
		<div class="appMaterial">
			<c:choose>
				<c:when test="${appMaterialMap[appMaterial.key]!=null}">
					<input readonly="readonly" type="checkbox" checked='checked' name="materialCode" class="InputCheck"
						value="${appMaterial.key}" />
							${appMaterialMap[appMaterial.key].name}
				</c:when>
				<c:otherwise>
					<input readonly="readonly" type="checkbox" name="materialCode" class="InputCheck" value="${appMaterial.key}" />
							${appMaterial.value.value}

				</c:otherwise>
			</c:choose>
			${appMaterialMap[appMaterial.key].pageCount}页
		</div>
	</c:forEach>
	<c:forEach var="appMaterial" items="${otherAppMaterialList}" varStatus="groupStatus">
		<div class="appMaterial">
			${appMaterial.name}  ${appMaterial.pageCount}页
		</div>
	</c:forEach>
</fieldset>