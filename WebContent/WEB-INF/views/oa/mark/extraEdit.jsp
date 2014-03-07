<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.founder.hs.constant.HSDV"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>

<form id="detailFormId" name="detailForm" action="" method="post">
<table>
     <tr >
			<th style="text-align:left;height:30px;">${name}</th>		
			
	  </tr>
</table>
<input type="text" value="${assessRecordsId}" id="id" name="id" style="display:none;"/>
<input type="text" value="${extraAssessNamesStr}" id="nameStr" name="nameStr" style="display:none;"/>
	 <fieldset style="margin:15px 10px 5px 10px;">
        <legend>获科技进步奖</legend>
		<table style="text-align:left;" id="science">		        
				<tr>
					<td><input name="extra" type="checkbox" value="获省科技进步奖分别加10分 10"/>获省科技进步奖分别加10分</td>
					
				</tr>
				<tr>
					<td><input name="extra" type="checkbox" value="获市科技进步奖分别加8分 8"/>获市科技进步奖分别加8分</td>
					
				</tr>
				<tr>
					<td><input name="extra" type="checkbox" value="获区科技进步奖分别加3分 3"/>获区科技进步奖分别加3分</td>
					
				</tr>
		</table>
	 </fieldset>
	  <fieldset style="margin:15px 10px 5px 10px;">
        <legend>获先进集体称号</legend>
		<table style="text-align:left;" id="advanced">		        
				<tr>
					<td><input name="extra" type="checkbox" value="获全国先进集体称号分别加8分 8"/>获全国先进集体称号分别加8分</td>
				</tr>
				<tr>
					<td><input name="extra" type="checkbox" value="获省先进集体称号分别加5分 5"/>获省先进集体称号分别加5分</td>
				</tr>
				<tr>
					<td><input name="extra" type="checkbox" value="获市先进集体称号分别加2分 2"/>获市先进集体称号分别加2分</td>
				</tr>
				
		</table>
	 </fieldset>
	  <fieldset style="margin:15px 10px 5px 10px;">
        <legend>学生刊物发表</legend>
		<table style="text-align:left;" id="advanced">		        
				<tr>
					<td><input name="extra" type="checkbox" value="在省级以上学术刊物上发表学术论文和在市级以上报刊发表宣传卫生工作的理论性文章数超过在职职工人数的20%加1分 1"/>在省级以上学术刊物上发表学术论文和在市级以上报刊发表宣传卫生工作的理论性文章数超过在职职工人数的20%加1分</td>
				</tr>
				<tr>
					<td><input name="extra" type="checkbox" value="在省级以上学术刊物上发表学术论文和在市级以上报刊发表宣传卫生工作的理论性文章数超过在职职工人数的30%加2分 2"/>在省级以上学术刊物上发表学术论文和在市级以上报刊发表宣传卫生工作的理论性文章数超过在职职工人数的30%加2分</td>
				</tr>
				<tr>
					<td><input name="extra" type="checkbox" value="在省级以上学术刊物上发表学术论文和在市级以上报刊发表宣传卫生工作的理论性文章数超过在职职工人数的40%加3分 3"/>在省级以上学术刊物上发表学术论文和在市级以上报刊发表宣传卫生工作的理论性文章数超过在职职工人数的40%加3分</td>
				</tr>
		</table>
	 </fieldset>
	 
	  <fieldset style="margin:15px 10px 5px 10px;">
        <legend>政府公开表彰</legend>
		<table style="text-align:left;" id="commend">		        
				<tr>
					<td><input name="extra" type="checkbox" value="好人好事获市级公开表彰的加1分 1"/>好人好事获市级公开表彰的加1分</td>
				</tr>
				<tr>
					<td><input name="extra" type="checkbox" value="获省级级公开表彰的加2分 2"/>获省级级公开表彰的加2分</td>
				</tr>
				<tr>
					<td><input name="extra" type="checkbox" value="获国家级公开表彰的加5分 5"/>获国家级公开表彰的加5分</td>
				</tr>
		</table>
	 </fieldset>
	 
</form>
<script type="text/javascript">

$(function() {
	var str = $(nameStr).val();
	var array = str.split(",");
	//alert(array)
	$('input[name="extra"]').each(function(i){
		 //alert($(this).val().split(" ")[0])
		for (var j = 0; j < array.length; j++) {
			
		  if($(this).val().split(" ")[0] == array[j]){	
			  //alert(array[j]);
			  $(this).attr("checked",true);
			  break;
		  }
		}
      });
});

var getExtraParams = function() {
	var prms = {};
	var str="";
	$('input[name="extra"]:checked').each(function(i){
		str += $(this).val() + ",";
      });
	prms.extra = str;
	prms.assessRecordsId = $("#id").val(); 
	return prms;
};

 var preScore = "";
var down = function(obj){
	var e = e||window.event;
    var k = e.keyCode||e.which||e.charCode;
	  //下标0开始的
    /*   if($(this).val()=="0"){
			$(this).val("");
			 // $(this).val()="";
		 }  */
	  
    if((k == 48) && ($(obj).val()=="")){
		  return false; 
	  }else{
       if(((k <= 57 && k >= 48) || (k <= 105 && k >= 96) || (k == 8))&&(!window.event.shiftKey)){	      	
        }
       else{
         return false;
       };
      
	  }
};
var up = function(obj){

	var value = $(obj).val();  

	if(!(/^(\+|-)?\d+$/.test(value)) || value < 0){
		 preScore = $(obj).val().substr(0,preScore.length);
		$(obj).val(""); 
		$(obj).val(preScore);
	}
	else{
	    
		var result = 0;
		var score = 0;
		var totalScore=$(obj).parents("tr:eq(0)").find("td:eq(3)");			
		var ts = totalScore.text();
		//alert(ts)
		
	    if(parseInt(ts)<parseInt($(obj).val())){	
	    	$(obj).val(""); 
	    	$(obj).val(preScore);	 
			 	 
		 }
		 else{
			 preScore = $(obj).val();
		 } 
		
		for (var i = 0; i < $('.items_score').size(); i++) {
			if($('.items_score')[i].value!=""){
				result += 1;
				score += parseInt($('.items_score')[i].value);
			};	
		}
		if(result == $('.items_score').size()){
			$('#score').val(score.toString());
		  
		}
		
	 }	 
};
/* var check = function(obj){
	alert()
	  var value = $(obj).val(); 
	  var totalScore=$(obj).parents("tr:eq(0)").find("td:eq(3)");	
	  var ts = totalScore.text();
	  if((!(/^(\+|-)?\d+$/.test(value)) || value < 0)||(parseInt(ts)>parseInt(value))||(value=="")){
		  $(obj).val("");
		  Dialog.alert("请确保打分合理！");
		}
}; */


</script>