<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container">
	<form id="search_form" name="search_form" action="" method="POST">
		<table class="formtable"  id="searchTable">
			<colgroup>
				<col style="width: 80px;">
				<col style="width: 160px;">
				<col style="width: 80px;">
				<col style="width: 160px;">
				<col style="width: 80px;">
				<col style="width: 160px;">
			</colgroup>
			<thead>
				<tr>	
				    <th width="150px"> 业务选择</th>
					<td><select id="business"  name="business" style="width:100px; " onclick="filtGroup()">
                        <option  value="app">许可申请</option>
					    <option  value="case">案件管理</option>
					     <!-- <option  value="appRestaurant">餐饮许可申请</option>
					    <option  value="appConstruction">建设项目许可申请</option>
					    <option  value="appDoctor">医师资格许可申请</option>
					    <option  value="appPublic">公共场所许可申请</option>
					    <option  value="appWater">生活饮用水许可申请</option>
					    <option  value="appRadiate">放射许可申请</option>
					    <option  value="appTransport">病原运输许可申请</option>
					    <option  value="majorEvents">重大活动保障</option> 
					    <option  value="emergency">应急处置</option>-->			
				    </select>
				    </td>
				    
				    <td id="department" ><input type="radio"  name="group"  value="department" checked onclick="filtUser()" />查科室</td>
				    <td id="user"><input  type="radio"  name="group"  value="user" onclick="filtUser()" />查个人</td>
				  
					<td><select id="departmentList"  name="departmentList" style="width:100px;">
					    <option  value="all">全部</option>
				        <c:forEach  var="departmentList" items="${departmentList}" varStatus="status">
							<option value="${departmentList.id}">${departmentList.name}</option>
						</c:forEach>
				    </select>
				   
					<select id=userList  name="userList" style="width:100px;display:none; ">
					    <option  value="all">全部</option>
				        <c:forEach  var="userList" items="${userList}" varStatus="status">
							<option value="${userList.id}">${userList.name}</option>
						</c:forEach>
				    </select>
					</td>
					
				</tr>
				
				<tr>
				<th>周期类别</th>
				<td><input type="radio"  name="period"  value="month" checked onclick="getRadio()"/>月度</td>
				<td><input type="radio"  name="period"  value="season" onclick="getRadio()"/>季度</td>
				<td><input type="radio"  name="period"  value="year" onclick="getRadio()"/>年度</td>
			
			    
				<td>
				   
				   <select id="month"  name="list">
					    <option  value="01" >一月</option>
					    <option  value="02">二月</option>	
					    <option  value="03">三月</option>
					    <option  value="04">四月</option>		
					    <option  value="05">五月</option>
					    <option  value="06">六月</option>
					    <option  value="07">七月</option>
					    <option  value="08">八月</option>	
					    <option  value="09">九月</option>
					    <option  value="10">十月</option>		
					    <option  value="11">十一月</option>
					    <option  value="12">十二月</option>					
				    </select>
               
				   <select id="season"  name="list" style=" display:none;">
					    <option  value="1" >第一季度</option>
					    <option  value="2">第二季度</option>	
					    <option  value="3">第三季度</option>
					    <option  value="4">第四季度</option>					
				    </select>
                
				   <select id="year"  name="list" style="display:none;">
					    <option  value="1" >上半年</option>
					    <option  value="2">下半年</option>	
					    <option  value="3">全年</option>				
				    </select>
                </td>
			
			
				</tr>
				
				
				<tr>
				<th>选择年份</th>
				<td><select id="yearSelect"  name="list" style="width:100px; ">
					   
					   
					    <option  value="2013">2013</option>	
					    <option  value="2014">2014</option>
					    <option  value="2015">2015</option>			
				    </select>
				    </td>
				
			
				</tr>
				
				<tr>
		
					<%-- <th>登记日期时间</th>
					<td><tag:dateInput  type="text"   id="registerStartDate" name="registerStartDate" />~<tag:dateInput onlypast="false" id="registerEndDate" name="registerEndDate" /></td>
				    <th>结果录入时间</th>
					<td><tag:dateInput  type="text"  id="finishStartDate" name="finishStartDate" />~<tag:dateInput onlypast="false" id="finishEndDate" name="finishEndDate" /></td>
			        <th>上报时间</th>

					<td><input type="text"  id="reportStartDate" name="reportStartDate" style="width:80px;" />~<tag:dateInput onlypast="false" id="reportEndDate" name="reportEndDate" style="width:80px;" /></td> --%>
					<td><input type="text"  id="startDate" name="startDate" style="width:90px;" /><input type="text"  id="endDate" name="endDate" style="width:90px;" /></td>


					<td><input type="hidden"  id="startDate" name="startDate" /><input type="hidden"  id="endDate" name="endDate" /></td>
                </tr>
				
			</thead>
			
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			
			<input class="button_search" onclick="searchStatistics();" type="button" />
			<input class="button_upload" onclick="statistics();" value="临时统计绩效" type="button" />
		</div>
	</form>
