<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<table class="edittable appExtend" id="appRadiateEquList">
	<tr>
		<th colspan="7">填加射线装置<a class="option_add" onclick="addRow('appRadiateEquList','appRadiateEquTemplate');"></a></th>
	</tr>
	<tbody id="appRadiateEquTemplate" style="display: none">
	<tr>
		<th>装置名称</th>
		<td><input type='text' id='deviceName' name='deviceName' maxlength='50' /></td>
		<th>型号</th>
		<td><input type='text' id='model' name='model' maxlength='30' /></td>
		<th>生产厂家</th>
		<td><input type='text' id='manufacturers' name='manufacturers' maxlength='200' /></td>
	</tr>
	<tr>
		<th>设备编号</th>
		<td><input type='text' id='equipmentNo' name='equipmentNo' maxlength='30' /></td>
		<th>主要参数</th>
		<td><input type='text' id='mainParameter' name='mainParameter' maxlength='20' /></td>
		<th>所在场所</th>
		<td><input type='text' id='location' name='location' maxlength='100' /></td>
		<th><a title="删除" href="javascript:void(0);" class="option_del" onclick="deleteItem($(this).parents(('tbody')).eq(0),'appRadiateEquDelIds');"></a></th>
	</tr>
	</tbody>
	<c:forEach var="appRadiateEqu" items="${app.appRadiateEquList}" varStatus="status">
		<tbody class='detailList'>

		<tr>
			<th>装置名称</th>
			<td><input type='text' value='${appRadiateEqu.deviceName}' id='deviceName' name='deviceName' maxlength='50' /></td>
			<th>型号</th>
			<td><input type='text' value='${appRadiateEqu.model}' id='model' name='model' maxlength='30' /></td>
			<th>生产厂家</th>
			<td><input type='text' value='${appRadiateEqu.manufacturers}' id='manufacturers' name='manufacturers' maxlength='200' /></td>
		</tr>
		<tr>
			<th>设备编号</th>
			<td><input type='text' value='${appRadiateEqu.equipmentNo}' id='equipmentNo' name='equipmentNo' maxlength='30' /></td>
			<th>主要参数</th>
			<td><input type='text' value='${appRadiateEqu.mainParameter}' id='mainParameter' name='mainParameter' maxlength='20' /></td>
			<th>所在场所</th>
			<td><input type='text' value='${appRadiateEqu.location}' id='location' name='location' maxlength='100' /></td>
			<th><input type="hidden" name='id' value="${appRadiateEqu.id}"> <a title="删除" href="javascript:void(0);" class="option_del"
			                                                                   onclick="deleteItem($(this).parents(('tbody')).eq(0),'appRadiateEquDelIds','${appRadiateEqu.id}');"></a></th>
		</tr>
		</tbody>
	</c:forEach>
</table>
<table class="edittable appExtend" id="appRadiateSealIsotopeList">
	<tr>
		<th colspan="7">填加密封型放射性同位素<a class="option_add" onclick="addRow('appRadiateSealIsotopeList','appRadiateSealIsotopeTemplate');"></a></th>
	</tr>
	<tbody id="appRadiateSealIsotopeTemplate" style="display: none">
	<tr>
		<th>核素名称</th>
		<td><input type='text' id='nucleinName' name='nucleinName' maxlength='50' /></td>
		<th>活度(Bq)</th>
		<td><input type='text' id='activity' name='activity' maxlength='10' /></td>
		<th>活度测量日期</th>
		<td><tag:dateInput id='activityMeasureDatetime' name='activityMeasureDatetime' /></td>
	</tr>
	<tr>
		<th>生产厂家</th>
		<td><input type='text' id='manufacturers' name='manufacturers' maxlength='200' /></td>
		<th>所在场所</th>
		<td><input type='text' id='location' name='location' maxlength='100' /></td>
		<th><a title="删除" href="javascript:void(0);" class="option_del" onclick="deleteItem($(this).parents(('tbody')).eq(0),'appRadiateSealIsotopeDelIds');"></a></th>
	</tr>
	</tbody>
	<tbody class='detailList'>
	<c:forEach var="appRadiateSealIsotope" items="${app.appRadiateSealIsotopeList}" varStatus="status">
		<tr>
			<th>核素名称</th>
			<td><input type='text' value='${appRadiateSealIsotope.nucleinName}' id='nucleinName' name='nucleinName' maxlength='50' /></td>
			<th>活度(Bq)</th>
			<td><input type='text' value='${appRadiateSealIsotope.activity}' id='activity' name='activity' maxlength='10' /></td>
			<th>活度测量日期</th>
			<td><tag:dateInput date='${appRadiateSealIsotope.activityMeasureDatetime}' id='activityMeasureDatetime' name='activityMeasureDatetime' /></td>
		</tr>
		<tr>
			<th>生产厂家</th>
			<td><input type='text' value='${appRadiateSealIsotope.manufacturers}' id='manufacturers' name='manufacturers' maxlength='200' /></td>
			<th>所在场所</th>
			<td><input type='text' value='${appRadiateSealIsotope.location}' id='location' name='location' maxlength='100' /></td>
			<th><input type="hidden" name='id' value="${appRadiateSealIsotope.id}"> <a title="删除" href="javascript:void(0);" class="option_del"
			                                                                           onclick="deleteItem($(this).parents(('tbody')).eq(0),'appRadiateSealIsotopeDelIds','${appRadiateSealIsotope.id}');"></a></th>
		</tr>
	</c:forEach>
	</tbody>
