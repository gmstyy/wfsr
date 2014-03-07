<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<table class="edittable">
	<colgroup>
		<col style="width: 100px;" />
		<col />
		<col style="width: 100px;" />
		<col />
	</colgroup>
	<tbody>
	<tr>
		<th>产品名称<span class="must_field">*</span></th>
		<td><input type='text' value='${app.productName}' id='productName' name='productName' maxlength='50' readonly="readonly" /></td>
		<th>产品型号<span class="must_field">*</span></th>
		<td><input type='text' value='${app.productModel}' id='productModel' name='productModel' maxlength='30' readonly="readonly" /></td>
	</tr>
	<tr>
		<th>产品类别<span class="must_field">*</span></th>
		<td><hs:dic dicName='RELATIVE_PERSON_BUSINESS_TYPE' disabled="true" id='businessType' name='businessType' defalt="${app.businessType}" blank="false" value1 = "02"/></td>
		<th>生产企业<span class="must_field">*</span></th>
		<td><input type='text' value='${app.manufacturer}' id='manufacturer' name='manufacturer' maxlength='200' readonly="readonly" /></td>
	</tr>
	<tr>
		<th>产品生产地址<span class="must_field">*</span></th>
		<td><input type='text' value='${app.manufacturerAddress}' id='manufacturerAddress' name='manufacturerAddress' maxlength='200' readonly="readonly" /></td>
		<th>邮编</th>
		<td><input type='text' value='${app.manufacturerZipcode}' id='manufacturerZipcode' name='manufacturerZipcode' maxlength='10' readonly="readonly" /></td>
	</tr>
	<tr>
		<th>传真</th>
		<td><input type='text' value='${app.manufacturerFax}' id='manufacturerFax' name='manufacturerFax' maxlength='20' readonly="readonly" /></td>
		<th>经办人</th>
		<td><input type='text' value='${app.operator}' id='operator' name='operator' maxlength='50' readonly="readonly" /></td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="3"><textarea name="remark" id="remark" cols="60" rows="5" readonly="readonly">${app.remark}</textarea></td>
	</tr>
	</tbody>
</table>