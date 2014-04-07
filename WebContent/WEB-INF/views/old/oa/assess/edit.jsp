<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<form id="detailFormId" name="detailForm" action="" method="post">
	<input type="text" value="${template.id}" name="id" id="id" style="display:none;"/>
	
	<table class="edittable">
	   <colgroup>
			<col style="width: 80px;" />
			<col style="width: 150px;" />
			<col style="width: 120px;" />
			<col style="width: 120px;"/>
			<col style="width: 120px;" />
			<col style="width: 120px;" />
		</colgroup>	
			<tr>
				<th>模板名称</th>
				<td><input  style="width:250px;"  type="text" id="name" name="name" value="${template.name}" maxlength="50"/></td>
				<th>考核总分</th>
				<td><input style="width:100px;"  type="text" id="totalScore" name="totalScore" class="totalScore" value="${template.totalScore}" maxlength="4"/></td>
				<th>考核周期</th>
				<td ><hs:dic  style="width:100px;" name="period" id="period" dicName="ASSESS_PERIOD" defalt="${template.period}"/></td>
			</tr>
			<tr>
				<td></td>
				<td>现有模板名称引入
				    <span id="show" onclick="showExistTemplate()" style="cursor: pointer;font-size:14px;font-weight: bold;">+</span> 
					<span id="hide" onclick="hideExistTemplate()" style="display: none;cursor: pointer;font-size:14px;font-weight: bold">-</span> 
				    <div id="existTemplate" style="position: absolute;display: block;">
						<jsp:include page="template.jsp"/>
					</div>
				</td>				   
				<td></td>
				<td></td>
				<td></td>
				<td></td>		
		   </tr>
	</table>
	
	<span>添加一个考核项目<a class="option_add" onclick="addRow()" ></a></span>
	<fieldset style="margin:15px 20px 5px 20px;">
    <legend>指标详细项</legend>
	<table class="edittable" id="addAssessTemplateItems">
	   <colgroup>
			<col style="width:50px">
			<col style="width:150px">
			<col style="width:250px">
			<col style="width:100px">
		</colgroup>	
			<thead style="border: solid 1px #CCC;">			
				<tr>
					<th style="text-align: left;padding:0 0 0 20px;">序号</th>
					<th style="text-align: left;">项目名称</th>
					<th style="text-align: left;">评分规则</th>
					<th style="text-align: left;">具体项分值</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${template.assessTemplateItems}" var="items" varStatus="status">
		       
		    <tr id="node_${status.count}" >
			    
				<td><input style="width: 50px;border:none;margin:0 0 0 20px;" type="text" name="rankNumber" value="${items.rankNumber}" maxlength="11"/></td>
				
				<td><input  style="width:150px;"  type="text" name="itemName" value="${items.itemName}" maxlength="50"/></td>
				
				<%-- <td><input  style="width:250px;"  type="text" name="markingRule" value="${items.markingRule}" maxlength="200"/></td>	 --%>
				<td><textarea onkeyup="up(this)" name="markingRule"  style="overflow:hidden;  width:250px;height:16px;font-size:12px;line-height:16px;">${items.markingRule}</textarea></td>
				<td><input  style="width:50px;margin:0 20px 0 0;"  type="text" name="maxScore" value="${items.maxScore}" maxlength="4"   onkeyup="up(this)"/>
				<a href="javascript:void(0);" class="option_del" onclick="removeRow('node_${status.count}')"></a>
				</td>	
					
		</tr>
								
		</c:forEach>
		<!--  -->
		<%-- 	<tr id="'+rowId+'" style="<c:if test="${template.id!=null}">display:none;</c:if>">
			    <td><input style="border:none;width:50px;" type="text" name="rankNumber" value = "1"/></td>
				<td><input  style="width:150px;"  type="text" name="itemName"/></td>
				 <td><input style="width:250px;" type="text" name="markingRule"/></td> 
				<!-- <td><textarea class="rule" style="overflow:hidden; width:200px;height:16px;font-size:14px;line-height:16px;"></textarea></td> -->
				<td><input style="width:50px;" type="text" name="maxScore"/><a class="option_del" onclick="removeRow(rowId)"></a></td>
	       </tr> --%>
		<tbody id="addNodeId"></tbody>
		
		</tbody>
		<!-- <tbody id="addNodeId"></tbody> -->
	</table>
	 </fieldset>
	<%-- 
	<fieldset style="margin:15px 10px 5px 10px;<c:if test="${template.id!=null}">display:none;</c:if>">
        <legend>指标详细项</legend>
		<table style="text-align:center;">	
		
			<colgroup>
			<col style="width:50px">
			<col style="width:200px">
			<col style="width:350px">
			<col style="width:80px">
		   </colgroup>
		<thead>	        
			<thead style="border: solid 1px #CCC;">			
				<tr>
					<th>序号</th>
					<th>项目名称</th>
					<th>评分规则</th>
					<th>具体项分值</th>
				</tr>
			</thead>
			<tr id="'+rowId+'">
			    <td><input style="border:none;width:50px;" type="text" name="rankNumber" value = "1"/></td>
				<td><input  style="width:150px;"  type="text" name="itemName"/></td>
				 <td><input style="width:250px;" type="text" name="markingRule"/></td> 
				<!-- <td><textarea class="rule" style="overflow:hidden; width:200px;height:16px;font-size:14px;line-height:16px;"></textarea></td> -->
				<td><input style="width:50px;" type="text" name="maxScore"/><a class="option_del" onclick="removeRow(rowId)"></a></td>
	       </tr>
			<tbody id="addNodeId"></tbody>
	
		</table>
	 </fieldset> --%>
	
	
	
