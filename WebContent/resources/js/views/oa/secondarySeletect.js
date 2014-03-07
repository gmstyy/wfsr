var secondarySelect = {

	firstRow : {
		value : "",
		text : "请选择"
	},

	defaultOption : "<option value=''>请选择</option>",

	createSelect : function (inputId, data, defaultValue) {
		var input = $("#" + inputId);
		var firstSelect = "<select id='" + inputId + "First' onchange='secondarySelect.parentChanged(\"" + inputId + "\", " + $.toJSON(data) + ")'></select>";
		var secondSelect = "<select id='" + inputId + "Second' onchange='secondarySelect.childChanged(\"" + inputId + "\")'></select>";
		var firstOptions = "";
		var secondOptions = "";
		var valueLevel = 2;
		//create first class select
		for (var i in data) {
			var value1 = data[i].value1;
			if (value1 == 0) {
				firstOptions += "<option value='" + i + "'>" + data[i].value + "</option>";
				if (i == defaultValue ) {
					valueLevel = 1;
				}
			}
		}
		$(input).after(secondSelect);
		$(input).after(firstSelect);
		var firstObj = $("#" + inputId + "First");
		var secondObj = $("#" + inputId + "Second");
		$(secondObj).hide();
		$(firstObj).html(secondarySelect.defaultOption + firstOptions);
		if (valueLevel == 1) {
			$(firstObj).val(defaultValue);
		} else if (defaultValue != "") {
			//create second class select
			var parentValue = data[defaultValue].value1;
			for (var i in data) {
				if (data[i].value1 == parentValue) {
					secondOptions += "<option value='" + data[i].code + "'>" + data[i].value + "</option>";
				}
			}
			$(secondObj).show();
			$(secondObj).html(secondarySelect.defaultOption + secondOptions);
			$(firstObj).val(parentValue);
			$(secondObj).val(defaultValue);
		}
	},

	parentChanged : function(inputId, data) {
		var parent = $("#" + inputId + "First");
		var child = $("#" + inputId + "Second");
		var options = "";
		var parentValue = $(parent).val();
		for (var i in data) {
			if (data[i].value1 == parentValue) {
				options += "<option value='" + data[i].code + "'>" + data[i].value + "</option>";
			}
		}
		if (options != "") {
			$(child).empty();
			$(child).html(secondarySelect.defaultOption + options);
			$(child).show();
		} else {
			$(child).hide();
		}
		$("#" + inputId).val($(parent).val());
	},

	childChanged : function(inputId) {
		var child = $("#" + inputId + "Second");
		if ($(child).val() != "") {
			$("#" + inputId).val($(child).val());
		} else {
			$("#" + inputId).val($("#" + inputId + "First").val());
		}
	}
};