if (typeof (TREE_OBJECT_CACHE) == "undefined") {
	TREE_OBJECT_CACHE = [];
}
function tree() {
	this.objIndex = TREE_OBJECT_CACHE.length;
	TREE_OBJECT_CACHE.push(this);
}

tree.prototype = {

	objIndex : -1,
	
	data : null,
	
	containerId : null,
	
	selectedNode : null,
	
	callback : null,
	
	buildJQueryTree : function(data, containerId, args) {
		if (typeof(data) != "undefined") {
			this.data = data;
		} else {
			return;
		}
		if (typeof(containerId) != "undefined") {
			this.containerId = containerId;
		} else {
			return;
		}
		if (typeof(args) != "undefined") {
			if (typeof(args.callback) == "function") {
				this.callback = args.callback;
			}
			this.folderSearchable = (args.folderSearchable == true);
		}
		$("#" + containerId).html("<ul class='filetree'>" + this.buildJQueryTreeNodes(data) + "</ul>").treeview();
	},

	buildJQueryTreeNodes : function(data) {
		var html = "";
		var treeObj = this;
		$(data).each(function(index, item) {
			var isFolder = typeof(item.children) != "undefined" && item.children.length > 0; 
			html += "<li>" + treeObj.buildJQueryTreeHtml(item, isFolder);
			if (isFolder) {
				html += ("<ul>" + treeObj.buildJQueryTreeNodes(item.children) + "</ul>");
			}
			html += "</li>";
		});
		return html;
	},

	buildJQueryTreeHtml : function(data, isFolder) {
		var html = "";
		if (isFolder) {
			if (this.folderSearchable) {
				html = "<span class=\"folder\" onclick='TREE_OBJECT_CACHE[" + this.objIndex + "].jqueryNodeClick(this, " + data.id + ", \"" + data.name + "\");'>" + data.name + "</span>";				
			} else {
				html = "<span class=\"folder\">" + data.name + "</span>";
			}
		} else {
			html= "<span class=\"file\" onclick='TREE_OBJECT_CACHE[" + this.objIndex + "].jqueryNodeClick(this, " + data.id + ", \"" + data.name + "\");'>" + data.name + "</span>";
		}
		return html;
	},
	
	jqueryNodeClick : function(obj, code, name) {
		this.selectedNode = {
			control : obj,
			code : code,
			name : name
		};
		if (typeof(this.callback) == "function") {
			this.callback(code, name);
		}
	}
	
};