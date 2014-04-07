<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="search_container">
	<form id="search_form"  action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
			   <col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 160px;">
				
			</colgroup>
			<thead>
				<tr>
				
					<th width="100px">选择考核记录 </th>
					<!-- <td><a href="javascript:void(0);" title="选择模板" class="option_edit"  onclick="select();"></a></td> -->
					<td><select id="list"  name="list" style="width:200px; ">
				        <c:forEach  var="list" items="${arList}" varStatus="status">
							<option value="${list.id}">${list.name}</option>
						</c:forEach>
				    </select>   
				    </td>
					<td></td>
	
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
		<colgroup>
			<col style="width: 50px;">
			<col style="width: 100px;">
			<col style="width: 100px;">
			<col style="width: 100px;">
			<col style="width: 100px;">		
			<col style="width: 100px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				
				<th>编号</th>
			<!-- 	<th>考核名称</th> -->
				<th>考核人</th>
				<th>被考核人</th>
				<th>得分</th>
				<th>完成状态</th>
				<th>操作</th>
           </tr>
		</thead>
		<tbody id="data_table">
		
		</tbody>
	
		<tr id="template" style="display:none;">

	 	
	 		<td style="text-align: center;">#rowCount#</td>
	 		<!-- <td>#name#</td> -->
			<td>#operatorName#</td>
			<td>#targetName#</td>
			<td>#score#</td>
            <td>#status#</td>
	 		<td style="text-align: center;">
	 			<div class="option_container">

					<a href="javascript:void(0);" title="查看" class="option_view" onclick="view('#id#');"></a>

				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>


	<div id="tabs" style="background-color:white;">
	<div style="float:left;background-color:white;">
	<a  id="viewScore" class="button_regist" href="javascript:void(0);" onclick="viewScore();">查看个人考核结果</a>
	</div>
	<div style="float:left;background-color:white;">
	<a  id="extraScore" class="button_start_case" href="javascript:void(0);" onclick="extraEdit();">个人附加分打分</a>
	</div>
	<ul style="float:right;">
		<li class="tabs-1"><span>打分记录</span></li>
		<li class="tabs-2"><span>被打分记录</span></li>		
	</ul>	
	
	<div id="tabs-1">
	  <div id="list_container1">
	<table class="repeattable">
		<colgroup>
			<col style="width: 50px;">
			<col style="width: 100px;">
			<col style="width: 100px;">
			<col style="width: 100px;">
			<col style="width: 100px;">		
			<col style="width: 100px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>编号</th>
				<th>考核人</th>
				<th>被考核人</th>
				<th>得分</th>
				<th>完成状态</th>
				<th>操作</th>
           </tr>
		</thead>
		<tbody id="data_table1">
		
		</tbody>
	
		<tr id="template1" style="display:none;text-align:center;">

	 		<td style="text-align: center;">#rowCount#</td>
			<td>#operatorName#</td>
			<td>#targetName#</td>
			<td>#score#</td>
            <td>#status#</td>
	 		<td style="text-align: center;">
	 			<div class="option_container">

					<a href="javascript:void(0);" title="查看" class="option_edit" onclick="edit('#id#');"></a>
				</div>
			</td>
		</tr>
	</table>
</div>
	
	</div>
	
	
	<div id="tabs-2">
	  <div id="list_container2">
	<table class="repeattable">
		<colgroup>
			<col style="width: 50px;">
			<col style="width: 100px;">
			<col style="width: 100px;">
			<col style="width: 100px;">
			<col style="width: 100px;">		
			<col style="width: 100px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>编号</th>
				<th>考核人</th>
				<th>被考核人</th>
				<th>得分</th>
				<th>完成状态</th>
				<th>操作</th>
           </tr>
		</thead>

		<tbody id="data_table2">
		   
		</tbody>
		<tr id="template2" style="display:none;text-align:center;">

	 		<td style="text-align: center;">#rowCount#</td>
			<td>#operatorName#</td>
			<td>#targetName#</td>
			<td>#score#</td>
            <td>#status#</td>
	 		<td style="text-align: center;">
	 			<div class="option_container">

					<a href="javascript:void(0);" title="查看" class="option_view" onclick="view('#id#');"></a>
					
				</div>
			</td>
		</tr>
	</table>
</div>
	</div>
	
	
	
	</div>




<script type="text/javascript">
var templateModel = {
		id : null,
		name : null,
		operatorName : null,
		targetName : null,
		score : null,
		status : null
	};
	
