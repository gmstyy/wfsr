var orgTree = {
	
	helper : new dataHelper(),
	
	url : {
		all : "/dictionary/getEmployeeTree",
		organization : "/dictionary/getOrgList",
		dapartment : "/dictionary/getDeptList",
		employee : "/dictionary/getEmployeeList"
	},
	
	prefix : {
		org : "org_",
		dept : "dept_",
		employee : "employee_"
	},
	
	createTree : function(containerId, defaultOrgId, dynamic, initFun) {
		var args = null;
		if (typeof(defaultOrgId) != "undefined" && defaultOrgId != "0") {
			args = { orgId : parseFloat(defaultOrgId) };
		}
		if (typeof(dynamic) != "undefined" && dynamic == "false") {
			helper.basicPost(orgTree.url.all, args, 1, null, function(response) {
				orgTree.buildStaticOrgList(containerId, response);
				if (typeof(initFun) == "function") {
					initFun();
				}
			});
		} else {
			helper.basicPost(orgTree.url.organization, args, 1, null, function(response) {
				orgTree.buildOrgList(containerId, response);
				if (typeof(initFun) == "function") {
					initFun();
				}
			});
		}
	},
	
	buildStaticOrgList : function(containerId, response) {
		var org = response.org;
		var deptList = response.departmentList;
		var employeeList = response.employeeList;
		// build organization node start
		var html = "<ul class='filetree'><li><span class=\"folder\" ></span><input type=\"checkbox\" onclick=\"orgTree.nodeChecked(this, 1);\" value=\"" + orgTree.prefix.org + org.id + "\" /><span>" + org.name + "</span>";
		html += "<ul>";
		$(deptList).each(function(deptIndex, dept) {
			// build department nodes start
			html += "<li><span class=\"folder\" ></span><input type=\"checkbox\" onclick=\"orgTree.nodeChecked(this, 2);\" value=\"" + orgTree.prefix.dept + dept.id + "\" /><span>" + dept.name + "</span>";
			// build employee nodes start
			html += "<ul>";
			$(employeeList).each(function(employeeIndex, employee) {
				if (employee.departmentId != dept.name) {
					return;
				}
				html += "<li><span class=\"file\"></span><input type=\"checkbox\" onclick=\"orgTree.nodeChecked(this, 3);\" value=\"" + orgTree.prefix.employee + employee.loginName + "\" /><span>" + employee.name + "</span></li>";
			});
			html += "</ul>";
			// build employee nodes end
			html += "</li>";
		});
		html += "</ul>";
		// build department nodes end
		html += "</li></ul>";
		// build organization node end
		$("#" + containerId).html(html);
		$("#" + containerId).treeview();
	},
	
	buildOrgList : function(containerId, response) {
		var html = "<ul class='filetree'>";
		$(response.orgList).each(function(index, item) {
			html += "<li class=\"expandable\"><span class=\"folder\" onclick=\"orgTree.nodeClick(this, 1, " + item.id + ");\"></span><input type=\"checkbox\" onclick=\"orgTree.nodeChecked(this, 1);\" value=\"" + orgTree.prefix.org + item.id + "\" /><span>" + item.name + "</span></li>";
		});
		html += "</ul>";
		$("#" + containerId).html(html);
		$("#" + containerId).treeview();
	},

	buildDepartmentList : function(data, obj) {
		var checkedHtml = $(obj).siblings("input").get(0).checked ? " checked=\"checked\"" : "";
		var html = "<ul>";
		$(data).each(function(index, item) {
			html += "<li class=\"expandable\"><span class=\"folder\" onclick=\"orgTree.nodeClick(this, 2, " + item.id + ");\"></span><input type=\"checkbox\" " + checkedHtml + " onclick=\"orgTree.nodeChecked(this, 2);\" value=\"" + orgTree.prefix.dept + item.id + "\" /><span>" + item.name + "</span></li>";
		});
		html  += "</ul>";
		return html;
	},

	buildEmployeeList : function(data, obj) {
		var checkedHtml = $(obj).siblings("input").get(0).checked ? " checked=\"checked\"" : "";
		var html = "<ul>";
		$(data).each(function(index, item) {
			html += "<li><span class=\"file\"></span><input type=\"checkbox\" " + checkedHtml + "onclick=\"orgTree.nodeChecked(this, 3);\" value=\"" + orgTree.prefix.employee + item.loginName + "\" /><span>" + item.name + "</span></li>";
		});
		html  += "</ul>";
		return html;
	},
	
	nodeClick : function(obj, level, searchKey) {
		if ($(obj).parent().hasClass("expandable")) {
			var children = $(obj).parent().find("ul");
			if (children.length > 0) {
				// show children if exists
				children.show();
			} else {
				// get children if not exists
				switch (level) {
				case 1:
					helper.basicPost(orgTree.url.dapartment, { orgId : searchKey }, 1, null, function(response) {
						$(obj).parent().append(orgTree.buildDepartmentList(response.departmentList, obj)).treeview();
					});
					break;
				case 2:
					helper.basicPost(orgTree.url.employee, { deptId : searchKey }, 1, null, function(response) {
						$(obj).parent().append(orgTree.buildEmployeeList(response.employeeList, obj)).treeview();
					});
					break;
				}
			}
			// click to open
			$(obj).parent().removeClass("expandable");
		} else {
			// hide children
			$(obj).parent().find("ul").hide();
			// click to close
			$(obj).parent().addClass("expandable");
		}
	},
	
	nodeChecked : function(obj, level) {
		switch (level) {
		case 1:
			// format children
			$(obj).parent().find("input[type='checkbox']").each(function(index, item) {
				if (item.value == obj.value) {
					return;
				}
				item.checked = obj.checked;
			});
			break;
		case 2:
			// format children
			$(obj).parent().find("input[type='checkbox']").each(function(index, item) {
				if (item.value == obj.value) {
					return;
				}
				item.checked = obj.checked;
			});
			// format parent
			var parent = $(obj).parent().parent();
			var parentCheckbox = parent.siblings("input");
			var brothers = parent.children().children("input");
			var parentChecked = true;
			brothers.each(function(index, item) {
				if (!item.checked) {
					parentChecked = false;
				}
			});
			parentCheckbox.get(0).checked = parentChecked;
			break;
		case 3:
			// format parent
			var parent = $(obj).parent().parent();
			var parentCheckbox = parent.siblings("input");
			var brothers = parent.children().children("input");
			var parentChecked = true;
			brothers.each(function(index, item) {
				if (!item.checked) {
					parentChecked = false;
				}
			});
			parentCheckbox.get(0).checked = parentChecked;
			// format grand parent
			parent = parent.parent().parent();
			var parentCheckbox = parent.siblings("input");
			var brothers = parent.children().children("input");
			var parentChecked = true;
			brothers.each(function(index, item) {
				if (!item.checked) {
					parentChecked = false;
				}
			});
			parentCheckbox.get(0).checked = parentChecked;
			break;
		}
	},
	
	getSelectedValues : function(containerId) {
		var orgIds = [], deptIds = [], loginNames = [];
		$("#" + containerId).find("input[type='checkbox']").each(function(index, item) {
			if (item.value.indexOf("undefined") > -1) {
				return;
			}
			if (item.checked) {
				if (item.value.indexOf(orgTree.prefix.org) > -1) {
					orgIds.push(item.value.replace(orgTree.prefix.org, ""));
				}
				if (item.value.indexOf(orgTree.prefix.dept) > -1) {
					deptIds.push(item.value.replace(orgTree.prefix.dept, ""));
				}
				if (item.value.indexOf(orgTree.prefix.employee) > -1) {
					loginNames.push(item.value.replace(orgTree.prefix.employee, ""));
				}
			}
		});
		return loginNames.join(",");
	},
	
	getSelectedNames : function(containerId) {
		var names = [];
		$("#" + containerId).find("input[type='checkbox']").each(function(index, item) {
			if (item.checked && item.value.indexOf("undefined") == -1 && item.value.indexOf(orgTree.prefix.employee) > -1) {
				names.push($(item).next().html());
			}
		});
		return names.join(";");
	}

};