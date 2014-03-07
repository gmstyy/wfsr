<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editFormId" action="" method="post">
	<input type="hidden" id="CSRFTokenName" value="${CSRFTokenName}" /> <input type="hidden" id="CSRFToken" value="${CSRFToken}" /> <input type="hidden" name='id'
		value="${statisticsConfig.id}">
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;" />
			<col />
			<col style="width: 80px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>报表名称</th>
				<td><input type='text' value='${statisticsConfig.statName}' id='statName' name='statName' maxlength='50' /></td>
				<th>机构级别</th>
				<td><hs:dic dicName="ORG_LEVEL" defalt="${statisticsConfig.orgLevel}" id='orgLevel' name='orgLevel' ></hs:dic></td>
			</tr>
			<tr>
				<th>sql<span style='color: red'>*</span></th>
				<td colspan="3"><textarea rows="5" cols="70"  id='runSql' name='runSql'>${statisticsConfig.runSql}</textarea></td>
			</tr>
			<tr>
				<th>运行时间</th>
				<td><input type='text' value='${statisticsConfig.runDate}' id='runDate' name='runDate' maxlength='50' /></td>
			</tr>
				<tr>
				<th>字符1名称</th>
				<td><input type='text' value='${statisticsConfig.str1Name}' id='str1Name' name='str1Name' maxlength='50' /></td>
				<th>字符1映射</th>
				<td><input type='text' value='${statisticsConfig.str1}' id='str1' name='str1' maxlength='50' /></td>
			</tr>
			<tr>
				<th>字符2名称</th>
				<td><input type='text' value='${statisticsConfig.str2Name}' id='str2Name' name='str2Name' maxlength='50' /></td>
				<th>字符2映射</th>
				<td><input type='text' value='${statisticsConfig.str2}' id='str2' name='str2' maxlength='50' /></td>
			</tr>
			<tr>
				<th>字符3名称</th>
				<td><input type='text' value='${statisticsConfig.str3Name}' id='str3Name' name='str3Name' maxlength='50' /></td>
				<th>字符3映射</th>
				<td><input type='text' value='${statisticsConfig.str3}' id='str3' name='str3' maxlength='50' /></td>
			</tr>
			<tr>
				<th>数值1名称</th>
				<td><input type='text' value='${statisticsConfig.num1Name}' id='num1Name' name='num1Name' maxlength='50' /></td>
				<th>数值1映射</th>
				<td><input type='text' value='${statisticsConfig.num1}' id='num1' name='num1' maxlength='50' /></td>
			</tr>
			<tr>
				<th>数值2名称</th>
				<td><input type='text' value='${statisticsConfig.num2Name}' id='num2Name' name='num2Name' maxlength='50' /></td>
				<th>数值2映射</th>
				<td><input type='text' value='${statisticsConfig.num2}' id='num2' name='num2' maxlength='50' /></td>
			</tr>
			<tr>
				<th>数值3名称</th>
				<td><input type='text' value='${statisticsConfig.num3Name}' id='num3Name' name='num3Name' maxlength='50' /></td>
				<th>数值3映射</th>
				<td><input type='text' value='${statisticsConfig.num3}' id='num3' name='num3' maxlength='50' /></td>
			</tr>
			<tr>
				<th>数值4名称</th>
				<td><input type='text' value='${statisticsConfig.num4Name}' id='num4Name' name='num4Name' maxlength='50' /></td>
				<th>数值4映射</th>
				<td><input type='text' value='${statisticsConfig.num4}' id='num4' name='num4' maxlength='50' /></td>
			</tr>
			<tr>
				<th>数值5名称</th>
				<td><input type='text' value='${statisticsConfig.num5Name}' id='num5Name' name='num5Name' maxlength='50' /></td>
				<th>数值5映射</th>
				<td><input type='text' value='${statisticsConfig.num5}' id='num5' name='num5' maxlength='50' /></td>
			</tr>
			<tr>
				<th>数值6名称</th>
				<td><input type='text' value='${statisticsConfig.num6Name}' id='num6Name' name='num6Name' maxlength='50' /></td>
				<th>数值6映射</th>
				<td><input type='text' value='${statisticsConfig.num6}' id='num6' name='num6' maxlength='50' /></td>
			</tr>
			<tr>
				<th>数值7名称</th>
				<td><input type='text' value='${statisticsConfig.num7Name}' id='num7Name' name='num7Name' maxlength='50' /></td>
				<th>数值7映射</th>
				<td><input type='text' value='${statisticsConfig.num7}' id='num7' name='num7' maxlength='50' /></td>
			</tr>
			<tr>
				<th>数值8名称</th>
				<td><input type='text' value='${statisticsConfig.num8Name}' id='num8Name' name='num8Name' maxlength='50' /></td>
				<th>数值8映射</th>
				<td><input type='text' value='${statisticsConfig.num8}' id='num8' name='num8' maxlength='50' /></td>
			</tr>
			<tr>
				<th>数值9名称</th>
				<td><input type='text' value='${statisticsConfig.num9Name}' id='num9Name' name='num9Name' maxlength='50' /></td>
				<th>数值9映射</th>
				<td><input type='text' value='${statisticsConfig.num9}' id='num9' name='num9' maxlength='50' /></td>
			</tr>
			<tr>
				<th>数值10名称</th>
				<td><input type='text' value='${statisticsConfig.num10Name}' id='num10Name' name='num10Name' maxlength='50' /></td>
				<th>数值10映射</th>
				<td><input type='text' value='${statisticsConfig.num10}' id='num10' name='num10' maxlength='50' /></td>
			</tr>


		</tbody>
	</table>
</form>

