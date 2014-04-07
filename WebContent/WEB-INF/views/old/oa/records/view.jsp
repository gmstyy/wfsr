<%@page import="com.founder.hs.constant.HSDV"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<form id="detailFormId" name="detailForm" action="" method="post">
	<input type="text" value="${id}" name="id" style="display:none;"/>
	
	<table  style="height:40px;border: solid 1px #CCC;background-color:#E8E8E8;">
	   <tr >
	                <th style="width:40px;">
					<th style="width:60px;text-align: center;">完成状态</th>
					<th style="width:300px;">考评人</th>
					<th style="width:350px;">被考评人</th>
					<th style="width:50px;">得分</th>
					<th style="width:100px;">评分时间</th>
	  </tr>
	</table>
		
		<table style="text-align:center;">
		        
			<c:forEach var="mark" items="${mark}" varStatus="status">
			<thead style="border: solid 1px #CCC;background-color:#EBEBEB;">
				
				<tr style="height:35px;">
					<th style="width:35px;text-align:center;">
						<span id="plus${status.index}"  onclick="show(${status.index})" style="cursor: pointer;">+</span> 
						<span id="minus${status.index}"  onclick="hide(${status.index})" style="display: none;cursor: pointer;">-</span> 
						
					</th>
					<%-- <th style="width:10%;">${mark.status}</th> --%>
					<td style="width:65px;"><hs:v dicName="ASSESS_STATUS" code="${mark.status}"/></td>	
					<td style="width:300px;">${mark.operatorName}</td>
					<td style="width:350px;">${mark.targetName}</td>
					<td style="width:50px;">${mark.score}</td>
					<td style="width:100px;">${mark.markTime}</td>
				</tr>
			</thead>
			<tbody id="tbody${status.index}" style="display: none;">
				<tr style="width:900px;">
				    <th style="width:35px;">
					<th style="width:65px;">序号</th>
					<th style="width:300px;">项目名称</th>
					<th style="width:350px;">评分规则</th>
					<th style="width:50px;">满分</th>
					<th style="width:100px;">具体项得分</th>
				</tr>
				<c:forEach var="items" items="${mark.assessMarkItems}">
				<tr>
				    <td></td>
					<td>${items.rankNumber}</td>
					<td>${items.name}</td>
					<td>${items.markingRule}</td>
					<td>${items.maxScore}</td>
					<td>${items.score}</td>
					
				</tr>
				</c:forEach>
			</tbody>
			</c:forEach>
			
		</table>
	
</form>
<script type="text/javascript">

	var show = function(index) {
		$("#plus" + index).hide();
		$("#minus" + index).show();
		$("#tbody" + index).show();
	};

   var hide = function(index) {
		$("#plus" + index).show();
		$("#minus" + index).hide();
		$("#tbody" + index).hide();
	};
	

</script>
