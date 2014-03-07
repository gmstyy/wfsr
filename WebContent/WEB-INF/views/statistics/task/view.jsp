<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>

<div id="tabs">
	<form id="viewCountViewFormId" action="" method="post">
		<fieldset>
			<legend>数据统计</legend>
				<table class="repeattable">
					<colgroup>
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
					</colgroup>
					<thead>
						<tr class="row_header">
							<th>任务来源</th>
							<th>许可申请</th>
							<th>投诉举报</th>
							<th>突发应急</th>
							<th>重大活动保障</th>
							<th>案件</th>
							<th>其他</th>
							<th>总计</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${taskCountMap}" var="map">
							<c:if test="${map.TASK_STATUS eq 1}">
								<tr style="text-align: center;">
									<td>${map.TASK_NAME}</td>
									<td>${map.LICENSE}</td>
									<td>${map.COMPLAINTS}</td>
									<td>${map.EMERGENCY}</td>
									<td>${map.MAJOR_EVENTS}</td>
									<td>${map.CASES}</td>
									<td>${map.OTHERS}</td>
									<td>${map.TOTAL}</td>
								</tr>
							</c:if>
							<c:if test="${map.TASK_STATUS eq 2}">
								<tr style="text-align: center;">
									<td>${map.TASK_NAME}</td>
									<td>${map.LICENSE}</td>
									<td>${map.COMPLAINTS}</td>
									<td>${map.EMERGENCY}</td>
									<td>${map.MAJOR_EVENTS}</td>
									<td>${map.CASES}</td>
									<td>${map.OTHERS}</td>
									<td>${map.TOTAL}</td>
								</tr>
							</c:if>
							<c:if test="${map.TASK_STATUS eq 3}">
								<tr style="text-align: center;">
									<td>${map.TASK_NAME}</td>
									<td>${map.LICENSE}</td>
									<td>${map.COMPLAINTS}</td>
									<td>${map.EMERGENCY}</td>
									<td>${map.MAJOR_EVENTS}</td>
									<td>${map.CASES}</td>
									<td>${map.OTHERS}</td>
									<td>${map.TOTAL}</td>
								</tr>
							</c:if>
							<c:if test="${map.TASK_STATUS eq 4}">
								<tr style="text-align: center;">
									<td>${map.TASK_NAME}</td>
									<td>${map.LICENSE}</td>
									<td>${map.COMPLAINTS}</td>
									<td>${map.EMERGENCY}</td>
									<td>${map.MAJOR_EVENTS}</td>
									<td>${map.CASES}</td>
									<td>${map.OTHERS}</td>
									<td>${map.TOTAL}</td>
								</tr>
							</c:if>
							<input type="hidden" class = "source_${map.TASK_STATUS}" value="${map.LICENSE}">
							<input type="hidden" class = "source_${map.TASK_STATUS}" value="${map.COMPLAINTS}">
							<input type="hidden" class = "source_${map.TASK_STATUS}" value="${map.EMERGENCY}">
							<input type="hidden" class = "source_${map.TASK_STATUS}" value="${map.MAJOR_EVENTS}">
							<input type="hidden" class = "source_${map.TASK_STATUS}" value="${map.CASES}">
							<input type="hidden" class = "source_${map.TASK_STATUS}" value="${map.OTHERS}">
						</c:forEach>
					</tbody>
				</table>
		</fieldset>
		<div id="container" style="width:595px;height: 380px;margin-top: 5px;"></div>
	</form>
</div>
<script type="text/javascript">
$(function () {
	 var initiate = new Array();
	 var comply = new Array();
	 var finish = new Array();
	 var cancel = new Array();
	 $(top.document).find(".source_1").each(function(){
		 initiate.push(parseInt($(this).val()));
	 });
	 $(top.document).find(".source_2").each(function(){
		 comply.push(parseInt($(this).val()));
	 });
	 $(top.document).find(".source_3").each(function(){
		 finish.push(parseInt($(this).val()));
	 });
	 $(top.document).find(".source_4").each(function(){
		 cancel.push(parseInt($(this).val()));
	 });
	 $(top.document).find('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '任务执行数据统计'
        },
        xAxis: {
            categories: ['行政许可', '投诉举报', '突发应急', '重大活动保障', '案件查处','其他']
        },
        yAxis: {
            min: 0,
            title: {
                text: '单位（件）'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                }
            }
        },
        legend: {
            align: 'right',
            x: -90,
            verticalAlign: 'top',
            y: 20,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },
        tooltip: {
            formatter: function() {
                return '<b>'+ this.x +'</b><br/>'+
                    this.series.name +': '+ this.y +'<br/>'+
                    '总数: '+ this.point.stackTotal;
            }
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                }
            }
        },			
        series: [{
            name: '任务发起',
            data: initiate
        }, {
            name: '任务执行',
            data: comply
        }, {
            name: '任务完成',
            data: finish
        },{
            name: '任务撤销',
            data: cancel
        }]
    });
});

</script>