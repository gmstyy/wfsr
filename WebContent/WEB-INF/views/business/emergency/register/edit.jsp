<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<form id="registerEditFormId" action="" method="post">
	<input type="hidden" id="CSRFTokenName" value="${CSRFTokenName}"/>
	<input type="hidden" id="CSRFToken" value="${CSRFToken}"/>
	<input type="hidden" name="id" id="id" value="${emergency.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 130px;" />
			<col />
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>突发事件名称<span class="must_field">*</span></th>
				<td colspan="3"><input type='text' id='name' name='name' maxlength='100' style="width: 90%" value="${emergency.name}"/></td>
			</tr>
			<tr>
				<th>预案</th>
				<td colspan="3">
					<select name="preplanId" id="preplan_sel">
						<option value='' class='option'></option>
						<c:if test="${not empty preplanList}">
							<c:forEach var="preplan" items="${preplanList}">
								<option value='${preplan.id}' ${emergency.preplanId eq preplan.id? 'selected=selected':'' } class='option'>${preplan.customName}</option>
							</c:forEach>
						</c:if>
					</select>
					<span id="preplan_view" ${empty emergency.preplanId? "style=display:none;":""}><a href="javascript:void(0);" class="option_view" title="查看" onclick="viewPreplan();"></a></span>
				</td>
			</tr>
			<tr>
				<th>场所名称</th>
				<td colspan="3"><input type='text' id='place' name='place' value="${emergency.place}" maxlength='100' style="width: 90%"/></td>
			</tr>
			<tr>
				<th>发生日期</th>
				<td><tag:dateInput onlypast="false" name="occurrenceDate" date="${emergency.occurrenceDate}"/></td>
			</tr>						
			<tr>
				<th>发生地点</th>
				<td colspan="3"><input type='text' id='address' name='address' value="${emergency.address}" maxlength='100' style="width: 90%"/></td>
			</tr>
			<tr>
				<th>突发事件内容</th>
				<td colspan="3"><textarea rows="6" style="width: 90%" id='content' name='content' maxlength='1500'>${emergency.content}</textarea></td>
			</tr>
		</tbody>
	</table>
</form>
<script type="text/javascript">
$("#preplan_sel").change(function(){
	if($("#preplan_sel").val() != ''){
		$("#preplan_view").show();
	}else{
		$("#preplan_view").hide();
	}
});
var viewPreplan = function() {
	if($("#preplan_sel").val() != '')
		file.download($("#preplan_sel").val());
};
</script>