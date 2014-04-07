<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="categoryOperation" value="${categoryOperation}"/>
<c:forEach var="node" items="${tree}">
	<li>
		<div id="Folder${node.id}" class="folder"><c:if test="${not empty node.children}"><span onclick="expand(this)" style="cursor: pointer;">＋</span></c:if><c:if test="${empty node.children}">&nbsp;&nbsp;</c:if></div>
		<c:if test="${categoryOperation eq 'search'}"><input type="checkbox"/></c:if><span onclick="${categoryOperation eq 'edit' ? 'choose(this)' : ''}" style="${categoryOperation eq 'edit' ? 'cursor:pointer':''}">${node.name}</span>
		<c:if test="${not empty node.children}">
			<ul id="expandCollapseFolder${node.id}" style="display: none">
				<c:set var="tree" value="${node.children}" scope="request"/>
				<jsp:include page="categoryTree.jsp"/>
			</ul>
		</c:if>
	</li>
</c:forEach>
<script type="text/javascript">
	var expand = function(obj) {
		var folder = $(obj).parent("div");
		var id = $(folder).attr("id");
		if ($(obj).html() == "＋") {
			$(obj).html("－");
			$(folder).parent("li").find("#expandCollapse" + id).show();
		} else if ($(obj).html() == "－") {
			$(obj).html("＋");
			$(folder).parent("li").find("#expandCollapse" + id).hide();
		}
	};
	var choose = function(obj) {
		var folder = $(obj).prev(".folder");
		var id = $(folder).attr("id").replace("Folder", "");
		$("#editCategoryId").val(id);
		$("#categoryChosen").html($(obj).html());
		$("#chooseCategory").hide();
	}
</script>