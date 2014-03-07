<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<form id="editFormId" action="" method="post">
	<input type="hidden" id="CSRFTokenName" value="${CSRFTokenName}"/>
	<input type="hidden" id="CSRFToken" value="${CSRFToken}"/>
	<table class="edittable">
		<colgroup>
			<col style="width: 130px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>突发事件名称<span class="must_field">*</span></th>
				<td><input type='text' id='name' name='name' maxlength='100' style="width: 90%"/></td>
			</tr>
			<tr>
				<th>预案</th>
				<td >
					<select name="preplanId" id="preplan_sel">
						<option selected='selected' value='' class='option'></option>
						<c:if test="${not empty preplans}">
							<c:forEach var="preplan" items="${preplans}">
								<option value='${preplan.id}' class='option'>${preplan.customName}</option>
							</c:forEach>
						</c:if>
					</select>
					<!-- <span id="preplan_view" style="display: none;"><a href="javascript:void(0);" class="option_view" title="查看" onclick="viewPreplan();"></a></span> -->
				</td>
			</tr>
			<tr>
				<th>发生场所<span class="must_field">*</span></th>
				<td><input type='text' id='place' name='place' maxlength='100' style="width: 90%"/></td>
			</tr>
			<tr>
				<th>发生地点<span class="must_field">*</span></th>
				<td><input type='text' id='address' name='address' maxlength='100' style="width: 90%"/></td>
			</tr>				
			<tr>
				<th>发生日期</th>
				<td><tag:dateInput onlypast="false" name="occurrenceDate" /></td>
			</tr>						
			<tr>
				<th>突发事件内容</th>
				<td><textarea rows="6" style="width: 90%" id='content' name='content' maxlength='1000'></textarea></td>
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