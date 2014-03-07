<%@page contentType="text/html;charset=UTF-8"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>王府涮肉欢迎您</title>
<style type="text/css">

.menu {
	position:relative;
	top: 15px;
	left:300px;
}
.menu li {
	background-image:url(nav_abg.png);
	#background: url(nav_abg.png) no-repeat scroll right center transparent;
	float:left;
	list-style: none outside none;
	width: 83px;
	display: inline-block;
    font-size: 14px;
    height: 27px;
    line-height: 27px;
    text-align: center;
    width: 83px;
	margin-left:50px;
}
.logo {
	position: absolute;
   # float: left;
    height: 70px;
   # padding-left: 8px;
   # padding-top: 3px;
    width: 202px;
	background-image:url(logo.jpg)
}
.best{

	top:376px;
	left: 437px;
	background-image:url(show_bg.png);
	width:341px;
	height:314px;

}
.info{
	top:378px;
	left: 94px;
	background-image:url(shengdan_ad.png);
	width:278px;
	height:286px;
}
.move_up{
	position:absolute;
	z-index:100;
}
.content{
	background-image:url(bodypic7.jpg);
	height:80%;
	width:100%;
	position:absolute;
	#left: 13px;
	top: 94px;
}
.footer{
	position:fixed;
	top:92%;
	width: 100%;
	z-index:101;
	background-color:#FF0;
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script> 
</head>

<body>
<div class="logo"></div>
<ul class="menu"><li>首页</li>
<li>菜品</li>
<li>关于我们</li>
<li>诚聘英才</li></ul>
<div class="content"></div>
<div class="best move_up"></div>
<div class="info move_up"></div>
<div class="footer" align="center"><p>© 2012 版权所有 王府涮肉</p></div>
<script type="text/javascript">
	$(".move_up").mouseover(function(){
		$(this).css("top","200px");
	});
	$(".move_up").mouseout(function(){
		$(this).css("top","376px");
	});
</script>
</body>
</html>