</table>
<table class="edittable appExtend" id="appRadiateUnsealIsotopeList">
	<tr>
		<th colspan="7">填加非密封型放射性同位素<a class="option_add" onclick="addRow('appRadiateUnsealIsotopeList','appRadiateUnsealIsotopeTemplate');"></a></th>
	</tr>
	<tbody id="appRadiateUnsealIsotopeTemplate" style="display: none">
	<tr>
		<th>核素名称</th>
		<td><input type='text' id='nucleinName' name='nucleinName' maxlength='50' /></td>
		<th>用途</th>
		<td><input type='text' id='purpose' name='purpose' maxlength='30' /></td>
		<th>物理状态</th>
		<td><input type='text' id='physicalState' name='physicalState' maxlength='10' /></td>
	</tr>
	<tr>
		<th>最大年操作量(Bq)</th>
		<td><input type='text' id='maxOperationYear' name='maxOperationYear' maxlength='20' /></td>
		<th>最大日操作量(Bq)</th>
		<td><input type='text' id='maxOperationDay' name='maxOperationDay' maxlength='20' /></td>
		<th>操作场所</th>
		<td><input type='text' id='operationArea' name='operationArea' maxlength='200' /></td>
	</tr>
	<tr>
		<th>工作场所级别</th>
		<td><input type='text' id='operationAreaLevel' name='operationAreaLevel' maxlength='10' /></td>
		<th><a title="删除" href="javascript:void(0);" class="option_del" onclick="deleteItem($(this).parents(('tbody')).eq(0),'appRadiateUnsealIsotopeDelIds');"></a></th>
	</tr>
	</tbody>
	<c:forEach var="appRadiateUnsealIsotope" items="${app.appRadiateUnsealIsotopeList}" varStatus="status">
		<tbody class='detailList'>
		<tr>
			<th>核素名称</th>
			<td><input type='text' value='${appRadiateUnsealIsotope.nucleinName}' id='nucleinName' name='nucleinName' maxlength='50' /></td>
			<th>用途</th>
			<td><input type='text' value='${appRadiateUnsealIsotope.purpose}' id='purpose' name='purpose' maxlength='30' /></td>
			<th>物理状态</th>
			<td><input type='text' value='${appRadiateUnsealIsotope.physicalState}' id='physicalState' name='physicalState' maxlength='10' /></td>
		</tr>
		<tr>
			<th>最大年操作量(Bq)</th>
			<td><input type='text' value='${appRadiateUnsealIsotope.maxOperationYear}' id='maxOperationYear' name='maxOperationYear' maxlength='20' /></td>
			<th>最大日操作量(Bq)</th>
			<td><input type='text' value='${appRadiateUnsealIsotope.maxOperationDay}' id='maxOperationDay' name='maxOperationDay' maxlength='20' /></td>
			<th>操作场所</th>
			<td><input type='text' value='${appRadiateUnsealIsotope.operationArea}' id='operationArea' name='operationArea' maxlength='200' /></td>
		</tr>
		<tr>
			<th>工作场所级别</th>
			<td><input type='text' value='${appRadiateUnsealIsotope.operationAreaLevel}' id='operationAreaLevel' name='operationAreaLevel' maxlength='10' /></td>
			<th><input type="hidden" name='id' value="${appRadiateUnsealIsotope.id}"> <a title="删除" href="javascript:void(0);" class="option_del"
			                                                                             onclick="deleteItem($(this).parents(('tbody')).eq(0),'appRadiateUnsealIsotopeDelIds','${appRadiateUnsealIsotope.id}');"></a></th>
		</tr>
		</tbody>
	</c:forEach>
