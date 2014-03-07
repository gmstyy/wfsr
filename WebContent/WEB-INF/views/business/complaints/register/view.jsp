<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ page language="java" import="com.founder.hs.constant.HSCV" %>

<form id="complaintsEditFormId" action="" method="post">
	<input type='hidden' value='${complaints.id}' id='id' name='id' />
	<table class="edittable">
		<colgroup>
			<col style="width: 130px;" />
			<col />
			<col style="width: 130px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>举报人</th>
				<td><input readonly="readonly" type="text" value="${complaints.complaintsName}"></td>
				<th>举报人电话</th>
				<td><input readonly="readonly" type="text" value="${complaints.complaintsTelephone}"></td>
			</tr>
			<tr>
				<th>举报对象</th>
				<td><input readonly="readonly" type="text" value="<hs:v dicName="COMPLAINTS_TYPE" code="${complaints.type}"/>"></td>
				<th>举报方式</th>
				<td><input readonly="readonly" type="text" value="<hs:v dicName="COMPLAINTS_MODE" code="${complaints.complaintsMode}"/>	"></td>
			</tr>			
			<tr>				
				<th>被举报人</th>
				<td colspan="3"><input readonly="readonly" type="text" value="${complaints.targetName}"/></td>
			</tr>
			<tr>
				<th>被举报人地址</th>
				<td colspan="3"><textarea rows="2" readonly="readonly" style="width:83.4%;">${complaints.targetAddress}</textarea></td>
			</tr>
			<tr>
				<th>标题</th>
				<td colspan="3"><input readonly="readonly" style="width:83.4%;" type='text' value='${complaints.title}'/></td>
			</tr>			
			<tr>
				<th>举报内容类别</th>
				<td colspan="3"><input type="text" readonly="readonly" value="<hs:v dicName="LICENSE_TYPE" code="${complaints.complaintsSort}"/>"></td>
			</tr>			
			<tr>
				<th>举报内容</th>
				<td colspan="3"><textarea readonly="readonly" rows="5" style="width: 83.4%">${complaints.content}</textarea></td>
			</tr>
			<tr>
				<th>登记人</th>
				<td><input readonly="readonly" type='text' value='${complaints.handlerName}'/></td>
				<th>登记时间</th>
				<td><input readonly="readonly" type="text" value="<fmt:formatDate value="${complaints.registerDatetime}" pattern="yyyy/MM/dd HH:mm:ss"/>"></td>				
			</tr>
			<tr>
				<c:if test="${complaints.type eq 1}"><!-- 商家 -->
				<th>被投诉商家</th>
				<td>
					<input disabled="disabled" type="radio" value="1" name="certifiedStatus" id="certifiedStatus" ${complaints.certifiedStatus eq 1? 'checked':''}>有证
					<input disabled="disabled" type="radio" value="0" name="certifiedStatus" id="certifiedStatus" ${complaints.certifiedStatus eq 0? 'checked':''}>无证
				</td>
				</c:if>
				<c:if test="${complaints.type eq 2}"><!-- 监督员 -->
				<th>被投诉科室</th>
				<td><input type="text" readonly="readonly" value="<hs:v dicName="DEPT" code="${complaints.complaintsDeptId}"/>"></td>
				<th>被投诉人员</th>
				<td><input type="text" readonly="readonly" value="<hs:v dicName="EMP" code="${complaints.complaintsEmpId}"/>"></td>
				</c:if>	
			</tr>
			<tr>
				<th>处理状态</th>
				<td>
					<input disabled="disabled" type="radio" name="handleStatus" ${complaints.handleStatus eq 1? 'checked':''} value="1">已完成
					<input disabled="disabled" type="radio" name="handleStatus" ${complaints.handleStatus eq 0? 'checked':''} value="0">未完成
				</td>
				<th>任务</th>
				<td><a href="javascript:void(0);" onclick="queryTasks('${complaints.id}','<%=HSCV.WORKFLOW_CATEGORY.COMPLAINTS%>');"><span id="taskCount"></span></a></td>
			</tr>			
<%-- 			<tr class="showorHideContent" style='${complaints.handleStatus eq 0 or empty complaints.handleStatus? "display: none":""}'>
				<th>回复时间</th>
				<td><input readonly="readonly" type='text' value='<fmt:formatDate value="${complaints.replyDatetime}" pattern="yyyy/MM/dd HH:mm:ss"/>'/></td>
				<th>回复人</th>
				<td><input readonly="readonly" type='text' value='${complaints.handlerName}' id='handlerName' name='handlerName' maxlength='11' /></td>
			</tr> --%>
			<tr class="showorHideContent" style='${complaints.handleStatus eq 0 or empty complaints.handleStatus? "display: none":""}'>
				<th>回复内容</th>
				<td colspan="3"><textarea rows="5" readonly="readonly" style="width:83.4%" id="replyContent" name="replyContent" maxlength='1000'>${complaints.replyContent}</textarea></td>
			</tr>	
			<tr>
				<th>填写备注</th>
				<td colspan="3"><textarea readonly="readonly" rows="5" style="width:83.4%" id="remark" name="remark" maxlength="1000">${complaints.remark}</textarea></td>
			</tr>
			<c:if test="${not empty complaints.backStatus and complaints.handleStatus != 1}">
				<tr>
					<th>退回状态</th>
					<td>已退回</td>
					<th>退回时间</th>
					<td><input readonly="readonly" type='text' value='<fmt:formatDate value="${complaints.backDatetime}" pattern="yyyy/MM/dd HH:mm:ss"/>'/></td>
				</tr>
			</c:if>
			<c:if test="${not empty complaints.transferStatus and empty complaints.backStatus and complaints.handleStatus != 1}">
				<tr>
					<th>移交状态</th>
					<td colspan="3">已移交   <a href="javascript:void(0);" onclick="showTransferInfo();">详细</a></td>
				</tr>
			</c:if>
		</tbody>
	</table>
</form>
<div style="display: none;" id="showTransfer">
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;" />
			<col style="width: 130px;"/>
			<col style="width: 80px;" />
			<col style="width: 130px;" />
		</colgroup>
		<c:forEach var="transferInfoList" items="${transferInfoList}" varStatus="status">
			<tr>
				<th>${status.index + 1}.</th>
				<td colspan="3">
					<hs:v dicName="ORG" code="${transferInfoList.sentOrgId}"/> 移交至 <hs:v dicName="ORG" code="${transferInfoList.receivedOrgId}"/>
					移交时间：<fmt:formatDate value="${transferInfoList.sentDatetime}" pattern="yyyy/MM/dd HH:mm:ss"/> 移交人：${transferInfoList.sentName}
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<script type="text/javascript">
$(function() {
	var data = new Object();
	data.categoryCode = '<%=HSCV.WORKFLOW_CATEGORY.COMPLAINTS%>';
	data.relationId = '${complaints.id}';
	passParams(data);
	workflowCount();
	taskCount();
});
var showTransferInfo = function(){
	$("#showTransfer").show();
}; 
</script>