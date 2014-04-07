<%@page contentType="text/html;charset=UTF-8"%>
<head>
<%@ include file="header.jsp"%>

<div class="content"></div>
<div class="best move_up"></div>
<div class="info move_up"></div>
<div class="footer" align="center">
	<p>© 2012 版权所有 王府涮肉</p>
</div>
<script type="text/javascript">
	$(".move_up").mouseover(function() {
		$(this).css("top", "200px");
	});
	$(".move_up").mouseout(function() {
		$(this).css("top", "376px");
	});
</script>
</html>
