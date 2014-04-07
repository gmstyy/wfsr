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
				    <th>考核选择</th>
					<td>
						<td><input type="text" id="name" name="name" maxlength="50" />
				    </td>
					<th>考核周期</th>
					<td><hs:dic dicName='ASSESS_PERIOD' id='period' name='period'></hs:dic></td>
					<th>考核总分</th>
					<td><input type="text" id="totalScore" name="totalScore" class="totalScore"  maxlength="50" /></td>
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
			<a class="button_start_case" href="javascript:void(0);" onclick="add();">发起考核</a>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 200px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 140px;">
			<col style="width: 100px;">
			<col style="width: 80px;">
		</colgroup>
		<thead>
			<tr class="row_header">
		
				<th>编号</th>
				<th>考核名称</th>
				<th>考核周期</th>
				<th>考核总分</th>
				<th>完成状态</th>
				<th>创建时间</th>
				<th>创建人</th>
				<th>操作</th>
           </tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display:none;">

	 		<td style="text-align: center;">#rowCount#</td>
			<td>#name#</td>
			<td>#period#</td>
			<td>#totalScore#</td>
            <td>#status#</td>
            <td>#createTime#</td>
			<td>#creatorName#</td>
	 		<td style="text-align: center;">
	 			<div class="option_container">
					<a href="javascript:void(0);" title="查看" class="option_view" onclick="view('#id#');"></a>
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
		totalScore : null,
		status : null,
		createTime :{type:'timestamp'},
		creatorName : null
	};
	
var validateModel = {	
		name : { must : true, fieldName : "考核名称"},
		operatorName : { must : true, fieldName : "考核者"},
		targetName : { must : true, fieldName : "被考核者"},
};
var helper = new dataHelper(templateModel,validateModel);

var search = function(){
	helper.postSearch('/records/search',{
		containerId:'data_table',
		formId : 'search_form',
		templateId:'template'
		});
};

$(function() {
	search();
});
var add = function() {
	helper.basicPost('/records/select',null,2, {
		containerId : 'editContainer',
		containerTitle : '新建考核活动',
		editConfirmUrl : '/records/start',
		editFormId : 'detailFormId',
		validate : true,
		height:565,
		width:850,
		 preProcess : function(form) {
			form.operatorLoginNameList = operator.getSelectedValues();
			form.operatorNameList = operator.getSelectedNames(); 
			form.targetLoginNameList = target.getSelectedValues();
			form.targetNameList = target.getSelectedNames();  
			
			return form;
		}, 
		defaultButtons:{
			okEnabled:true,
			okText:"发起考核",
			cancelEnabled:true,
			cancelText:"取消"
		},
		successMessage :'发起考核成功'
	});
};

var view = function(pk) {
	helper.basicPost('/records/get',{
		   id : pk
		   },2, {
		containerId : 'editContainer',
		containerTitle : '查看考核记录',
		editConfirmUrl : '/records/start',
		editFormId : 'detailFormId',
		validate : true,
		height:565,
		width:900,
		defaultButtons:null
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
