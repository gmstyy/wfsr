<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ page language="java" import="com.founder.oa.common.constant.OACV" %>
<%@ page language="java" import="com.founder.hs.constant.HSCV" %>

<div id="search_container">
	<form id="search_form" name="userForm" action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 120px;">
				<col style="width: 220px;">
				<col style="width: 120px;">
				<col style="width: 200px;">
				<col style="width: 120px;">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>消息类型</th>
					<td><hs:dic dicName="NOTICE_TYPE" type="checkbox" name="noticeType:String:IN"></hs:dic> </td>
					<th>通知标题</th>
					<td><input type="text" id="title" name="title:String:LIKE" maxlength="100" /></td>
					<th>发送时间</th>
					<td><tag:dateInput onlypast="false" name="sentStartDate" />~<tag:dateInput onlypast="false" name="sentEndDate" /></td>					
				</tr>
				<tr>
					<th>发送人</th>
					<td><input type="text" id="senderUserName" name="senderUserName:String:LIKE" maxlength="50" /></td>
					<th>接收人</th>
					<td><input type="text" id="receiverUserName" name="receiverUserName:String:LIKE" maxlength="50" /></td>
<!-- 					<th>手机号码</th>
					<td><input type="text" id="msgTarget" name="msgTarget:String:LIKE" maxlength="100" /></td> -->
<!-- 					<th>邮件地址</th>
					<td><input type="text" id="mailTarget" name="mailTarget:String:LIKE" maxlength="100" /></td> -->
					<th>&nbsp;</th>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<th>邮件发送状态</th>
					<td><hs:dic dicName="SEND_STATUS" name="sentMailStatus:Integer:EQ"></hs:dic> </td>
					<th>短信发送状态</th>
					<td><hs:dic dicName="SEND_STATUS" name="sentMsgStatus:Integer:EQ"></hs:dic> </td>
					<th>站内消息发送状态</th>
					<td><hs:dic dicName="SEND_STATUS" name="sentLetterStatus:Integer:EQ"></hs:dic> </td>
				</tr>
				<tr>
					<th>已读状态</th>
					<td><hs:dic dicName="READ_STATUS" name="readStatus:Integer:EQ"></hs:dic> </td>				
					<th>删除状态</th>
					<td><hs:dic dicName="DELETE_STATUS" name="deleteFlag:Integer:EQ"></hs:dic> </td>
					<th>&nbsp;</th>
					<td>&nbsp;</td>
				</tr>
			</thead>
		</table>
		<div class="filter_button_container" id="buttons" style="margin-bottom: 5px; margin-top: 5px; text-align: center;">
			<input class="button_reset" onclick="$('form')[0].reset();" type="button" />
			<input class="button_search" onclick="search();" type="button" />
		</div>
	</form>
</div>
<div id="list_container">
	<table class="repeattable">
		<caption>
			<a class="button_resend" href="javascript:void(0);" onclick="helper.operateObjects(null,'/notice/resend','重发',null);">重发</a>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 90px;">
			<col>
			<col style="width: 90px;">
			<col style="width: 90px;">
			<col style="width: 90px;">
			<col style="width: 90px;">
			<col style="width: 90px;">
			<col style="width: 80px;">
			<col style="width: 60px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>消息类型</th>
				<th>通知标题</th>
				<th>发送人</th>
				<th>发送时间</th>
				<th>接收人</th>
				<th>发送状态</th>
				<th>已读状态</th>
				<th>删除状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="list_table"></tbody>
		<tr id="template" style="display: none;">
			<td style="text-align: center;"><input type="checkbox" name="resend_checkbox_#sentMsgStatus##sentMailStatus#" class="checkItem" value="#id#" onclick="helper.selectItem(this);" /></td>
			<td>#noticeLetterType# #noticeMsgType# #noticeMailType#</td>
			<td>#title#</td>
			<td>#senderUserName#</td>
			<td>#sentDatetime#</td>
			<td>#receiverUserName#</td>
			<td>#sentLetterStatusDesc# #sentMsgStatusDesc# #sentMailStatusDesc#</td>
			<td style="text-align: center;">#readStatusDesc#</td>
			<td style="text-align: center;">#deleteFlag#</td>
			<td style="text-align: center;">
				<div class="option_container">
					<a href="javascript:void(0);" name="resend_button_#sentMsgStatus##sentMailStatus#" title="重发" class="option_edit" onclick="resendNotice('#id#');"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<div id="notice_setting_container"></div>
<script type="text/javascript">
	var templateModel = {
		id : null,
		noticeMailType : null,
		noticeMsgType : null,
		noticeLetterType : null,
		title : null,
		content : null,
		senderUserName : null,
		sentDatetime : {type:"timestamp"},
		receiverUserName : null,
		sentMailStatus : null,
		sentMsgStatus : null,
		sentLetterStatus : null,
		sentMailStatusDesc : null,
		sentMsgStatusDesc : null,
		sentLetterStatusDesc : null,
		readStatusDesc : null,
		deleteFlag : null
	};
	var helper = new dataHelper(templateModel);
	var search = function() {
		helper.postSearch('/notice/manageSearch', {
			formId : 'search_form',
			containerId : 'list_table',
			templateId : 'template'
		});
		
		helper.addListener("afterFillData", handler, "list_table", "notice");
	};
	
	var handler = function(e,pageList){
		$("input[name='resend_checkbox_<%=HSCV.SEND_STATUS.SENT%><%=HSCV.SEND_STATUS.SENT%>']").remove();
		$("a[name='resend_button_<%=HSCV.SEND_STATUS.SENT%><%=HSCV.SEND_STATUS.SENT%>']").remove();
		
		$("input[name='resend_checkbox_<%=HSCV.SEND_STATUS.SENT%><%=HSCV.SEND_STATUS.NONE%>']").remove();
		$("a[name='resend_button_<%=HSCV.SEND_STATUS.SENT%><%=HSCV.SEND_STATUS.NONE%>']").remove();
		
		$("input[name='resend_checkbox_<%=HSCV.SEND_STATUS.NONE%><%=HSCV.SEND_STATUS.SENT%>']").remove();
		$("a[name='resend_button_<%=HSCV.SEND_STATUS.NONE%><%=HSCV.SEND_STATUS.SENT%>']").remove();
		
		$("input[name='resend_checkbox_<%=HSCV.SEND_STATUS.NONE%><%=HSCV.SEND_STATUS.NONE%>']").remove();
		$("a[name='resend_button_<%=HSCV.SEND_STATUS.NONE%><%=HSCV.SEND_STATUS.NONE%>']").remove();
	};
	
	var resendNotice = function(id) {
		if (typeof (id) != "undefined" && (null == id || "" == id))
			return;
		else if (typeof (id) == "undefined")
			id = helper.getSelectedValues();
		else if (id == "")
			return;

		var data = {ids : id};
		AjaxHelper.get(getContextUrl("/notice/resend"), data, function() {
			helper.redirectPage(1,"/notice/manageSearch");
		});

	};
	//make default search
	$(function() {
		search();
	});
</script>
