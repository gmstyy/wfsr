<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>

<div id="list_container">
	<table class="repeattable">
		<colgroup>
			<col style="width: 50px;">
			<col style="width: 100px;">
			<col style="width: 120px;">
			<col style="width: 150px;">
			<col>
			<col style="width: 80px;">
			<col style="width: 60px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>序号</th>
				<th>任务类别</th>
				<th>场所名称</th>	
				<th>创建日期</th>		
				<th>负责人</th>		
				<th>任务状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<c:forEach items="${taskList}" var="tk" varStatus="status">
		<tr class='<c:choose><c:when test="${status.count % 2 == 0}">row_odd</c:when><c:otherwise>row_even</c:otherwise></c:choose>'>
			<td style="text-align: center;">${status.count}</td>
			<td align="left"><hs:v dicName="TASK_TYPE" code="${tk.taskType}"/></td>
			<td align="left">${tk.place}</td>
			<td><fmt:formatDate value="${tk.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td align="left">${tk.selectUsers}</td>
			<td><hs:v dicName="TASK_STATUS" code="${tk.status}"/></td>
			<td style="text-align: center;">
	 			<div class="option_container">
	 				<a href="javascript:void(0);" title="查看" class="option_view" onclick="viewTaskDeail('${tk.id}');"></a>	
				</div>
			</td>	
		</tr>
		</c:forEach>
	</table>
</div>
