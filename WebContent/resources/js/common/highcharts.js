var basicPie = {
	chart: {
		plotBackgroundColor: null,
		plotBorderWidth: null,
		plotShadow: false
	},
	title: {
		text: ''
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
		data: []
	}]
};

var rotatedColumn = {
	chart: {
		type: 'column',
		margin: [ 50, 50, 100, 80]
	},
	title: {
		text: ''
	},
	xAxis: {
		categories: null,
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
			text: ''
		}
	},
	legend: {
		enabled: false
	},
	tooltip: {
		pointFormat: '数量: <b>{point.y:.0f}个</b>'
	},
	series: [{
		name: 'Population',
		data: null,
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
};

var basicColumn = {
	chart: {
		type: 'column'
	},
	title: {
		text: ''
	},
	subtitle: {
		text: ''
	},
	xAxis: {
		categories: null
	},
	yAxis: {
		min: 0,
		title: {
			text: 'Rainfall (mm)'
		}
	},
	tooltip: {
		headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			'<td style="padding:0"><b>{point.y:.1f} #unit#</b></td></tr>',
		footerFormat: '</table>',
		shared: true,
		useHTML: true
	},
	plotOptions: {
		column: {
			pointPadding: 0.2,
			borderWidth: 0
		}
	},
	series: {}
};

function CustomerHighcharts(type) {
	this.chartType = type;
	switch (type) {
		case "basicColumn" :
			this.template = clone(basicColumn);
			break;
	}
}

CustomerHighcharts.prototype = {

	template : null,
	chartType : null,

	drilldownLevels : [],

	createCharts: function(container, args) {
		args.credits = { enabled : false };
		$(container).highcharts(args);
	},

	/**
	 * 创建图表
	 * @param container
	 * @param args:
	 * @title 标题
	 * @colNames 柱状图名称（数组）
	 * @colValues 柱状图值 （map）
	 * @colYaxisTitle 柱状图Y轴名称
	 * @colUnit 柱状图单位 （比如：个数|个）
	 * @pieSeriesName 饼状图数值名称
	 */
	createChart: function(container, args) {
		var title = isNull(args) || isNull(args.title) ? null : args.title;
		var subtitle = isNull(args) || isNull(args.subtitle) ? null : args.subtitle;
		var colNames = isNull(args) || isNull(args.colNames) ? null : args.colNames;
		var colValues = isNull(args) || isNull(args.colValues) ? null : args.colValues;
		var colYaxisTitle = isNull(args) || isNull(args.colYaxisTitle) ? null : args.colYaxisTitle;
		var colUnit = isNull(args) || isNull(args.colUnit) ? null : args.colUnit;
		var pieSeriesName = isNull(args) || isNull(args.pieSeriesName) ? null : args.pieSeriesName;
		var pieSeriesData = isNull(args) || isNull(args.pieSeriesData) ? null : args.pieSeriesData;
		var drilldown = isNull(args) || isNull(args.drilldown) ? false : args.drilldown;
		var drilldownArg = isNull(args) || isNull(args.drilldownArg) ? null : args.drilldownArg;
		if (isNull(args)) {
			top.Dialog.alert("请输入参数");
			return;
		}
		var template = this.template;
		var chartType = this.chartType;
		if (isNull(chartType)) {
			top.Dialog.alert("请输图表类型");
			return;
		}
		switch(chartType) {
			case "basicColumn" :
				if (colYaxisTitle != null) {
					template.yAxis.title.text = colYaxisTitle;
				}
				if (colUnit != null) {
					var unit = colUnit.split('|')[1];
					var pointFormat = template.tooltip.pointFormat;
					template.tooltip.pointFormat = pointFormat.replace("#unit#", unit);
				}
				if (colNames != null && colValues != null) {
					template.xAxis.categories = colNames;
					template.series = this.getColValues(colValues, colNames, drilldown);
				}
				var c_chart = this;
				if (drilldown && drilldownArg != null) {
					template.chart.events = {
						drilldown : function(e) {
							if (!e.seriesOptions) {
								var helper = new dataHelper(null);
								var chart = this;
								helper.postForm(drilldownArg.url, 0, {
									formId : drilldownArg.formId,
									processData : function(prms) {
										return drilldownArg.processData(prms, e.point.name, e.point.series.name);
									}
								}, function(response) {
									var categories = JSON.parse(response.colNames);
									var colVal = JSON.parse(response.colValues);
									var name = e.point.series.name;
									var drilldowns = {};
									drilldowns[name] = {
										name : name,
										data : colVal[name]
									};
									var ddSeries = drilldowns[e.point.series.name];
									c_chart.pushDrilldownLevel(chart);
									c_chart.setChart(chart, categories, [ddSeries]);
									c_chart.showDrillUpButton(chart);
								});
							}
						}
					};
				}
				break;
		}
		if (title != null) {
			template.title.text = title;
		}
		if (subtitle != null) {
			template.subtitle.text = subtitle;
		}
		template.credits = { enabled : false };
		$('#' + container).highcharts(template);
	},

	setChart : function(chart, categories, series) {
		chart.counters.color=0;
		chart.xAxis[0].setCategories(categories);
		while (chart.series.length > 0) {
			chart.series[0].remove(true);
		}
		for (var i = 0; i < series.length; i++) {
			chart.addSeries(series[i]);
		}
	},

	pushDrilldownLevel : function(chart) {
		var chartSeries = chart.series;
		var series = [];
		for (var i = 0; i < chartSeries.length; i++) {
			var data = [];
			for (var j = 0; j < chartSeries[i].data.length; j++) {
				var dat = chartSeries[i].data[j];
				data.push({
					name: dat.name,
					y: dat.y,
					drilldown: dat.drilldown
				});
			}
			series.push({
				name: chartSeries[i].name,
				data: data
			});
		}
		var level = {
			categories: chartSeries[0].xAxis.names,
			series: series
		};
		this.drilldownLevels.push(level);
	},

	showDrillUpButton : function(chart) {
		var backText = '<返回',
			buttonOptions = chart.options.drilldown.drillUpButton,
			attr,
			states,
			drilldownLevels = this.drilldownLevels;

		if (!chart.drillUpButton) {
			attr = buttonOptions.theme;
			states = attr && attr.states;

			var c_chart = this;
			chart.drillUpButton = chart.renderer.button(
				backText,
				null,
				null,
				function () {
					var level = drilldownLevels.pop();
					c_chart.setChart(chart, level.categories, level.series);
					if (drilldownLevels.length === 0) {
						chart.drillUpButton = chart.drillUpButton.destroy();
					}
				},
				attr,
				states && states.hover,
				states && states.select
			)
				.attr({
					align: buttonOptions.position.align,
					zIndex: 9
				})
				.add()
				.align(buttonOptions.position, false, buttonOptions.relativeTo || 'plotBox');
		} else {
			chart.drillUpButton.attr({
				text: backText
			})
				.align();
		}
	},

	getColNames : function (config) {
		var colNames = new Array();
		for (var i = 1; i <= 10; i++) {
			var name = eval("config.num" + i + "Def");
			if (isNull(name)) {
				break;
			} else {
				name = name.split("|")[1];
				colNames.push(name);
			}
		}
		return colNames;
	},

	getColValues : function (data, colNames, drilldown) {
		var series = [];
		if (drilldown) {
			for (var name in data) {
				var dat = [];
				for (var i = 0; i < colNames.length; i++) {
					dat.push({
						name : colNames[i],
						y : data[name][i],
						drilldown : true
					});
				}
				series.push({
					name : name,
					data : dat
				});
			}
		} else {
			for (var name in data) {
				series.push({
					name: name,
					data: data[name]
				});
			}
		}
		return series;
	}

};