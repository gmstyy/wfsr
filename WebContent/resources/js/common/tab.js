var tabs = {
	
	cssNames : {
		tabGroup : "tab_group",
		tabItem : "tab_item",
		focusItem : "focus_tab"
	},
	
	prefix : "tabs-",
	
	createTabs : function(containerId) {
		var container = $("#" + containerId);
		var firstTab = null, firstContentId = null, defaultHandler = null, clickHandler = null;
		
		container.addClass(tabs.cssNames.tabGroup);
		container.find("li").each(function(index, obj) {
			if (typeof($(this).attr("class")) == "undefined" || $(this).attr("class").indexOf(tabs.prefix) == -1) {
				return;
			}
			clickHandler = "tabs.switchTab(this, \"" + containerId + "\", \"" + $(obj).attr("class") + "\");";
			defaultHandler = $(obj).attr("onclick");
			if (!isNull(defaultHandler)) {
				clickHandler += defaultHandler;
			}
			$(obj).attr("onclick", clickHandler);
			if (index == 0) {
				firstTab = obj;
				firstContentId = $(obj).attr("class");
			}
			$(this).addClass(tabs.cssNames.tabItem);
		});
		tabs.switchTab(firstTab, containerId, firstContentId);
	},
	
	switchTab : function(item, containerId, contentId) {
		var container = $("#" + containerId);
		var tabItems = container.find("li");
		tabItems.removeClass(tabs.cssNames.focusItem);
		$(item).addClass(tabs.cssNames.focusItem);
		$("#" + containerId).find("div").each(function() {
			if (typeof(this.id) != "unedfined" && this.id.indexOf(tabs.prefix) > -1) {
				$(this).hide();
			}
		});
		$("#" + contentId).show();
	}
	
};