<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<div id="search_container">
    <form id="search_form" name="userForm" action="" method="post">
		<table class="formtable" id="searchTable">
			<colgroup>
				<col style="width: 100px;">
				<col>
				<col style="width: 100px;">
				<col>
				<col style="width: 100px;">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>通知标题</th>
					<td><input type="text" id="title" name="title:String:LIKE" maxlength="100" /></td>
					<th>发送人</th>
					<td><input type="text" id="senderUserName" name="senderUserName:String:LIKE" maxlength="50" /></td>
					<th>发送时间</th>
					<td><tag:dateInput onlypast="false" name="sentStartDate" />~<tag:dateInput onlypast="false" name="sentEndDate" /></td>
				</tr>
				<tr>
					<th>已读状态</th>
					<td><hs:dic dicName="READ_STATUS" name="readStatus:Integer:EQ" style="width:172px;"></hs:dic> </td>
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
			<a class="button_mark_read" href="javascript:void(0);" id="btn_notice_read_all" onclick="helper.operateObjects(null,'/notice/read','标记已读',null);">标记已读</a>
			<a class="button_del_all" href="javascript:void(0);" id="btn_notice_del" onclick="helper.deleteObjects(null,'/notice/delete');">删除</a>
		</caption>
		<colgroup>
			<col style="width: 30px;">
			<col style="width: 50px;">
			<col style="width: 200px;">
			<col>
			<col style="width: 120px;">
			<col style="width: 150px;">
			<col style="width: 60px;">
		</colgroup>
		<thead>
			<tr class="row_header">
				<th><input type="checkbox" id="selectAll" onclick="helper.selectAll(this);" /></th>
				<th>编号</th>
				<th>通知标题</th>
				<th>通知内容</th>
				<th>发送人</th>
				<th>发送时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="data_table"></tbody>
		<tr id="template" style="display: none;">
	 		<td style="text-align: center;">
	 			<input type="checkbox" class="#checkItem#" value="#id#" onclick="helper.selectItem(this);" />
	 			<input type="hidden" class="hidId" value="#id#"/>
	 			<input type="hidden" class="hidReadStatus" value="#readStatus#"/>
	 		</td>
	 		<td style="text-align: center;" class="readStatus">#rowCount#</td>
			<td class="readStatus">#title#</td>
			<td class="readStatus">#content#</td>
			<td style="text-align: center;" class="readStatus">#senderUserName#</td>
			<td style="text-align: center;" class="readStatus">#sentDatetime#</td>
	 		<td style="text-align: center;">
	 			<div class="option_container">
					<a href="javascript:void(0);" title="删除" class="option_delete"  onclick="helper.deleteObjects('#id#','/notice/delete');"></a>
				</div>
			</td>
		</tr>
	</table>
	<div id="pagenation"></div>
</div>
<div id="notice_setting_container"></div>
<script type="text/javascript">
var noticePage = 1;

var noticeTemplateModel = {
	id : null,
	title : null,
	content : null,
	senderUserName : null,
	sentDatetime : {type:"timestamp"},
	readStatus : null
};

var rowStyleFormatter = function(data, index){
	if(data.readStatus == 0)
		return "font-weight:bold";
	else return "";
};

var helper = new dataHelper(noticeTemplateModel,null,rowStyleFormatter);

var search = function() {
	helper.postSearch('/notice/search',{formId : 'search_form',containerId:'data_table',templateId:'template'});
	helper.addListener("afterFillData", handler, "data_table","notice");
};

var handler = function(e,pageList) {
	noticePage = pageList.page.currentPage;
};

//点击数据行标记已读
$("#data_table").on("click", "td", function(event){
	if($(this).hasClass("readStatus")){
		var id = $(this).parent().find(".hidId").eq(0).val();
		var readStatus = $(this).parent().find(".hidReadStatus").eq(0).val();
		readNotice(id,readStatus);		
	}
});

var readNotice = function(id, read) {
	if (typeof (id) != "undefined" && (null == id || "" == id))
		return;
	else if (typeof (id) == "undefined")
		id = helper.getSelectedValues();
	else if(read == 1){
		return;
	}else if (id == "")
		return;

	helper.basicPost('/notice/read', {id:id}, null, null, function(response) {
		helper.redirectPage(noticePage,"/notice/search");
	});
};

//make default search
$(function() {
	search();
});
</script>
