<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<table id="learningList" class="edittable">
	<tr>
		<th colspan="7">添加专业学习及培训简历<a class="option_add" onclick="addRow('learningList','learningTemplate')"></a></th>
	</tr>
	<tbody id="learningTemplate" class="detailList" style="display: none">
	<tr>
		<th>起止时间</th>
		<td colspan="5"><tag:dateInput name="beginTime" /> ~ <tag:dateInput name="endTime" /></td>
	</tr>
	<tr>
		<th>学校及系、专业或培训
			班名称(举办单位)</th>
		<td colspan="5"><input type='text' name='hostUnits' maxlength='100' style="width: 600px"/></td>
	</tr>
	<tr>
		<th>毕业</th>
		<td><hs:dic dicName="GRADUATION_TYPE" name="graduationType"/></td>
		<th>学历</th>
		<td><hs:dic dicName="EDUCATION" name="education"/></td>
		<th>学位证明人</th>
		<td><input type='text' name='degreeReferences' maxlength='50'/></td>
		<th><a title="删除" href="javascript:void(0);" class="option_del" onclick="deleteItem($(this).parents(('tbody')).eq(0),'learningDelIds');"></a></th>
	</tr>
	</tbody>
	<c:forEach var="learning" items="${app.learningList}" varStatus="status">
		<tbody class="detailList">
		<tr>
			<th>起止时间</th>
			<td colspan="5"><tag:dateInput name="beginTime" date="${learning.beginTime}" /> ~ <tag:dateInput name="endTime" date="${learning.endTime}" /></td>
		</tr>
		<tr>
			<th>学校及系、专业或培训
				班名称(举办单位)</th>
			<td colspan="5"><input type='text' name='hostUnits' value="${learning.hostUnits}" maxlength='100' style="width: 600px"/></td>
		</tr>
		<tr>
			<th>毕业</th>
			<td><hs:dic dicName="GRADUATION_TYPE" defalt="${learning.graduationType}" name="graduationType"/></td>
			<th>学历</th>
			<td><hs:dic dicName="EDUCATION" name="education" defalt="${learning.education}"/></td>
			<th>学位证明人</th>
			<td><input type='text' name='degreeReferences' value="${learning.degreeReferences}" maxlength='50'/></td>
			<th>
				<input type="hidden" name='id' value="${learning.id}">
				<a title="删除" href="javascript:void(0);" class="option_del"
				   onclick="deleteItem($(this).parents(('tbody')).eq(0),'learningDelIds','${learning.id}');"></a>
			</th>
		</tr>
		</tbody>
	</c:forEach>
</table>
<table id="workingList" class="edittable">
	<tr>
		<th colspan="7">添加从事职业病防治、诊疗等相关工作经历<a class="option_add" onclick="addRow('workingList','workingTemplate')"></a></th>
	</tr>
	<tbody id="workingTemplate" style="display: none">
	<tr>
		<th>起止时间</th>
		<td colspan="5"><tag:dateInput name="beginTime" /> ~ <tag:dateInput name="endTime" /></td>
	</tr>
	<tr>
		<th>单位</th>
		<td colspan="5"><input type='text' name='unit' maxlength='100' style="width: 600px"/></td>
	</tr>
	<tr>
		<th>技术职务</th>
		<td><input type="text" name="technicalPosition" maxlength="100"/></td>
		<th>从事何专业技术工作</th>
		<td><input type="text" name="jobMajor" maxlength="100"/></td>
		<th>证明人</th>
		<td><input type='text' name='references' maxlength='50'/></td>
		<th><a title="删除" href="javascript:void(0);" class="option_del" onclick="deleteItem($(this).parents(('tbody')).eq(0),'workingDelIds');"></a></th>
	</tr>
	</tbody>
	<c:forEach var="working" items="${app.workingList}" varStatus="status">
		<tbody>
		<tr>
			<th>起止时间</th>
			<td colspan="5"><tag:dateInput name="beginTime" date="${working.beginTime}" /> ~ <tag:dateInput name="endTime" date="${working.endTime}" /></td>
		</tr>
		<tr>
			<th>单位</th>
			<td colspan="5"><input type='text' name='unit' value="${working.unit}" maxlength='100' style="width: 600px"/></td>
		</tr>
		<tr>
			<th>技术职务</th>
			<td><input type="text" name="technicalPosition" value="${working.technicalPosition}" maxlength="100"/></td>
			<th>从事何专业技术工作</th>
			<td><input type="text" name="jobMajor" value="${working.jobMajor}" maxlength="100"/></td>
			<th>证明人</th>
			<td><input type='text' name='references' value="${working.references}" maxlength='50'/></td>
			<th>
				<input type="hidden" name='id' value="${working.id}">
				<a title="删除" href="javascript:void(0);" class="option_del"
				   onclick="deleteItem($(this).parents(('tbody')).eq(0),'workingDelIds','${working.id}');"></a>
			</th>
		</tr>
		</tbody>
	</c:forEach>
</table>