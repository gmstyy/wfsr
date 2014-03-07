if (typeof (PARAMS_CACHE) == "undefined") {
	PARAMS_CACHE = [];
}

var selectCategory = function(tag) {
	hideBusiness(tag);
	$('#businessCode_'+tag).val('');
	var val = $('#workflowCategory_'+tag).val();
	$('#business_'+tag+'_'+val).show();
	if(tag == 2){
		selectBusiness(tag, val);
	}
};

var selectBusiness = function(tag,val) {
	$('#businessCode_'+tag).val($('#business_'+tag+'_'+val).val());
};

var hideBusiness = function(tag) {
	$('#business_'+tag+'_1').hide();
	$('#business_'+tag+'_2').hide();
};

var taskValidateModel = {
	sourceType : { must : true, fieldName : "任务来源" },
	taskType : { must : true, fieldName : "任务类别" },
	place : { must : true, fieldName : "场所" },	
	address : { must : true, fieldName : "地址" },
	usersName : { must : true, fieldName : "负责人" }
	//chargePersonTel : { type : "telephone", fieldName : "联系电话" }
};

var taskHelper = new dataHelper(null, taskValidateModel);

var queryTasks = function(relationId, categoryCode) {
	if($("#taskCount").text() == '0'){
		top.Dialog.alert('无任务记录');
		return;
	}
	taskHelper.basicPost('/task/query', {relationId:relationId,categoryCode:categoryCode}, 2, {
		containerId : 'taskListContainer',
		containerTitle : '查看任务',
		defaultButtons: {
			okEnabled : false
		}
	});
};

var viewTaskDeail = function(id) {
	taskHelper.basicPost('/task/view', {id:id}, 2, {
		containerId : 'taskViewDetailContainer',
		containerTitle : '查看任务详情',
		defaultButtons: {
			okEnabled : false
		}
	});
};

var workflowValidateModel = {
	workflowId : { must : true, fieldName : "选择流程" }
};
var workflowHelper = new dataHelper(null, workflowValidateModel);

var queryWorkflows = function(relationId, categoryCode) {
	if($("#workflowCount").text() == '0'){
		top.Dialog.alert('无发起流程记录');
		return;
	}
	workflowHelper.basicPost('/approve/query', {relationId:relationId,categoryCode:categoryCode}, 2, {
		containerId : 'workflowListContainer',
		containerTitle : '查看发起流程审批',
		defaultButtons: {
			okEnabled : false
		}
	});
};

var viewWorkflowDetail = function(id) {
	workflowHelper.basicPost('/approve/view', {id:id}, 2, {
		containerId : 'workflowViewDetailContainer',
		containerTitle : '查看审批情况',
		defaultButtons: {
			okEnabled : false
		}
	});
};

var passParams = function(data) {
	PARAMS_CACHE = [];
	PARAMS_CACHE.push(data);
};

var addTask = function() {
	var namespace = "task";
	//任务创建完成dialog关闭后回调函数
	taskHelper.removeAllListener("taskContainer",namespace);
	taskHelper.addListener("editCompleted", taskCount, "taskContainer",namespace);
	
	taskHelper.basicPost('/task/add', PARAMS_CACHE[0], 2, {
		containerId : 'taskContainer',
		containerTitle : '新建任务',
		successMessage : '新建任务成功',
		editConfirmUrl : '/task/manage/save',
		editFormId : 'taskDetailFormId',
		validate : true,
		refreshList : false,
		namespace : namespace,
		preProcess : function(prms) {
			prms[$("#CSRFTokenName").val()]=$("#CSRFToken").val();
			return prms;
		}
	});	
};

var addWorkflow = function() {	
	var namespace = "workflow";
	//任务创建完成dialog关闭后回调函数
	workflowHelper.removeAllListener("workflowContainer",namespace);
	workflowHelper.addListener("editCompleted", workflowCount, "workflowContainer",namespace);
	
	workflowHelper.basicPost('/approve/choose', PARAMS_CACHE[0], 2, {
		height : 100,
		width : 300,
		containerId : 'workflowContainer',
		containerTitle : '发启流程审批',
		successMessage : '发启流程审批成功',
		editConfirmUrl : '/approve/start',
		editFormId : 'startWorkflowFormId',
		validate : true,
		refreshList : false,
		namespace : namespace,
		defaultButtons: {
			okText : '发起审批'
		}
	});
};

