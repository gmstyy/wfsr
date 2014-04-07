<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<fieldset id="appMaterialList">
	<input type="hidden" id="CSRFTokenName" value="${CSRFTokenName}"/>
	<input type="hidden" id="CSRFToken" value="${CSRFToken}"/>
	<input type="hidden" id="licenseTypeName" value="<hs:v dicName='LICENSE_TYPE' code='${licenseType}'/>" />
	<input type="hidden" id="documentNo" value="${app.documentNo}" />
	<div class="title">材料</div>
	<legend>
		<input type='checkbox' onclick='dicCheckBoxSelectAll(this)' />全选 
		<c:choose>
			<c:when test="${not empty app.id}">
			<input type='checkbox' name="printA" /><a href="javascript:printA();">打印材料接收文书</a>  <input type='checkbox'
			name="printB" /> <a href="javascript:printB();">打印材料补正通知书</a>
			</c:when>
			<c:otherwise>
			<input type='checkbox' name="printA" />打印材料接收文书 <input type='checkbox'
			name="printB" />打印材料补正通知书
			</c:otherwise>
		</c:choose>
		
	</legend>
	<c:forEach var="appMaterial" items="${appMaterialDic}" varStatus="groupStatus">
		<div class="appMaterial">
			<c:choose>
				<c:when test="${appMaterialMap[appMaterial.key]!=null}">
					<input type='hidden' name='id' value='${appMaterialMap[appMaterial.key].id}'>
					<input type="checkbox" checked='checked' name="materialCode" class="InputCheck" value="${appMaterial.key}" />
							${appMaterialMap[appMaterial.key].name}
							<input type='hidden' name='name' value='${appMaterialMap[appMaterial.key].name}'>
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="materialCode" class="InputCheck" value="${appMaterial.key}" />
							${appMaterial.value.value}
							<input type='hidden' name='name' value='${appMaterial.value.value}'>

				</c:otherwise>
			</c:choose>
			<input type="text" name='pageCount' value="${appMaterialMap[appMaterial.key].pageCount}" style="width: 50px;" maxlength="5">页
		</div>
	</c:forEach>
	<c:forEach var="appMaterial" items="${otherAppMaterialList}" varStatus="groupStatus">
		<div class="appMaterial">
			<input type='hidden' name='id' value='${appMaterial.id}'> <input type='hidden' name='materialCode' value='${APP_MATERIAL_OTHER}'> <input type='text' name='name'
				value="${appMaterial.name}"> <input type="text" name='pageCount' value="${appMaterial.pageCount}" maxlength="5">页 <a title="删除" href="javascript:void(0);"
				class="option_del" onclick="deleteItem($(this).parents(('div')).eq(0));"></a>
		</div>
	</c:forEach>
	<a class="option_add" onclick="addRow('appMaterialList','appMaterialTemplate','appMaterial');">填加其他材料</a>
	<div id="appMaterialTemplate" style="display: none">
		<input type='hidden' name='materialCode' value='${APP_MATERIAL_OTHER}'> <input type='text' name='name'> <input type="text" name='pageCount' maxlength="5">页
		<a title="删除" href="javascript:void(0);" class="option_del" onclick="deleteItem($(this).parents(('div')).eq(0));"></a>
	</div>
</fieldset>
<div id="printA" style="display: none;">
	<%@ include file="/WEB-INF/views/oa/print/permit/a.jsp"%>
</div>
<div id="printB" style="display: none;">
	<%@ include file="/WEB-INF/views/oa/print/permit/b.jsp"%>
</div>
<script type="text/javascript">
	var printA = function() {
		var licenseMaterialList = appMaterialCheckedData("appMaterialList", ".appMaterial");
		Dialog.open("printA", "", 800, 600, {
			defaultButtons : {
				okEnabled : false
			},
			buttons : {
				'打 印' : function() {jqPrint("printA");}
			}
		});
		var printObj = $("#printA");
		var material = "";
		for ( var i = 0; i < licenseMaterialList.length; i++) {
			material += "<p>" + licenseMaterialList[i].name + nvl(licenseMaterialList[i].pageCount, "若干") + "页 </p>";
		}
		printObj.find("#documentNo").html($("#appMaterialList").find("#documentNo").val());
		printObj.find("#applicant").html($("#relative").find("#applicant").val());
		printObj.find("#licenseType").html($("#appMaterialList").find("#licenseTypeName").val());
		printObj.find("#material").html(material);
		printObj.find("#count").html(licenseMaterialList.length);
		printObj.show();
	}
	var printB = function() {
		var licenseMaterialList = appMaterialCheckedData("appMaterialList", ".appMaterial", false);
		Dialog.open("printB", "", 800, 600, {
			defaultButtons : {
				okEnabled : false
			},
			buttons : {
				'打 印' : function() {jqPrint("printB");}
			}
		});
		var printObj = $("#printB");
		var material = "";
		for ( var i = 0; i < licenseMaterialList.length; i++) {
			material += "<p>" +licenseMaterialList[i].name + "</p>";
		}
		printObj.find("#documentNo").html($("#appMaterialList").find("#documentNo").val());
		printObj.find("#applicant").html($("#relative").find("#applicant").val());
		printObj.find("#licenseType").html($("#appMaterialList").find("#licenseTypeName").val());
		printObj.find("#material").html(material);
		printObj.find("#count").html(licenseMaterialList.length);
		printObj.show();
	}
</script>