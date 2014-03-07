<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>

<div id="tabs">
	<input type="hidden" id="validPercentage" value="${complaintsCount.validPercentage}">
	
	<input type="hidden" id="unacceptTotal" value="${complaintsCount.unacceptTotal}">
	<input type="hidden" id="acceptTotal" value="${complaintsCount.acceptTotal}">
	<input type="hidden" id="complateTotal" value="${complaintsCount.complateTotal}">
	<input type="hidden" id="gobackTotal" value="${complaintsCount.gobackTotal}">
	<input type="hidden" id="transferTotal" value="${complaintsCount.transferTotal}">
	<input type="hidden" id="statusPercentage" value="${complaintsCount.statusPercentage}">
	
	<input type="hidden" id="businessTotal" value="${complaintsCount.businessTotal}">
	<input type="hidden" id="documentedTotal" value="${complaintsCount.documentedTotal}">
	<input type="hidden" id="undocumentedTotal" value="${complaintsCount.undocumentedTotal}">
	<input type="hidden" id="regulatoryTotal" value="${complaintsCount.regulatoryTotal}">

	<input type="hidden" id="siteTotal" value="${complaintsCount.siteTotal}">
	<input type="hidden" id="telephoneTotal" value="${complaintsCount.telephoneTotal}">
	<input type="hidden" id="letterTotal" value="${complaintsCount.letterTotal}">
	<input type="hidden" id="onlineTotal" value="${complaintsCount.onlineTotal}">
	<input type="hidden" id="otherTotal" value="${complaintsCount.otherTotal}">						
	<form id="viewCountViewFormId" action="" method="post">
		<ul>
			<li class="tabs-1"><span>投诉有效性</span></li>
			<li class="tabs-2"><span>受理状态</span></li>
			<li class="tabs-3"><span>投诉对象</span></li>
			<li class="tabs-4"><span>投诉类型</span></li>
			<li class="tabs-5"><span>投诉方式</span></li>
		</ul>
		<div id="tabs-1">
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
							<th>投诉总数	</th>
							<th>有效投诉</th>
							<th>无效投诉</th>
							<th>投诉有效率</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${complaintsCount.total}</td>
							<td>${complaintsCount.validTotal}</td>
							<td>${complaintsCount.invalidTotal}</td>
							<td>${complaintsCount.validPercentage}%</td>
						</tr>
					</tbody>
				</table>
			</fieldset>
			<div id="containerA" style="width:595px;height: 380px;margin-top: 5px;"></div>
		</div>
		<div id="tabs-2">
			<fieldset style="height: 80px;">
				<legend>数据统计</legend>
				<table class="repeattable">
					<colgroup>
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
					</colgroup>
					<thead>
						<tr class="row_header">
							<th>未受理</th>
							<th>已受理</th>
							<th>已完成</th>
							<th>已退回</th>
							<th>已移交</th>
							<th>完成率</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${complaintsCount.unacceptTotal}</td>
							<td>${complaintsCount.acceptTotal}</td>
							<td>${complaintsCount.complateTotal}</td>
							<td>${complaintsCount.gobackTotal}</td>
							<td>${complaintsCount.transferTotal}</td>
							<td>${complaintsCount.statusPercentage}%</td>
						</tr>
					</tbody>
				</table>
			</fieldset>
			<div id="containerB" style="width:595px;height: 380px;margin-top: 5px;"></div>
		</div>
		<div id="tabs-3">
			<fieldset style="height: 80px;">
				<legend>数据统计</legend>
				<table class="repeattable">
					<c:forEach var="deptList" items="${deptMap}">
						<input type="hidden" class="dept" name="${deptList.NAME}" value="${deptList.DEPT_COUNT}">
					</c:forEach>
					<colgroup>
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
					</colgroup>
					<thead>
						<tr class="row_header">
							<th>投诉商家数</th>
							<th>投诉监督员数</th>
							<th>商家有证数</th>
							<th>商家无证数</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${complaintsCount.businessTotal}</td>
							<td>${complaintsCount.regulatoryTotal}</td>
							<td>${complaintsCount.documentedTotal}</td>
							<td>${complaintsCount.undocumentedTotal}</td>
						</tr>
					</tbody>
				</table>
			</fieldset>
			<div id="containerC"  style="width:293px;height: 385px;margin-top: 5px;float: left"></div>
			<div id="containerC1" style="width:303px;height: 190px;margin-top: 5px;float: right"></div>
			<div id="containerC2" style="width:303px;height: 190px;margin-top: 5px;float: right"></div>
		</div>
		<div id="tabs-4">
			<c:forEach var="map" items="${mapCount}">
				<input type="hidden" class="complaintsSortCount" name="${map.key}" value="${map.value}"/>
			</c:forEach>
			<div id="containerD" style="width:595px;height: 482px;margin-top: 5px;"></div>
		</div>
		<div id="tabs-5">
			<fieldset style="height: 80px;">
				<legend>投诉方式</legend>
				<table class="repeattable">
					<colgroup>
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
					</colgroup>
					<thead>
						<tr class="row_header">
							<th>现场投诉</th>
							<th>电话投诉</th>
							<th>信件投诉</th>
							<th>在线投诉</th>
							<th>其他投诉</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${complaintsCount.siteTotal}</td>
							<td>${complaintsCount.telephoneTotal}</td>
							<td>${complaintsCount.letterTotal}</td>
							<td>${complaintsCount.onlineTotal}</td>
							<td>${complaintsCount.otherTotal}</td>
						</tr>
					</tbody>
				</table>
			</fieldset>
			<div id="containerE" style="width:595px;height: 380px;margin-top: 5px;"></div>
		</div>
	</form>
