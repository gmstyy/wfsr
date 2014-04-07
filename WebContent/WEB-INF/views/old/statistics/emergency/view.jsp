<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>

<div id="tabs">
	<input type="hidden" id="untreatedTotal" value="${emergencyCountMap.UNTREATED_TOTAL}">
	<input type="hidden" id="processedTotal" value="${emergencyCountMap.PROCESSED_TOTAL}">
	<input type="hidden" id="completedTotal" value="${emergencyCountMap.COMPLETED_TOTAL}">
	<form id="viewCountViewFormId" action="" method="post">
		<fieldset style="height: 80px;">
			<legend>数据统计</legend>
				<table class="repeattable">
					<colgroup>
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
					</colgroup>
					<thead>
						<tr class="row_header">
							<th>应急处置总数</th>
							<th>未处理</th>
							<th>处理中</th>
							<th>已完成</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${emergencyCountMap.EMERGENCY_COUNT}</td>
							<td>${emergencyCountMap.UNTREATED_TOTAL}</td>
							<td>${emergencyCountMap.PROCESSED_TOTAL}</td>
							<td>${emergencyCountMap.COMPLETED_TOTAL}</td>
						</tr>
					</tbody>
				</table>
		</fieldset>
		<div id="container" style="width:595px;height: 380px;margin-top: 5px;"></div>
	</form>
</div>
<script type="text/javascript">
	 $(function ($) {
		 var untreatedTotal = parseInt($(top.document).find("#untreatedTotal").val());
		 var processedTotal = parseInt($(top.document).find("#processedTotal").val());
		 var completedTotal = parseInt($(top.document).find("#completedTotal").val());
		 var sum = untreatedTotal+processedTotal+completedTotal;
		 if(sum == 0){
			 $(top.document).find("#container").text("提示：无统计数据，请建立相关数据！");
			 return;
		 } 
		 $(top.document).find('#container').highcharts({
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false
	        },
	        title: {
	            text: '应急处置'
	        },
	        tooltip: {
	    	    pointFormat: '{series.name}: <b>{point.percentage:.0f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    color: '#000000',
	                    connectorColor: '#000000',
	                    format: '<b>{point.name}</b>: {point.percentage:.0f} %'
	                }
	            }
	        },
	        series: [{
	            type: 'pie',
	            name: '比例',
	            data: [
	                ['未处理',    untreatedTotal],
	                ['处理中',    processedTotal],
	                ['已完成',    completedTotal]
	            ]
	        }]
	     });
	});
</script>