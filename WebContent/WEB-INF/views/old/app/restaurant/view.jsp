<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editFormId" action="" method="post">
	<table class="edittable">
		<colgroup>
			<col style="width: 120px;" />
			<col />
			<col style="width: 120px;" />
			<col />
		</colgroup>
		<tbody>
		<tr>
			<th>申请项目<span class="must_field">*</span></th>
			<td><input type='text' value='${app.applyItem}' id='applyItem' name='applyItem' maxlength='200' readonly="readonly" /></td>
			<th>餐饮类型（规模）<span class="must_field">*</span></th>
			<td><hs:dic dicName='RESTAURANT_SCALE' defalt="${app.businessType}" id='businessType' name='businessType' disabled="true"/></td>
		</tr>
		<tr>
			<th>固定资产(万元)</th>
			<td><input type='text' value='${app.fixedAssets}' id='fixedAssets' name='fixedAssets' maxlength='10' readonly="readonly" /></td></tr>
		<tr>
			<th>职工人数</th>
			<td><input type='text' value='${app.employeeCount}' id='employeeCount' name='employeeCount' maxlength='9' readonly="readonly" /></td>
			<th>应体检人数</th>
			<td><input type='text' value='${app.examPersonCount}' id='examPersonCount' name='examPersonCount' maxlength='9' readonly="readonly" /></td>
		</tr>
		<tr>
			<th>业主</th>
			<td><input type='text' value='${app.owner}' id='owner' name='owner' maxlength='30' readonly="readonly" /></td>
			<th>业主手机</th>
			<td><input type='text' value='${app.ownerTel}' id='ownerTel' name='ownerTel' maxlength='30' readonly="readonly" /></td>
		</tr>
		<tr>
			<th>负责人</th>
			<td><input type='text' value='${app.chargePerson}' id='chargePerson' name='chargePerson' maxlength='30' readonly="readonly" /></td>
			<th>负责人手机</th>
			<td><input type='text' value='${app.chargePersonTel}' id='chargePersonTel' name='chargePersonTel' maxlength='30' readonly="readonly" /></td>
		</tr>
		<tr>
			<th>委托代理人</th>
			<td><input type='text' value='${app.delegate}' id='delegate' name='delegate' maxlength='50' readonly="readonly" /></td>
			<th>委托代理人手机</th>
			<td><input type='text' value='${app.delegateTel}' id='delegateTel' name='delegateTel' maxlength='30' readonly="readonly" /></td>
		</tr>
		<tr>
			<th>传真</th>
			<td><input type='text' value='${app.fax}' id='fax' name='fax' maxlength='20' readonly="readonly" /></td>
			<th>其他联系方式</th>
			<td><input type='text' value='${app.otherContact}' id='otherContact' name='otherContact' maxlength='50' readonly="readonly" /></td>
		</tr>
		<tr>
			<th>就餐座位数</th>
			<td><input type='text' value='${app.seatsCount}' id='seatsCount' name='seatsCount' maxlength='10' readonly="readonly" /></td>
			<th>加工经营场所面积</th>
			<td><input type='text' value='${app.area}' id='area' name='area' maxlength='10' readonly="readonly" /></td>
		</tr>
		<tr>
			<th>备注</th>
			<td colspan="3"><textarea name="remark" id="remark" cols="70" rows="5" readonly="readonly">${app.remark}</textarea></td>
		</tr>
		</tbody>
	</table>
</form>
