var dropdown = {
	
		/*
		 * prms可以包含属性：id, name, className, addFirstRow[true, false]
		 */
		createHtml : function(dataList, valueField, displayField, selectedValue, prms) {
			// id, name, className, tipRow
			var html = "<select";
			if (typeof(prms) != "undefined" && typeof(prms.id) != "undefined") {
				html += " id='" + prms.id + "'";
			}
			if (typeof(prms) != "undefined" && typeof(prms.name) != "undefined") {
				html += " name='" + prms.name + "'";
			}
			if (typeof(prms) != "undefined" && typeof(prms.className) != "undefined") {
				html += " class='" + prms.className + "'";
			}
			html += ">";
			// add first row
			if (typeof(prms) != "undefined" && prms.addFirstRow) {
				html += "<option value=''>请选择</option>";
			}
			if (typeof(selectedValue) != "undefined") {
				selectedValue = null;
			}
			// add options
			$(dataList).each(function(index, data) {
				html += ("<option value='" + data[valueField] + "'" + ((selectedValue == data[valueField]) ? " selected" : "") + ">" + data[displayField] + "</option>");
			});
			html += "</select>";
			return html;
		},
		
		clearOptions : function(control) {
			control.options.length = 0;
		},
		
		addOption : function(control, display, value) {
			control.options.add(new Option(display, value));
		},
		
		getKeyValues : function(control) {
			var values = {};
			$(control.options).each(function(index, obj) {
				if (isEmpty(obj.value)) {
					return;
				}
				values[obj.value.toString()] = obj.text;
			});
			return values;
		},
		
		getKeyValuePairs : function(control) {
			var pairs = [];
			$(control.options).each(function(index, obj) {
				if (isEmpty(obj.value)) {
					return;
				}
				pairs.push({ key : obj.value.toString(), value : obj.text });
			});
			return pairs;
		}
		
};

var checkbox = {
	
	getValues : function(name) {
		var elements = document.getElementsByName(name);
		var values = [];
		$(elements).each(function(index, obj) {
			if (obj.checked = true) {
				values.push($(obj).val());
			}
		});
		return values;
	},
	
	setValues : function(name, values) {
		var elements = document.getElementsByName(name);
		$(elements).each(function(index, obj) {
			obj.checked = (values.indexOf($(obj).val()) > -1);
		});
	}
	
};
