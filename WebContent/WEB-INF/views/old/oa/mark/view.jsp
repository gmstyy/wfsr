<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>

<form id="detailFormId" name="detailForm" action="" method="post">	
<table>
     <tr >
			<th style="text-align:center;height:30px;">${name}</th>		
	  </tr>
</table>
<input type="text" value="${mark.id}" id="id" name="id" style="display:none;"/>

<fieldset style="margin:0 10px 5px 10px;">
        <legend>考核信息</legend>
        <table style="margin:0 0 0 20px;">	
           <tr>
					<th style="width:80px;margin:0 0 0 20px;">完成状态</th>
					<td style="width:80px;"><hs:v dicName="ASSESS_STATUS" code="${mark.status}"/></td>
						
					<th style="width:60px;">考评人</th>
					<td style="width:80px;">${mark.operatorName}</td>
					
					<th style="width:60px;">被考评人</th>
					<td style="width:80px;">${mark.targetName}</td>
					
					<th style="width:40px;">满分</th>
					<td style="width:80px;">${totalScore}</td>
					
					<th style="width:80px;">评分时间</th>
					<td style="width:200px;">${mark.markTime}</td>

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
				<c:forEach var="items" items="${mark.assessMarkItems}">
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
					<td>${mark.score}</td>
				</tr>		
			</tbody>		
		</table>
	 </fieldset>
	 
	
</form>
<script type="text/javascript">


/* 	
	$('.items_score').keyup(function () {
		
		});
 */
</script>
