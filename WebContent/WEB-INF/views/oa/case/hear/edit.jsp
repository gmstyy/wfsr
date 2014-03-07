<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>

<form id="caseHearDetailFormId" name="caseHearDetailForm" action="" method="post">
	<input type="hidden" value="${entity.id}" name="id" />
	<table class="edittable">
		<colgroup>
			<col style="width: 150px;" />
			<col />
		</colgroup>
		<tbody>			
			<tr>
				<th>当事人：</th>
				<td>${entity.casePlace}</td>
			</tr>						
			<tr>
				<th>委托代理人</th>
				<td><input type="text" name="hearAgent" style="width:78.5%;"/></td>	
			</tr>						
			<tr>
				<th>听证员</th>				
				<td><input type="text" name="hearPersons" style="width:78.5%;"/></td>				
			</tr>
			<tr>
				<th>听证主持人</th>
				<td>
					<input type="text" id="usersName" name="usersName" style="width:78.5%;"/>
					<input type="hidden" id="users" name="users" value="${users}" />
				</td>
			</tr>
			<tr>
				<th>书记员</th>
				<td>
					<input type="text" id="usersName1" name="usersName1" style="width:78.5%;"/>
					<input type="hidden" id="users1" name="users1" value="${users}" />
				</td>
			</tr>	
			<tr>
				<th>听证方式</th>
				<td>					
					<hs:dic dicName="HEAR_METHOD" name="hearMethod" defalt="1" type="radio"></hs:dic>
				</td>
			</tr>														
			<tr>
				<th>听证地点</th>
				<td><input type="text" name="hearAddress" style="width:78.5%;"/></td>	
			</tr>	
			<tr>
				<th>听证日期<span class="must_field">*</span></th>
				<td>
					<tag:dateInput onlypast="false" name="hearDate"/>
				</td>
			</tr>
			<tr>
				<th>听证时间</th>
				<td>
					<input type="text" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'H:mm'})" class="Wdate" name="hearStartTime"/>~<input type="text" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'H:mm'})" class="Wdate" name="hearEndTime"/>
				</td>
			</tr>						
			<tr>
				<th>听证记录</th>				
				<td><textarea rows="3" name="hearRecord" maxlength="500" style="width:78.5%"></textarea></td>				
			</tr>																		
		</tbody>			
	</table>
</form>
<script type="text/javascript">
	var dicEmployee1 = new dictionary("employeeTree", "usersName", {codeCtrlId:'users', dicTitle : "听证主持人", orgId : "${orgId}", dynamic : false });
	var userList1 = [];
	dicEmployee1.setSelectedItems(userList1);
	
	var dicEmployee2 = new dictionary("employeeTree", "usersName1", {codeCtrlId:'users1', dicTitle : "书记员", orgId : "${orgId}", dynamic : false });
	var userList2 = [];
	dicEmployee2.setSelectedItems(userList2);
</script>