<%@page import="com.founder.hs.constant.HSDV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container">
	<div id="orgLicenseList">
		<hs:dic dicName="LICENSE_TYPE" type="checkbox" defalt="${orgLicenseMap}" value2="1" groupIndex="1" name='licenseCategory'  divClass="orgLicenseDiv" hiddenPropertiy="id"/>
	</div>
	<input type="button" onclick="save()" value="保存" />
</div>
<script type="text/javascript">
var helper = new dataHelper();
var save = function() {
	var orgLicenseList = $.toJSON(getCheckedDataList("orgLicenseList", ".orgLicenseDiv"));
	helper.basicPost("/app/saveOrgLicense", {json:orgLicenseList}, 3, {successMessage:"保存成功"});
};
</script>