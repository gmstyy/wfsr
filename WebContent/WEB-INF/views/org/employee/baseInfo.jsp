<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<input type='hidden' value='${employee.loginName}' name='loginName' />
<table class="edittable">
	<colgroup>
		<col style="width: 80px;" />
		<col />
		<col style="width: 80px;" />
		<col />
		<col style="width: 80px;" />
		<col />
	</colgroup>
	<tbody>
		<tr>
			<th>监督员<span class="must_field">*</span></th>
			<td><input type='text' value='${employee.name}' id='name'
				name='name' maxlength='30' /></td>
			<th>性别<span class="must_field">*</span></th>
			<td><hs:dic dicName='GENDER' defalt="${employee.gender}" id="gender" name="gender" value1="1" /></td>
			<th>出生日期<span class="must_field">*</span></th>
			<td><tag:dateInput onlypast="false" id="birthday" name="birthday" date="${employee.birthday}" /></td>
		</tr>
		<tr>
			<th>身份证号</th>
			<td><input type='text' value='${employee.cardNo}' id='cardNo' onBlur="updatePersonInfo()" name='cardNo' maxlength='18' /></td>
			<th>政治面貌<span class="must_field">*</span></th>
			<td><hs:dic dicName='POLITICAL_LANDSCAPE' defalt="${employee.politicalLandscape}" id="politicalLandscape" name="politicalLandscape"></hs:dic></td>
			<th>婚姻状况</th>
			<td><hs:dic dicName='MARRY_STATUS' defalt="${employee.marryStatus}" id="marryStatus" name="marryStatus"></hs:dic></td>
		</tr>
		<tr>
			<th>办公电话</th>
			<td><input type='text' value='${employee.workPhone}'
				id='workPhone' name='workPhone' maxlength='20' /></td>
			<th>手机</th>
			<td><input type='text' value='${employee.mobile}' id='mobile'
				name='mobile' maxlength='20' /></td>
			<th>邮件地址</th>
			<td><input type='text' value='${employee.email}' id='email'
				name='email' maxlength='50' /></td>
		</tr>
		<tr>
			<th>民族</th>
			<td><hs:dic dicName='ETHNIC' defalt="${employee.ethnic}" id="ethnic" name="ethnic"></hs:dic></td>
			<th>户口所在地</th>
			<td><input type='text' value='${employee.accountLocation}'
				id='accountLocation' name='accountLocation' maxlength='200' /></td>
			<th>毕业院校</th>
			<td><input type='text' value='${employee.graduated}'
				id='graduated' name='graduated' maxlength='100' /></td>
		</tr>
		<tr>
			<th>所学专业</th>
			<td><hs:dic dicName='MAJOR' defalt="${employee.major}" id="major" name="major"></hs:dic></td>
			<th>最高学历<span class="must_field">*</span></th>
			<td><hs:dic dicName='EDUCATION' defalt="${employee.education}" id="education" name="education"></hs:dic></td>
			<th>学位</th>
			<td><hs:dic dicName='DEGREE' defalt="${employee.degree}" id="degree" name="degree"></hs:dic></td>
		</tr>
		<tr>
			<th>家庭地址区县码</th>
			<td id="homeDistrictContainer"></td>
			<th>家庭地址街道</th>
			<td><input type='text' value='${employee.homeStreet}'
				id='homeStreet' name='homeStreet' maxlength='200' /></td>
			<th>家庭地址邮编</th>
			<td><input type='text' value='${employee.homeZipcode}'
				id='homeZipcode' name='homeZipcode' maxlength='10' /></td>
		</tr>
		<tr>
			<th>紧急联系人</th>
			<td><input type='text' value='${employee.emergencyContact}'
				id='emergencyContact' name='emergencyContact' maxlength='50' /></td>
			<th>紧急联系人电话</th>
			<td><input type='text' value='${employee.emergencyContactTel}'
				id='emergencyContactTel' name='emergencyContactTel' maxlength='30' /></td>
			<th>排序号</th>
			<td><input type='text' value='${employee.sortNo}' id='sortNo' name='sortNo' maxlength='11' /></td>
		</tr>
	</tbody>
</table>
<script type="text/javascript">
function updatePersonInfo() {
	var result = analyzeCardNo($(".edittable").find("#cardNo").val());
	if (result.valid) {
		$(".edittable").find("#birthday").val(result.birthday);  
	    $(".edittable").find("#gender").val(result.gender);
	}
} 
</script> 