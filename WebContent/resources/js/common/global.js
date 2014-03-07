var mergeObject = function(obj1, obj2) {
	var target = {};
	for (var attr in obj1) {
		target[attr] = obj1[attr];
	}
	for (var attr in obj2) {
		target[attr] = obj2[attr];
	}
	return target;
};
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
};
String.prototype.replaceAll = function(fromStr, toStr) {
	return this.replace(new RegExp(fromStr, "gm"), toStr);
};

Array.prototype.indexOf = function(element /* , from */) {
	var len = this.length;
	var from = Number(arguments[1]) || 0;
	from = (from < 0) ? Math.ceil(from) : Math.floor(from);
	if (from < 0) {
		from += len;
	}
	for (; from < len; from++) {
		if (from in this && this[from] === element) {
			return from;
		}
	}
	return -1;
};
Array.prototype.removeItem = function(val) {
	var i;
	var j;
	for (i = 0; i < this.length; i++) {
		if (this[i] == val) {
			for (j = i; j < this.length - 1; j++) {
				this[j] = this[j + 1];
			}
			this.length = this.length - 1;
		}
	}
};
Array.prototype.remove = function(from, to) {
	var rest = this.slice((to || from) + 1 || this.length);
	this.length = from < 0 ? this.length + from : from;
	return this.push.apply(this, rest);
};
Array.prototype.removeAt = function(index) {
	var rest = this.slice(index + 1 || this.length);
	this.length = index < 0 ? this.length + index : index;
	return this.push.apply(this, rest);
};
Array.prototype.addRange = function(range) {
	for ( var cnt = 0; cnt < range.length; cnt++) {
		this.push(range[cnt]);
	}
};
Array.prototype.insertAt = function(index, value) {
	this.splice(index, 0, value);
};
Array.prototype.toObject = function() {
	var obj = {};
	for ( var cnt = 0; cnt < this.length; cnt++) {
		obj[cnt] = this[cnt];
	}
	return obj;
};

$.fn.disable = function() {
	return $(this).find("*").each(function() {
		$(this).attr("disabled", "disabled");
	});
};
function getContextUrl(url) {
	if (typeof (url) == "undefined") {
		url = "";
	}
	var date = "date=" + new Date().getTime();
	var urlc = (url.indexOf("?") == -1) ? url + "?" + date : url + "&" + date;
	var ctxLocal;
	if(typeof (ctx) == "undefined" ){
		ctxLocal=window.parent.ctx;
	}else{
		ctxLocal=ctx;
	}
	if (url.indexOf(ctxLocal) < 0) {
		urlc = ctxLocal + urlc;
	}
	return urlc;
}

var getDataList = function(containerId, repeatTagName) {
	var list = [];
	$("#" + containerId).find(repeatTagName).each(function() {
		var data = {};
		if ($(this).css("display") == "none") {
			return;
		}
		$(this).find(":input").each(function() {
			if ($(this).attr("type") == "radio") {
				if ($(this).attr("checked") == "checked") {
					data[$(this).attr("name")] = $(this).val();
				}
			} else if ($(this).attr("type") == "checkbox") {
				if ($(this).attr("checked") == "checked") {
					var name = $(this).attr("name");
					var value = data[name];
					if (isNull(value)) {
						data[name] = $(this).val();
					} else {
						data[name] = value + ";" + $(this).val();
					}
				}
			} else if ($(this).hasClass("date_input") && $(this).val().length > 0 && $(this).val().indexOf(" ") == -1) {
				data[$(this).attr("name")] = $(this).val() + " 00:00:00";
			} else {
				data[$(this).attr("name")] = $(this).val();
			}
		});
		var propertyCount = 0;
		for (var attr in data) {
			if (!isEmpty(data[attr])) {
				propertyCount++;
			}
		}
		if (propertyCount > 0) {
			list.push(data);
		}
	});
	return list;
};
var getCheckedDataList = function(containerId, repeatTagName) {
	var list = [];
	$("#" + containerId).find(repeatTagName).each(function() {
		var data = {};
		if ($(this).find("input:checkbox").attr("checked")) {
			$(this).find(":input").each(function() {
				data[$(this).attr("name")] = $(this).val();
			});
			list.push(data);
		}
	});
	return list;
};
function onDatePickerChanged(dp) {
	$(this).trigger("onDatePickerChanged");
}

function goTop() {
	$('html, body').animate({
		scrollTop : 0
	}, 'slow');
}

function goDiv(div) {
	var a = $("#" + div).offset().top - 200;
	$("html,body").animate({
		scrollTop : a
	}, 'slow');
}

function goBottom() {
	window.scrollTo(0, document.documentElement.scrollHeight
			- document.documentElement.clientHeight);
}

function isNull(object) {
	return typeof (object) == "undefined" || object == null;
}

function isEmpty(obj) {
	return obj == null || obj == "";
}
function nvl(object, defaultValue) {
	if (isNull(object) || object == "") {
		return defaultValue;
	}
	return object;
}

