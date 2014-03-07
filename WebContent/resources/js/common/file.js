var file = {

	upload : function(fileType, fileElementId, fileUsage, callback) {
		var url;
		if (typeof(globalContext)!="undefined" && globalContext == "cms") {
			url = '/proxy/CMS/file/upload?fileType=' + fileType + '&fileElementId=' + fileElementId + '&usage=' + fileUsage;
		} else {
			url = '/file/upload?fileType=' + fileType + '&fileElementId=' + fileElementId;
		}
		$.ajaxFileUpload({
			url : getContextUrl(url),
			secureuri : false,
			fileElementId : fileElementId,
			dataType : 'json',
			success : function(response, status) {
				callback(response);
			},
			error : function(data, status, e) {
			}
		});
		return false;
	},

	remove : function(fileType, newFileName){
		AjaxHelper.post(getContextUrl("/file/remove"), {fileType:fileType, newFileName:newFileName}, function(response) {}, 'html');
	},

	download : function(fileId) {
		AjaxHelper.post(getContextUrl("/file/check"), {id:fileId}, function(response) {
			if(response.flag == 'N') {
				top.Dialog.alert("文件已经不存在");
			} else {
				window.location.href = getContextUrl("/file/download?id=" + fileId);
			}
		});
	},

	exportExcel : function(data, template, fileName) {
		data.tmp = template;
		data.fileName = fileName;
		var param="";
		if (data) {
			for(var i in data) {
				if(param!="")
					param += "&";
				param += i+"="+data[i];
			}
		}
		var url = getContextUrl("/file/exportExcel" + encodeURI(param==""?"":("?"+param)));
		if (url.length >= 255) {
			data.tmp = template;
			AjaxHelper.post(getContextUrl("/file/generateExcel"), data, function(response) {
				if (response && response.filePath) {
					window.location.href = getContextUrl("/file/downloadExcel?path=" + response.filePath + "&tmp=" + template + "&fileName=" + fileName);
				}
			});
		} else {
			window.location.href = url;
		}
	},

	_attId : -1,
	_attName : '',
	_isSingal : 'false',
	_type : '',
	_file : '',
	_fileCheck : '',
	_usage : '',
	_pathId : '',

	deleteAttach : function(_id, newFileName, from) {
		$("#"+_id).remove();
		if (file._isSingal == 'true') {
			if(_id == -1) return;
			$("#"+file._fileCheck).val("");
			if(from == 0){
				$("#"+file._file).val("");
			}
			file.remove(file._type, newFileName);
		} else {
			if(from == 0) {
				file.remove(file._type, newFileName);
			}
		}
	},

	doUploadFile : function() {
		if(file._isSingal == 'true') {
			file.deleteAttach(file._attId, file._attName, 1);
		}
		showWaiting();
		return file.upload(file._type, file._file, file._usage, function(data) {
			if (data.success === false) {
				hideWaiting();
				if (data.fileSize === 0) {					
					top.Dialog.alert("请选择文件！");
				} else {
					top.Dialog.alert("文件上传失败，请联系管理员！");
				}
				return;
			}
			file._attName = data.newFileName;
			file._attId = data.newFileName.replace('.','');
			var tr = "<tr id='"+file._attId+"'><td><input type='hidden' class='newFileName' value='"+file._attName+"'/><input type='hidden' class='originFileName' value='"+data.originFileName+"'/>"+data.originFileName+"<a href='javascript:void(0);' title='删除' class='option_del' onclick = 'file.deleteAttach(\""+file._attId+"\", \""+file._attName+"\", 0)'></a></td></tr>";
			if(file._isSingal == 'true') {
				$("#"+file._fileCheck).val(file._attName);
			}
			if (!isNull(file._pathId) && !isNull(data.src)) {
				$("#" + file._pathId).val(data.src.replace('/oa-web/proxy/CMS', '/cms-web'));
			}
			hideWaiting();
			$("#attachment").append(tr);
		});
	}

};
