var districtHelper = {
	
	requestUrl : "/dictionary/getDistrict",
	
	defaultProvinceCode : "520000",
	
	firstRow : {
		value : "",
		text : "请选择"
	},
	
	createDistrict : function(containerId, fieldId, args) {
		var html = "";
		// default value check
		var selectedValue = ((typeof(args) == "undefined" || (typeof(args.defaultValue) == "undefined" && args.defaultValue.length != 6)) ? "" : args.defaultValue);
		var selectedProvince = "", selectedCity = "", selectedCounty = "";
		if (selectedValue != "") {
			// selected value
			selectedProvince = selectedValue.substring(0, 2) + "0000";
			selectedCity = selectedValue.substring(0, 4) + "00";
			selectedCounty = selectedValue;
			// level check
			if (selectedCounty == selectedCity) {
				selectedCounty = "";
			}
			if (selectedCity == selectedProvince) {
				selectedCity = "";
			}
		} else {
			selectedValue = districtHelper.defaultProvinceCode;
		}
		// build controls
		var disabled = ((typeof(args) == "undefined" || typeof(args.disabled) == "undefined") ? false : args.disabled);
		var disabledString = disabled ? " disabled " : "";
		var hideProvince = ((typeof(args) == "undefined" || typeof(args.hideProvince) == "undefined") ? true : args.hideProvince);
		var showProvince = (hideProvince === false);
		var provinceId = null;
		if (showProvince) {
			provinceId = "prov_" + fieldId;
			html += "<select id='" + provinceId + "'" + disabledString + " style='width:80px;' onchange='districtHelper.parentChanged(this, \"" + cityId + "\");districtHelper.valueChanged(this, \"" + containerId + "\", \"" + fieldId + "\");'></select>";
		}
		var cityId = "city_" + fieldId;
		var countyId = "coun_" + fieldId;
		html += "<select id='" + cityId + "'" + disabledString + " style='width:80px;' onchange='districtHelper.parentChanged(this, \"" + countyId + "\");districtHelper.valueChanged(this, \"" + containerId + "\", \"" + fieldId + "\");'></select>";
		html += "<select id='" + countyId + "'" + disabledString + " style='width:80px;' onchange='districtHelper.valueChanged(this, \"" + containerId + "\", \"" + fieldId + "\");'></select>";
		
		$("#" + containerId).append(html);
		$("#" + containerId).append("<input type='hidden' id='" + fieldId + "' name='" + fieldId + "' value='" + selectedValue + "' />");
		// display data
		if (showProvince) {
			districtHelper.loadData(provinceId, "0", false, selectedProvince, function() {
				districtHelper.loadData(cityId, $("#" + provinceId).val(), true, selectedCity, function() {
					if (selectedCounty != "") {
						districtHelper.loadData(countyId, $("#" + cityId).val(), true, selectedCounty);
					}
				});
			});
		} else {
			districtHelper.loadData(cityId, districtHelper.defaultProvinceCode, false, selectedCity, function() {
				districtHelper.loadData(countyId, $("#" + cityId).val(), true, selectedCounty);
			});
		}
	},
	
	parentChanged : function(parentObj, childCtrlId) {
		districtHelper.loadData(childCtrlId, $(parentObj).val(), true);
	},
	
	loadData : function(ctrlId, parentCode, addFirstRow, selectedValue, callback) {
		if (parentCode == -1) {
			return;
		}
		AjaxHelper.get(
				getContextUrl(districtHelper.requestUrl),
			{ parentCode : parentCode },
			function(response){
				districtHelper.fillData(ctrlId, response.dicMap, addFirstRow, selectedValue);
				if (typeof(callback) == "function") {
					callback();
				}
			}
		);
	},
	
	fillData : function(ctrlId, map, addFirstRow, selectedValue) {
		var controls = $("#" + ctrlId);
		if (controls.length == 0) {
			return;
		}
		var ctrl = controls.get(0);
		dropdown.clearOptions(ctrl);
		if (true === addFirstRow) {
			dropdown.addOption(ctrl, districtHelper.firstRow.text, districtHelper.firstRow.value);
		}
		for (var key in map) {
			dropdown.addOption(ctrl, map[key].value, key);
		}
		if (typeof(selectedValue) != "undefined" && selectedValue != "") {
			$(ctrl).val(selectedValue);
		}
	},
	
	valueChanged : function(ctrl, containerId, fieldId) {
		var value = $(ctrl).val();
		if (value != districtHelper.firstRow.value) {
			$("#" + containerId).find("#" + fieldId).val(value);
		} else {
			var prev = $(ctrl).prev();
			if (prev.length == 0) {
				return;
			}
			if (prev.val() != districtHelper.firstRow.value) {
				$("#" + containerId).find("#" + fieldId).val(prev.val());
			} else {
				prev = prev.prev();
				if (prev.length == 0) {
					return;
				}
				if (prev.val() != districtHelper.firstRow.value) {
					$("#" + containerId).find("#" + fieldId).val(prev.val());
				}
			}
		}
	}
	
};