function getWindowSize() {
	var pageObj = document.documentElement || document.body;
	var w = pageObj.clientWidth || pageObj.offsetWidth;
	var h = pageObj.clientHeight || pageObj.offsetHeight;
	return {
		page : pageObj,
		width : w,
		height : h
	};
}
function coverAll(level) {
	discoverAll();
	var coverId = "coverObject";
	var coverObj = document.createElement("div");
	var wSize = getWindowSize();
	coverObj.style.position = "absolute";
	coverObj.id = coverId;
	coverObj.style.background = "#cccccc";
	coverObj.style.zIndex = level;
	coverObj.style.display = "";
	coverObj.style.top = "0px";
	coverObj.style.left = "0px";
	coverObj.style.width = wSize.page.scrollWidth + "px";
	coverObj.style.height = wSize.page.scrollHeight + "px";
	coverObj.onclick = function() {
		return false;
	};
	coverObj.style.filter = "alpha(opacity=40)";
	coverObj.style.opacity = "0.4";
	document.body.appendChild(coverObj);
}
function discoverAll() {
	var coverObj = document.getElementById("coverObject");
	if (coverObj) {
		document.body.removeChild(coverObj);
	}
}
function showWaiting() {
	coverAll(9999);
	var waiting = $("#waitingContainer");
	waiting.css("left", ($(window).width() - waiting.width()) / 2 + "px").css(
			"top", ($(window).height() - waiting.height()) / 2 + "px").css(
			"zIndex", 1000).show();
}
function hideWaiting() {
	discoverAll();
	$("#waitingContainer").hide();
}

var resizeFunctions = [];
function resetContentSize() {
	var bodyWidth = $(window).width() - 36;
	$(".navigator .menu_group").width(bodyWidth - 268);
	$(".top_middle").width(bodyWidth);
	$(".content_wrapper").width(bodyWidth);
	$(".bottom_middle").width(bodyWidth + 7);
	var bodyHeight = $(window).height() - 145;
	$(".content").height(bodyHeight);
	$(".menu_container").height(bodyHeight);
	$(".menu_container .menu_group").width($(".menu_container").width() - 6);
	$(".menu_container .menu_group").height(bodyHeight - 2);
	$(".spliter_container").height(bodyHeight);
	$(".spliter").css("marginTop", (bodyHeight - 42) / 2);
	$(".page_container").height(bodyHeight - 32);
	var contentWidth = bodyWidth - $(".spliter_container").width();
	if ($(".menu_container").css("display") != "none") {
		contentWidth -= $(".menu_container").width();
	}
	$(".content_title").width(contentWidth);
	$(".page_container").width(contentWidth);
	menu.refreshContainer();
	for ( var count = 0; count < resizeFunctions.length; count++) {
		if (typeof (resizeFunctions[count]) == "function") {
			resizeFunctions[count]();
		}
	}
}
function scrollNavigator(moveLeft) {
	var itemWidth = 91;
	var moveObj = $(".navigator .menu_group .menu_move");
	var marginLeft = parseFloat(moveObj.css("marginLeft"));
	if (isNaN(marginLeft)) {
		marginLeft = 0;
	}
	var maxWidth = (moveObj.find(".menu_item").length - 1) * itemWidth;
	var containerWidth = moveObj.width();
	if (moveLeft) {
		if (itemWidth + maxWidth <= containerWidth) {
			return;
		}
		marginLeft -= itemWidth;
	} else {
		if (marginLeft >= 0) {
			return;
		}
		marginLeft += itemWidth;
	}
	moveObj.css("marginLeft", marginLeft + "px");
}
function changeUserPassword(id) {
	var helper = new dataHelper();
	var args = (typeof (id) == "undefined") ? null : {
		"id" : id
	};
	helper.basicPost('/user/changePassword', args, 2, {
		width : 320,
		height : 180,
		containerId : 'passwordContainer',
		containerTitle : (args == null ? '密码修改' : '密码重置'),
		editConfirmUrl : '/user/savePassword',
		editFormId : 'changePasswordFormId',
		successMessage : '修改成功！',
		refreshList : false,
		customValidate : function() {
			var message = "", firstCtrl = null;
			var password = $("#password");
			if (password.length == 1 && "" == password.val()) {
				message += "旧密码不能为空！<br/>";
				firstCtrl = password;
			}
			var newpwd = $("#newPassword");
			if ("" == newpwd.val()) {
				message += "新密码不能为空！<br/>";
				if (firstCtrl == null) {
					firstCtrl = newpwd;
				}
			}
			var confirmpwd = $("#confirmPwd");
			if ("" == confirmpwd.val()) {
				message += "确认密码不能为空！<br/>";
				if (firstCtrl == null) {
					firstCtrl = confirmpwd;
				}
			}
			if (newpwd.val() != confirmpwd.val()) {
				message += "两次密码不统一！<br/>";
				if (firstCtrl == null) {
					firstCtrl = confirmpwd;
				}
			}
			if (message == "") {
				return true;
			}
			top.Dialog.alert(message, function() {
				firstCtrl.focus().select();
			});
			return false;
		}
	});
}
function gotoDefaultPage() {
	menu.loadContent("/home/index", "个人首页", 0);
}
function viewInformation(id) {
	var helper = new dataHelper();
	helper.basicPost('/login/myInformation', null, 2, {
		width : 500,
		height : 200,
		containerId : 'editContainer',
		containerTitle : '我的个人信息',
		editConfirmUrl : '/login/saveMyInformation',
		editFormId : 'userFormId',
		successMessage : '保存成功！',
		refreshList : false,
		preProcess : function(prms) {
			var data = {};
			$(".userConfig").each(function(index, obj) {
				data[$(obj).attr("name")] = (obj.checked) ? 1 : 0;
			});
			prms.json = $.toJSON(data);
			return prms;
		},
		defaultButtons: {
			okText : "保 存",
			cancelText : '关 闭'
		}
	});
}
function switchDepartment() {
	var helper = new dataHelper();
	helper.basicPost('/login/switchDepartment', null, 2, {
		width : 320,
		height : 180,
		containerId : 'editContainer',
		containerTitle : '切换当前科室',
		editConfirmUrl : '/login/updateDepartment',
		editFormId : 'userFormId',
		successMessage : '切换成功！',
		refreshList : false,
		defaultButtons: {
			okText : "切 换",
			cancelText : '关 闭'
		},
		successProcess : function() {
			window.location.href = getContextUrl('/login/home'); 
		}
	});
}
function updateDeptList(obj, deptId) {
	AjaxHelper.get(
			getContextUrl("/login/getMyDepartmentList"),
		{ orgId : $(obj).val() },
		function(response) {
			var ctrl = $("#" + deptId).get(0);
			dropdown.clearOptions(ctrl);
			if (typeof(response) == "undefined" || typeof(response.deptList) == "undefined" || response.deptList.length == 0) {
				return;
			}
			$(response.deptList).each(function(index, obj) {
				dropdown.addOption(ctrl, obj.name, obj.id);
			});
		}
	);
}
function dicCheckBoxSelectAll(obj) {
	var fieldset = $(obj).parents('fieldset')[0];
	$(fieldset).find("input:checkbox").attr("checked", !isNull($(obj).attr("checked")));
}
function dicCheckBoxShowAll(obj) {
	var fieldset = $(obj).parents('fieldset')[0];
	$(fieldset).hide();
}

