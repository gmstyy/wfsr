<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ page language="java" import="com.founder.hs.constant.HSCV" %>
<input type="hidden" name="empId" id="empId" value="${complaints.complaintsEmpId}">
<form id="handleEditFormId" action="" method="post">
	<input type="hidden" name="${CSRFTokenName}" value="${CSRFToken}">
	<input type='hidden' value='${complaints.id}' id='id' name='id' />
	<input type="hidden" value='${complaints.handleStatus}' id="handleStatus"/>
	<input type="hidden" value='${complaints.backStatus}' id="backStatus"/>
	<input type="hidden" value='${complaints.transferStatus}' id="transferStatus"/>
	<table class="edittable">
		<colgroup>
			<col style="width: 130px;" />
			<col />
			<col style="width: 130px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>举报人<span class="must_field">*</span></th>
				<td><input name="complaintsName" id="complaintsName" maxlength="20" type="text" value="${complaints.complaintsName}"></td>
				<th>举报人电话<span class="must_field">*</span></th>
				<td><input name="complaintsTelephone" id="complaintsTelephone" maxlength="20" type="text" value="${complaints.complaintsTelephone}"></td>
			</tr>		
			<tr>
			<%--<th>受理投诉机构</th>
				<td><input readonly="readonly" maxlength="11" type="text" value="<hs:v dicName="ORG" code="${complaints.targetOrgId}"/>"></td> --%>
				<th>举报对象</th>
				<td><hs:dic name="type" id="type" dicName="COMPLAINTS_TYPE" defalt="${complaints.type}"/></td>
				<th>举报方式</th>
				<td>
					<hs:dic dicName="COMPLAINTS_MODE"  id="complaintsMode" name="complaintsMode" defalt="${complaints.complaintsMode}"/>		
				</td>
			</tr>
			<tr>
				<th>被举报人</th>
				<td colspan="3"><input type="text" name="targetName"  id="targetName" value="${complaints.targetName}" maxlength='20'/></td>			
			</tr>
			<tr>
				<th>被举报人地址<span class="must_field">*</span></th>
				<td colspan="3"><textarea rows="2" style="width:83%;" id='targetAddress' name='targetAddress' maxlength='200'>${complaints.targetAddress}</textarea></td>
			</tr>
			<tr>
				<th>标题<span class="must_field">*</span></th>
				<td colspan="3"><input style="width:83%;" type='text' value='${complaints.title}' id='title' name='title' maxlength='100'/></td>
			</tr>
			<tr>
				<th>举报内容类别</th>
				<td colspan="3"><hs:dic dicName="LICENSE_TYPE" id="complaintsSort" name="complaintsSort" limitedMap="${licenseTypeMap}" defalt="${complaints.complaintsSort}"/></td>				
			</tr>			
			<tr>
				<th>举报内容<span class="must_field">*</span></th>
				<td colspan="3"><textarea rows="5" style="width: 83%"  id='content' name='content' maxlength='1500'>${complaints.content}</textarea></td>
			</tr>
	   <%-- <tr>
				<th>受理状态</th>
				<td><input readonly="readonly" maxlength="1" type='text' value="<hs:v dicName="COMPLAINTS_STATUS" code="${complaints.status}"/>"/></td>
				<th>当前受理机构</th>
				<td><input readonly="readonly" maxlength="11" type='text' value="<hs:v dicName="ORG" code="${complaints.handleOrgId}"/>"/></td>
			</tr> --%>
			<tr>
				<th>登记人</th>
				<td><input readonly="readonly" maxlength="50" type='text' value='${complaints.handlerName}'/></td>
				<th>登记时间</th>
				<td><input readonly="readonly" type="text" value="<fmt:formatDate value="${complaints.registerDatetime}" pattern="yyyy/MM/dd HH:mm:ss"/>"></td>				
			</tr>
			<tr>								
				<c:if test="${complaints.type eq 1}"><!-- 商家 -->
					<th>投诉商家</th>
					<td colspan="3">
						<input type="radio" value="1" name="certifiedStatus" id="certifiedStatus" ${complaints.certifiedStatus eq 1? 'checked':''}>有证
						<input type="radio" value="0" name="certifiedStatus" id="certifiedStatus" ${complaints.certifiedStatus eq 0? 'checked':''}>无证
					</td>
				</c:if>	
				<c:if test="${complaints.type eq 2}"><!-- 监督员 -->
					<th>被投诉科室</th>
					<td><hs:dic dicName="DEPT" defalt="${complaints.complaintsDeptId}" id="complaintsDeptId" name="complaintsDeptId" value1="${loginUser.orgId}" onChange="loadEmployee(this)" /></td>
					<th>被投诉人员</th>
					<td>
						<select id='complaintsEmpId' name="complaintsEmpId"></select>
					</td>
				</c:if>	
			</tr>
			<tr>
				<th>处理状态</th>
				<td>
					<input type="radio" name="handleStatus" ${complaints.handleStatus eq 1? 'checked':''} value="1" onclick="showOrHide(1)">已完成
					<input type="radio" name="handleStatus" ${complaints.handleStatus eq 0? 'checked':''} value="0" onclick="showOrHide(0)">未完成
				</td>
				<th>任务</th>
				<td><a href="javascript:void(0);" onclick="queryTasks('${complaints.id}','<%=HSCV.WORKFLOW_CATEGORY.COMPLAINTS%>');"><span id="taskCount"></span></a><a class="option_add" href="javascript:void(0);" onclick="addTask();"></a></td>
			</tr>
			<tr id="showorHideContent" style='${complaints.handleStatus eq 0 or empty complaints.handleStatus? "display: none":""}'>
				<th>回复内容<span class="must_field">*</span></th>
				<td colspan="4"><textarea rows="5" style="width:83%" id="replyContent" maxlength='1000'>${complaints.replyContent}</textarea></td>
			</tr>		
			<tr id="showOrHideRemark">
				<th>填写备注</th>
				<td colspan="4"><textarea rows="5" style="width:83%" id="remark" name="remark" maxlength='1000'>${complaints.remark}</textarea></td>
			</tr>
		</tbody>
	</table>