var helper = new dataHelper(templateModel); 
var helper1 = new dataHelper(templateModel);
var helper2 = new dataHelper(templateModel);
var helper3 = new dataHelper(templateModel);

/* var searchIndx = function(){
	$("#tabs").hide();
	//$("#list_container2").hide();
	helper.postSearch('/mark/search',{containerId:'data_table',templateId:'template'});
};
 */
var search = function(){
	$("#list_container").hide();
	$("#tabs").show();
	//$("#list_container2").show();
	helper1.postSearch('/mark/operator/search',{formId:'search_form',containerId:'data_table1',templateId:'template1'});
	helper2.postSearch('/mark/target/search',{formId:'search_form',containerId:'data_table2',templateId:'template2'}); 
};

 $(function() {
	 $("#tabs").hide();
}); 

var viewScore = function() {
	helper3.basicPost('/mark/get/assess', {
		id : $("#list").val(),
	}, 2, {
		containerId : 'editContainer',
		containerTitle : '查看个人综合考评结果',
		editFormId : 'detailFormId',
		validate : true,
		height:400,
		width:850,
		defaultButtons:null
	});
};
var extraEdit = function() {
	helper1.basicPost('/mark/get/extraEdit', {
		id :$("#list").val(),
	}, 2, {
		containerId : 'editContainer',
		containerTitle : '个人附加分打分',
		editConfirmUrl : '/mark/saveExtra',
		editFormId : 'detailFormId',
		validate : true,
		height:400,
		width:850,
		afterDialogClose : function() {
			search();
		},
		defaultButtons:{
			okEnabled:true,
			okText:"保存附加分",
			cancelEnabled:true,
			cancelText:"取消"
		},
		successMessage : "保存成功",

		preProcess : function(prms) {
			if(!isNull(getExtraParams)){
				return getExtraParams(prms);
			}
			return prms;
		}
		/* validateList : {
			containerId : "addAssessMarkItems",
			repeatTagName : "tr",
			model : {
				items_score : { must : true, fieldName : "打分分数" }
			}
		}  */
	});
	//helper.addListener("afterFillData", handler, "data_table");
	
};

var edit = function(id) {
	helper1.basicPost('/mark/get/edit', {
		id : id
	}, 2, {
		containerId : 'editContainer',
		containerTitle : '考核别人记录',
		editConfirmUrl : '/mark/save',
		editFormId : 'detailFormId',
		validate : true,
		height:400,
		width:850,
		afterDialogClose : function() {
			search();
		},
		defaultButtons:{
			okEnabled:true,
			okText:"保存评价",
			cancelEnabled:true,
			cancelText:"取消"
		},
		successMessage : "评价成功",
		validateList : {
			containerId : "addAssessMarkItems",
			repeatTagName : "tr",
			model : {
				items_score : { must : true, fieldName : "打分分数" }
			}
		} 
	});
	//helper.addListener("afterFillData", handler, "data_table");
	
};

/* var handler = function(e,pageList){
	search();
};
 */

var view = function(id) {
	helper2.basicPost('/mark/get/view', {
		'id' : id
	}, 2, {
		containerId : 'editContainer',
		containerTitle : '被考核记录',
		editConfirmUrl : '/mark/save',
		editFormId : 'detailFormId',
		validate : true,
		height:400,
		width:850,
		defaultButtons:null
	});
};
tabs.createTabs("tabs");

$("ul").css({ color: "black", background: "#E6E6E6",padding: "5px 0 0 0",width: "255px" });
$("li").css({ margin: "0 0 0 5px"});
$("li>span").css({ margin: "0 0 0 40px"});

/*var tab1 = $("li").eq(0).attr("class");
var tab2 = $("li").eq(1).attr("class");
 if(tab1 = "tabs-1 tab_item focus_tab"){
	$("li").eq(0).css({ color: "black", background: "D7D7D7"});
	$("li").eq(1).css({ color: "grey", background: "white"});
}
else{
	$("li").eq(1).css({ color: "grey", background: "D7D7D7"});
	$("li").eq(0).css({ color: "black", background: "white"});
}

if(tab2 = "tabs-2 tab_item focus_tab"){
	$("li").eq(1).css({ color: "black", background: "D7D7D7"});
	$("li").eq(0).css({ color: "grey", background: "white"});
}
else{
	$("li").eq(0).css({ color: "grey", background: "D7D7D7"});
	$("li").eq(1).css({ color: "black", background: "white"});
} */


</script>
