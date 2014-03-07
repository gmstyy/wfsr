<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<!--  
	no
	name
	permitType
	material
	count
-->

<div style="width:80%;height:100%;">
	<p style='text-align:left;'>
		<span style='font-size:12.0pt;font-family:隶书;'>卫生行政许可文书</span>
	</p>
	
	<p style='text-align:center;'>
		<b><span style='font-size:16.0pt;font-family:宋体'>行政许可申请材料接收凭证</span></b>
	</p>
	
	<p style='text-align:right;'>
		<span style='font-size:12.0pt;font-family:宋体'>编号:<span id="documentNo">${app.documentNo}</span></span>
	</p>
	
	<p style='text-align:left;'>
		<u><span  style='font-size:14.0pt;font-family:仿宋'><span id="applicant">${app.applicant}</span></span></u>
		<span style='font-size:14.0pt;font-family:仿宋'>:</span>
	</p>
	
	<p style='text-indent:28.0pt;text-align:left;'>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>本机关现已收到你（单位）提交的申请</span>
		<u><span style='font-size:14.0pt;font-family:仿宋'><span id="licenseType"><hs:v dicName='LICENSE_TYPE' code='${licenseType}'/></span></span></u>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>行政许可的下列材料:</span>
	</p>
	
	<p style='text-indent:28.0pt;text-align:left;'>
		<span style='font-size:14.0pt;font-family:仿宋'><span id="material">
		<c:forEach var="appMaterial" items="${app.licenseMaterialList}" varStatus="groupStatus">
		<p>${appMaterial.name} ${appMaterial.pageCount}页</p>
	</c:forEach></span></span>
	</p>
	
	<p><span>&nbsp;</span></p>
	
	<p style='text-indent:28.0pt;text-align:left;'>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>以上材料共</span>
		<u><span style='font-size:14.0pt;font-family:仿宋'><span id="count">${fn:length(app.licenseMaterialList)}</span></span></u>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>件。</span>
	</p>
	
	<p style='text-indent:28.0pt;text-align:left;'>
		<span style='font-size:14.0pt;font-family:仿宋_GB2312'>以上申请材料如不齐全或者不符合法定形式，本机关将在五个工作日内予以告知。</span>
	</p>
	
	<p style='text-align:right;text-indent:276.0pt;'>
		<span style='font-size:12.0pt;font-family:宋体'>卫生行政机关（盖章）</span>
	</p>
	
	<p style='text-align:right;'>
		<span style='font-size:12.0pt;' id="orgDate"><fmt:formatDate value="${date}" pattern="yyyy年MM月dd日"/></span>
	</p>
	
	<p style='text-align:left;'>
		<span style='font-size:12.0pt;font-family:宋体'>当事人（签字）</span>
	</p>
	
	<p style='text-align:left;'>
		<span style='font-size:12.0pt;' id="personDate" ><fmt:formatDate value="${date}" pattern="yyyy年MM月dd日"/></span>
	</p>
	
	<p style='margin-top:2pt'>
		<span style='position:absolute;margin-left:-1px;width:80%;height:2px;'><img width=100% height=2 src="${pageContext.request.contextPath}/images/image001.png"></span>
	</p>
	
	<p style='margin-top:4pt;text-align:left;'>
		<span style='font-size:12.0pt;font-family:宋体'>第一联存档，第二联交申请人</span>
		<span style='font-size:12.0pt;font-family:宋体;float:right;display:inline-block;'>中华人民共和国卫生部制</span>		
	</p>
</div>
