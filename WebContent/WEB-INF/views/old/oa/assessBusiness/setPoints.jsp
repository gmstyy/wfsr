<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.founder.hs.constant.HSDV"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>

<form id="detailFormId" name="detailForm" action="" method="post">
<input type="text" value="${business}" id="business" name="business" style="display:none;"/>	
	<table style="width:300px;height:40px;border: solid 1px #CCC;background-color:#E8E8E8;">
	   <tr>
					<th style="150px;">业务详细项</th>
					<th style="150px;">单项未完成扣分分值</th>
	  </tr>
	</table>
	
		<table style="text-align:center;float:left;">    
			<c:forEach var="items" items="${itemsList}">
				<tr>
				    <td><input style="height:24px;text-align:center;border:none;width:100px;" type="text" name="items" class="items" value="${items}"/></td>				
				</tr>
				</c:forEach>		
		</table>
		<table style="text-align:center;float:left;margin:0 0 0 35px;">		        
			<c:forEach var="points" items="${pointsList}">
				<tr>
				    <td><input style="width:100px;" type="text" name="points"  class="points"  value="${points}"/></td>	
							
				</tr>
			</c:forEach>		
		</table>
	
</form>
<script type="text/javascript">

</script>
