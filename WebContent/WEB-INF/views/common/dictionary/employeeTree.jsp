<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../layout/taglibs.jsp"%>
<div id="orgTreeContainer"></div>
<script type="text/javascript">
var storedSelectedValues = null;
var getSelectedValues = function() {
	return orgTree.getSelectedValues("orgTreeContainer");
};
var getSelectedNames = function() {
	return orgTree.getSelectedNames("orgTreeContainer");
};
var setSelectedValues = function(selectedValues) {
	storedSelectedValues = selectedValues;
};
var updateSelectedValues = function() {
	if (storedSelectedValues == null || storedSelectedValues == "") {
		return;
	}
	var values = storedSelectedValues.split(",");
	$("#orgTreeContainer").find("input[type='checkbox']").each(function(index, item) {
		if (values.indexOf(item.value.replace(orgTree.prefix.employee, "")) > -1) {
			item.checked = true;
		}
	});
};
$(document).ready(function() {
	orgTree.createTree("orgTreeContainer", "${orgId}", "${dynamic}", updateSelectedValues);
});
</script>