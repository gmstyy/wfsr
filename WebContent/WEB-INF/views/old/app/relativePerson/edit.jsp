<%--@elvariable id="relativePerson" type="com.founder.hs.entity.business.RelativePerson"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editFormId" action="" method="post">
	<input type="hidden" name="id" value="${relativePerson.id}">
	<input type="hidden" name="orgId" value="${relativePerson.orgId}">
	<input type="hidden" name="relativePersonNum" value="${relativePerson.relativePersonNum}">
	<input type="hidden" name="domain" value="${relativePerson.domain}">
	<input type="hidden" name="reportDept" value="${relativePerson.reportDept}">
	<input type="hidden" name="reportOrg" value="${relativePerson.reportOrg}">
	<input type="hidden" name="reportOrgOfficer" value="${relativePerson.reportOrgOfficer}">
	<input type="hidden" name="nationalSystemId" value="${relativePerson.nationalSystemId}">
	<input type="hidden" name="dataSource" value="${relativePerson.dataSource}">
	<table class="edittable">
		<colgroup>
			<col style="width: 150px;" />
			<col style="width: 200px;" />
			<col style="width: 150px;" />
			<col />
		</colgroup>
		<tbody>
		<tr>
			<th>业务类型<span class="must_field">*</span></th>
			<td colspan="3">
				<hs:dic dicName="RELATIVE_PERSON_BUSINESS_TYPE" defalt="${relativePerson.businessTypea}" value1="0" id="businessType" name="businessTypea" onChange="bizType1()"/>
				<select id="bizType" name="${checkBizType ? 'businessTypeb' : ''}" style="${relativePerson.businessTypeb ne null ? '' : 'display:none;'}" onchange="bizType2()">
					<option value=""></option>
					<c:forEach var="bizType" items="${bizTypes}">
						<option value="${bizType.value.code}" ${bizType.value.code eq relativePerson.businessTypeb ? "selected" : ""}>${bizType.value.value}</option>
					</c:forEach>
					<option value="other">非字典类型</option>
				</select>
				<input type="text" id="businessTypeOther" name="${checkBizType ? '' : 'businessTypeb'}" value="${relativePerson.businessTypeb}" style="${checkBizType ? 'display:none' : ''}"/>
				<input type="hidden" id="businessTypeaName" name="businessTypeaName" value="${relativePerson.businessTypeaName}"/>
				<input type="hidden" id="businessTypebName" name="businessTypebName" value="${relativePerson.businessTypebName}"/>
			</td>
		</tr>
		<tr>
			<th>名称（单位/个人）<span class="must_field">*</span></th>
			<td colspan="3"><input type="text" value="${relativePerson.name}" id="name" name="name" maxlength="50" style="width:77.5%;"/></td>
		</tr>
		<tr>
			<th>类别<span class="must_field">*</span></th>
			<td><hs:dic dicName="RELATIVE_PERSON_TYPE" defalt="${relativePerson.type}" blank="false" id="type" name="type" /></td>
		</tr>
		<tr>
			<th>经济类型<span class="must_field">*</span></th>
			<td colspan="3"><input type="hidden" id="ecmcode" name="ecmcode" value="${relativePerson.ecmcode}"/></td>
		</tr>
		<tr>
			<th>地址<span class="must_field">*</span></th>
			<td colspan="3"><input type="text" value="${relativePerson.address}" id="address" name="address" maxlength="200" style="width:77.5%;" onblur="copyAddress();"/></td>
		</tr>
		<tr>
			<th>注册地址<span class="must_field">*</span></th>
			<td colspan="3"><input type="text" value="${relativePerson.regaddr}" id="regaddr" name="regaddr" maxlength="200" style="width:77.5%;"/></td>
		</tr>
		<tr>
			<th>电话</th>
			<td><input type="text" value="${relativePerson.telephone}" id="telephone" name="telephone" maxlength="11" /></td>
			<th>手机</th>
			<td><input type="text" value="${relativePerson.mobile}" id="mobile" name="mobile" maxlength="11" /></td>
		</tr>
		<tr>
			<th>邮编</th>
			<td><input type="text" value="${relativePerson.postcode}" id="postcode" name="postcode"/></td></tr>
		<tr>
			<th>法人姓名<span class="must_field">*</span></th>
			<td><input type="text" value="${relativePerson.legalPersonName}" id="legalPersonName" name="legalPersonName" maxlength="50" /></td>
		</tr>
		<tr>
			<th>法人证件类型<span class="must_field">*</span></th>
			<td><hs:dic dicName="ID_CARD_TYPE" defalt="${relativePerson.legalIdType}" blank="false" id="legalIdType" name="legalIdType" /></td>
			<th>法人证件号码</th>
			<td><input type="text" value="${relativePerson.legalIdNo}" id="legalIdNo" name="legalIdNo" maxlength="18" /></td>
		</tr>
		<tr>
			<th>法人性别</th>
			<td><hs:dic dicName="GENDER" defalt="${relativePerson.legalSex}" id="legalSex" name="legalSex" value1="1"/></td>
			<th>法人职务</th>
			<td><input type="text" value="${relativePerson.legalJob}" id="legalJob" name="legalJob" maxlength="20"/></td>
		</tr>
		<tr>
			<th>法人邮件</th>
			<td><input type="text" value="${relativePerson.legalEmail}" id="legalEmail" name="legalEmail" max="30"/></td>
			<th>法人民族</th>
			<td><hs:dic dicName="ETHNIC" defalt="${relativePerson.legalNation}" id="legalNation" name="legalNation" /></td>
		</tr>
		<tr>
			<th>法人地址</th>
			<td colspan="3"><input type="text" value="${relativePerson.legalAddr}" id="legalAddr" name="legalAddr" maxlength="200" style="width:77.5%;"/></td>
		</tr>
		<tr>
			<th>位置区域</th>
			<td colspan="3"><input type="text" value="${relativePerson.position}" id="position" name="position" maxlength="30" style="width: 60%"/></td>
		</tr>
		<tr>
			<th>坐标X</th>
			<td><input type="text" value="${relativePerson.x86}" id="x86" name="x86"/></td>
			<th>坐标Y</th>
			<td><input type="text" value="${relativePerson.y86}" id="y86" name="y86"/></td>
		</tr>
		<tr>
			<th>是否有证</th>
			<td><hs:dic dicName="BOOLEAN_TYPE" defalt="${relativePerson.licType}" id="licType" name="licType" /></td>
			<th>许可证号</th>
			<td><input type="text" name="licenseNo" value="${relativePerson.licenseNo}" readonly/></td>
		</tr>
		<tr>
			<th>备注</th>
			<td colspan="3"><textarea name="relativePersonRemark" id="remark" cols="60" rows="5">${relativePerson.relativePersonRemark}</textarea></td>
		</tr>
		</tbody>
	</table>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/oa/secondarySeletect.js"></script>
