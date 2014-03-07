if (typeof(DICTIONARY_CONTROLS) == "undefined") {
	DICTIONARY_CONTROLS = [];
}

function dictionary(dicType, ctrlId, args) {
	this.init(dicType, ctrlId, args);
}

dictionary.prototype = {

	title : {
		organization : "机构选择",
		department : "科室选择",
		employee : "人员选择",
		role : "角色选择",
		relativePerson : "管理相对人",
		dictionary : "通用字典"
	},
	
	dataHelper : null,	
	
	dicType : null,
	
	ctrlId : null,
	
	codeCtrlId : null,
	
	containerId : null,
	
	callback : null,
	
	selecterId : null,
	
	multipleSelect : true,
	
	selectCtrl : null,
	
	selectedValues : null,
	
	selectedNames : null,
	
	selectedItems : null,
	
	searchConditions : null,
	
	url : "/dictionary/index",
	
	ctrlIndex : -1,
	
	htmlContainerId : "dictionaryContainer", 
	
	init : function(dicType, ctrlId, args) {
		this.dicType = dicType;
		this.ctrlId = ctrlId;
		if (!isNull(args)) {
			if (!isNull(args.containerId)) {
				this.containerId = args.containerId;	
			}
			if (!isNull(args.callback)) {
				this.callback = args.callback;
			}
			if (!isNull(args.multipleSelect)) {
				this.multipleSelect = args.multipleSelect;
			}
			if (!isNull(args.value1)) {
				this.value1 = args.value1;	
			}
			if (!isNull(args.value2)) {
				this.value2 = args.value2;	
			}
			if (!isNull(args.value3)) {
				this.value3 = args.value3;	
			}
			if (!isNull(args.dicName)) {
				this.dicName = args.dicName;	
			}
			if (!isNull(args.dicTitle)) {
				this.dicTitle = args.dicTitle;	
			}
			if (!isNull(args.codeCtrlId)) {
				this.codeCtrlId = args.codeCtrlId;	
			}
			if (!isNull(args.orgId)) {
				this.orgId = args.orgId;	
			}
			if (!isNull(args.dynamic)) {
				this.dynamic = args.dynamic;	
			}
		}
		if (!isNull(this.containerId)) {
			this.selectCtrl = $("#" + this.containerId).find("#" + this.ctrlId);
		} else {
			this.selectCtrl = $("#" + this.ctrlId);
		}
		if (this.dicType != "relativePerson") {
			this.selectCtrl.attr("readonly", "readonly");
		}
		this.selecterId = ctrlId + "Select";
		this.dataHelper = new dataHelper(null);
		this.ctrlIndex = DICTIONARY_CONTROLS.length;
		DICTIONARY_CONTROLS.push(this);
		this.selectCtrl.after("<a id='" + this.selecterId + "' class='dic_select' href='javascript:void(0);' onclick='DICTIONARY_CONTROLS[" + this.ctrlIndex + "].open();'></a>");
	},

	setSelectedItems : function(items) {
		var code = [];
		var name = [];
		$(items).each(function(index, item) {
			code.push(item.code);
			name.push(item.name);
		});
		if (this.multipleSelect) {
			this.selectedValues = code.join(",");
			this.selectedNames = name.join(";");
		} else {
			this.selectedValues = code[0];
			this.selectedNames = name[0];
		}
		this.selectedItems = items;
		this.selectCtrl.val(this.selectedNames);
	},
	
	getSelectedValues : function() {
		return this.selectedValues;
	},
	
	getSelectedNames : function() {
		return this.selectedNames;
	},

	open : function() {
		var prms = {
			dicType : this.dicType,
			multipleSelect : this.multipleSelect,
			searchConditions : this.searchConditions,
			selectedValues : this.selectedValues
		};
		if (!isNull(this.value1)) {
			prms.value1 = this.value1;	
		}
		if (!isNull(this.value2)) {
			prms.value2 = this.value2;	
		}
		if (!isNull(this.value3)) {
			prms.value3 = this.value3;	
		}
		if (!isNull(this.dicName)) {
			prms.dicName = this.dicName;	
		}
		if (!isNull(this.orgId)) {
			prms.orgId = parseFloat(this.orgId);	
		}
		if (!isNull(this.dynamic)) {
			prms.dynamic = this.dynamic;	
		}
		var sender = this;
		this.dataHelper.basicPost(this.url, prms, 2, null, function(response) {
			$("#" + sender.htmlContainerId).html(response);
			var okCallback = function() {
				sender.selectedValues = getSelectedValues();
				sender.selectedNames = getSelectedNames();
				if (typeof(sender.callback) == "function") {
					sender.callback(sender.selectedNames);
				} else {
					//sender.selectCtrl.get(0).value = sender.selectedNames;
					if (!isNull(this.containerId)) {
						$("#" + sender.containerId).find("#" + sender.codeCtrlId).val(sender.selectedValues);
						$("#" + sender.containerId).find("#" + sender.ctrlId).val(sender.selectedNames);
					} else {
						$("#" + sender.codeCtrlId).val(sender.selectedValues);
						$("#" + sender.ctrlId).val(sender.selectedNames);
					}
				}
				top.Dialog.close();
			};
			var displayTitle = sender.title[sender.dicType];
			if (typeof(sender.dicTitle) != "undefined") {
				displayTitle = sender.dicTitle;
			}
			var width = 800, height = 400;
			if (sender.dicType == "employeeTree") {
				width = 400;
			}
			top.Dialog.open(sender.htmlContainerId, displayTitle, width, height,  { okCallback : okCallback });
			if (sender.selectedValues) {
				setSelectedValues(sender.selectedValues);
			}
		});
	}
	
};