</div>
<script type="text/javascript">
	top.tabs.createTabs("tabs");
	 $(function ($) {
		 var valid = parseInt($(top.document).find("#validPercentage").val());
		 var invalid = 100-valid;
		
		 var unacceptTotal = parseInt($(top.document).find("#unacceptTotal").val());
		 var acceptTotal = parseInt($(top.document).find("#acceptTotal").val());
		 var complateTotal = parseInt($(top.document).find("#complateTotal").val());
		 var gobackTotal = parseInt($(top.document).find("#gobackTotal").val());
		 var transferTotal = parseInt($(top.document).find("#transferTotal").val());
		 var complate = parseInt($(top.document).find("#statusPercentage").val());
		 var notComplate = 100-complate;
		 var businessTotal = parseInt($(top.document).find("#businessTotal").val());
		 var regulatoryTotal = parseInt($(top.document).find("#regulatoryTotal").val());
		 var documentedTotal = parseInt($(top.document).find("#documentedTotal").val());
		 var undocumentedTotal = parseInt($(top.document).find("#undocumentedTotal").val());
		 var deptList = new Array();
		 $(top.document).find(".dept").each(function(){
			 	var dept = new Array();
			 	dept.push($(this).attr('name'));
			 	if(isNull($(this).val())){
			 		dept.push(0);
			 	}else{
			 		dept.push(parseInt($(this).val()));
			 	}
			 	deptList.push(dept);
		 });
		 var sortTotalName = new Array();
		 var sortTotalValue = new Array();
		 $(top.document).find(".complaintsSortCount").each(function(){
			 sortTotalName.push($(this).attr('name'));
			 sortTotalValue.push(parseInt($(this).val()));
		 });
		 var siteTotal = parseInt($(top.document).find("#siteTotal").val());
		 var telephoneTotal = parseInt($(top.document).find("#telephoneTotal").val());
		 var letterTotal = parseInt($(top.document).find("#letterTotal").val());
		 var onlineTotal = parseInt($(top.document).find("#onlineTotal").val());
		 var otherTotal = parseInt($(top.document).find("#otherTotal").val());
		
		 customerHighcharts.createCharts($(top.document).find('#containerA'), {
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false
	        },
	        title: {
	            text: '投诉举报有效性'
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
	                ['投诉有效',    valid],
	                ['投诉无效',    invalid]
	            ]
	        }]
	     });
		 
		 customerHighcharts.createCharts($(top.document).find('#containerB'), {
	            chart: {
	            },
	            title: {
	                text: '投诉举报受理状态'
	            },
	            yAxis: {
	                min: 0,
	                title: {
	                    text: '单位 (件)'
	                }
	            },
	            xAxis: {
	                categories: ['统计数量']
	            },
	            tooltip: {
	                formatter: function() {
	                    var s;
	                    if (this.point.name) { 
	                        s = ''+
	                            this.point.name +': '+ this.y +' % ';
	                    } else {
	                        s = ''+
	                            this.x  +': '+ this.y;
	                    }
	                    return s;
	                }
	            },
	            labels: {
	                items: [{
	                    html: '完成率',
	                    style: {
	                        left: '445px',
	                        top: '110px',
	                        color: 'black'
	                    }
	                }]
	            },
	            series: [{
	                type: 'column',
	                name: '未受理',
	                data: [unacceptTotal]
	            }, {
	                type: 'column',
	                name: '已受理',
	                data: [acceptTotal]
	            }, {
	                type: 'column',
	                name: '已完成',
	                data: [complateTotal]
	            },{
	            	type: 'column',
		            name: '已退回',
		            data: [gobackTotal]
	            },{
	            	type: 'column',
		            name: '已移交',
		            data: [transferTotal]
	            }, {
	                type: 'pie',
	                name: 'Total consumption',
	                data: [{
	                    name: '已完成率',
	                    y: complate,
	                    color: Highcharts.getOptions().colors[7] 
	                }, {
	                    name: '未完成率',
	                    y: notComplate,
	                    color: Highcharts.getOptions().colors[8] 
	                }],
	                center: [440,40],
	                size: 100,
	                showInLegend: false,
	                dataLabels: {
	                    enabled: false
	                }
	            }]
	     });
		 
		 customerHighcharts.createCharts($(top.document).find('#containerC'), {
	            chart: {
	                type: 'column',
	                margin: [ 50, 50, 100, 80]
	            },
	            title: {
	                text: '投诉对象'
	            },
	            xAxis: {
	                categories: ['投诉商家数','投诉监督员数'],
	                labels: {
	                    rotation: -45,
	                    align: 'right',
	                    style: {
	                        fontSize: '13px',
	                        fontFamily: 'Verdana, sans-serif'
	                    }
	                }
	            },
	            yAxis: {
	                min: 0,
	                title: {
	                    text: '数量 (件)'
	                }
	            },
	            legend: {
	                enabled: false
	            },
	            tooltip: {
	                pointFormat: '数量: <b>{point.y:.0f}件</b>',
	            },
	            series: [{
	                name: 'Population',
	                data: [businessTotal,regulatoryTotal],
	                dataLabels: {
	                    enabled: true,
	                    rotation: -90,
	                    color: '#FFFFFF',
	                    align: 'right',
	                    x: 4,
	                    y: 10,
	                    style: {
	                        fontSize: '13px',
	                        fontFamily: 'Verdana, sans-serif',
	                        textShadow: '0 0 3px black'
	                    }
	                }
	            }]
	     });
		 
		 customerHighcharts.createCharts($(top.document).find('#containerC1'), {
		        chart: {
		            plotBackgroundColor: null,
		            plotBorderWidth: null,
		            plotShadow: false
		        },
		        title: {
		            text: '投诉商家'
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
		                    format: '<b>{point.name}</b>: {point.percentage:.0f}%'
		                }
		            }
		        },
		        series: [{
		            type: 'pie',
		            name: '比例',
		            data: [
		                ['有证',    documentedTotal],
		                ['无证',    undocumentedTotal]
		            ]
		        }]
		 });
		 
		 customerHighcharts.createCharts($(top.document).find('#containerC2'), {
		        chart: {
		            plotBackgroundColor: null,
		            plotBorderWidth: null,
		            plotShadow: false
		        },
		        title: {
		            text: '投诉科室'
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
		            data: deptList
		        }]
		  });
		 
		 customerHighcharts.createCharts($(top.document).find('#containerD'), {
	            chart: {
	                type: 'column',
	                margin: [ 50, 50, 100, 80]
	            },
	            title: {
	                text: '投诉类型'
	            },
	            xAxis: {
	                categories: sortTotalName,
	                labels: {
	                    rotation: -45,
	                    align: 'right',
	                    style: {
	                        fontSize: '13px',
	                        fontFamily: 'Verdana, sans-serif'
	                    }
	                }
	            },
	            yAxis: {
	                min: 0,
	                title: {
	                    text: '数量 (件)'
	                }
	            },
	            legend: {
	                enabled: false
	            },
	            tooltip: {
	                pointFormat: '数量: <b>{point.y:.0f}件</b>',
	            },
	            series: [{
	                name: 'Population',
	                data: sortTotalValue,
	                dataLabels: {
	                    enabled: true,
	                    rotation: -90,
	                    color: '#FFFFFF',
	                    align: 'right',
	                    x: 4,
	                    y: 10,
	                    style: {
	                        fontSize: '13px',
	                        fontFamily: 'Verdana, sans-serif',
	                        textShadow: '0 0 3px black'
	                    }
	                }
	            }]
	     });
		 
		 customerHighcharts.createCharts($(top.document).find('#containerE'), {
	            chart: {
	                type: 'column',
	                margin: [ 50, 50, 100, 80]
	            },
	            title: {
	                text: '投诉方式'
	            },
	            xAxis: {
	                categories: ['现场投诉','电话投诉','信件投诉','网上投诉','其他投诉'],
	                labels: {
	                    rotation: -45,
	                    align: 'right',
	                    style: {
	                        fontSize: '13px',
	                        fontFamily: 'Verdana, sans-serif'
	                    }
	                }
	            },
	            yAxis: {
	                min: 0,
	                title: {
	                    text: '数量 (件)'
	                }
	            },
	            legend: {
	                enabled: false
	            },
	            tooltip: {
	                pointFormat: '数量: <b>{point.y:.0f}件</b>',
	            },
	            series: [{
	                name: 'Population',
	                data: [siteTotal,telephoneTotal,letterTotal,onlineTotal,otherTotal],
	                dataLabels: {
	                    enabled: true,
	                    rotation: -90,
	                    color: '#FFFFFF',
	                    align: 'right',
	                    x: 4,
	                    y: 10,
	                    style: {
	                        fontSize: '13px',
	                        fontFamily: 'Verdana, sans-serif',
	                        textShadow: '0 0 3px black'
	                    }
	                }
	            }]
	     });
	});
</script>