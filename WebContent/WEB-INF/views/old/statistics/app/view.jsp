<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>

<div id="tabs">
	<ul>
		<li class="tabs-1"><span>本机构数据</span></li>
		<li class="tabs-2" onclick="domainTab()"><span>本区域数据</span></li>
		<li class="tabs-3"><span>时间范围维度</span></li>
	</ul>
	<div id="tabs-1">
		<div id="license_num_org" style="width:1000px;height: 482px;margin-top: 5px;"></div>
	</div>
	<div id="tabs-2">
		<div id="license_num_domain" style="width:1000px;height: 482px;margin-top: 5px;"></div>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/highcharts.js"></script>
<script type="text/javascript">
	var dimentions = ["org"];

	var dimentionSearch = function(dimention, callback, processData) {
		$("#dimention").val(dimention);
		helper.postForm('/statistics/app/search', 0, {
			formId : "search_form",
			processData : processData
		}, function(response) {
			callback(response);
		});
	};

	var domainTab = function() {
		if (dimentions.indexOf("domain") > -1) {
			return;
		}
		dimentions.push("domain");
		dimentionSearch("domain", function(response) {
			licenseNumDomain(response);
		});
	};

	var licenseNumOrg = function() {
		var org = $("#orgId :selected").html();
		var customerHighcharts = new CustomerHighcharts("basicColumn");
		customerHighcharts.createChart("license_num_org", {
			title : "许可处理数量",
			subtitle : org,
			colYaxisTitle : "许可数量 (个)",
			colUnit : "个数|个",
			colNames : ${colNames},
			colValues : ${colValues}
		});
	};

	var licenseNumDomain = function(mav) {
		debugger;
		var org = $("#orgId :selected").html().replace("卫生监督局", "");
		var colNames = JSON.parse(mav.colNames);
		var colValues = JSON.parse(mav.colValues);
		var customerHighcharts = new CustomerHighcharts("basicColumn");
		customerHighcharts.createChart("license_num_domain", {
			title : "许可处理数量",
			subtitle : org,
			colYaxisTitle : "许可数量 (个)",
			colUnit : "个数|个",
			colNames : colNames,
			colValues : colValues,
			drilldown : true,
			drilldownArg : {
				url : "/statistics/app/search",
				formId : "search_form",
				processData : function(prms, param1, param2) {
					prms.licenseType = param1;
					prms.dataName = param2;
					prms.dimention = "unit";
					return prms;
				}
			}
		});
	};


	$(function() {
		tabs.createTabs("tabs");
		licenseNumOrg();
	});
</script>