</table>
<table class="edittable appExtend" id="appRadiateSourceEquList">
	<tr>
		<th colspan="7">填加含密封源装置<a class="option_add" onclick="addRow('appRadiateSourceEquList','appRadiateSourceEquTemplate');"></a></th>
	</tr>
	<tbody id="appRadiateSourceEquTemplate" style="display: none">
	<tr>
		<th>编号</th>
		<td><input type='text' id='nomber' name='nomber' maxlength='30' /></td>
		<th>装置名称</th>
		<td><input type='text' id='deviceName' name='deviceName' maxlength='50' /></td>
		<th>型号</th>
		<td><input type='text' id='model' name='model' maxlength='30' /></td>
	</tr>
	<tr>
		<th>生产厂家</th>
		<td><input type='text' id='manufacturers' name='manufacturers' maxlength='200' /></td>
		<th>核素名称</th>
		<td><input type='text' id='nucleinName' name='nucleinName' maxlength='50' /></td>
		<th>活度(Bq)</th>
		<td><input type='text' id='activity' name='activity' maxlength='10' /></td>
	</tr>
	<tr>
		<th>活度测量日期</th>
		<td><tag:dateInput id='activityMeasureDatetime' name='activityMeasureDatetime' /></td>
		<th>所在场所</th>
		<td><input type='text' id='location' name='location' maxlength='100' /></td>

		<th><a title="删除" href="javascript:void(0);" class="option_del" onclick="deleteItem($(this).parents(('tbody')).eq(0),'appRadiateSourceEquDelIds');"></a></th>
	</tr>
	</tbody>
	<c:forEach var="appRadiateSourceEqu" items="${app.appRadiateSourceEquList}" varStatus="status">
		<tbody class='detailList'>
		<tr>
			<th>编号</th>
			<td><input type='text' value='${appRadiateSourceEqu.nomber}' id='nomber' name='nomber' maxlength='30' /></td>
			<th>装置名称</th>
			<td><input type='text' value='${appRadiateSourceEqu.deviceName}' id='deviceName' name='deviceName' maxlength='50' /></td>
			<th>型号</th>
			<td><input type='text' value='${appRadiateSourceEqu.model}' id='model' name='model' maxlength='30' /></td>
		</tr>
		<tr>
			<th>生产厂家</th>
			<td><input type='text' value='${appRadiateSourceEqu.manufacturers}' id='manufacturers' name='manufacturers' maxlength='200' /></td>
			<th>核素名称</th>
			<td><input type='text' value='${appRadiateSourceEqu.nucleinName}' id='nucleinName' name='nucleinName' maxlength='50' /></td>
			<th>活度(Bq)</th>
			<td><input type='text' value='${appRadiateSourceEqu.activity}' id='activity' name='activity' maxlength='10' /></td>
		</tr>
		<tr>
			<th>活度测量日期</th>
			<td><tag:dateInput date='${appRadiateSourceEqu.activityMeasureDatetime}' id='activityMeasureDatetime' name='activityMeasureDatetime'/></td>
			<th>所在场所</th>
			<td><input type='text' value='${appRadiateSourceEqu.location}' id='location' name='location' maxlength='100' /></td>

			<th><input type="hidden" name='id' value="${appRadiateSourceEqu.id}"> <a title="删除" href="javascript:void(0);" class="option_del"
			                                                                         onclick="deleteItem($(this).parents(('tbody')).eq(0),'appRadiateSourceEquDelIds','${appRadiateSourceEqu.id}');"></a></th>
		</tr>
		</tbody>
	</c:forEach>
</table>