if (typeof (OBJECT_CACHE) == "undefined") {
	OBJECT_CACHE = [];
}

function dataHelper(templateModel, validateModel, rowStyleFormatter) {
	this.templateModel = templateModel;
	this.validateModel = validateModel;
	this.rowStyleFormatter = rowStyleFormatter;
	this.objIndex = OBJECT_CACHE.length;
	OBJECT_CACHE.push(this);
}

dataHelper.prototype = {

	/**
	 * 事件监听 addListener(events,handler,containerId [,namespace][,clean])
	 * 
	 * @param events
	 * @param handler
	 * @param containerId
	 * @param namespace 可选 (string)
	 * @param clean 可选 (boolean)
	 */
	addListener : function(events, handler, containerId,namespace, clean) {
		var namespace_local = "";
		if(typeof(namespace)=='undefined')
			namespace_local="";
		else if(typeof(namespace)=='boolean')
			clean = namespace;
		else if(typeof(namespace)=='string')
			namespace_local = "."+namespace;
		if(typeof(clean) =='undefined' || clean)
			this.removeListener(events+namespace_local, handler, containerId);
		$("#" + containerId).on(events+namespace_local, handler);
	},
	removeListener : function(events, handler, containerId) {
		$("#" + containerId).off(events, handler);
	},
	removeAllListener : function(containerId, namespace) {
		if(typeof(namespace)=='undefined')
			$("#" + containerId).off();
		else
			$("#" + containerId).off("."+namespace);
	},

	objIndex : -1,

	containers : {
		search : "#search_container",
		list : "#list_container",
		dataTable : "data_table",
		rowTemplate : "template",
		pagenation : "#pagenation"
	},

	searchUrl : null,

	searchCondition : null,

	listPageNo : 1,

	templateModel : null,

	validateModel : null,

	rowStyleFormatter : null,

	/**
	 * @type：填充类型（1：行填充，2：普通填充）
	 * @data：待填充对象
	 * @index：行索引（行填充模式下使用）
	 * @template：数据模板
	 */
	fillData : function(type, data, index, template, allData) {
		var html = (type == 1 ? ("<tr class='" + ((index % 2 == 0) ? "row_odd" : "row_even") + "' style='{0}'>") : "");
		if (type == 1) {
			html = html.replace("{0}", ((typeof (this.rowStyleFormatter) == "function") ? this.rowStyleFormatter(data, index) : ""));
		}
		var itemHtml = template;
		var property = null;
		var value;
		for ( var attr in this.templateModel) {
			property = this.templateModel[attr];
			value = (typeof (data[attr]) == "undefined" ? "" : data[attr]);
			if (typeof (property) != "undefined" && property != null) {
				if (isEmpty(value) && typeof (property.nullField) != "undefined") {
					value = (typeof (data[property.nullField]) == "undefined" ? "" : data[property.nullField]);
				}
				if (isEmpty(value) && typeof (property.defaultValue) != "undefined") {
					value = property.defaultValue;
					continue;
				}
				// 自定义格式化方法
				if (typeof (property.formatter) == "function") {
					value = property.formatter(value, data, allData);
				} else {
					// 属性格式化
					switch (property.type) {
					case "html":
						value = value.replace(/<[^<|>]+?>/gi, '');
						break;
					case "timestamp":
						if (isEmpty(value)) {
							value = "";
						} else {
							value = new Date(parseFloat(value)).format("C");
						}
						break;
					case "date":
						if (isEmpty(value)) {
							value = "";
						} else {
							value = new Date(parseFloat(value)).format("Q");
						}
						break;
					default:
						break;
					}
					// 最大长度
					if (typeof (property.maxLength) != "undefined") {
						if (value.length > property.maxLength) {
							value = "<span title='" + value + "'>" + value.substring(0, property.maxLength) + " ...</span>";
						}
					}
				}
			}
			itemHtml = itemHtml.replaceAll("#" + attr + "#", value);
		}
		if (type == 1) {
			html += itemHtml.replaceAll("#checkItem#", "checkItem").replaceAll("#rowCount#", index + 1);
			html += "</tr>";
		}
		return html;
	},

	validateContainer : function(jqueryContainer, validateModel) {
		// validate input values in forms
		var field = null, ctrl = null, value = null, message = "", firstCtrl = null, patten = null, msg = "";
		for ( var fieldName in validateModel) {
			field = validateModel[fieldName];
			ctrl = jqueryContainer.find("[name=" + fieldName + "]");
			if(ctrl.length == 0) {
				continue;
			}
			if (ctrl.hasClass("validate_error")) {
				ctrl.removeClass("validate_error");
			}
			switch (ctrl.get(0).tagName) {
			case "SELECT":
				value = ctrl.val();
				break;
			case "INPUT":
				if (ctrl.length > 1) {
					switch (ctrl.attr("type")) {
					case "radio":
						value = "";
						$(ctrl).each(function(index, obj) {
							if (obj.checked) {
								value = obj.value;
							}
						});
						break;
					case "checkbox":
						value = [];
						$(ctrl).each(function(index, obj) {
							if (obj.checked) {
								value.push(obj.value);
							}
						});
						value = value.join(",");
						break;
					case "hidden":
						value = [];
						$(ctrl).each(function(index, obj) {
							value.push(obj.value);
						});
						value = value.join(",");
						break;
					}
				} else {
					value = ctrl.val();
				}
				break;
			case "TEXTAREA":
				value = ctrl.val();
				break;
			default:
				value = (ctrl.html() == "") ? ctrl.val() : ctrl.html();
				break;
			}
			// must field
			if (typeof (field.must) != "undefined" && field.must === true) {
				if (value == "") {
					ctrl.addClass("validate_error");
					message += ("请输入" + field.fieldName + "！<br/>");
					if (firstCtrl == null) {
						firstCtrl = ctrl;
					}
				}
			}
			// user defined value type
			if (typeof (field.type) != "undefined" && field.type != null && field.type != "") {
				patten = null;
				switch (field.type) {
				case "number":
					patten = new RegExp(/^-?(\d)*$/);
					msg = ("请输入整数作为" + field.fieldName + "！<br/>");
					break;
				case "positiveNumber":
					patten = new RegExp(/^(\d)*$/);
					msg = ("请输入整数作为" + field.fieldName + "！<br/>");
					break;
				case "letternumber":
					patten = new RegExp(/^[A-Za-z0-9]*$/);
					msg = ("请输入字母和数字作为" + field.fieldName + "！<br/>");
					break;
				case "money":
					patten = new RegExp(/^-?(([1-9](\d)*)|(0))(\.\d{1,2})?$/);
					msg = ("请输入金额(最多2位小数)作为" + field.fieldName + "！<br/>");
					break;
				case "telephone":
					patten = new
					RegExp(/^(\d{7}(\d)?)|(0\d{2}(\d)?-\d{7}(\d)?)|(1\d{10})$/);
					msg = ("请输入正确的电话号码作为" + field.fieldName + "！<br/>");
					break;
				case "email":
					patten = new RegExp(/^[a-zA-Z0-9]+((\.)?[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,4})$/);
					msg = ("请输入正确的邮件地址作为" + field.fieldName + "！<br/>");
					break;
				case "url":
					patten = new RegExp(/^((http(s)?:\/\/)|(ftp:\/\/))?([\w-]+\.)+[\w-]+(\/[\w-.\/?%&=]*)?$/);
					msg = ("请输入正确的网址作为" + field.fieldName + "！<br/>");
					break;
				}
				if (value != "" && patten != null && !patten.test(value)) {
					ctrl.addClass("validate_error");
					message += msg;
					if (firstCtrl == null) {
						firstCtrl = ctrl;
					}
				}
			}
			if (field.type == "identify" && value != "") {
				var idTest = analyzeCardNo(value);
				if (!idTest.valid) {
					ctrl.addClass("validate_error");
					message += (idTest.message + "！<br/>");
					if (firstCtrl == null) {
						firstCtrl = ctrl;
					}
				}
			}
			// regular expression
			if (typeof (field.regex) != "undefined" && field.regex != null && field.regex != "") {
				patten = new RegExp(field.regex);
				if (value != "" && !patten.test(value)) {
					ctrl.addClass("validate_error");
					message += (field.message + "<br/>");
					if (firstCtrl == null) {
						firstCtrl = ctrl;
					}
				}
			}
			// custome validation
			if (typeof(field.customValidate) == "function") {
				var msg = field.customValidate(value, jqueryContainer);
				if (msg != null && msg != "") {
					ctrl.addClass("validate_error");
					message += (msg + "<br/>");
					if (firstCtrl == null) {
						firstCtrl = ctrl;
					}
				}
			}
		}
		return {
			message : message,
			firstCtrl : firstCtrl
		};
	},

	validateForm : function(jqueryContainer, validateModel) {
		return this.validateContainer(jqueryContainer, validateModel);
	},

	validateMultipleForms : function(formIdList, validateModel) {
		var message = "", firstCtrl = null, result = null;
		for (var index = 0; index <= formIdList.length; index++) {
			result = this.validateForm($("#" + formIdList[index]), validateModel);
			if (result.message != "") {
				message += result.message;
				if (firstCtrl == null) {
					firstCtrl = result.firstCtrl;
				}
			}
		}
		return { message : message, firstCtrl : firstCtrl };
	},

	validateDataList : function(validateList) {
		var message = "", firstCtrl = null, result = null;
		var tempHelper = this;
		$("#" + validateList.containerId).find(validateList.repeatTagName).each(function(index, itemContainer) {
			result = tempHelper.validateContainer($(itemContainer), validateList.model);
			if (result.message != "") {
				message += result.message;
				if (firstCtrl == null) {
					firstCtrl = result.firstCtrl;
				}
			}
		});
		return { message : message, firstCtrl : firstCtrl };
	},
	
	validateMultipleDataList : function(validateMultipleList) {
		var message = "", firstCtrl = null, result = null;
		for (var index in validateMultipleList) {
			result = this.validateDataList(validateMultipleList[index]);
			if (result.message != "") {
				message += result.message;
				if (firstCtrl == null) {
					firstCtrl = result.firstCtrl;
				}
			}
		}
		return { message : message, firstCtrl : firstCtrl };
	},

	/**
	 * @url： 提交请求url
	 * @type：返回请求后的处理类型（0：使用模板替换方式填充数据列表；1：使用模板替换方式填充数据对象；2：使用返回html填充目标容器; 3:直接post）
	 * @callback：请求返回后执行回调函数
	 * @args参数:
	 * @containerId：提交数据的表单id
	 * @containerId：待填充容器id
	 * @templateId：数据模板id
	 * @containerTitle: 弹出框标题
	 * @editConfirmUrl 弹出框确认路径
	 * @editFormId 弹出框参数表单Id
	 */
	basicPost : function(url, prms, type, args, callback) {
		var containerId = isNull(args) || isNull(args.containerId) ? null : args.containerId;
		var templateId = isNull(args) || isNull(args.templateId) ? null : args.templateId;
		var containerTitle = isNull(args) || isNull(args.containerTitle) ? "" : args.containerTitle;
		var editConfirmUrl = isNull(args) || isNull(args.editConfirmUrl) ? null : args.editConfirmUrl;
		var editFormId = isNull(args) || isNull(args.editFormId) ? null : args.editFormId;
		var preProcess = isNull(args) || isNull(args.preProcess) ? null : args.preProcess;
		var afterDialogOpen = isNull(args) || isNull(args.afterDialogOpen) ? null : args.afterDialogOpen;
		var afterDialogClose = isNull(args) || isNull(args.afterDialogClose) ? null : args.afterDialogClose;////
		var width = isNull(args) || isNull(args.width) ? 800 : args.width;
		var height = isNull(args) || isNull(args.height) ? 500 : args.height;
		var customValidate = isNull(args) || isNull(args.customValidate) ? null : args.customValidate;
		var validate = isNull(args) || isNull(args.validate) ? false : args.validate;
		var validateMultiForms = isNull(args) || isNull(args.validateMultiForms) ? false : args.validateMultiForms;
		var validateFormIds = isNull(args) || isNull(args.validateFormIds) ? [] : args.validateFormIds;
		var validateList = isNull(args) || isNull(args.validateList) ? null : args.validateList;
		var validateMultipleList = isNull(args) || isNull(args.validateMultipleList) ? null : args.validateMultipleList;
		var refreshList = isNull(args) || isNull(args.refreshList) ? true : args.refreshList;
		var successProcess = isNull(args) || isNull(args.successProcess) ? null : args.successProcess;
		var buttons = isNull(args) || isNull(args.buttons) ? null : args.buttons;
		var defaultButtons = isNull(args) || isNull(args.defaultButtons) ? null : args.defaultButtons;
		var customeEditCallback = isNull(args) || isNull(args.customeEditCallback) ? null : args.customeEditCallback;
		var namespace = isNull(args) || isNull(args.namespace) ? "" : ("."+args.namespace);
		var successMessage = isNull(args) || isNull(args.successMessage) ? "" : (args.successMessage);

		var sender = this;
		if (type == 3 && validate) {
			var result = sender.validateForm($("#" + editFormId), sender.validateModel);
			if (result.message != "") {
				top.Dialog.alert(result.message, function() { result.firstCtrl.focus(); });
				return;
			}
		}
		if (isNull(callback)) {
			callback = function(response) {
				switch (type) {
				case 0:
					// 使用模板替换方式填充数据列表
					if (!isNull(response.pageList)) {
						// 触发填充数据前事件
						$("#" + containerId).trigger("beforeFillData"+namespace, [ response.pageList ]);
						var html = "";
						$(response.pageList.list).each(function(index, data) {
							html += sender.fillData(1, data, index, $("#" + templateId).html(), response);
						});
						$("#" + containerId).html(html);
						// 触发完成填充数据事件
						$("#" + containerId).trigger("afterFillData"+namespace, [ response.pageList ]);
						// 刷新分页控件
						sender.refreshPagenation(response.pageList.page);
					}
					break;
				case 1:
					// 使用模板替换方式填充数据对象
					if (!isNull(response)) {
						// edit mode
						$("#" + containerId).html(sender.fillData(2, response, 0, $("#" + templateId).html()), response);
					}
					break;
				case 2:
					// 使用返回html填充目标容器
					$(top.document).find("#" + containerId).html(response);
					var editCallback = null;
					if (!isNull(customeEditCallback)) {
						editCallback = customeEditCallback;
					}
					if (!isNull(editConfirmUrl)) {
						editCallback = function(response) {
							// custom validation
							if (typeof(customValidate) == "function") {
								var result = customValidate($(top.document).find("#" + editFormId));
								if (result === false) {
									return;
								}
							}
							// start validation
							var message = "", firstCtrl = null, result = null;
							// normal validate
							if (validate) {
								result = sender.validateForm($(top.document).find("#" + editFormId), sender.validateModel);
								if (result.message != "") {
									message += result.message;
									if (firstCtrl == null) {
										firstCtrl = result.firstCtrl;
									}
								}
							}
							// multiple forms validate
							if (validateMultiForms) {
								result = sender.validateMultipleForms(validateFormIds, sender.validateModel);
								if (result.message != "") {
									message += result.message;
									if (firstCtrl == null) {
										firstCtrl = result.firstCtrl;
									}
								}
							}
							// data list validate
							if (validateList != null) {
								result = sender.validateDataList(validateList);
								if (result.message != "") {
									message += result.message;
									if (firstCtrl == null) {
										firstCtrl = result.firstCtrl;
									}
								}
							}
							// multiple data list validate
							if (validateMultipleList != null) {
								result = sender.validateMultipleDataList(validateMultipleList);
								if (result.message != "") {
									message += result.message;
									if (firstCtrl == null) {
										firstCtrl = result.firstCtrl;
									}
								}
							}
							if (message != "") {
								top.Dialog.alert(message, function() { firstCtrl.focus().select(); });
								return;
							}
							// end validation
							var prms = {
								'formId' : editFormId
							};
							if (typeof (preProcess) == "function") {
								prms.processData = preProcess;
							}
							// 提交数据前禁用对话框各种按钮
							top.Dialog.disableButtons();
							sender.postForm(editConfirmUrl, 3, prms, function(response) {
								if (refreshList) {
									sender.redirectPage(sender.listPageNo);
								}
								top.Dialog.close();
								$(top.document).find("#" + containerId).trigger("editCompleted"+namespace);
								if (successMessage) {
									top.Dialog.alert(successMessage, successProcess);
								} else if (typeof (successProcess) == "function") {
									successProcess();
								}
								if (typeof (afterDialogClose) == "function") {									
									afterDialogClose();	
								};								
							});
						};
					}
					var userCallbacks = { okCallback : editCallback };
					if (defaultButtons != null) {
						userCallbacks.defaultButtons = defaultButtons;
					}
					if (buttons != null) {
						userCallbacks.buttons = buttons;
					}
					top.Dialog.open(containerId, containerTitle, width, height, userCallbacks);
					break;
				case 3:
					if (successMessage) {
						top.Dialog.alert(successMessage);
					}
					break;
				}
				if (typeof (afterDialogOpen) == "function") {
					afterDialogOpen();
				}
				$("#" + containerId).trigger("afterCallback"+namespace);
			};
		}
		AjaxHelper.post(getContextUrl(url), prms, callback, (type <= 1 ? "json" : "html"));
	},

	getFormData : function(formId, data) {
		if (isNull(formId)) {
			return {};
		}
		if (typeof(data) == "undefined") {
			data = {};
		} 
		$($("#" + formId).formToArray()).each(function(index, field) {
			if (field.value != "") {
				if (!isNull(data[field.name])) {
					data[field.name] = data[field.name] + ',' + field.value;
					return;
				}
				if (field.name.indexOf(":") == -1) {
					// date input fields parse
					var tempCtrl = $("#" + formId).find("input[name=" + field.name + "]");
					if (tempCtrl.length > 0 && tempCtrl.hasClass("date_input") && field.value.indexOf(" ") == -1) {
						field.value += " 00:00:00";
					}
				}
				data[field.name] = field.value;
			}
		});
		return data;
	},

	/**
	 * 列表查询页面提交用Post
	 * 
	 * @url： 提交请求url
	 * 
	 * @args参数:
	 * @formId：提交数据的表单id
	 * @containerId：待填充容器id
	 * @templateId：数据模板id
	 * @containerTitle: 弹出框标题
	 * @editConfirmUrl 弹出框确认路径
	 * @editFormId 弹出框参数表单Id
	 * 
	 * @callback：请求返回后执行回调函数
	 */
	postSearch : function(url, args, callback) {
		this.searchUrl = url;
		this.searchCondition = this.getFormData(args.formId);
		if (typeof(args.additionalConditions) != "undefined") {
			for (var attr in args.additionalConditions) {
				this.searchCondition[attr] = args.additionalConditions[attr];
			} 
		}
		this.containers.dataTable = args.containerId;
		this.containers.rowTemplate = args.templateId;
		var conditions = this.searchCondition;
		conditions["currentPage"] = 1;
		this.basicPost(url, this.searchCondition, 0, args, callback);
	},

	/**
	 * 编辑页面提交用Post *
	 * 
	 * @url： 提交请求url
	 * @type：返回请求后的处理类型（0：使用模板替换方式填充数据列表；1：使用模板替换方式填充数据对象；2：使用返回html填充目标容器）
	 * @callback：请求返回后执行回调函数
	 * @args参数:
	 * @formId：提交数据的表单id
	 * @containerId：待填充容器id
	 * @templateId：数据模板id
	 * @containerTitle: 弹出框标题
	 * @editConfirmUrl 弹出框确认路径
	 * @editFormId 弹出框参数表单Id
	 */
	postForm : function(url, type, args, callback) {
		var prms = this.getFormData(args.formId);
		if (typeof (args.processData) == "function") {
			prms = args.processData(prms);
		}
		this.basicPost(url, prms, type, args, callback);
	},

	/**
	 * 分页跳转调用方法
	 */
	redirectPage : function(currentPage, url) {
		if ($("#selectAll").length > 0) {
			$("#selectAll").get(0).checked = false;
		}
		this.listPageNo = currentPage;
		// search conditions
		var conditions = this.searchCondition;
		if (typeof (conditions) == "undefined" || conditions == null) {
			conditions = {};
		}
		conditions["currentPage"] = currentPage;
		// search url
		if (typeof (url) != "undefined") {
			this.searchUrl = url;
		}
		if (isEmpty(this.searchUrl)) {
			return;
		}
		// call basic post function
		this.basicPost(this.searchUrl, conditions, 0, {
			containerId : this.containers.dataTable,
			templateId : this.containers.rowTemplate
		});
	},

	refreshPagenation : function(page) {
		var html = "";
		if (page) {
			html = "<span class='current_page'>共 " + page.totalRows + " 条记录，当前第 <b>" + page.currentPage + "</b>/" + page.totalPages + " 页</span>";
			if (page.currentPage > 1) {
				html += "<span class='change_page' onclick='OBJECT_CACHE[" + this.objIndex + "].redirectPage(1);'>首页</span>";
				html += "<span class='change_page' onclick='OBJECT_CACHE[" + this.objIndex + "].redirectPage(" + page.previousPage + ");'>&lt;&lt; 上一页</span>";
			}
			if (page.currentPage < page.totalPages) {
				html += "<span class='change_page' onclick='OBJECT_CACHE[" + this.objIndex + "].redirectPage(" + page.nextPage + ");'>&gt;&gt; 下一页</span>";
				html += "<span class='change_page' onclick='OBJECT_CACHE[" + this.objIndex + "].redirectPage(" + page.totalPages + ");'>尾页</span>";
			}
		}
		$(this.containers.pagenation).html(html);
	},

	deleteObjects : function(id, url) {
		this.operateObjects(id, url, "删除");
	},

	operateObjects : function(id, url, title, prms,callback) {
		var sender = this;
		var idList = "";
		if (!isNull(id) && id != "") {
			// operate one
			idList = id;
		} else {
			// operate list
			idList = this.getSelectedValues();
		}
		if (idList == "") {
			top.Dialog.alert("请选择要" + title + "的记录！");
			return;
		}
		if (isNull(url)) {
			url = this.url.del;
		}
		if (isNull(prms)) {
			prms = {
				id : idList
			};
		}else{
			prms['id']=idList;
		}
		top.Dialog.confirm("你确定要" + title + "吗？", function() {
			sender.basicPost(url, prms, 3, null, function(response) {
				sender.redirectPage(sender.listPageNo);
				if(!isNull(callback)){
					callback();
				}else{
					top.Dialog.alert(title+"成功");
				}
				
			});
		}, null, 300, 120);
	},

	selectAll : function(obj) {
		$(".checkItem").each(function(index, item) {
			item.checked = obj.checked;
		});
	},

	selectItem : function(obj) {
		var allChecked = true;
		$(".checkItem").each(function(index, item) {
			if (!item.checked) {
				allChecked = false;
			}
		});
		$("#selectAll").get(0).checked = allChecked;
	},

	getSelectedValues : function() {

		var values = [];
		$(".checkItem").each(function(index, item) {
			if (item.checked) {
				values.push($(item).val());
			}
		});
		return values.join(',');
	}

};