</form>
<script type="text/javascript">
$(function(){
if(!$("#id").val()){
	var html = '<tr id="1"><td><input style="border:none;width:50px;margin:0 0 0 20px;" type="text" name="rankNumber" value = "1"/></td>';
	html += '<td><input style="width:150px;"  type="text" name="itemName" maxlength="50"/></td>';
	html += '<td><textarea onkeyup="up(this)" name="markingRule"  style="overflow:hidden;  width:250px;height:16px;font-size:12px;line-height:16px;">${items.markingRule}</textarea></td>';
	//html += '<td><input style="width:250px;"  type="text" name="markingRule" maxlength="200"/></td>';
	html += '<td><input style="width:50px;margin:0 20px 0 0;"  type="text" class="maxScore"   onkeyup="up(this)" name="maxScore" maxlength="4"/><a class="option_del" onclick="removeRow(1)"></a></td></tr>';
	$("#addNodeId").append(html);
}
});

var num = 0;
var addRow = function() {
	
	num = num + 1;
	rank = $('input[name=rankNumber]').size()+1;
	var rowId = 'row_'+num;
	var html = '<tr id="'+rowId+'"><td><input style="border:none;width:50px;margin:0 0 0 20px;" type="text" name="rankNumber" value = "'+rank+'"/></td>';
	html += '<td><input style="width:150px;"  type="text" name="itemName" maxlength="50"/></td>';
	html += '<td><textarea onkeyup="up(this)" class="rule" name="markingRule"  style="overflow:hidden;  width:250px;height:16px;font-size:12px;line-height:16px;">${items.markingRule}</textarea></td>';
	//html += '<td><input style="width:250px;"  type="text" name="markingRule" maxlength="200"/></td>';
	html += '<td><input style="width:50px;margin:0 20px 0 0;"  type="text" class="maxScore"   onkeyup="up(this)"  name="maxScore" maxlength="4"/><a class="option_del" onclick="removeRow(\''+rowId+'\')"></a></td></tr>';
	$("#addNodeId").append(html);
};
var removeRow = function(rowId) {
	$("#"+rowId).html('');
};


$("#existTemplate").hide();
var showExistTemplate = function() {
	$("#existTemplate").show();
	$("#show").hide();
	$("#hide").show();
};
var hideExistTemplate = function() {
	$("#existTemplate").hide();
	$("#hide").hide();
	$("#show").show();
};


$("#name").focus(function () {
		$("#existTemplate").hide();
		$("#hide").hide();
		$("#show").show();
	});
$("#existTemplate").blur(function () {
	$("#existTemplate").hide();
	$("#hide").hide();
	$("#show").show();
});


</script>


<script type="text/javascript">
var up = function(obj) {
	//alert()
	var len = $(obj).val().replace(/[^\u0000-\u00ff]/g,"aa").length;
	
 	$(obj).css("height","16px");
	if(len>40){
	/* 	var length = (len/2).toString() + "px";
		$(obj).css("height",length); */
		height = ((Math.floor(len/40)+1)*16).toString() + "px";
		$(obj).css("height",height);
	} 	
};
$(function() {
	var len = $('textarea[name="markingRule"]').val().replace(/[^\u0000-\u00ff]/g,"aa").length;
	$('textarea[name="markingRule"]').css("height","16px");
	 if(len>40){
		 height = ((Math.floor(len/40)+1)*16).toString() + "px";
		$('textarea[name="markingRule"]').css("height",height);
		/* var length = (len/2).toString() + "px";
		$('textarea[name="markingRule"]').css("height",length);   */
	} 	
});
</script>

<script type="text/javascript">

$(document).ready(function(){
var preScore = "";
$('.totalScore').keydown(function () {
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

$('.totalScore').keyup(function () {
	   
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

