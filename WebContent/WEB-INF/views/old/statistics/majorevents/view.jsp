<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>

<div id="tabs">
	<input type="hidden" id="majorEventsCount" value="${majorEventsCountMap.MAJOR_EVENTS_COUNT}">
	<input type="hidden" id="acceptTotal" value="${majorEventsCountMap.ACCEPT_TOTAL}">
	<input type="hidden" id="completedTotal" value="${majorEventsCountMap.COMPLETED_TOTAL}">
	<form id="viewCountViewFormId" action="" method="post">
		<fieldset style="height: 80px;">
			<legend>数据统计</legend>
				<table class="repeattable">
					<colgroup>
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
					</colgroup>
					<thead>
						<tr class="row_header">
							<th>重大活动总数</th>
							<th>已受理</th>
							<th>已完成</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${majorEventsCountMap.MAJOR_EVENTS_COUNT}</td>
							<td>${majorEventsCountMap.ACCEPT_TOTAL}</td>
							<td>${majorEventsCountMap.COMPLETED_TOTAL}</td>
						</tr>
					</tbody>
				</table>
		</fieldset>
		<div id="container" style="width:595px;height: 380px;margin-top: 5px;"></div>
	</form>
</div>

<script type="text/javascript">
	 $(function ($) {
		 var acceptTotal = parseInt($(top.document).find("#acceptTotal").val());
		 var completedTotal = parseInt($(top.document).find("#completedTotal").val());
		 var sum = acceptTotal+completedTotal;
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
	            text: '重大活动'
	        },
	        tooltip: {
	    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    color: '#000000',
	                    connectorColor: '#000000',
	                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
	                }
	            }
	        },
	        series: [{
	            type: 'pie',
	            name: '比例',
	            data: [
	                ['已受理',    acceptTotal],
	                ['已完成',    completedTotal]
	            ]
	        }]
	     });
	});
</script>