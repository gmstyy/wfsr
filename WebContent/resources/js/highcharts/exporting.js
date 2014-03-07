﻿/*
 Highcharts JS v3.0.4 (2013-08-02)
 Exporting module

 (c) 2010-2013 Torstein Hønsi

 License: www.highcharts.com/license
 */
(function(e) {
	var y = e.Chart, v = e.addEvent, B = e.removeEvent, m = e.createElement, j = e.discardElement, t = e.css, k = e.merge, r = e.each, p = e.extend, C = Math.max, i = document, z = window, D = e.isTouchDevice, E = e.Renderer.prototype.symbols, s = e.getOptions(), w;
	p(s.lang, {
		printChart : "Print chart",
		downloadPNG : "Download PNG image",
		downloadJPEG : "Download JPEG image",
		downloadPDF : "Download PDF document",
		downloadSVG : "Download SVG vector image",
		contextButtonTitle : "Chart context menu"
	});
	s.navigation = {
		menuStyle : {
			border : "1px solid #A0A0A0",
			background : "#FFFFFF",
			padding : "5px 0"
		},
		menuItemStyle : {
			padding : "0 10px",
			background : "none",
			color : "#303030",
			fontSize : D ? "14px" : "11px"
		},
		menuItemHoverStyle : {
			background : "#4572A5",
			color : "#FFFFFF"
		},
		buttonOptions : {
			symbolFill : "#E0E0E0",
			symbolSize : 14,
			symbolStroke : "#666",
			symbolStrokeWidth : 3,
			symbolX : 12.5,
			symbolY : 10.5,
			align : "right",
			buttonSpacing : 3,
			height : 22,
			theme : {
				fill : "white",
				stroke : "none"
			},
			verticalAlign : "top",
			width : 24
		}
	};
	s.exporting = {
		type : "image/png",
		url : getContextUrl("/highcharts/export"),
		buttons : {
			contextButton : {
				symbol : "menu",
				_titleKey : "contextButtonTitle",
				menuItems : [ {
					textKey : "printChart",
					onclick : function() {
						this.print();
					}
				}, {
					separator : !0
				}, {
					textKey : "downloadPNG",
					onclick : function() {
						this.exportChart();
					}
				}, {
					textKey : "downloadJPEG",
					onclick : function() {
						this.exportChart({
							type : "image/jpeg"
						});
					}
				} ]
			}
		}
	};
	e.post = function(a, b) {
		var c, d;
		d = m("form", {
			method : "post",
			action : a,
			enctype : "multipart/form-data"
		}, {
			display : "none"
		}, i.body);
		for (c in b)
			m("input", {
				type : "hidden",
				name : c,
				value : b[c]
			}, null, d);
		d.submit();
		j(d);
	};
	p(
			y.prototype,
			{
				getSVG : function(a) {
					var b = this, c, d, x, g, f = k(b.options, a);
					if (!i.createElementNS)
						i.createElementNS = function(a, b) {
							return i.createElement(b);
						};
					a = m("div", null, {
						position : "absolute",
						top : "-9999em",
						width : b.chartWidth + "px",
						height : b.chartHeight + "px"
					}, i.body);
					d = b.renderTo.style.width;
					g = b.renderTo.style.height;
					d = f.exporting.sourceWidth || f.chart.width
							|| /px$/.test(d) && parseInt(d, 10) || 600;
					g = f.exporting.sourceHeight || f.chart.height
							|| /px$/.test(g) && parseInt(g, 10) || 400;
					p(f.chart, {
						animation : !1,
						renderTo : a,
						forExport : !0,
						width : d,
						height : g
					});
					f.exporting.enabled = !1;
					f.series = [];
					r(b.series, function(a) {
						x = k(a.options, {
							animation : !1,
							showCheckbox : !1,
							visible : a.visible
						});
						x.isInternal || f.series.push(x);
					});
					c = new e.Chart(f, b.callback);
					r(
							[ "xAxis", "yAxis" ],
							function(a) {
								r(
										b[a],
										function(b, f) {
											var d = c[a][f], e = b
													.getExtremes(), g = e.userMin, e = e.userMax;
											d
													&& (g !== void 0 || e !== void 0)
													&& d.setExtremes(g, e, !0,
															!1);
										});
							});
					d = c.container.innerHTML;
					f = null;
					c.destroy();
					j(a);
					d = d.replace(/zIndex="[^"]+"/g, "").replace(
							/isShadow="[^"]+"/g, "").replace(
							/symbolName="[^"]+"/g, "").replace(
							/jQuery[0-9]+="[^"]+"/g, "").replace(
							/url\([^#]+#/g, "url(#").replace(/<svg /,
							'<svg xmlns:xlink="http://www.w3.org/1999/xlink" ')
							.replace(/ href=/g, " xlink:href=").replace(/\n/,
									" ").replace(/<\/svg>.*?$/, "</svg>")
							.replace(/&nbsp;/g, " ").replace(/&shy;/g, "­")
							.replace(/<IMG /g, "<image ").replace(
									/height=([^" ]+)/g, 'height="$1"').replace(
									/width=([^" ]+)/g, 'width="$1"').replace(
									/hc-svg-href="([^"]+)">/g,
									'xlink:href="$1"/>').replace(
									/id=([^" >]+)/g, 'id="$1"').replace(
									/class=([^" >]+)/g, 'class="$1"').replace(
									/ transform /g, " ").replace(
									/:(path|rect)/g, "$1").replace(
									/style="([^"]+)"/g, function(a) {
										return a.toLowerCase();
									});
					return d = d.replace(/(url\(#highcharts-[0-9]+)&quot;/g,
							"$1").replace(/&quot;/g, "'");
				},
				exportChart : function(a, b) {
					var a = a || {}, c = this.options.exporting, c = this
							.getSVG(k({
								chart : {
									borderRadius : 0
								}
							}, c.chartOptions, b, {
								exporting : {
									sourceWidth : a.sourceWidth
											|| c.sourceWidth,
									sourceHeight : a.sourceHeight
											|| c.sourceHeight
								}
							})), a = k(this.options.exporting, a);
					e.post(a.url, {
						filename : a.filename || "chart",
						type : a.type,
						width : a.width || 0,
						scale : a.scale || 2,
						svg : c
					});
				},
				print : function() {
					var a = this, b = a.container, c = [], d = b.parentNode, e = i.body, g = e.childNodes;
					if (!a.isPrinting)
						a.isPrinting = !0, r(g, function(a, b) {
							if (a.nodeType === 1)
								c[b] = a.style.display,
										a.style.display = "none";
						}), e.appendChild(b), z.focus(), z.print(), setTimeout(
								function() {
									d.appendChild(b);
									r(g, function(a, b) {
										if (a.nodeType === 1)
											a.style.display = c[b];
									});
									a.isPrinting = !1;
								}, 1E3);
				},
				contextMenu : function(a, b, c, d, e, g, f) {
					var h = this, q = h.options.navigation, n = q.menuItemStyle, o = h.chartWidth, i = h.chartHeight, A = "cache-"
							+ a, l = h[A], k = C(e, g), u, j, s;
					if (!l)
								h[A] = l = m("div", {
									className : "highcharts-" + a
								}, {
									position : "absolute",
									zIndex : 1E3,
									padding : k + "px"
								}, h.container),
								u = m("div", null, p({
									MozBoxShadow : "3px 3px 10px #888",
									WebkitBoxShadow : "3px 3px 10px #888",
									boxShadow : "3px 3px 10px #888"
								}, q.menuStyle), l),
								j = function() {
									t(l, {
										display : "none"
									});
									f && f.setState(0);
									h.openMenu = !1;
								},
								v(l, "mouseleave", function() {
									s = setTimeout(j, 500);
								}),
								v(l, "mouseenter", function() {
									clearTimeout(s);
								}),
								r(
										b,
										function(a) {
											if (a) {
												var b = a.separator ? m("hr",
														null, null, u)
														: m(
																"div",
																{
																	onmouseover : function() {
																		t(
																				this,
																				q.menuItemHoverStyle);
																	},
																	onmouseout : function() {
																		t(this,
																				n);
																	},
																	onclick : function() {
																		j();
																		a.onclick
																				.apply(
																						h,
																						arguments);
																	},
																	innerHTML : a.text
																			|| h.options.lang[a.textKey]
																},
																p(
																		{
																			cursor : "pointer"
																		}, n),
																u);
												h.exportDivElements.push(b);
											}
										}), h.exportDivElements.push(u, l),
								h.exportMenuWidth = l.offsetWidth,
								h.exportMenuHeight = l.offsetHeight;
					a = {
						display : "block"
					};
					c + h.exportMenuWidth > o ? a.right = o - c - e - k + "px"
							: a.left = c - k + "px";
					d + g + h.exportMenuHeight > i
							&& f.alignOptions.verticalAlign !== "top" ? a.bottom = i
							- d - k + "px"
							: a.top = d + g - k + "px";
					t(l, a);
					h.openMenu = !0;
				},
				addButton : function(a) {
					var b = this, c = b.renderer, a = k(
							b.options.navigation.buttonOptions, a), d = a.onclick, i = a.menuItems, g, f, h = {
						stroke : a.symbolStroke,
						fill : a.symbolFill
					}, q = a.symbolSize || 12;
					if (!b.btnCount)
						b.btnCount = 0;
					b.btnCount++;
					if (!b.exportDivElements)
						b.exportDivElements = [], b.exportSVGElements = [];
					if (a.enabled !== !1) {
						var n = a.theme, o = n.states, m = o && o.hover, o = o
								&& o.select, j;
						delete n.states;
						d ? j = function() {
							d.apply(b, arguments);
						} : i
								&& (j = function() {
									b.contextMenu("contextmenu", i,
											f.translateX, f.translateY,
											f.width, f.height, f);
									f.setState(2);
								});
						a.text && a.symbol ? n.paddingLeft = e.pick(
								n.paddingLeft, 25) : a.text || p(n, {
							width : a.width,
							height : a.height,
							padding : 0
						});
						f = c.button(a.text, 0, 0, j, n, m, o).attr({
							title : b.options.lang[a._titleKey],
							"stroke-linecap" : "round"
						});
						a.symbol
								&& (g = c.symbol(a.symbol, a.symbolX - q / 2,
										a.symbolY - q / 2, q, q).attr(p(h, {
									"stroke-width" : a.symbolStrokeWidth || 1,
									zIndex : 1
								})).add(f));
						f.add().align(p(a, {
							width : f.width,
							x : e.pick(a.x, w)
						}), !0, "spacingBox");
						w += (f.width + a.buttonSpacing)
								* (a.align === "right" ? -1 : 1);
						b.exportSVGElements.push(f, g);
					}
				},
				destroyExport : function(a) {
					var a = a.target, b, c;
					for (b = 0; b < a.exportSVGElements.length; b++)
						if (c = a.exportSVGElements[b])
							c.onclick = c.ontouchstart = null,
									a.exportSVGElements[b] = c.destroy();
					for (b = 0; b < a.exportDivElements.length; b++)
								c = a.exportDivElements[b],
								B(c, "mouseleave"),
								a.exportDivElements[b] = c.onmouseout = c.onmouseover = c.ontouchstart = c.onclick = null,
								j(c);
				}
			});
	E.menu = function(a, b, c, d) {
		return [ "M", a, b + 2.5, "L", a + c, b + 2.5, "M", a, b + d / 2 + 0.5,
				"L", a + c, b + d / 2 + 0.5, "M", a, b + d - 1.5, "L", a + c,
				b + d - 1.5 ];
	};
	y.prototype.callbacks.push(function(a) {
		var b, c = a.options.exporting, d = c.buttons;
		w = 0;
		if (c.enabled !== !1) {
			for (b in d)
				a.addButton(d[b]);
			v(a, "destroy", a.destroyExport);
		}
	});
})(Highcharts);