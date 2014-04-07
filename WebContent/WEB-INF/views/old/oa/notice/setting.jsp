<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="noticeSettingFormId" name="noticeSettingForm" action="" method="post">
	<input type="hidden" value="${noticeSetting.noticeTypes}" id="hidden_noticeTypes"/>
	<hs:dic dicName="NOTICE_TYPE" type="checkbox" defalt="${noticeSetting.noticeTypes}" name="noticeType:String:IN"/>
</form>

