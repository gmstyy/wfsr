<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<table class="edittable appExtend" id="appRadiateEquList">
	<tr>
		<th colspan="7">射线装置</th>
	</tr>
	<c:forEach var="appRadiateEqu" items="${app.appRadiateEquList}" varStatus="status">
		<tbody class='detailList'>
		<tr>
			<th>装置名称</th>
			<td><input type='text' value='${appRadiateEqu.deviceName}' id='deviceName' name='deviceName' maxlength='50' readonly="readonly" /></td>
			<th>型号</th>
			<td><input type='text' value='${appRadiateEqu.model}' id='model' name='model' maxlength='30' readonly="readonly" /></td>
			<th>生产厂家</th>
			<td><input type='text' value='${appRadiateEqu.manufacturers}' id='manufacturers' name='manufacturers' maxlength='200' readonly="readonly" /></td>
		</tr>
		<tr>
			<th>设备编号</th>
			<td><input type='text' value='${appRadiateEqu.equipmentNo}' id='equipmentNo' name='equipmentNo' maxlength='30' readonly="readonly" /></td>
			<th>主要参数</th>
			<td><input type='text' value='${appRadiateEqu.mainParameter}' id='mainParameter' name='mainParameter' maxlength='20' readonly="readonly" /></td>
			<th>所在场所</th>
			<td><input type='text' value='${appRadiateEqu.location}' id='location' name='location' maxlength='100' readonly="readonly" /></td>
			<th></th>
		</tr>
		</tbody>
	</c:forEach>
</table>
<table class="edittable appExtend" id="appRadiateSealIsotopeList">
	<tr>
		<th colspan="7">密封型放射性同位素</th>
	</tr>
	<tbody class='detailList'>
	<c:forEach var="appRadiateSealIsotope" items="${app.appRadiateSealIsotopeList}" varStatus="status">
		<tr>
			<th>核素名称</th>
			<td><input type='text' value='${appRadiateSealIsotope.nucleinName}' id='nucleinName' name='nucleinName' maxlength='50' readonly="readonly" /></td>
			<th>活度(Bq)</th>
			<td><input type='text' value='${appRadiateSealIsotope.activity}' id='activity' name='activity' maxlength='10' readonly="readonly" /></td>
			<th>活度测量日期</th>
			<td><tag:dateInput date='${appRadiateSealIsotope.activityMeasureDatetime}' id='activityMeasureDatetime' name='activityMeasureDatetime' disabled="true" /></td>
		</tr>
		<tr>
			<th>生产厂家</th>
			<td><input type='text' value='${appRadiateSealIsotope.manufacturers}' id='manufacturers' name='manufacturers' maxlength='200' readonly="readonly" /></td>
			<th>所在场所</th>
			<td><input type='text' value='${appRadiateSealIsotope.location}' id='location' name='location' maxlength='100' readonly="readonly" /></td>
			<th></th>
		</tr>
	</c:forEach>
	</tbody>
</table>
<table class="edittable appExtend" id="appRadiateUnsealIsotopeList">
	<tr>
		<th colspan="7">非密封型放射性同位素</th>
	</tr>
	<c:forEach var="appRadiateUnsealIsotope" items="${app.appRadiateUnsealIsotopeList}" varStatus="status">
		<tbody class='detailList'>
		<tr>
			<th>核素名称</th>
			<td><input type='text' value='${appRadiateUnsealIsotope.nucleinName}' id='nucleinName' name='nucleinName' maxlength='50' readonly="readonly" /></td>
			<th>用途</th>
			<td><input type='text' value='${appRadiateUnsealIsotope.purpose}' id='purpose' name='purpose' maxlength='30' readonly="readonly" /></td>
			<th>物理状态</th>
			<td><input type='text' value='${appRadiateUnsealIsotope.physicalState}' id='physicalState' name='physicalState' maxlength='10' readonly="readonly" /></td>
		</tr>
		<tr>
			<th>最大年操作量(Bq)</th>
			<td><input type='text' value='${appRadiateUnsealIsotope.maxOperationYear}' id='maxOperationYear' name='maxOperationYear' maxlength='20' readonly="readonly" /></td>
			<th>最大日操作量(Bq)</th>
			<td><input type='text' value='${appRadiateUnsealIsotope.maxOperationDay}' id='maxOperationDay' name='maxOperationDay' maxlength='20' readonly="readonly" /></td>
			<th>操作场所</th>
			<td><input type='text' value='${appRadiateUnsealIsotope.operationArea}' id='operationArea' name='operationArea' maxlength='200' readonly="readonly" /></td>
		</tr>
		<tr>
			<th>工作场所级别</th>
			<td><input type='text' value='${appRadiateUnsealIsotope.operationAreaLevel}' id='operationAreaLevel' name='operationAreaLevel' maxlength='10' readonly="readonly" /></td>
			<th></th>
		</tr>
		</tbody>
	</c:forEach>
</table>
<table class="edittable appExtend" id="appRadiateSourceEquList">
	<tr>
		<th colspan="7">含密封源装置</th>
	</tr>
	<c:forEach var="appRadiateSourceEqu" items="${app.appRadiateSourceEquList}" varStatus="status">
		<tbody class='detailList'>
		<tr>
			<th>编号</th>
			<td><input type='text' value='${appRadiateSourceEqu.nomber}' id='nomber' name='nomber' maxlength='30' readonly="readonly" /></td>
			<th>装置名称</th>
			<td><input type='text' value='${appRadiateSourceEqu.deviceName}' id='deviceName' name='deviceName' maxlength='50' readonly="readonly" /></td>
			<th>型号</th>
			<td><input type='text' value='${appRadiateSourceEqu.model}' id='model' name='model' maxlength='30' readonly="readonly" /></td>
		</tr>
		<tr>
			<th>生产厂家</th>
			<td><input type='text' value='${appRadiateSourceEqu.manufacturers}' id='manufacturers' name='manufacturers' maxlength='200' readonly="readonly" /></td>
			<th>核素名称</th>
			<td><input type='text' value='${appRadiateSourceEqu.nucleinName}' id='nucleinName' name='nucleinName' maxlength='50' readonly="readonly" /></td>
			<th>活度(Bq)</th>
			<td><input type='text' value='${appRadiateSourceEqu.activity}' id='activity' name='activity' maxlength='10' readonly="readonly" /></td>
		</tr>
		<tr>
			<th>活度测量日期</th>
			<td><tag:dateInput date='${appRadiateSourceEqu.activityMeasureDatetime}' id='activityMeasureDatetime' name='activityMeasureDatetime' disabled="true"/></td>
			<th>所在场所</th>
			<td><input type='text' value='${appRadiateSourceEqu.location}' id='location' name='location' maxlength='100' readonly="readonly" /></td>
			<th></th>
		</tr>
		</tbody>
	</c:forEach>
</table>