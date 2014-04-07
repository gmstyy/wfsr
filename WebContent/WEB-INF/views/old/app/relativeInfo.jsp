<%--@elvariable id="app" type="com.founder.hs.interf.App"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<input type="hidden" name='id' value="${app.id}">
<input type="hidden" value='${licenseType}' id='licenseType' name='licenseType' />
<input type='hidden' value='${app.orgId}' id='orgId' name='orgId'/>
<input type='hidden' value='${app.relativePersonNum}' id='relativePersonNum' name='relativePersonNum'/>
<input type='hidden' value='${app.status}' id='status' name='status'/>
<input type='hidden' value='${app.licenseNo}' id='licenseNo' name='licenseNo'/>
<input type="hidden" name="validBeginDatetime" value="<fmt:formatDate value='${app.validBeginDatetime}' pattern='yyyy-MM-dd HH:mm:ss'/>">
<input type="hidden" name="validEndDatetime" value="<fmt:formatDate value='${app.validEndDatetime}' pattern='yyyy-MM-dd HH:mm:ss'/>">
<input type="hidden" name="domain" value="${app.domain}">
<input type="hidden" name="applyStatus" value="${app.applyStatus}"/>
<input type="hidden" name="handleStatus" value="${app.handleStatus}"/>
<input type="hidden" name="grantStatus" value="${app.grantStatus}"/>
<input type="hidden" name="recordStatus" value="${app.recordStatus}"/>
<input type="hidden" name="reportStatus" value="${app.reportStatus}"/>
<input type="hidden" name="offStatus" value="${app.offStatus}"/>
<input type="hidden" name="creatorLoginName" value="${app.creatorLoginName}">
<input type="hidden" name="creatorName" value="${app.creatorName}">
<input type="hidden" name="applyDatetime" value="<fmt:formatDate value='${app.applyDatetime}' pattern='yyyy-MM-dd HH:mm:ss'/>">
<input type="hidden" name="applyType" value="${app.applyType}">
<input type="hidden" name="originAppId" value="${app.originAppId}">
<input type="hidden" name="previousAppId" value="${app.previousAppId}">
<input type="hidden" name="dataSource" value="${app.dataSource}">
<hs:dic dicName="RELATIVE_PERSON_BUSINESS_TYPE" value2="${licenseType}" blank="false" id="businessTypea" name="businessTypea" style="display:none"/>
<table class="edittable">
	<colgroup>
		<col style="width: 150px;" />
		<col style="width: 200px;" />
		<col style="width: 150px;" />
		<col />
	</colgroup>
	<tbody>
 	<%--<tr>
		<th>业务类型</th>
		<td colspan="3">
			<hs:dic dicName="RELATIVE_PERSON_BUSINESS_TYPE" defalt="${app.businessTypea}" value2="${licenseType}" blank="false" id="businessTypea" name="businessTypea"/>
			<hs:dic dicName="RELATIVE_PERSON_BUSINESS_TYPE" defalt="${app.businessTypeb}" value3="${licenseType}" id="businessTypeb" name="businessTypeb" onChange="changeBizType()" />
		</td>
	</tr>--%>
	<tr>
		<th>名称（单位/个人）<span class="must_field">*</span></th>
		<td colspan="3"><input type="text" value="${app.applicant}" id="applicant" name="applicant" maxlength="50" style="width:78.5%;"/></td>
	</tr>
	<tr>
		<th>类别<span class="must_field">*</span></th>
		<td><hs:dic dicName="RELATIVE_PERSON_TYPE" defalt="${app.type}" blank="false" id="type" name="type" /></td>
	</tr>
<tr>
		<th>经济类型<span class="must_field">*</span></th>
		<td colspan="3"><input type="hidden" id="ecmcode" name="ecmcode" value="${app.ecmcode}"/></td>
	</tr>
	<tr>
		<th>地址<span class="must_field">*</span></th>
		<td colspan="3"><input type="text" value="${app.address}" id="address" name="address" maxlength="200" style="width:78.5%;" onblur="copyAddress();"/></td>
	</tr>
	<tr>
		<th>注册地址<span class="must_field">*</span></th>
		<td colspan="3"><input type="text" value="${app.regaddr}" id="regaddr" name="regaddr" maxlength="200" style="width:78.5%;"/></td>
	</tr>
	<tr>
		<th>联系电话</th>
		<td><input type="text" value="${app.telephone}" id="telephone" name="telephone" maxlength="11" /></td>
		<th>手机</th>
		<td><input type="text" value="${app.mobile}" id="mobile" name="mobile" maxlength="11" /></td>
	</tr>
	<tr>
		<th>邮编</th>
		<td><input type="text" value="${app.postcode}" id="postcode" name="postcode" maxlength="6"/></td></tr>
	<tr>
		<th>法人姓名<span class="must_field">*</span></th>
		<td><input type="text" value="${app.legalPersonName}" id="legalPersonName" name="legalPersonName" maxlength="50" /></td>
		<th>法人性别</th>
		<td><hs:dic dicName="GENDER" defalt="${app.legalSex}" id="legalSex" name="legalSex" value1="1" /></td>
	</tr>
	<tr>
		<th>法人证件类型<span class="must_field">*</span></th>
		<td><hs:dic dicName="ID_CARD_TYPE" defalt="${app.legalIdType}" blank="false" id="legalIdType" name="legalIdType" /></td>
		<th>法人证件号码</th>
		<td><input type="text" value="${app.legalIdNo}" id="legalIdNo" name="legalIdNo" maxlength="18" /></td>
	</tr>
	<tr>
		<th>法人民族</th>
		<td colspan="3"><hs:dic dicName="ETHNIC" defalt="${app.legalNation}" id="legalNation" name="legalNation" /></td>
	</tr>	
	<tr>
		<th>法人邮件</th>
		<td><input type="text" value="${app.legalEmail}" id="legalEmail" name="legalEmail" max="30"/></td>	
		<th>法人职务</th>
		<td><input type="text" value="${app.legalJob}" id="legalJob" name="legalJob" maxlength="20"/></td>
	</tr>
	<tr>
		<th>法人地址</th>
		<td colspan="3"><input type="text" value="${app.legalAddr}" id="legalAddr" name="legalAddr" maxlength="200" style="width:78.5%;"/></td>
	</tr>
	</tbody>
</table>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/oa/secondarySeletect.js"></script>
<script type="text/javascript">
	secondarySelect.createSelect('ecmcode', ${ecmcodeJson}, '${app.ecmcode}');
	var copyAddress = function() {
		$("#regaddr").val($("#address").val());
	};
	//districtHelper.createDistrict('domainContainer', 'domain', {defaultValue:"${app.domain}"});
/* 	var changeBizType = function() {
		if ($("#bizType").val() != "0") {
			$("#businessType").removeAttr("name");
			$("#bizType").attr("name", "businessType");
		} else {
			$("#bizType").removeAttr("name");
			$("#businessType").attr("name", "businessType");
		}
	}; */
</script>
