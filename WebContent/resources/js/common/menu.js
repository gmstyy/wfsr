var menu = {
	
		menuItems : {},
		
		menuContainer : $("#leftMenuContainer"),
		
		menuRequestUrl : ctx + '/login/leftMenu',
		
		show : function() {
			$(".menu_container").show();
			var contentWidth = $(".top_middle").width() - $(".menu_container").width() - $(".spliter_container").width();
			$(".spliter").css("backgroundImage", $(".spliter").css("backgroundImage").replace("show", "hide"));
			$(".spliter").parent().css("marginLeft", 0);
			$(".page_container").width(contentWidth);
			resetContentSize();
		},
		
		hide : function() {
			$(".menu_container").hide();
			var contentWidth = $(".top_middle").width() - $(".spliter_container").width();
			$(".spliter").css("backgroundImage", $(".spliter").css("backgroundImage").replace("hide", "show"));
			$(".spliter").parent().css("marginLeft", -6);
			$(".page_container").width(contentWidth);
			resetContentSize();
		},
		
		loadLeftMenu : function(selectedTopMenu, menuId) {
			if (!isNull(menu.menuItems[menuId])&&menu.menuItems[menuId]!= "") {
				$(menu.menuContainer).html(menu.menuItems[menuId]);
				// refresh left menu container
				resetContentSize();
			} else {
				AjaxHelper.get(
						menu.menuRequestUrl,
						{ headerId : menuId },
						function(response){
							var menuHtml = "";
							if (response != null && response.leftMenus != null) {
								var groups = [];
								var items = {};
								var parentId;
								var currentItems;
								$(response.leftMenus).each(function(index, menu){
									if (menu.menuLevel == 2) {
										groups.push(menu);
									} else if (menu.menuLevel == 3) {
										parentId = menu.parentId;
										if (typeof(items[parentId]) == "undefined") {
											items[parentId] = [];
										}
										items[parentId].push(menu);
									}
								});
								$(groups).each(function(index, menu){
									var groupClassName = (index == 0) ? "menu_sub_group_focus" : "menu_sub_group";
									var itemsClassName = (index == 0) ? "menu_items_focus" : "menu_items";
									menuHtml += "<div class='" + groupClassName + "' id='menuSubGroup_" + menu.id + "' onclick='menu.subGroupClick(this, " + menu.id + ");'>" + menu.name + "</div>";
									menuHtml += "<div class='" + itemsClassName + "' id='menuItems_" + menu.id + "'>";
									
									currentItems = items[menu.id];
									$(currentItems).each(function(index1, item){
										menuHtml += "<div class='menu_item'><a href='javascript:void(0);' onclick='menu.loadContent(\"" + (typeof(item.url) == "undefined" ? "" : item.url) + "\", \"" + item.name + "\", " + item.useIframe + ");'><img alt='" + item.name + "' src='" + ctx + "/images/menus/" + item.imagePath + "' /><br/><span>" + item.name + "</span></a></div>";
									});
									menuHtml += "</div>";
								});	
							}
							menu.menuItems[menuId] = menuHtml;
							$(menu.menuContainer).html(menuHtml);
							// refresh left menu container
							resetContentSize();
						}
					);
			}
			$(selectedTopMenu).parent().parent().siblings().removeClass("focus_item");
			$(selectedTopMenu).parent().parent().addClass("focus_item");
			
			// display left menu
			menu.show();
		},
		
		subGroupClick : function(groupItem, groupId) {
			if ($(groupItem).hasClass("menu_sub_group_focus")) {
				return;
			}
			// reset focused group
			$(".menu_sub_group_focus").removeClass("menu_sub_group_focus").addClass("menu_sub_group");
			$(".menu_items_focus").removeClass("menu_items_focus").addClass("menu_items");
			// set focus to current group
			$(groupItem).removeClass("menu_sub_group").addClass("menu_sub_group_focus");
			$("#menuItems_" + groupId).removeClass("menu_items").addClass("menu_items_focus");
			// refresh left menu container
			resetContentSize();
		},
		
		refreshContainer : function() {
			if ($(".menu_sub_group_focus").length == 0) {
				return;
			}
			var groupCount = $(".menu_sub_group").length + 1;
			var containerHeight = $(menu.menuContainer).height();
			var focusHeight = containerHeight - 28 * groupCount;
			if (focusHeight < 0) {
				focusHeight = 0;
			}
			$(".menu_items_focus").height(focusHeight);
		},
		
		loadContent : function(url, name, useIframe) {
			//移除集成页面绑定的click函数
			$(document).unbind("click");
			
			if (!isEmpty(name)) {
				$("#current_page").html(name);
			}
			$('#page_container').html("");
			$('#page_iframe').attr("src", "");
			
			if (url == null || url == "null" || url == "") {
				return;
			}
			if (useIframe == 1) {
				$('#page_iframe').attr("src", getContextUrl(url));
				$('#page_iframe').show();
				$('#page_container').hide();
			} else {
				AjaxHelper.load($('#page_container'), getContextUrl(url));
				$('#page_container').show();
				$('#page_iframe').hide();
			}
		}
		
};