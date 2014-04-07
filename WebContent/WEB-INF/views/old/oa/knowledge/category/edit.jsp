<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editCategoryForm" name="editCategoryForm" method="post">
	<input type="hidden" name="id" value="${category.id}"/>
	<input type="hidden" name="orgId" value="${category.orgId}"/>
	<table class="edittable">
		<colgroup>
			<col style="width: 20%"/>
			<col style="width: 80%"/>
		</colgroup>
		<tbody>
		<tr>
			<th>名称<span class="must_field">*</span></th>
			<td><input type="text" name="name" value="${category.name}" maxlength="100"/></td>
		</tr>
		<tr>
			<th>级别<span class="must_field">*</span></th>
			<td>
				<select id="categoryLevel" name="categoryLevel" style="width: 100px" onchange="parentCategoryList();">
					<option value="1" ${category.categoryLevel eq 1 ? "selected" : ""}>一级</option>
					<option value="2" ${category.categoryLevel eq 2 ? "selected" : ""}>二级</option>
					<option value="3" ${category.categoryLevel eq 3 ? "selected" : ""}>三级</option>
				</select>
				<span id="parentCategory" style="${category.parentId eq null ? 'display:none' : ''}">
					&nbsp;&nbsp;&nbsp;&nbsp;父类别:
					<select name="parentId" id="parentId">
						<c:forEach var="parent" items="${parentList}">
							<option value="${parent.id}" ${category.parentId eq parent.id ? "selected" : ""}>${parent.name}</option>
						</c:forEach>
					</select>
				</span>
			</td>
		</tr>
		<tr>
			<th>排序号</th>
			<td><input type="text" name="sortNo" value="${category.sortNo}" maxlength="100"/></td>
		</tr>
		</tbody>
	</table>
</form>