<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container">
	<form id="search_form"  action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 100px;">
				<col>
				<col style="width: 100px;">
				<col>
				<col style="width: 100px;">
				<col>	
			</colgroup>
			<thead>
				<tr>
					<th>科室</th>
					<td><hs:dic dicName="DEPT" id="departmentId" name="departmentId:Integer:LIKE" value1="${loginUser.orgId}" defalt="${loginUser.departmentId}" /></td>
					<th>监督员</th>
					<td><input type="text" id="name" name="name:String:LIKE"></td>
					<th>性别</th>
					<td><hs:dic dicName='GENDER' id="gender" name="gender" value1="1" /></td>
				</tr>
				<tr>
					<th>出生日期</th>
					<td><tag:dateInput onlypast="false" name="startDate" />~<tag:dateInput onlypast="false" name="endDate" /></td>
					<th>政治面貌</th>
					<td><hs:dic dicName='POLITICAL_LANDSCAPE' id="politicalLandscape" name="politicalLandscape"/></td>
					<th>最高学历</th>
					<td><hs:dic dicName='EDUCATION' id="education" name="education"/></td>
				</tr>
			</thead>
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			<input class="button_reset" onclick="$('form')[0].reset();" type="button" /> 
			<input class="button_search" onclick="search();" type="button" />
		</div>
	</form>
</div>
<div id="list_container">
	<table class="repeattable">
		<caption>
			<a class="button_add" href="javascript:void(0);" onclick="editObject(0);">新建</a>
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/employee/delete');">删除</a>
		</caption>
		<colgroup>
			<col style="width: 40px;">
			<col style="width: 60px;">
			<col style="width: 180px;">
			<col style="width: 150px;">
			<col style="width: 150px;">
			<col style="width: 80px;">
			<col style="width: 150px;">
			<col style="width: 120px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>编号</th>
				<th>科室</th>
				<th>工号</th>
				<th>监督员</th>
				<th>性别</th>
				<th>联系电话</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display:none;">
	 		<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
	 		<td style="text-align: center;">#rowCount#</td>
			<td style="text-align: center;">#departmentId#</td>
			<td style="text-align: center;">#workNo#</td>
			<td style="text-align: center;">#name#</td>
			<td style="text-align: center;">#gender#</td>
			<td style="text-align: center;">#mobile#</td>			
	 		<td style="text-align: center;">
	 			<div class="option_container">
					<a href="javascript:void(0);" title="轮岗" class="option_process" onclick="updateDept('#id#');"></a>
					<a href="javascript:void(0);" title="修改" class="option_edit" onclick="editObject('#id#');"></a>
					<a href="javascript:void(0);" title="删除" class="option_delete" onclick="helper.deleteObjects('#id#','/employee/delete');"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<div id="detailContainor" style="display: none;"></div>
<script type="text/javascript">
var templateModel = {
	id : null,
	departmentId : null,
	workNo : null,
	name : null,
	mobile : null,
	cardNo : null,
	gender : null,
	accountLocation : null,
	sortNo:null
};
var validateModel = {
	name : { must : true, fieldName : "监督员" },
	gender : { must : true, fieldName : "性别" },
	cardNo : { type : "identify", fieldName : "身份证号" },
	birthday : { must : true, fieldName : "出生日期" },
	workNo : { must : true, fieldName : "工号" },
	departmentId : { must : true, fieldName : "编制科室ID" },
	proWorkDatetime : { type : "positiveNumber", fieldName : "参加卫生监督工作年份" },
	politicalLandscape : { must : true, fieldName : "政治面貌" },
	education : { must : true, fieldName : "最高学历" }
};
var helper = new dataHelper(templateModel, validateModel);
var search = function() {
	helper.postSearch('/employee/search',{formId:'search_form',containerId:'data_table',templateId:'template'});
};
var editObject = function(id) {
	helper.basicPost('/employee/edit', {'id' : id }, 2, {
			containerId : 'editContainer',
			containerTitle : (id == 0 ? '新增人员' : '修改人员'),
			successMessage : (id == 0 ? '人员新增成功' : '人员修改成功'),
			editConfirmUrl : '/employee/save',
			editFormId : 'editFormId',
			width : 900,
			height : 600,
			validate : true,
			/* validateMultipleList : [{
					containerId : "addEducationNode",
					repeatTagName : "tbody",
					model : {
						startDatetime : { must : true, fieldName : "起始日期" },
						endDatetime : { must : true, fieldName : "终止日期" },
						educationOrg : { must : true, fieldName : "教育机构" },
						major : { must : true, fieldName : "专业" },
						degree : { must : true, fieldName : "学位" },
						education : { must : true, fieldName : "学历" }
					}
				},{
					containerId : "addExperienceNode",
					repeatTagName : "tbody",
					model : {
						startDatetime: { must : true, fieldName : "开始日期" },
						endDatetime: { must : true, fieldName : "结束日期" },
						workUnit: { must : true, fieldName : "工作单位" },
						position: { must : true, fieldName : "职位" },
						title: { must : true, fieldName : "职称" },
						description:{ must : true, fieldName : "描述" }
					}
				},{
					containerId : "addfamilyNode",
					repeatTagName : "tbody",
					model : {
						relationship:{ must : true, fieldName : "家庭关系" },
						name:{ must : true, fieldName : "姓名" },
						workUnit:{ must : true, fieldName : "工作单位" },
						telephone:{ must : true, fieldName : "联系电话" }
					}
				},{
					containerId : "addDepartmentNode",
					repeatTagName : "tbody",
					model : {
						departmentId:{ must : true, fieldName : "科室" },
						positionCode:{ must : true, fieldName : "行政职务" },
					}
				}
			], */
			preProcess : function(prms){
				prms.educat = $.toJSON(getDataList("addEducationNode", "tbody"));
				prms.experience = $.toJSON(getDataList("addExperienceNode", "tbody"));
				prms.family = $.toJSON(getDataList("addfamilyNode", "tbody"));
				prms.dept = $.toJSON(getDataList("addDepartmentNode", "tbody"));
				return prms;
			}
	});
};
var updateDept = function(id) {
	helper.basicPost('/user/updateDept', {'id' : id }, 2, {
			containerId : 'editContainer',
			containerTitle : '轮岗',
			successMessage : '人员修改成功',
			editConfirmUrl : '/user/updateDeptSave',
			editFormId : 'userFormId',
			width : 900,
			height : 600,
			validate : true
	});
};
search();
</script>
