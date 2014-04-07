<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>

<form id="caseHearDetailFormId" name="caseHearDetailForm" action="" method="post">
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
				<td><input type="text" name="hearAgent" value="${entity.hearAgent}" style="width:78.5%;"/></td>	
			</tr>						
			<tr>
				<th>听证员</th>				
				<td>
					<input type="text" name="hearPersons" value="${entity.hearPersons}"  style="width:78.5%;"/>
				</td>			
			</tr>
			<tr>
				<th>听证主持人</th>
				<td>
					<input type="text" name="usersName" value="${entity.usersName}"  style="width:78.5%;"/>
				</td>
			</tr>
			<tr>
				<th>书记员</th>
				<td>
					<input type="text" name="usersName1" value="${entity.usersName1}"  style="width:78.5%;"/>
				</td>
			</tr>
			<tr>
				<th>听证方式</th>
				<td>					
					<hs:dic dicName="HEAR_METHOD" name="hearMethod" defalt="${entity.hearMethod}" type="radio"></hs:dic>
				</td>
			</tr>															
			<tr>
				<th>听证地点</th>
				<td><input type="text" name="hearAddress" value="${entity.hearAddress}" style="width:78.5%;"/></td>	
			</tr>	
			<tr>
				<th>听证日期<span class="must_field">*</span></th>
				<td>
					<tag:dateInput onlypast="false" name="hearDate" date="${entity.hearDate}"/>
				</td>
			</tr>
			<tr>
				<th>听证时间</th>
				<td>
					<input type="text" value="${entity.hearStartTime}"/>~<input type="text" value="${entity.hearEndTime}"/>
				</td>
			</tr>						
			<tr>
				<th>听证记录</th>				
				<td><textarea rows="3" name="hearRecord" maxlength="500" style="width:78.5%">${entity.hearRecord}</textarea></td>				
			</tr>																		
		</tbody>			
	</table>
</form>