</div>
<%-- <div id="list_container">
	<table class="repeattable">
		<caption>
			<a class="button_add" href="javascript:void(0);" onclick="showbusinessAssess();">业务统计</a>
		
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 50px;">
			<col style="width: 120px;">
			
			<col style="width: 220px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>编号</th>
				<th>重大活动名称</th>
				<th>登记时间</th>
				<th>受理人</th>
				<th>结果录入人</th>
				<th>完成状态</th>
           </tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display:none;">

	 		<td style="text-align: center;"><input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" /></td>
	 		<td style="text-align: center;">#rowCount#</td>
			<td>#name#</td>
			<td>#registerDatetime#</td>
			<td>#handlerName#</td>
			 <td>#finisherName#</td>
			<td>#status#</td>		
		</tr>		
	</table>
	<div id="pagenation"></div>
</div> --%>

<div id="list_container">
	<table class="repeattable">
		<caption>
			<a class="button_regist" href="javascript:void(0);" onclick="showbusinessAssess();">查看业务绩效明细</a>
			<a class="button_power_set" href="javascript:void(0);" onclick="setPoints();">设置扣分分值</a>		
		</caption>
		<colgroup>
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 80px;">
			<col style="width: 150px;">
			<col style="width: 50px;">
			
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>编号</th>
				<th>处理业务</th>
				<th>总数</th>
				<th>实际应处理</th>
				<th>处理</th>
				<th>处理率(%)</th>
				<th>单次未上报扣分分值</th>
				<th>实际扣分</th>
           </tr>
		</thead>
		<tbody  style="text-align: center;"  id="data_table"></tbody>
		<tr style="text-align: center;" id="template" style="display:none;">
	 		<td >#rowCount#</td>
	 		<td>#itemName#</td>
			<td>#totalAcount#</td>
			<td>#needAcount#</td>
			<td>#doneAcount#</td>
			<td>#ratio#</td>
			<td>#eachPoint#</td>
			<td>#allPoint#</td>			
		</tr>	
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
var templateModel = {
		id:null,
		itemName:null,
		totalAcount:null,
		needAcount:null,
		doneAcount:null,
		ratio:null,
		eachPoint:null,
		allPoint:null,
		period:null
	};

var helper = new dataHelper(templateModel);

var searchStatistics = function(){
	getDate();
    helper.postSearch('/assessBusiness/search', {
			formId : 'search_form',
			containerId : 'data_table',
			templateId : 'template'
		});
	
};

 var showbusinessAssess = function() {
	helper.basicPost('/assessBusiness/view/'+$("#business").val(), {filterData : $("#startDate").val()+","+$("#endDate").val() +","+$("#departmentList").val()+","+$("#userList").val() + ","+$("#business").val() }, 2, {
		containerId : 'editContainer',
		containerTitle : '查看业务绩效明细',
		validate : true,
		height:565,
		width:1024,
		defaultButtons:null
	});
}; 

function getMonthEndDate(startDate,yearSelectValue){
	var endDate = "";
	
	if(parseInt(startDate)<9){
		endDate = yearSelectValue + "-" + "0" + (parseInt(startDate)+1).toString() + "-" + "15";
		
	}
	if(parseInt(startDate) == 9){
		endDate = yearSelectValue + "-" + (parseInt(startDate)+1).toString() + "-" + "15";
	}
	if((parseInt(startDate) == 10)||(parseInt(startDate) == 11)){
		endDate = yearSelectValue + "-" + (parseInt(startDate)+1).toString() + "-" + "15";
	}
	if(parseInt(startDate) == 12){
		endDate = (parseInt(yearSelectValue) + 1).toString() + "-" + "01" + "-" + "15";
	}
	
		return endDate;
}
function getDate(){
	var val=$('input:radio[name="period"]:checked').val();
 	var yearSelectValue=$("#yearSelect").val();
 	
 		if(val=="month"){
 			$("#startDate").val(yearSelectValue+"-"+$("#month").val()+"-"+"00");
 			//var nextIndex = $("#month").selectedIndex-1;
 			$("#endDate").val(getMonthEndDate($("#month").val(),yearSelectValue));
 			
		}
		if(val=="season"){
			if($("#season").val() == 1){
				$("#startDate").val(yearSelectValue+"-01-00");
				$("#endDate").val(yearSelectValue + "-04-15");
			}
			if($("#season").val() == 2){
				$("#startDate").val(yearSelectValue+"-04-00");
				$("#endDate").val(yearSelectValue + "-07-15");
			}
			if($("#season").val() == 3){
				$("#startDate").val(yearSelectValue+"-07-00");
				$("#endDate").val(yearSelectValue + "-10-15");
			}
			if($("#season").val() == 4){
				$("#startDate").val(yearSelectValue+"-10-00");
				$("#endDate").val((parseInt(yearSelectValue)+1).toString() + "-01-15");
			}
		}
		if(val=="year"){
			if($("#year").val() == 1){
				$("#startDate").val(yearSelectValue+"-01-00");
				$("#endDate").val(yearSelectValue + "-07-15");
			}
			if($("#year").val() == 2){
				$("#startDate").val(yearSelectValue+"-07-00");
				$("#endDate").val((parseInt(yearSelectValue)+1).toString() + "-01-15");
			}
			if($("#year").val() == 3){
				$("#startDate").val(yearSelectValue+"-01-00");
				$("#endDate").val((parseInt(yearSelectValue)+1).toString() + "-01-15");
			}
		}
}