function analyzeCardNo(cardNo) {
	var result = {
		valid : false,
		message : null,
		birthday : null,
		gender : 0
	};
	if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(cardNo))) {
		result.message = '身份证号长度不对，或不符合格式要求';
		return result;
	}
	if (cardNo.length == 15) {
		re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);
		var arrSplit = cardNo.match(re);
		var birthday = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]);
		var birthdayMatch = (birthday.getYear() == Number(arrSplit[2]))
				&& ((birthday.getMonth() + 1) == Number(arrSplit[3]))
				&& (birthday.getDate() == Number(arrSplit[4]));
		if (!birthdayMatch) {
			result.message = '身份证号中的出生日期错误';
			return result;
		}
		result.valid = true;
		result.birthday = "19" + cardNo.substr(6,2) + "-" + cardNo.substr(8,2) + "-" + cardNo.substr(10,2);
		result.gender = (parseInt(cardNo.substr(14,1))%2==0) ? 2 : 1;
	} else {
		re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/);
		var arrSplit = cardNo.match(re);
		var birthday = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]);
		var birthdayMatch = (birthday.getFullYear() == Number(arrSplit[2]))
				&& ((birthday.getMonth() + 1) == Number(arrSplit[3]))
				&& (birthday.getDate() == Number(arrSplit[4]));
		if (!birthdayMatch) {
			result.message = '身份证号中的出生日期错误';
			return result;
		}
		// 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
		var valnum;
		var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
		var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
		var nTemp = 0, i;
		for (i = 0; i < 17; i++) {
			nTemp += cardNo.substr(i, 1) * arrInt[i];
		}
		valnum = arrCh[nTemp % 11];
		if (valnum != cardNo.substr(17, 1)) {
			result.message = '身份证号中的校验位错误';
			return result;
		}
		result.valid = true;
		result.birthday = cardNo.substr(6,4) + "-" + cardNo.substr(10,2) + "-" + cardNo.substr(12,2);
		result.gender = (parseInt(cardNo.substr(16,1))%2==0) ? 2 : 1;
	}
	return result;
}

function clone(obj) {
	// Handle the 3 simple types, and null or undefined
	if (null == obj || "object" != typeof obj) return obj;

	// Handle Date
	if (obj instanceof Date) {
		var copy = new Date();
		copy.setTime(obj.getTime());
		return copy;
	}

	// Handle Array
	if (obj instanceof Array) {
		var copy = [];
		for (var i = 0, len = obj.length; i < len; i++) {
			copy[i] = clone(obj[i]);
		}
		return copy;
	}

	// Handle Object
	if (obj instanceof Object) {
		var copy = {};
		for (var attr in obj) {
			if (obj.hasOwnProperty(attr)) copy[attr] = clone(obj[attr]);
		}
		return copy;
	}

	throw new Error("Unable to copy obj! Its type isn't supported.");
}