var taskCount = function() {
	taskHelper.basicPost('/task/count', {relationId:PARAMS_CACHE[0].relationId,categoryCode:PARAMS_CACHE[0].categoryCode}, null, null, function(response) {
		$(top.document).find("#taskCount").html(response.taskCount);
	});
};

var workflowCount = function() {
	workflowHelper.basicPost('/approve/count', {relationId:PARAMS_CACHE[0].relationId,categoryCode:PARAMS_CACHE[0].categoryCode}, null, null, function(response) {
		$(top.document).find("#workflowCount").html(response.approveCount);
	});
};

var viewHelper = new dataHelper();

var viewMajorevents = function(id) {
	viewHelper.basicPost('/majorevents/view', {'id' : id}, 2, {
		containerId : 'editContainer',
		containerTitle : '查看重大活动保障',
		defaultButtons: {
			okEnabled : false
		}
	});
};

var viewEmergency = function(id) {
	helper.basicPost('/emergency/view', {
		'id' : id
	}, 2, {
		containerId : 'editContainer',
		containerTitle : '查看突发应急',
		defaultButtons:{
			okEnabled:false
		}
	});
};

var viewComplaints = function(id,invalidMark) {
	var msg;
	if(invalidMark==1){//有效投诉
		msg='查看投诉举报(有效投诉)';
	}else{
		msg="查看投诉举报(无效投诉)";
	}
	helper.basicPost('/complaints/view', {
		'id' : id
	}, 2, {
		containerId : 'editContainer',
		containerTitle : msg,
		height : 660,
		awidth : 800,
		defaultButtons:{
			okEnabled:false,
			cancelEnabled:true,	
			cancelText:"关闭"
		}
	});
};

var viewLicense = function(id, licenseType) {
	viewHelper.basicPost('/app/view', {
		'id' : id,
		'licenseType' : licenseType
	}, 2, {
		containerId : 'editContainer',
		containerTitle : '查看',
		defaultButtons: {
			okEnabled : false
		}
	});
};


var viewDocument = function(id) {
	viewHelper.basicPost('/docManage/view', {
		'id' : id
	}, 2, {
		containerId : 'editContainer',
		containerTitle : '公文查看',
		defaultButtons:{
			okEnabled:false
		}
	});
};

var viewAcceptCase = function(id) {
	viewHelper.basicPost('/case/accept/view', {id:id}, 2, {
		containerId : 'editContainer',		
		containerTitle : '查看',
		defaultButtons: {
			okEnabled : false
		}
	});
};

var viewRegistCase = function(id) {
	viewHelper.basicPost('/case/regist/view', {id:id}, 2, {
		containerId : 'editContainer',		
		containerTitle : '查看',
		defaultButtons: {
			okEnabled : false
		}
	});
};

var viewInvestigateCase = function(id) {
	viewHelper.basicPost('/case/investigate/view', {id:id}, 2, {
		containerId : 'editContainer',		
		containerTitle : '查看',
		defaultButtons: {
			okEnabled : false
		}
	});
};

var viewFinishCase = function(id) {
	viewHelper.basicPost('/case/finish/view', {id:id}, 2, {
		containerId : 'editContainer',		
		containerTitle : '查看',
		defaultButtons: {
			okEnabled : false
		}
	});
};

var viewPunishCase = function(id) {
	viewHelper.basicPost('/case/punish/view', {id:id}, 2, {
		containerId : 'editContainer',		
		containerTitle : '查看',
		defaultButtons: {
			okEnabled : false
		}
	});
};

var viewHearCase = function(id) {
	viewHelper.basicPost('/case/hear/view', {id:id}, 2, {
		containerId : 'editContainer',		
		containerTitle : '查看',
		defaultButtons: {
			okEnabled : false
		}
	});
};

var constructUploadPrams = function(prams){
	var newFileNames = [];
	$(".newFileName").each(function(index, item) {
		newFileNames.push($(item).val());
	});
	prams.newFileNames = newFileNames.join(",");
	
	var originFileNames = [];
	$(".originFileName").each(function(index, item) {
		originFileNames.push($(item).val());
	});
	prams.originFileNames = originFileNames.join(",");
	return prams;
};