<script type="text/javascript">
	//districtHelper.createDistrict('domainContainer', 'domain', {defaultValue:"${relativePerson.domain}"});
	secondarySelect.createSelect('ecmcode', ${ecmcodeJson}, '${relativePerson.ecmcode}');
	var bizTypeHelper = new dataHelper();
	var bizType1 = function() {
		var type = $("#businessType").val();
		if (type == "") {
			$("#bizType").hide();
			return;
		}
		bizTypeHelper.basicPost("/relativePerson/getBizType", {type : type}, 0, null, function(data) {
			var types = data.bizTypes;
			$("#bizType").show();
			var html = "<option value=''></option>";
			var i = 0;
			for (var code in types) {
				html += "<option value='" + code + "'>" + types[code].value + "</option>";
				i++;
			}
			html += "<option value='other'>非字典类型</option>";
			if (i > 0) {
				$("#bizType").html(html);
			} else {
				$("#bizType").hide();
			}
			switchBizType2(1);
			$("#businessTypeaName").val($("#businessType :selected").html());
		});
	};
	var bizType2 = function() {
		if ($("#bizType").val() == "other") {
			switchBizType2(2);
		} else {
			switchBizType2(1);
		}
		$("#businessTypebName").val($("#bizType :selected").html());
	};

	var switchBizType2 = function(to) {
		if (to == 1) {
			$("#businessTypeOther").hide();
			$("#businessTypeOther").removeAttr("name");
			$("#bizType").attr("name", "businessTypeb");
		} else {
			$("#businessTypeOther").show();
			$("#bizType").removeAttr("name");
			$("#businessTypeOther").attr("name", "businessTypeb");
		}
	};
	
	var copyAddress = function() {
		$("#regaddr").val($("#address").val());
	};
</script>
