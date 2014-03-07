<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="personal_container">
	<div class="block" style="width: 30%; ">
		<div class="block_title" style="color: #FFFFFF">快捷办公</div>
		<div class="block_data" id="office">
			<c:forEach var="oaHomeConfigList" items="${oaHomeConfigList}">
				<c:if test="${oaHomeConfigList.type == 0}">
					<div class="officeItem">
						<input class="dataUrl" type="hidden" value="${oaHomeConfigList.dataUrl}" />
						<input class="rediUrl" type="hidden" value="${oaHomeConfigList.redirectUrl}"/>
						<input class="rediName"type="hidden" value="${oaHomeConfigList.name}">
						${oaHomeConfigList.displayFormat}
						<span class="consent"></span>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<div class="block" style="width: 67%;">
		<div class="block_title" style="color: #FFFFFF">消息通知</div>
		<div class="block_data" id="message">
			<c:forEach var="oaHomeConfigList" items="${oaHomeConfigList}">
				<c:if test="${oaHomeConfigList.type == 1}">
					<fieldset>
						<legend>${oaHomeConfigList.name}</legend>
						<div class="messageItem">
							<input class="dataUrl" type="hidden"  value="${oaHomeConfigList.dataUrl}" />
							<input class="rediUrl" type="hidden"  value="${oaHomeConfigList.redirectUrl}" />	
						</div>
						<div style="text-align: right;">
							<a href="javascript:void(0);" onclick="redirectPage('${oaHomeConfigList.listUrl}','${oaHomeConfigList.name}');">更多</a>
						</div>
		 			</fieldset>
		 		</c:if>
	 		</c:forEach>
		</div>
	</div>
</div>
<script type="text/javascript">
	var targets = {};
	$("#office").find(".officeItem").each(function() {
		var url = $(this).children(".dataUrl").val();
		var rediUrl = $(this).children(".rediUrl").val();
		var rediName = $(this).children(".rediName").val();
		if(url != ""){
			targets[url] = $(this).find(".type1");
			$(this).find(".type1").attr("onclick","redirectPage('"+rediUrl+"','"+rediName+"');");
			var consent = $(this).children(".consent");
			AjaxHelper.get(getContextUrl(url), null, function(response) {
				$(response.indexEntityList).each(function(index,item){
					if(!isEmpty(item.businessCode)){
						consent.html();
					}
					targets[url].html(item.dataCount);
				});
			});
		}
	});
	$("#message").find(".messageItem").each(function(){
		var messageContainer = this;
		var url = $(this).children(".dataUrl").val();
		var rediUrl = $(this).children(".rediUrl").val();
		if(url != ""){
			AjaxHelper.get(getContextUrl(url),null,function(response){
				var html = "";
				$(response.data).each(function(index, item) {
					html += ("<a href='javascript:void(0);' onclick='view(" + item.dataCode + ", \"" + rediUrl + "\");'>"+item.dataName+"</a><br/>");
				});
				$(messageContainer).html(html);
			});
		}
	});
	var helper = new dataHelper();
	var view = function(id,url) {
		helper.basicPost(url, {
			'id' : id
		}, 2, {
			containerId : 'editContainer',
			containerTitle : '查看',
			buttons:{
				"关闭":function(){Dialog.close();}
			},
			defaultButtons:{
				okEnabled:false,
				cancelEnabled:false,
			}
		});
	};
	var redirectPage = function(url, rediName) {
		menu.loadContent(url, rediName, 0);
	};
</script>