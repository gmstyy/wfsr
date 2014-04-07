<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>

<form id="detailFormId" name="detailForm" action="" method="post">
<table>
     <tr >
			<th style="text-align:center;height:30px;">${name}</th>		
	  </tr>
</table>
<input type="text" value="${result.id}" id="id" name="id" style="display:none;"/>
	<fieldset style="margin:0 10px 5px 10px;">
        <legend>考核信息</legend>
        <table style="margin:0 0 0 20px;">	
           <tr>
					<th style="width:60px;margin:0 0 0 20px;">完成状态</th>
					<td style="width:100px;"><hs:v dicName="ASSESS_STATUS" code="${result.status}"/></td>
						
					<th style="width:60px;">考核名称</th>
					<td style="width:100px;">${result.name}</td>
					
					<th style="width:60px;">被考评人</th>
					<td style="width:100px;">${result.targetName}</td>
					
					<th style="width:100px;">被考评人工号</th>
					<td style="width:100px;">${result.targetStaffid}</td>
					
					<th style="width:60px;">满分</th>
					<td style="width:100px;">${totalScore}</td>

	       </tr>
        </table>	
        
	</fieldset>
	
	 <fieldset style="margin:15px 10px 5px 10px;">
        <legend>指标详细项</legend>
		<table style="text-align:center;">		        
			<thead style="border: solid 1px #CCC;">			
				<tr>
					<th style="width:100px;">序号</th>
					<th style="width:300px;">项目名称</th>
					<th style="width:300px;">评分规则</th>
					<th style="width:120px;">具体项分值</th>
					<th style="width:120px;">得分</th>
				</tr>
			</thead>
			<tbody>       
				<c:forEach var="items" items="${result.assessResultItems}">
				<tr>
					<td>${items.rankNumber}</td>
					<td>${items.name}</td>
					<td>${items.markingRule}</td>
					<td>${items.maxScore}</td>
					<td>${items.score}</td>				
				</tr>
				</c:forEach>	
				
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>最终得分</td>
					<td>${result.totalScore}</td>
				</tr>		
			</tbody>		
		</table>
	 </fieldset>
	
	 <fieldset style="margin:15px 10px 5px 10px;">
        <legend>附加分细项</legend>
		<table  style="padding:0 0 0 10px;">	 
		    	        		
			    <tr>
			     <th>附加分项:</th>		
				 <td>${extraStr}</td>	
				</tr>
				<tr>
				   <th>附加分项:</th>		
				   <td>${extraTotal}</td>	
				</tr>	
		</table>
	 </fieldset>
 <table style="text-align:right;height:30px;">
     <tr>
			<th>总得分:${finalTotal}</th>		
	  </tr>
</table>

</form>
<script type="text/javascript">


/* 	
	$('.items_score').keyup(function () {
		
		});
 */
</script>
