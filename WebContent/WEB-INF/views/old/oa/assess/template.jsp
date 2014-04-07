<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
 <c:if test="${not empty list}">
<div style="margin:10px 10px 0 0;width: auto;height:auto;border:solid 1px grey;background-color:#FFF; ">
	<c:forEach items="${list}" var="items" varStatus="status">
		       
		  <input style="border:none;margin:0 0 0 10px;" type="text" name="templateName" class="templateName" value="${items.name}" maxlength="11" readonly/><a title="快捷引用" style="line-height: 20px;" class="button_report" href="javascript:void(0);" onclick="useName(this)"></a><br>
							
  </c:forEach>
 
</div>
 </c:if> 
  <c:if test="${empty list}">
<div style="margin:10px 10px 0 0;width: 200px;height:40px;border:solid 1px grey;background-color:#FFF; ">
 尚无考核模板
</div>
 </c:if> 
 
<script type="text/javascript">

/* $(document).ready(function(){
$('.button_report').click(function () {
	alert();
	//$('#name').val("");
	$('#name').val($(this).prev().val());
	}); 

}); */

var useName = function(obj) {
	$('#name').val($(obj).prev().val());
};
</script>
  