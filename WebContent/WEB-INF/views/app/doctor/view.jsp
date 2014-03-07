<%--@elvariable id="app" type="com.founder.hs.entity.business.AppDoctor"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<table class="edittable">
	<colgroup>
		<col style="width: 120px;" />
		<col />
		<col style="width: 120px;" />
		<col />
	</colgroup>
	<tbody>
	<tr>
		<th>执业机构（单位）名称<span class="must_field">*</span></th>
		<td><input type='text' value='${app.pracInstName}' id='pracInstName' name='pracInstName' maxlength='100' readonly="readonly"/>
		</td>
		<th>填表时间<span class="must_field">*</span></th>
		<td><tag:dateInput date='${app.fillingTime}' id='fillingTime' name='fillingTime' disabled="true"/></td>
	</tr>
	<tr>
		<th>性别<span class="must_field">*</span></th>
		<td><hs:dic dicName='GENDER' id='gender' name='gender' defalt="${app.gender}" value1="1" disabled="true"/></td>
		<th>出生年月<span class="must_field">*</span></th>
		<td><tag:dateInput date='${app.birthYearMonth}' id='birthYearMonth' name='birthYearMonth' disabled="true"/></td>
	</tr>
	<tr>
		<th>籍 贯<span class="must_field">*</span></th>
		<td><input type='text' value='${app.nativePlace}' id='nativePlace' name='nativePlace' maxlength='50' readonly="readonly"/></td>
		<th>民族<span class="must_field">*</span></th>
		<td><hs:dic dicName="ETHNIC" defalt='${app.nation}' id='nation' name='nation' disabled="true" /></td>
	</tr>
	<tr>
		<th>学历/学位<span class="must_field">*</span></th>
		<td><hs:dic dicName='DEGREE' id='degree' name='degree' disabled="true" defalt="${app.degree}"/></td>
		<th>传真</th>
		<td><input type='text' value='${app.fax}' id='fax' name='fax' maxlength='30' readonly="readonly"/></td>
	</tr>
	<tr>
		<th>现任专业技术职务及
			任职时间、聘任单位
		</th>
		<td colspan="3"><textarea name="positionDescribe" id="positionDescribe" cols="70" rows="5" readonly="readonly">${app.positionDescribe}</textarea></td>
	</tr>
	<tr>
		<th>现有专业技术职务任职
			资格及取得时间、审批机关
		</th>
		<td colspan="3"><textarea name="jobQualifications" id="jobQualifications" cols="70" rows="5" readonly="readonly">${app.jobQualifications}</textarea></td>
	</tr>
	<tr>
		<th>申请专业<span class="must_field">*</span></th>
		<td><hs:dic dicName='APPLY_MAJOR' id='applyMajor' name='applyMajor' disabled="true" defalt="${app.applyMajor}"/></td>
	</tr>
	<tr>
		<th>本人专业技术工作述评</th>
		<td colspan="3"><textarea name="workReview" id="workReview" cols="70" rows="5" readonly="readonly">${app.workReview}</textarea></td>
	</tr>
	<%--<tr>
		<th>执业机构(单位)意见</th>
		<td colspan="3"><textarea name="pracInstOpinion" id="pracInstOpinion" cols="70" rows="5">${app.pracInstOpinion}</textarea></td>
	</tr>
	<tr>
		<th>执业机构负责人</th>
		<td><input type='text' value='${app.pracInstHead}' id='pracInstHead' name='pracInstHead' maxlength='50'/>
		</td>
	</tr>
	<tr>
		<th>市（州）级卫生行政部门初审意见</th>
		<td colspan="3"><textarea name="preliminaryExamOpinion" id="preliminaryExamOpinion" cols="70" rows="5">${app.preliminaryExamOpinion}</textarea></td>
	</tr>
	<tr>
		<th>初审负责人</th>
		<td><input type='text' value='${app.preliminaryExamHead}' id='preliminaryExamHead'
		           name='preliminaryExamHead' maxlength='50'/></td>
	</tr>
	<tr>
		<th>省卫生监督局复核意见</th>
		<td colspan="3"><textarea name="reviewOpinions" id="reviewOpinions" cols="70" rows="5">${app.reviewOpinions}</textarea></td>
	</tr>
	<tr>
		<th>复核负责人</th>
		<td><input type='text' value='${app.reviewHead}' id='reviewHead' name='reviewHead' maxlength='50'/></td>
	</tr>
	<tr>
		<th>省级卫生行政部门审批意见</th>
		<td colspan="3"><textarea name="provinceAdminOpinions" id="provinceAdminOpinions" cols="70" rows="5">${app.provinceAdminOpinions}</textarea></td>
	</tr>
	<tr>
		<th>省级卫生行政部门审批负责人</th>
		<td><input type='text' value='${app.provinceAdminHead}' id='provinceAdminHead' name='provinceAdminHead'
		           maxlength='50'/></td>
	</tr>--%>
	</tbody>
</table>
