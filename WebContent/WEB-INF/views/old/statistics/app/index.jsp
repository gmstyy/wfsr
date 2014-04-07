<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<div id="search_container">
	<form id="search_form" name="userForm" action="" method="post">
		<input type="hidden" id="dimention" name="dimention" value="org"/>
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 120px;"/>
				<col/>
				<col style="width: 120px;"/>
				<col/>
				<col style="width: 120px;"/>
				<col/>
			</colgroup>
			<thead>
			<tr>
				<th>行政级别</th>
				<td><hs:dic dicName="ORG_LEVEL" id="orgLevel" name="orgLevel" onChange="changeOrgLevel()"/></td>
				<th>机构</th>
				<td>
					<select name="orgId" id="orgId">
						<option value="">请选择行政级别</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>时间范围</th>
				<td colspan="5">
					<input type="radio" name="timeRange" value="all" onchange="setTimeRange()" checked/>全部
					<input type="radio" name="timeRange" value="yearly" onchange="setTimeRange()"/>年度
					<input type="radio" name="timeRange" value="monthly" onchange="setTimeRange()"/>月度
					<input type="radio" name="timeRange" value="other" onchange="setTimeRange()"/>其他
					<span id="otherTime" style="display: none">
						<tag:dateInput name="beginTime" pattern="yyyy-MM-dd"/> ~
						<tag:dateInput name="endTime" pattern="yyyy-MM-dd"/>
					</span>
				</td>
			</tr>
			<tr>
				<th>业务</th>
				<td>
					<select name="business" id="business">
						<option value="license_num">许可数量</option>
						<option value="license_rate">许可处理率</option>
					</select>
				</td>
			</tr>
			</thead>
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			<input class="button_reset" onclick="$('form')[0].reset();" type="button" />
			<input class="button_search" onclick="search();" type="button" />
		</div>
	</form>
</div>
<div id="diagram_container">
</div>
<script type="text/javascript">
	var templateModel = {};
	var helper = new dataHelper(templateModel);

	var changeOrgLevel = function() {
		helper.basicPost("/statistics/changeOrgLevel", {orgLevel : $("#orgLevel").val()}, 0, null, function(data) {
			var html = "";
			var list = data.orgList;
			if (isNull(list) || list.length == 0) {
				html += "<option value=''>请选择行政级别</option>";;
			}
			for (var i = 0; i < list.length; i++) {
				html += "<option value='" + list[i].id + "'>" + list[i].name + "</option>";
			}
			$("#orgId").html(html);
		});
	};

	var setTimeRange = function() {
		if ($(":checked[name='timeRange']").val() == 'other') {
			$("#otherTime").show();
		} else {
			$("#otherTime").hide();
		}
	};

	var search = function() {
		$("#dimention").val("org");
		if ($("#orgId").val() == "") {
			Dialog.alert("请选择机构");
			return;
		}
		helper.postForm('/statistics/app/search', 2, {
			formId : "search_form"
		}, function(response) {
			$("#diagram_container").html(response);
		});
	};

	//make default search
	$(function() {
		//tabs.createTabs("tabs");
		//search();
	});
</script>