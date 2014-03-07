function HSajax() {
}
$.ajaxSetup({cache:true});
HSajax.prototype = {

	/**
	 * 载入远程 HTML 文件代码并插入至 DOM 中。
	 * 
	 * @param element
	 *            页面元素id
	 * @param url
	 *            (String) : 请求的HTML页的URL地址。
	 * @param data
	 *            (Map) : (可选参数) 发送至服务器的 key/value 数据。
	 * @param callback
	 *            (Function) : (可选参数) 请求完成时(不需要是success的)的回调函数。
	 */
	load : function(element, url, data, callback) {
		this.ajax(url, data, "GET", function(data, textStatus) {
			$(element).html(data);
			if (!isNull(callback)) {
				callback(data);
			}
		}, "html");
	},

	/**
	 * 使用POST方式来进行异步请求
	 * 
	 * @param url(String) :
	 *            发送请求的URL地址.
	 * @param data(Map) :
	 *            (可选) 要发送给服务器的数据，以 Key/value 的键值对形式表示。
	 * @param callback(Function) :
	 *            (可选) 载入成功时回调函数(只有当Response的返回状态是success才是调用该方法)。
	 * @param type(String) :
	 *            (可选)规定预期的服务器响应的数据类型。默认执行智能判断（xml、json、script 或 html）。
	 */
	post : function(url, data, callback, type) {
		this.ajax(url, data, "POST", callback, type);
	},

	/**
	 * 使用GET方式来进行异步请求
	 * 
	 * @param url
	 *            (String) : 发送请求的URL地址.
	 * @param data(Map) :
	 *            (可选) 要发送给服务器的数据，以 Key/value 的键值对形式表示，会做为QueryString附加到请求URL中。
	 * @param callback(Function) :
	 *            (可选) 载入成功时回调函数(只有当Response的返回状态是success才是调用该方法)。
	 */
	get : function(url, data, callback) {
		this.ajax(url, data, "GET", callback);
	},

	/**
	 * 
	 * @param url
	 *            (默认: 当前页地址) 发送请求的地址。
	 * @param data
	 *            发送到服务器的数据。将自动转换为请求字符串格式。GET 请求中将附加在 URL 后。查看 processData
	 *            选项说明以禁止此自动转换。必须为 Key/Value 格式。如果为数组，jQuery 将自动为不同值对应同一个名称。如
	 *            {foo:["bar1", "bar2"]} 转换为 '&foo=bar1&foo=bar2'。
	 * @param type
	 *            (默认: "GET") 请求方式 ("POST" 或 "GET")， 默认为 "GET"。注意：其它 HTTP 请求方法，如
	 *            PUT 和 DELETE 也可以使用，但仅部分浏览器支持。
	 * @param dataType
	 *            预期服务器返回的数据类型。如果不指定，jQuery 将自动根据 HTTP 包 MIME 信息返回 responseXML 或
	 *            responseText，并作为回调函数参数传递，可用值:<br>
	 *            "xml": 返回 XML 文档，可用 jQuery 处理。<br>
	 *            "html": 返回纯文本 HTML 信息；包含 script 元素。<br>
	 *            "script": 返回纯文本 JavaScript 代码。不会自动缓存结果。<br>
	 *            "json": 返回 JSON 数据 。<br>
	 *            "jsonp": JSONP 格式。使用 JSONP 形式调用函数时，如 "myurl?callback=?" jQuery
	 *            将自动替换 ? 为正确的函数名，以执行回调函数。
	 * @param contentType
	 *            (默认: "application/x-www-form-urlencoded")
	 *            发送信息至服务器时内容编码类型。默认值适合大多数应用场合。
	 * @param success
	 *            请求成功后回调函数。这个方法有两个参数：服务器返回数据，返回状态<br>
	 *            function (data, textStatus) {<br> // data could be xmlDoc,
	 *            jsonObj, html, text, etc...<br>
	 *            this; // the options for this ajax request<br> }
	 * @param error
	 *            (默认: 自动判断 (xml 或 html)) 请求失败时将调用此方法。这个方法有三个参数：XMLHttpRequest
	 *            对象，错误信息，（可能）捕获的错误对象。<br>
	 *            function (XMLHttpRequest, textStatus, errorThrown) {<br> //
	 *            通常情况下textStatus和errorThown只有其中一个有值 <br>
	 *            this; // the options for this ajax request<br> }
	 * @param beforeSend
	 *            发送请求前可修改 XMLHttpRequest 对象的函数，如添加自定义 HTTP 头。XMLHttpRequest
	 *            对象是唯一的参数。<br>
	 *            function (XMLHttpRequest) {<br>
	 *            this; // the options for this ajax request<br> }
	 * @param complete
	 *            请求完成后回调函数 (请求成功或失败时均调用)。参数： XMLHttpRequest 对象，成功信息字符串。<br>
	 *            function (XMLHttpRequest, textStatus) {<br>
	 *            this; // the options for this ajax request<br> }
	 */
	ajax : function(url, data, type, success, dataType, error, beforeSend,
			complete) {
		$.ajaxSetup({cache:true});
		var _success = this._success;
		var _error = this._error;
		var sender = this;		
		$.ajax({
			type : type,
			url : url,
			data : data,
			dataType : dataType,
			beforeSend : function(XMLHttpRequest) {
				sender._beforeSend(XMLHttpRequest);
				if (typeof(beforeSend) == "function") {
					beforeSend(XMLHttpRequest);
				}
			},
			success : function(data, textStatus, a) {
				if (sender._success(data, textStatus, a)) {
					success(data);
				}
			},
			complete : function(XMLHttpRequest, textStatus) {
				sender._complete(XMLHttpRequest, textStatus);
				if (typeof(complete) == "function") {
					complete(XMLHttpRequest, textStatus);
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				sender._error(XMLHttpRequest, textStatus, errorThrown);
			}
		});
	},

	_success : function(data, textStatus, a) {
		// response data is string
		if (data.toString().indexOf("redirectUrl") > -1) {
			data = JSON.parse(data);
			if (!isNull(data.redirectUrl)) {
				top.window.location.href = ctx + data.redirectUrl;
				return false;
			}
		}
		// response data is object
		if (typeof(JSON) != "undefined" && JSON.stringify(data).indexOf("redirectUrl") > -1) {
			if (!isNull(data.redirectUrl)) {
				top.window.location.href = ctx + data.redirectUrl;
			}
		}
		if (data.toString().indexOf("id=\"error\"") > -1) {
			top.Dialog.enableButtons();
			top.Dialog.alert(data.toString());
			return false;
		}
		return true;
	},

	_error : function(XMLHttpRequest, textStatus, errorThrown) {
		top.Dialog.enableButtons();
		// 请求出错处理
		switch (XMLHttpRequest.status) {
		case 400:
			top.Dialog.alert(textStatus + "请求错误，请检查请求地址是否正确。");
			break;
		case 403:
			top.Dialog.alert("没有相关功能权限");
			break;
		case 500:
			top.Dialog.alert("系统错误，请与管理员联系。" + XMLHttpRequest.status + "\r\n"
					+ XMLHttpRequest.responseText, null, 1000, 600);
			break;
		default:
			top.Dialog.alert("系统错误，请与管理员联系。" + XMLHttpRequest.status + "\r\n"
					+ XMLHttpRequest.responseText, null, 1000, 600);
			break;
		}
	},

	_beforeSend : function(XMLHttpRequest) {
		// start loading status
		showWaiting();
	},

	_complete : function(XMLHttpRequest, textStatus) {
		// finish loading status
		hideWaiting();		
		top.Dialog.enableButtons();
	}

};

if (AjaxHelper == null) {
	var AjaxHelper = new HSajax();
}