</form>
<script type="text/javascript">
	$(function() {
		var handleStatus = $("#handleStatus").val();
		var backStatus = $("#backStatus").val();
		if(handleStatus == 2 || backStatus == 1){
			$("#remark").attr("disabled","disabled");
			$("#replyContent").attr("disabled","disabled");
			$("input[name='handleStatus']").attr("disabled","disabled");
		};
		var deptId = $("#complaintsDeptId").val();
		if(!isNull(deptId)){
			helper.basicPost("/employee/getEmployeeListByDept", { deptId : deptId }, 0, null, function(data) {
				var list = data.employeeList;
				var empSelect=$("#complaintsEmpId");
				var empId=$("#empId").val();
				empSelect.empty();
				empSelect.append($("<option></option>"));
				for ( var i = 0; i < list.length; i++) {
					var hidden = "<input type='hidden' id='property' value='"+list[i]+"' >";
					if(empId == list[i].id){
						empSelect.append($("<option selected value='"+list[i].id+"'>" + list[i].name + "(" + list[i].workNo + ")" + "</option>"));
					}else{
						empSelect.append($("<option value='"+list[i].id+"'>" + list[i].name + "(" + list[i].workNo + ")" + "</option>"));
					}
				}
			});
		}
		var data = new Object();
		data.sourceType = 2; //任务来源：投诉举报
		data.taskType = 3; //临时性监督
		data.categoryCode = '<%=HSCV.WORKFLOW_CATEGORY.COMPLAINTS%>';
		data.relationId = '${complaints.id}';
		data.title = '${complaints.title}';
		data.description = '${complaints.content}';
		data.address = '${complaints.targetAddress}';
		data.place = '${complaints.targetName}';
		passParams(data);
		//workflowCount();
		taskCount();
	});
	
	var loadEmployee = function(obj) {
		if(isNull($(obj).val())){
			return;
		}
		refreshEmployeeList($(obj).val());
	};
	
	var refreshEmployeeList = function(deptId) {
		helper.basicPost("/employee/getEmployeeListByDept", { deptId : deptId }, 0, null, function(data) {
			var list = data.employeeList;
			var empSelect=$("#complaintsEmpId");
			empSelect.empty();
			empSelect.append($("<option></option>"));
			for ( var i = 0; i < list.length; i++) {
				var hidden = "<input type='hidden' id='property' value='"+list[i]+"' >";
				empSelect.append($("<option value='"+list[i].id+"'>" + list[i].name + "(" + list[i].workNo + ")" + "</option>"));
			}
		});
	};
	
	var showOrHide = function(status){
		if(status == 1){
			$("#showorHideContent").show();
			$("#replyContent").attr('name','replyContent');
			$("#showOrHideRemark").hide();
			$("#remark").attr('name','');
			$("#remark").val("");
		}else{
			$("#showorHideContent").hide();
			$("#replyContent").attr('name','');
			$("#replyContent").val("");
			$("#showOrHideRemark").show();
			$("#remark").attr('name','remark');
		}
	};
</script>