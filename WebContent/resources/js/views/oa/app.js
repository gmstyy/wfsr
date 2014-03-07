var addRow = function(containerId, templateId, clazz) {
	if (isNull(clazz)) {
		clazz = "detailList";
	}
	var template = $("#" + templateId).clone().removeAttr('id').addClass(clazz).show();
	$("#" + containerId).append(template);
};
var deleteItem = function(obj, key, id) {
	$(obj).remove();
	// if (!isNull(id)) {
	// var value = nvl(deleteIds[key], "");
	// if (value == "") {
	// deleteIds[key] = id;
	// } else {
	// deleteIds[key] = value + "," + id;
	// }
	// }
};
var dicRelative = new dictionary("relativePerson", "applicant", {
	containerId : "relative",
	multipleSelect : false,
	callback : function(data) {
		$("#relative").find("#applicant").val(data.applicant);
		$("#relative").find("#chargePerson").val(data.chargePerson);
		$("#relative").find("#legalPerson").val(data.legalPerson);
		$("#relative").find("#telephone").val(data.telephone);
		$("#relative").find("#unitAddress").val(data.unitAddress);
		$("#relative").find("#legalPersonIdCard").val(data.legalPersonIdCard);
		$("#relativePersonId").val(data.relativePersonId);
	}
});
var appMaterialCheckedData = function(containerId,repeatTagName,checked) {
	if(isNull(checked)){
		checked=true;
	}
	var list = [];
	$("#" + containerId).find(repeatTagName).each(function() {
		var data = {};
		if (checked&&($(this).find("input:checkbox").attr("checked")||$(this).find("input:checkbox").length<1)) {
			$(this).find(":input").each(function() {
				data[$(this).attr("name")] = $(this).val();
			});
			list.push(data);
		}
		if (!checked&&!$(this).find("input:checkbox").attr("checked")) {
			$(this).find(":input").each(function() {
				data[$(this).attr("name")] = $(this).val();
			});
			list.push(data);
		}
	});
	return list;
};
