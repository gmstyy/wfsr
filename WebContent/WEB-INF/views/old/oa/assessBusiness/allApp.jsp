<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>

<form id="detailFormId" name="detailForm" action="" method="post">
		<table>
		<tr>
		<th style="text-align: center;">贵州卫生监督<input type="text" class="date" name="filterData" value="${dataStr}" style="display:none;"/>业务绩效考核统计</th>
	     <th style="text-align: center;"><input type="text" class="date" name="detailItemsName" value="${detailItemsName}" style="display:;"/></th>
	    </tr>
		</table> 
		<table style="text-align:center;">	      
			<colgroup>
			
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
			</colgroup>
			<thead   class="repeattable">
				
				<tr>
					<th>实际应发放</th>
					<th>发放</th>
					<th>发放率(%)</th>
					<th>单次未发放扣分分值</th>
					<th>实际扣分</th>
	           </tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class="list" name="list" value="${list.get(0)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(1)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(2)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(3)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(4)}"/></td>
				</tr>	
			</tbody>		
		</table>
	   <table style="text-align:center;">	          
			<colgroup>
			
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
			</colgroup>
			<thead   class="repeattable">
				<tr>
					<th>实际应备案</th>
					<th>备案</th>
					<th>备案率(%)</th>
					<th>单次未备案扣分分值</th>
					<th>实际扣分</th>
	           </tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class="list" name="list" value="${list.get(5)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(6)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(7)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(8)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(9)}"/></td>
				</tr>	
			</tbody>		
		</table>
		<table style="text-align:center;">	   	      
			<colgroup>
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
			</colgroup>
			<thead   class="repeattable">
				<tr>
					<th>实际应受理</th>
					<th>受理</th>
					<th>受理率(%)</th>
					<th>单次未受理扣分分值</th>
					<th>实际扣分</th>
	           </tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class="list" name="list" value="${list.get(10)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(11)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(12)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(13)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(14)}"/></td>
				</tr>	
			</tbody>		
		</table> 
	<%-- 	<table style="text-align:center;">	   	      
			<colgroup>
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
			</colgroup>
			<thead   class="repeattable">
				<tr>
					<th>实际应受理</th>
					<th>受理</th>
					<th>受理率(%)</th>
					<th>单次未受理扣分分值</th>
					<th>实际扣分</th>
	           </tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class="list" name="list" value="${list.get(15)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(16)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(17)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(18)}"/></td>
					<td><input type="text" class="list" name="list" value="${list.get(19)}"/></td>
				</tr>	
			</tbody>		
		</table>  --%>

</form>


