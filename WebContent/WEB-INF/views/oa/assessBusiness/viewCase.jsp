<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ page language="java" import="com.founder.oa.common.constant.OACV" %>


<div id="search_container">
	<form id="search_form2" name="userForm" action="" method="post">
	<input type="text" id="filterData" name="filterData" maxlength="200"  value="${filterData}" style = "display:none;"/>
		
	</form>
</div>
<div id="list_container">
	<table class="repeattable">
		
		<colgroup>
			<col style="width: 20%;">
			<col style="width: 20%;">
			<col style="width: 20%;">
			<col style="width: 10%;">
			<col style="width: 10%;">
			<col style="width: 10%;">
			<col style="width: 10%;">
		</colgroup>
		<thead>
			<tr class="row_header">
		        <th>案件类别</th>
				<th>案件来源</th>
				<th>被查处单位</th>
				<th>当前状态</th>
				<th>立案时间</th>
				<th>结案时间</th>
				<th>上报时间</th>
			</tr>
		</thead>
		<tbody id="list_table2"></tbody>
		<tr id="template2" style="display: none;">
			
			<td>#caseInvestigateDesc#</td>
	 		<td>#caseSource#</td>
			<td>#casePlace#</td>
			<td>#statusDesc#</td>
			<td>#createDatetime#</td>
			<td>#closeDatetime#</td>
			<td>#reportDatetime#</td>
			
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<script type="text/javascript">
	var templateModel = {
		id : null,
		caseInvestigateDesc : null,
		caseSource : null,
		casePlace : null,
		statusDesc : null,
		createDatetime :{type:'timestamp'},
		closeDatetime : {type:'timestamp'},
		reportDatetime : {type:'timestamp'}	
	};
	var helper2 = new dataHelper(templateModel);
	var search = function() {
		//licenseTypeTmp=$("#search_form").find("#licenseType").val();
		helper2.postSearch('/assessBusiness/view/case/search/', {
			formId : 'search_form2',
			containerId : 'list_table2',
			templateId : 'template2'
		});
	};
	$(function() {
		search();
	});
	//make default search

</script>
