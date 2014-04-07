<%--@elvariable id="app" type="com.founder.hs.interf.App"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<input type="hidden" name='id' value="${app.id}" readonly="readonly">
<input type="hidden" value='${licenseType}' id='licenseType' name='licenseType' readonly="readonly" />
<input type='hidden' value='${app.orgId}' id='orgId' name='orgId' maxlength='11' readonly="readonly"/>
<input type='hidden' value='${app.relativePersonNum}' id='relativePersonNum' name='relativePersonNum' maxlength='11' readonly="readonly"/>
<input type="hidden" name="applyStatus" value="${app.applyStatus}" readonly="readonly"/>
<input type="hidden" name="handleStatus" value="${app.handleStatus}" readonly="readonly"/>
<input type="hidden" name="grantStatus" value="${app.grantStatus}" readonly="readonly"/>
<input type="hidden" name="recordStatus" value="${app.recordStatus}" readonly="readonly"/>
<input type="hidden" name="reportStatus" value="${app.reportStatus}" readonly="readonly"/>
<input type="hidden" name="offStatus" value="${app.offStatus}" readonly="readonly"/>
<table class="edittable">
	<colgroup>
		<col style="width: 150px;" />
		<col style="width: 200px;" />
		<col style="width: 150px;" />
		<col />
	</colgroup>
	<tbody>
<%-- <tr>
		<th>业务类型</th>
		<td>
			<hs:dic dicName="RELATIVE_PERSON_BUSINESS_TYPE" disabled="true" defalt="${fn:substring(app.businessType, 0, 2)}" value2="${licenseType}" blank="false" id="businessType" name="businessType"/>
			<hs:dic dicName="RELATIVE_PERSON_BUSINESS_TYPE" disabled="true" defalt="${app.businessType}" value3="${licenseType}" id="bizType"/>
		</td>
	</tr> --%>
	<tr>
		<th>名称（单位/个人）<span class="must_field">*</span></th>
		<td colspan="3"><input type="text" value="${app.applicant}" id="applicant" name="applicant" maxlength="50" readonly="readonly" style="width:78.5%;"/></td>
	</tr>
	<tr>
		<th>类别<span class="must_field">*</span></th>
		<td><hs:dic dicName="RELATIVE_PERSON_TYPE" defalt="${app.type}" id="type" name="type" disabled="true" /></td>	
		<th>经济类型<span class="must_field">*</span></th>
		<td><hs:dic dicName="ECONOMIC_NATURE" defalt="${app.ecmcode}" id="ecmcode" name="ecmcode" disabled="true" /></td>
	</tr>
	<tr>
		<th>地址<span class="must_field">*</span></th>
		<td colspan="3"><input type="text" value="${app.address}" id="address" name="address" maxlength="200" style="width:78.5%;" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>注册地址<span class="must_field">*</span></th>
		<td colspan="3"><input type="text" value="${app.regaddr}" id="regaddr" name="regaddr" maxlength="200" style="width:78.5%;" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>联系电话</th>
		<td><input type="text" value="${app.telephone}" id="telephone" name="telephone" maxlength="11"  readonly="readonly"/></td>
		<th>手机</th>
		<td><input type="text" value="${app.mobile}" id="mobile" name="mobile" maxlength="11" readonly="readonly" /></td>
	</tr>
	<tr>
		<th>邮编</th>
		<td><input type="text" value="${app.postcode}" id="postcode" name="postcode" readonly="readonly"/></td></tr>
	<tr>
		<th>法人姓名<span class="must_field">*</span></th>
		<td><input type="text" value="${app.legalPersonName}" id="legalPersonName" name="legalPersonName" maxlength="50" readonly="readonly" /></td>
		<th>法人性别</th>
		<td><hs:dic dicName="GENDER" defalt="${app.legalSex}" id="legalSex" name="legalSex" value1="1" disabled="true" /></td>
	</tr>
	<tr>
		<th>法人证件类型<span class="must_field">*</span></th>
		<td><hs:dic dicName="ID_CARD_TYPE" defalt="${app.legalIdType}" id="legalIdType" name="legalIdType" disabled="true" /></td>
		<th>法人证件号码</th>
		<td><input type="text" value="${app.legalIdNo}" id="legalIdNo" name="legalIdNo" maxlength="18" readonly="readonly" /></td>
	</tr>
	<tr>
		<th>法人民族</th>
		<td colspan="3"><hs:dic dicName="ETHNIC" defalt="${app.legalNation}" id="legalNation" name="legalNation" disabled="true" /></td>
	</tr>	
	<tr>
		<th>法人邮件</th>
		<td><input type="text" value="${app.legalEmail}" id="legalEmail" name="legalEmail" max="30" readonly="readonly"/></td>	
		<th>法人职务</th>
		<td><input type="text" value="${app.legalJob}" id="legalJob" name="legalJob" maxlength="20" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>法人地址</th>
		<td colspan="3"><input type="text" value="${app.legalAddr}" id="legalAddr" name="legalAddr" maxlength="200" style="width:78.5%;" readonly="readonly"/></td>
	</tr>
	</tbody>
</table>
<c:if test="${app.handleStatus eq 2}">
	<br/>
	<p>拒绝理由</p>
	<textarea readonly="readonly">${app.handleReason}</textarea>
</c:if>
