<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>

<div id="list_container">
	<table class="repeattable">
		<caption>
			<a class="button_add" href="javascript:void(0);" onclick="createCollegial('${caseId}');">新建合议</a>			
		</caption>	
		<colgroup>
			<col style="width: 40px;">
			<col style="width: 100px;">
			<col style="width: 150px;">
			<col>
			<col style="width: 60px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th>编号</th>
				<th>主持人</th>
				<th>合议时间</th>	
				<th>合议建议</th>
				<th>操作</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="cc" varStatus="status">
		<tr class='<c:choose><c:when test="${status.count % 2 == 0}">row_odd</c:when><c:otherwise>row_even</c:otherwise></c:choose>'>
			<td style="text-align: center;">${status.count}</td>
			<td>${cc.usersName1}</td>
			<td><fmt:formatDate value="${cc.collegialTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${cc.collegialAdvice}</td>
			<td style="text-align: center;">
	 			<div class="option_container">
	 				<a href="javascript:void(0);" title="查看" class="option_view" onclick="viewCollegial('${cc.id}');"></a>	
				</div>
			</td>	
		</tr>
		</c:forEach>
	</table>
</div>
<script type="text/javascript">
var collhelper = new dataHelper();

var createCollegial = function(id) {
	collhelper.basicPost('/case/collegial/create', {id:id}, 2, {		
		containerId : 'workflowViewDetailContainer',		
		containerTitle : '合议记录',
		defaultButtons: {
			okEnabled : false,
		},
		buttons: {
			'保存' : function() {saveCollegial(id);}
		}
	});
};

var saveCollegial = function(id) {
	var form = collhelper.getFormData("caseCollgialDetailFormId");
	collhelper.basicPost("/case/collegial/save", form, 3, { validate : true, editFormId : "caseCollgialDetailFormId" }, function(response) {		
		Dialog.alert('合议记录保存成功', function() {
			Dialog.close();
			Dialog.close('workflowListContainer');
			collegial(id);
		});		
	});
};

var viewCollegial = function(id) {
	collhelper.basicPost('/case/collegial/view', {id:id}, 2, {
		containerId : 'workflowViewDetailContainer',		
		containerTitle : '查看',
		defaultButtons: {
			okEnabled : false
		}
	});
};
</script>
