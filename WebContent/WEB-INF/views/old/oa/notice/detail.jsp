<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<h1>${notice.title}</h1>
<div style="text-align: left;margin-left: 100px;margin-right: 100px">${notice.content}</div>
<div style="text-align: left;margin-left: 100px;margin-right: 100px">发送人：${notice.senderUserName}</div>
<div style="text-align: left;margin-left: 100px;margin-right: 100px">发送时间：<fmt:formatDate value="${notice.sentDatetime}" pattern="yyyy-MM-dd HH:mm:ss" /></div>