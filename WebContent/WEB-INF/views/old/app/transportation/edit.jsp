<%--@elvariable id="app" type="com.founder.oa.entity.business.AppTransportation"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
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
		<td><input type="text" name="applyItem" value="${app.applyItem}"/></td>
	</tr>
	<tr>
		<th>菌（毒）种或样本名称<span class="must_field">*</span></th>
		<td><input type='text' value='${app.name}' id='name' name='name' maxlength='50'/></td>
		<th>英文名称</th>
		<td><input type='text' value='${app.englishName}' id='englishName' name='englishName' maxlength='100'/></td>
	</tr>
	<tr>
		<th>样品分类/UN编号<span class="must_field">*</span></th>
		<td><input type='text' value='${app.type}' id='sampleType' name='sampleType' maxlength='30'/></td>
		<th>样品状态</th>
		<td><input type='text' value='${app.sampleStatus}' id='sampleStatus' name='sampleStatus' maxlength='200'/></td>
	</tr>
	<tr>
		<th>每包装容量</th>
		<td><input type='text' value='${app.eachPackCapacity}' id='eachPackCapacity' name='eachPackCapacity'
		           maxlength='100'/></td>
		<th>包装数量</th>
		<td><input type='text' value='${app.packageQuantity}' id='packageQuantity' name='packageQuantity'
		           maxlength='11'/></td>
	</tr>
	<tr>
		<th>来源<span class="must_field">*</span></th>
		<td><input type='text' value='${app.source}' id='source' name='source' maxlength='200'/></td>
		<th>运输目的<span class="must_field">*</span></th>
		<td><input type='text' value='${app.transportPurpose}' id='transportPurpose' name='transportPurpose'
		           maxlength='200'/></td>
	</tr>
	<tr>
		<th>主容器</th>
		<td><input type='text' value='${app.mainContainer}' id='mainContainer' name='mainContainer' maxlength='50'/>
		</td>
		<th>辅助容器</th>
		<td><input type='text' value='${app.secondaryContainer}' id='secondaryContainer' name='secondaryContainer'
		           maxlength='50'/></td>
	</tr>
	<tr>
		<th>填充物</th>
		<td><input type='text' value='${app.filler}' id='filler' name='filler' maxlength='50'/></td>
		<th>外包装</th>
		<td><input type='text' value='${app.outerPacking}' id='outerPacking' name='outerPacking' maxlength='50'/>
		</td>
	</tr>
	<tr>
		<th>制冷剂名称</th>
		<td><input type='text' value='${app.refrigerantName}' id='refrigerantName' name='refrigerantName'
		           maxlength='50'/></td>
		<th>制冷剂数量</th>
		<td><input type='text' value='${app.refrigerantNumber }' id='refrigerantNumber ' name='refrigerantNumber'
		           maxlength='11'/></td>
	</tr>
	<tr>
		<th>拆检注意事项</th>
		<td colspan="3"><input type='text' value='${app.overhaulMattersAttention}' id='overhaulMattersAttention'
		           name='overhaulMattersAttention' maxlength='200' style="width: 80%"/></td>
	</tr>
	<tr>
		<th>运输起点</th>
		<td><input type='text' value='${app.transportStartingPoint}' id='transportStartingPoint'
		           name='transportStartingPoint' maxlength='50'/></td>
		<th>运输终点</th>
		<td><input type='text' value='${app.transportEndingPoint}' id='transportEndingPoint'
		           name='transportEndingPoint' maxlength='50'/></td>
	</tr>
	<tr>
		<th>运输开始日期</th>
		<td><tag:dateInput date='${app.transportStartingDate}' id='transportStartingDate'
		                   name='transportStartingDate'/></td>
		<th>运输结束日期</th>
		<td><tag:dateInput date='${app.transportEndingDate}' id='transportEndingDate'
		                   name='transportEndingDate' /></td>
	</tr>
	<tr>
		<th>运输次数</th>
		<td><input type='text' value='${app.deliveryTimes}' id='deliveryTimes' name='deliveryTimes' maxlength='11'/>
		</td>
		<th>运输方式</th>
		<td><input type='text' value='${app.transportType}' id='transportType' name='transportType' maxlength='50'/>
	</tr>
	<tr>
		<th>接收单位名称</th>
		<td><input type='text' value='${app.receivesUnitName}' id='receivesUnitName' name='receivesUnitName'
		           maxlength='50'/></td>
	</tr>
	<tr>
		<th>接收单位地址</th>
		<td colspan="3"><input type='text' value='${app.receivesUnitAddress}' id='receivesUnitAddress'
		           name='receivesUnitAddress' maxlength='200' style="width: 80%"/></td>
	</tr>
	<tr>
		<th>接收单位负责人</th>
		<td><input type='text' value='${app.receivesUnitHead}' id='receivesUnitHead' name='receivesUnitHead'
		           maxlength='50'/></td>
		<th>接收单位联系电话</th>
		<td><input type='text' value='${app.receivesUnitPhone}' id='receivesUnitPhone' name='receivesUnitPhone'
		           maxlength='20'/></td>
	</tr>
	<tr>
		<th>运输工作负责人</th>
		<td><input type='text' value='${app.transportHead}' id='transportHead' name='transportHead' maxlength='50'/>
		</td>
		<th>运输负责人职务或职称</th>
		<td><input type='text' value='${app.headPosition}' id='headPosition' name='headPosition' maxlength='50'/>
		</td>
	</tr>
	<tr>
		<th>运输负责人电话</th>
		<td><input type='text' value='${app.headPhone}' id='headPhone' name='headPhone' maxlength='30'/></td>
	</tr>
	</tbody>
</table>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/oa/app.js"></script>
<script type="text/javascript">
	var getAppParams = function(formData) {
		formData.licenseMaterialList = appMaterialCheckedData("appMaterialList", ".appMaterial");
		var prms = {};
		prms.json=$.toJSON(formData);
		prms.licenseType=$("#relativeInfoForm #licenseType").val();
		return prms;
	};
</script>