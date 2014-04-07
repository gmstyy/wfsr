<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<form id="editFormId" action="" method="post">
	<input type="hidden" id="CSRFTokenName" value="${CSRFTokenName}"/>
	<input type="hidden" id="CSRFToken" value="${CSRFToken}"/>
	<table class="edittable">
		<colgroup>
			<col style="width: 100px;" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>预案名称<span class="must_field">*</span></th>
				<td align="left"><input type='text' id='customName' name='customName' maxlength='30' style="width: 80%;"/></td>
			</tr>
			<tr>
				<th>附件<span class="must_field">*</span></th>
				<td align="left">
					<input type="file" id="preplanUploadFile" name="preplanUploadFile" style="width: 70%;"/>
					<input class="button_upload" onclick="file.doUploadFile();" value="上 传" type="button" style="width: 50px" />	
					<input type="hidden" id="preplanFile" name="preplanFile" value=""/>				
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<table id="attachment">	
					</table>
				</td>
			</tr>							
		</tbody>
	</table>
</form>
<script type="text/javascript">
	file._attId = -1;
	file._attName = '';
	file._isSingal = 'true';
	file._type = 'emergency';
	file._file = 'preplanUploadFile';
	file._fileCheck = 'preplanFile';
</script>