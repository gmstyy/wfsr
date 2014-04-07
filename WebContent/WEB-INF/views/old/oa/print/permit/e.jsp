<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<!--  
	applicant
	permitType
	thought
	workDays
-->

<div style="width:80%;height:100%;">
	<p style='text-align:left;'>
		<span style='font-size:12.0pt;font-family:隶书;'>卫生行政许可文书</span>
	</p>
	
	<p style='text-align:center;'>
		<b><span style='font-size:16.0pt;font-family:宋体'>行政许可技术审查延期通知书</span></b>
	</p>
	
	<p style='text-align:right;'>
		<span style='font-size:12.0pt;font-family:宋体'>卫 &nbsp;&nbsp;&nbsp;字[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]第&nbsp;&nbsp;&nbsp;号</span>
	</p>
	
	<p style='text-align:left;'>
		<u><span  style='font-size:14.0pt;font-family:仿宋'>${app.applicant}</span></u>
		<span style='font-size:14.0pt;font-family:仿宋'>:</span>
	</p>
	
	<p style='text-indent:28.0pt;text-align:left;'>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>你（单位）提出的关于</span>
		<u><span style='font-size:14.0pt;font-family:仿宋'><hs:v dicName='LICENSE_TYPE' code='${app.licenseType}'/></span></u>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>行政许可申请，经技术审查，认为:</span>
	</p>
	
	<p style='text-indent:28.0pt;text-align:left;'>
		<span style='font-size:14.0pt;font-family:仿宋'>${thought}</span>
	</p>
	
	<p style='text-indent:28.0pt;text-align:left;'>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>请按以上意见补充材料，自补充材料全部提交之日起，</span>
		<u><span style='font-size:14.0pt;font-family:仿宋'>${procedure}</span></u>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>（1、招标；2、拍卖；3、检验；4、检测；5、检疫；6、鉴定；7、专家评审）期限</span>
		<u><span style='font-size:14.0pt;font-family:仿宋'>15</span></u>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>个工作日。</span>
	</p>
	
	<p style='text-indent:28.0pt;text-align:left;'>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>特此通知。</span>
	</p>

	<p><span>&nbsp;</span></p>	
	
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
