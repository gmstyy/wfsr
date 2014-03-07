<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<div id="search_container">
	<form id="search_form" name="search_form" action="" method="POST">
		<table class="formtable"  id="searchTable">
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
				    <th>模板选择</th>
					<td>
						<select id="list" name="list">
						    <option value=""></option>
					        <c:forEach  var="list" items="${list}" varStatus="status">
								<option  value="${list.name}">${list.name}</option>
							</c:forEach>
					    </select>
				    </td>
					<th>考核周期</th>
					<td><hs:dic dicName='ASSESS_PERIOD' id='period' name='period'></hs:dic></td>
					<th>考核总分</th>
					<td><input type="text" id="totalScore" class="totalScore" name="totalScore" maxlength="4"  /></td>
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
			<a class="button_add" href="javascript:void(0);" onclick="edit(0);">新建</a>
			<a class="button_del_all" href="javascript:void(0);" onclick="helper.deleteObjects(null,'/assess/delete');">删除</a>
		</caption>
		<colgroup>
			<col style="width: 5%;">
			<col style="width: 5%;">
			<col style="width: 30%;">
			<col style="width: 20%;">
			<col style="width: 20%;">
			<col style="width: 20%;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>编号</th>
				<th>模板名称</th>
				<th>考核周期</th>
				<!-- <th>考核人</th>
				<th>被考核人</th> -->
				<th>考核总分</th>
				<th>操作</th>
           </tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display:none;">

	 		<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
	 		<td style="text-align: center;">#rowCount#</td>
			<td>#name#</td>
			<td>#period#</td>
		<!-- 	<td>#operatorRoleId#</td>
			<td>#targetRoleId#</td> -->
			<td>#totalScore#</td>

	 		<td style="text-align: center;">
	 			<div class="option_container">

					<a href="javascript:void(0);" title="修改" class="option_edit" onclick="edit('#id#');"></a>
					<a href="javascript:void(0);" title="删除" class="option_delete" onclick="helper.deleteObjects('#id#','/assess/delete');"></a>

				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
var templateModel = {
		id : null,
		name : null,
		period : null,
		totalScore : null
	};
	
var validateModel = {	
		name : { must : true, fieldName : "考核模板名称"},
		period : { must : true, fieldName : "考核周期"},
		totalScore : { must : true, fieldName : "考核总分"}
	};
var helper = new dataHelper(templateModel, validateModel);

var search = function(){
	//helper.postSearch('/assess/search',{containerId:'data_table',templateId:'template'});
		    helper.postSearch('/assess/search', {
			formId : 'search_form',
			containerId : 'data_table',
			templateId : 'template'
		});
};

$(function() {
	search();
});
var rank = 0;
var edit = function(pk) {
	helper.basicPost('/assess/get', {id : pk}, 2, {
		containerId : 'editContainer',
		containerTitle : (pk == 0) ? '新建考核模板' : '修改考核模板',
		successMessage : (pk == 0) ? '新建考核模板成功' : '修改考核模板成功',
		editConfirmUrl : '/assess/save',
		editFormId : 'detailFormId',
		validate : true ,
		defaultButtons: {
			okText : '建立模板'
		},
		preProcess : function(prms) {
			prms.json = $.toJSON(getDataList("addAssessTemplateItems", "tr"));
			return prms;
		},
		validateList : {
			containerId : "addAssessTemplateItems",
			repeatTagName : "tr",
			model : {
				itemName : { must : true, fieldName : "指标名称" },
				markingRule : { must : true, fieldName : "评分规则" },
				maxScore : { must : true, fieldName : "指标总分" }
			}
		} 
	});
};
</script>


<script type="text/javascript">


 $(document).ready(function(){
var preScore = "";
$('#totalScore').keydown(function () {
	var e = e||window.event;
     var k = e.keyCode||e.which||e.charCode;
	  //下标0开始的
     /*   if($(this).val()=="0"){
			$(this).val("");
			 // $(this).val()="";
		 }  */
	  
	  
        if(((k <= 57 && k >= 48) || (k <= 105 && k >= 96) || (k == 8))&&(!window.event.shiftKey)){
		  if((k == 48) && ($(this).val()=="")){
			  return false; 
		  }else{
        	return true;
		  }
         }
        else{
          return false;
        };
	}); 

$('#totalScore').keyup(function () {
	   
	var value = $(this).val();   

	if(!(/^(\+|-)?\d+$/.test(value)) || value < 0){
		 preScore = $(this).val().substr(0,preScore.length);
		$(this).val(""); 
		$(this).val(preScore);		 
	}
	else{
		preScore = $(this).val();
	 }
	}); 
});
</script>
