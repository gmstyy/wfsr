<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.founder.hs.constant.HSDV"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>

<form id="detailFormId" name="detailForm" action="" method="post">
<table>
     <tr >
			<th style="text-align:center;height:30px;">${name}</th>		
	  </tr>
</table>
<input type="text" value="${mark.id}" id="id" name="id" style="display:none;"/>
	
	 <fieldset style="margin:0 10px 5px 10px;">
        <legend>考核信息</legend>
        <table style="margin:0 0 0 20px;">	
           <tr>
					<th style="width:60px;margin:0 0 0 20px;">完成状态</th>
					<td style="width:100px;"><hs:v dicName="ASSESS_STATUS" code="${mark.status}"/></td>
						
					<th style="width:60px;">考评人</th>
					<td style="width:100px;">${mark.operatorName}</td>
					
					<th style="width:60px;">被考评人</th>
					<td style="width:100px;">${mark.targetName}</td>
					
					<th style="width:60px;">满分</th>
					<td style="width:100px;">${totalScore}</td>

	       </tr>
        </table>	
        
	</fieldset>
	
	 <fieldset style="margin:15px 10px 5px 10px;">
        <legend>指标详细项</legend>
		<table style="text-align:center;" id="addAssessMarkItems">		        
			<thead style="border: solid 1px #CCC;">			
				<tr>
					<th style="width:100px;">序号</th>
					<th style="width:300px;">项目名称</th>
					<th style="width:300px;">评分规则</th>
					<th style="width:120px;">具体项分值</th>
					<th style="width:120px;">打分</th>
				</tr>
			</thead>
			<tbody>       
				<c:forEach var="items" items="${mark.assessMarkItems}">
				<tr>
					<td>${items.rankNumber}</td>
					<td>${items.name}</td>
					<td>${items.markingRule}</td>
					<td>${items.maxScore}</td>
					<td><input type="text" class="items_score" name="items_score" style="width:50px;" value="${items.score}" onkeydown="down(this)" onkeyup="up(this)"/></td>				
				</tr>
				</c:forEach>	
				
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>最终得分</td>
					<td><input type="text" id="score" name="score" style="border:none;width:50px;" value="${mark.score}" readonly/></td>
				</tr>		
			</tbody>		
		</table>
	 </fieldset>
</form>
<script type="text/javascript">


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