var statistics = function() {
	 getDate();
	// var period = $("#startDate").val() + " "+$("#endDate").val();
	 var businessName = $("#business").val();
	 var dateStr = $("#startDate").val()+","+$("#endDate").val() +","+$("#departmentList").val()+","+$("#userList").val() + ","+$("#business").val();
	 helper.basicPost('/assessBusiness/get/'+businessName, 
			//helper.basicPost('/assessBusiness/get/app',
		{ 
		 dateStr : dateStr/* ,
		  startDate : $("#startDate").val(),
		  endDate : $("#endDate").val() */
		}, 2, {
		containerId : 'editContainer',
		containerTitle : '统计数据',
		successMessage : '统计数据保存成功',
		//editConfirmUrl : '/assessBusiness/save/'+businessName,
		editConfirmUrl : '/assessBusiness/save/app',
		editFormId : 'detailFormId',
		validate : true ,
		defaultButtons: {
			okText : '保 存'
		}	
	}); 
};

var getRadio = function(evt){

	 $("#month").hide();
	 $("#season").hide();
	 $("#year").hide();
	var evt=evt || window.event;   
	var e =evt.srcElement || evt.target;
	 if(e.value=="month"){
		 $("#month").show();
		 
	 }
	 if(e.value=="season"){
		 $("#season").show();
	 }
	 if(e.value=="year"){
		 $("#year").show();
	 }
 
};

var filtUser = function(evt){

	 $("#departmentList").hide();
	 $("#userList").hide();
	var evt=evt || window.event;   
	var e =evt.srcElement || evt.target;
	 if(e.value=="department"){
		 $("#departmentList").show();
		 $("#userList").val("all");
	 }
	 else{
		 $("#userList").show();
		 $("#departmentList").val("all");
	 }

};
var filtGroup = function(evt){
	var evt=evt || window.event;   
	var e =evt.srcElement || evt.target;
	 if(e.value=="case"){
		 $("#user").hide();
		 $("#department").hide();
		 $("#userList").hide();
		 $("#departmentList").hide();
	 }
	 else{
		 var group = $('input[name="group"]:checked').val();
		 if(group=="department"){
			 $("#departmentList").show();
			 $("#userList").val("all");
			 
		 }
		 else{
			 $("#userList").show();
			 $("#departmentList").val("all");
		 }
		 $("#user").show();
		 $("#department").show();
	 }
	
};
var setPoints = function(){
	 var businessName = $("#business").val();
	 //var dataStr = $("#startDate").val()+","+$("#endDate").val() +","+$("#departmentList").val()+","+$("#userList").val() + ","+$("#business").val();
	 helper.basicPost('/assessBusiness/get/points', 
			//helper.basicPost('/assessBusiness/get/app',
		{ 
			dataStr : businessName/* ,
		  startDate : $("#startDate").val(),
		  endDate : $("#endDate").val() */
		}, 2, {
		containerId : 'editContainer',
		containerTitle : '设置业务扣分分值',
		successMessage : '分值设置成功',
		//editConfirmUrl : '/assessBusiness/points/save/'+businessName,
		editConfirmUrl : '/assessBusiness/save/points',
		editFormId : 'detailFormId',
		validate : true ,
		height:200,
		width:300,
		defaultButtons: {
			okText : '保存设置'
		}	
	}); 
};

$("#startDate").hide();
$("#endDate").hide();
</script>


