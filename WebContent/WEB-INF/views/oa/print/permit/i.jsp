<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<!--  
	name
	reason
	cause
	idNo
-->

<div style="width:80%;height:100%;">
	<p style='text-align:left;'>
		<span style='font-size:12.0pt;font-family:隶书;'>卫生行政许可文书</span>
	</p>
	
	<p style='text-align:center;'>
		<b><span style='font-size:16.0pt;font-family:宋体'>行政许可证件撤销决定书</span></b>
	</p>
	
	<p style='text-align:right;'>
		<span style='font-size:12.0pt;font-family:宋体'>卫 &nbsp;&nbsp;&nbsp;字[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]第&nbsp;&nbsp;&nbsp;号</span>
	</p>
	
	<p style='text-align:left;'>
		<u><span  style='font-size:14.0pt;font-family:仿宋'>${app.applicant}</span></u>
		<span style='font-size:14.0pt;font-family:仿宋'>:</span>
	</p>
	
	<p style='text-indent:28.0pt;text-align:left;'>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>由于 </span>
		<u><span style='font-size:14.0pt;font-family:仿宋'>${reason}</span></u>
	</p>
	
	<p style='text-align:left;'>
		<span style='font-size:14.0pt;font-family:仿宋'>1、行政机关工作人员滥用职权、玩忽职守作出准予行政许可决定</span>
	</p>
	<p style='text-align:left;'>
		<span style='font-size:14.0pt;font-family:仿宋'>2、行政机关超越法定职权作出准予行政许可决定</span>
	</p>
	<p style='text-align:left;'>		
		<span style='font-size:14.0pt;font-family:仿宋'>3、行政机关违反法定程序作出准予行政许可决定</span>
	</p>
	<p style='text-align:left;'>		
		<span style='font-size:14.0pt;font-family:仿宋'>4、行政机关对不具备申请资格或者不符合法定条件的申请人准予行政许可决定</span>
	</p>
	<p style='text-align:left;'>		
		<span style='font-size:14.0pt;font-family:仿宋'>5、你（单位）以欺骗、贿赂等不正当手段取得行政许可</span>
	</p>
	<p style='text-align:left;'>		
		<span style='font-size:14.0pt;font-family:仿宋'>6、其它原因（注明）: </span>
		<u><span style='font-size:14.0pt;font-family:仿宋'>${cause}</span></u>
	</p>
	
	<p><span>&nbsp;</span></p>
	
	<p style='text-indent:28.0pt;text-align:left;'>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>根据《中华人民共和国行政许可法》第六十九条的规定，现对</span>
		<u><span style='font-size:14.0pt;font-family:仿宋'>${app.licenseNo}</span></u>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>许可证件\证号予以撤销。</span>
	</p>
	
	<p style='text-indent:28.0pt;text-align:left;'>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>如不服本决定的，可自收到本决定书之日起60日内申请行政复议，或在三个月内向人民法院提起行政诉讼。</span>
	</p>	
	
	<p style='text-align:right;text-indent:276.0pt;'>
		<span style='font-size:12.0pt;font-family:宋体'>卫生行政机关（盖章）</span>
	</p>
	
	<p style='text-align:right;'>
		<span style='font-size:12.0pt;'><fmt:formatDate value="${date}" pattern="yyyy年MM月dd日"/></span>
	</p>
	
	<p style='margin-top:2pt'>
		<span style='position:absolute;margin-left:-1px;width:80%;height:2px;'><img width=100% height=2 src="${pageContext.request.contextPath}/images/image001.png"></span>
	</p>
	
	<p style='margin-top:4pt;text-align:left;'>
		<span style='font-size:12.0pt;font-family:宋体'>第一联存档，第二联交申请人</span>
		<span style='font-size:12.0pt;font-family:宋体;float:right;display:inline-block;'>中华人民共和国卫生部制</span>		
	</p>
</div>
