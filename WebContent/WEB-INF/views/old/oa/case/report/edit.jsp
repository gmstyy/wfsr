<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>
<%@ page language="java" import="com.founder.oa.common.constant.OACV" %>

<form id="reportDetailFormId" name="reportDetailForm" action="" method="post">
	<c:set var="PUBLIC_PLACE" value="<%=OACV.CASE_INVESTIGATE.PUBLIC_PLACE%>" scope="request"/>
	<c:set var="DRINK_WATER" value="<%=OACV.CASE_INVESTIGATE.DRINK_WATER%>" scope="request"/>
	<c:set var="OCCUP_HEALTH" value="<%=OACV.CASE_INVESTIGATE.OCCUP_HEALTH%>" scope="request"/>
	<c:set var="RADIATION_HEALTH" value="<%=OACV.CASE_INVESTIGATE.RADIATION_HEALTH%>" scope="request"/>	
	<c:set var="SCHOOL_HEALTH" value="<%=OACV.CASE_INVESTIGATE.SCHOOL_HEALTH%>" scope="request"/>
	<c:set var="MEDIACL_HEALTH" value="<%=OACV.CASE_INVESTIGATE.MEDIACL_HEALTH%>" scope="request"/>
	<c:set var="DISEASE_CONTROL" value="<%=OACV.CASE_INVESTIGATE.DISEASE_CONTROL%>" scope="request"/>
	<c:set var="BLOOD" value="<%=OACV.CASE_INVESTIGATE.BLOOD%>" scope="request"/>
	<c:set var="NO_LICENSE" value="<%=OACV.CASE_INVESTIGATE.NO_LICENSE%>" scope="request"/>
	<input type="hidden" value="${entity.id}" name="businessId" />		
	<input type="hidden" value="${relativePerson.domain}" name="regionCode" />
	<input type="hidden" value="${entity.relativeNationId}" name="relativeNationId" />
	<input type="hidden" value="${entity.disId}" name="disId" />
	<input type="hidden" value="${relativePerson.businessTypeb}" name="businessType" />
	<input type="hidden" value="${entity.caseType}" name="speSec" />
	<input type="hidden" value="${relativePerson.licType}" name="licType" />
	<table class="edittable">
		<colgroup>
			<col style="width: 150px;" />
			<col style="width: 200px;" />
			<col style="width: 150px;" />
			<col />
		</colgroup>
		<tbody>	
			<tr>
				<th>被查处单位（个人）</th>
				<td><input type="text" value="${entity.casePlace}" name="casePlace" maxlength="50"/></td>	
				<th>行政区划</th>
				<td id="adminDivisionCodeContainer"></td>
			</tr>
			<tr>
				<th>注册地址</th>
				<td colspan="3">
					<input type="text" value="${relativePerson.regaddr}" name="regaddr" maxlength="100" style="width:81%"/>
				</td>		
			</tr>
			<tr>
				<th>地址</th>
				<td colspan="3">
					<input type="text" value="${relativePerson.address}" name="address" maxlength="100" style="width:81%"/>
				</td>		
			</tr>			
			<tr>
				<th>被查处单位组织机构代码</th>
				<td></td>		
				<th>被查处单位经济类型</th>
				<td><hs:v dicName="ECONOMIC_NATURE" code="${entity.ecmcode}"></hs:v></td>		
			</tr>
			<tr>
				<th>法定代表人（负责人）</th>
				<td><input type="text" value="${entity.casePerson}" name="casePerson" maxlength="10"/></td>	
			</tr>	
			<tr>		
				<th>证件类别</th>
				<td>
					<hs:dic dicName="ID_CARD_TYPE" name="legalIdType" defalt="${relativePerson.legalIdType}"></hs:dic>
				</td>
				<th>证件号码</th>
				<td>
					<input type="text" value="${relativePerson.legalIdNo}" name="legalIdNo" maxlength="30"/>
				</td>						
			</tr>			
			<c:if test="${entity.caseType != SCHOOL_HEALTH}">
			<tr>
				<th>单位类别</th>
				<td colspan="3">
					<hs:dic dicName="RELATIVE_PERSON_BUSINESS_TYPE" value1="${entity.caseType}" name="businessType" defalt="${relativePerson.businessTypeb}" ></hs:dic>
				</td>
			</tr>
			</c:if>				
			<c:if test="${entity.caseType == SCHOOL_HEALTH}">
			<tr>
				<th>学校类别</th>
				<td>
					<hs:dic dicName="RELATIVE_PERSON_BUSINESS_TYPE" value1="${SCHOOL_HEALTH}" name="businessType" defalt="${relativePerson.businessTypeb}"></hs:dic>
				</td>
				<th>办学性质</th>
				<td>
					<hs:dic dicName="SCHOOL_TYPE" name="schoolType"></hs:dic>
				</td>				
			</tr>			
			</c:if>
			<c:if test="${entity.caseType == MEDIACL_HEALTH}">
			<tr>
				<th>医疗机构执业许可证号</th>
				<td>
					<input type="text" value="${caser.licenseNo}" name="licenseNo" maxlength="50"/>
				</td>	
				<th>母婴保健技术服务执业许可证号</th>
				<td>					
					<input type="text" value="${caser.babyLicenseNo}" name="babyLicenseNo" maxlength="50"/>
				</td>
			</tr>
			<tr>
				<th>个人类别</th>
				<td>
					<hs:dic dicName="RELATIVE_PERSON_BUSINESS_TYPE" value1="0698" name="personType" defalt="${caser.personType}"></hs:dic>
				</td>	
				<th>执业证书编码</th>
				<td>					
					<input type="text" value="${caser.careerCertificateNo}" name="careerCertificateNo" maxlength="50"/>
				</td>
			</tr>			
			</c:if>
			<c:if test="${entity.caseType == NO_LICENSE}">
			<tr>		
				<th>违法地点</th>
				<td>
					<hs:dic dicName="ILLEGAL_PLACE" name="fixedPlace" defalt="${caser.fixedPlace}"></hs:dic>
				</td>
				<th>非法行医被处罚次数</th>
				<td>
					<hs:dic dicName="ILLEGAL_MEDIACL_PUNISH_COUNT" name="punishedTimes" defalt="${caser.punishedTimes}"></hs:dic>
				</td>						
			</tr>			
			</c:if>
			<c:if test="${entity.caseType == BLOOD}">
			<tr>
				<th>采供血执业许可证号</th>
				<td>
					<input type="text" value="${caser.bloodlicenseNo}" name="bloodlicenseNo" maxlength="100"/>
				</td>	
				<th>医疗机构执业许可证号</th>
				<td>					
					<input type="text" value="${caser.licenseNo}" name="licenseNo" maxlength="100"/>
				</td>
			</tr>
			<tr>
				<th>个人类别</th>
				<td>
					<hs:dic dicName="RELATIVE_PERSON_BUSINESS_TYPE" value1="069801" name="personType" defalt="${caser.personType}"></hs:dic>
				</td>	
				<td colspan="2"></td>
			</tr>
			</c:if>
			<tr>
				<th>案件来源</th>
				<td colspan="3"><hs:dic dicName="CASE_SOURCE" name="caseSource" defalt="${entity.caseSource}"></hs:dic></td>				
			</tr>
			<tr>
				<th>违法事实</th>
				<td colspan="3">
					<input type="text" id="caseIllegalNameId" name="caseIllegalName" style="width:81%"/>
					<input type="text" id="caseIllegalValueId" name="caseIllegal" value="${casei.caseIllegal}" style="display:none;"/>
				</td>				
			</tr>				
			<tr>
				<th>处罚程序</th>
				<td colspan="3">
					<hs:dic dicName="PUNISH_PROCESS" name="punishimentprocedure" defalt="${caser.punishimentprocedure}" type="radio"></hs:dic>
				</td>
			</tr>
			<tr>
				<th>立案日期</th>
				<td>					
					<tag:dateInput onlypast="false" name="registerDate" date="${entity.registerDate}"/>
				</td>			
				<th>决定书送达日期</th>
				<td>					
					<tag:dateInput onlypast="false" name="decisionDate" date="${caser.decisionDate}"/>
				</td>
			</tr>
			<tr>
				<th>处罚文号或编号</th>
				<td colspan="3"><input type="text" value="${entity.documentNo}" name="documentNo" maxlength="50"/></td>
			</tr>							
			<tr>
				<th>行政处罚决定</th>
				<td colspan="3">
					<hs:dic dicName="PUNISH_TYPE" value1="${entity.caseType}01" name="adminPunish" defalt="${caser.adminPunish}" type="checkbox"></hs:dic>
				</td>		
			</tr>			
			<tr>
				<th>罚款金额</th>
				<td>
					<input type="text" value="${caser.penalty}" name="penalty" maxlength="10"/>元
				</td>
				<c:if test="${entity.caseType == NO_LICENSE}" >
				<th>没收违法所得金额</th>
				<td>
					<input type="text" value="${caser.confiscatePenalty}" name="confiscatePenalty" maxlength="10"/>元
				</td>
				</c:if>		
			</tr>			
			<tr>
				<th>行政强制及其他措施</th>
				<td colspan="3">
					<hs:dic dicName="PUNISH_TYPE" value1="${entity.caseType}02" name="adminFocus" defalt="${caser.adminFocus}" type="checkbox"></hs:dic>
				</td>		
			</tr>	
			<tr>
				<th>行政复议</th>
				<td colspan="3">
					<hs:dic dicName="ADMIN_RECONSIDERATION" name="aReview" defalt="${caser.aReview}" type="radio"></hs:dic>
				</td>		
			</tr>
			<tr>
				<th>行政诉讼</th>
				<td colspan="3">
					<hs:dic dicName="ADMIN_LITIGATION" name="aLitigation" defalt="${caser.aLitigation}" type="radio"></hs:dic>
				</td>		
			</tr>
			<tr>
				<th>执行方式</th>
				<td colspan="3">
					<hs:dic dicName="EXECUTE_METHOD" name="executeMethod" defalt="${casef.executeMethod}" type="radio"></hs:dic>
				</td>	
			</tr>	
			<tr>
				<th>执行结果</th>
				<td colspan="3">					
					<hs:dic dicName="EXECUTE_RESULT" name="executeResult" defalt="${casef.executeResult}" type="radio"></hs:dic>
				</td>
			</tr>						
			<tr>		
				<th>实际履行罚款金额</th>
				<td>
					<input type="text" value="${casef.actualPenalty}" name="actualPenalty" maxlength="10"/>元
				</td>
				<th>不作行政处罚</th>
				<td>
					<input type="checkbox" id="unpunishId" onclick="isPunish();"/>
					<input type="text" value="0" id="unpunish" name="unpunish" style="display:none;"/>
				</td>						
			</tr>
			<tr>
				<th>结案日期</th>
				<td colspan="3">					
					<tag:dateInput onlypast="false" name="closeDate" date="${casef.closeDate}"/>
				</td>						
			<tr>
				<th>其他处理情况</th>
				<td colspan="3">					
					<hs:dic dicName="PUNISH_TYPE" value1="${entity.caseType}03" name="otherDeal" defalt="${caser.otherDeal}" type="radio"></hs:dic>
				</td>
			</tr>
			<c:if test="${entity.caseType == OCCUP_HEALTH || entity.caseType == DISEASE_CONTROL || entity.caseType == MEDIACL_HEALTH || entity.caseType == BLOOD}">
			<tr>
				<th>警告</th>
				<td><input type="text" name="warningStaff" value="0"/>人</td>
				<th>记过</th>
				<td><input type="text" name="demeritsStaff" value="0"/>人</td>
			</tr>
			<tr>
				<th>记大过</th>
				<td><input type="text" name="seriousDemaritsStaff" value="0"/>人</td>
				<th>责令改正和通报批评</th>
				<td><input type="text" name="criticizedStaff" value="0"/>人</td>
			</tr>
			<tr>
				<th>降级</th>
				<td><input type="text" name="degradeStaff" value="0"/>人</td>
				<th>撤职</th>
				<td><input type="text" name="dischargeStaff" value="0"/>人</td>
			</tr>
			<tr>
				<th>开除</th>
				<td><input type="text" name="fireStaff" value="0"/>人</td>
				<th>移送</th>
				<td><input type="text" name="removeStaff" value="0"/>人</td>
			</tr>									
			</c:if>																														
		</tbody>			
	</table>
</form>
<script type="text/javascript">
districtHelper.createDistrict('adminDivisionCodeContainer', 'domain', {defaultValue:"${relativePerson.domain}"});

var dic = new dictionary("dictionary", "caseIllegalNameId", {codeCtrlId:'caseIllegalValueId', dicName : 'ILLEGAL_FACTORS', value1 : '${entity.caseType}', dicTitle : '违法事实' });

var caseIllegalList = [];
<c:forEach var="v" items="${caseIllegalList}">
caseIllegalList.push({ code : '${v.code}', name : '${v.value}'});
</c:forEach>
dic.setSelectedItems(caseIllegalList);

var isPunish = function() {
	if ($("#unpunishId").attr("checked") == "checked") {
		$("#unpunish").val('1');
	} else {
		$("#unpunish").val('0');
	}
}
</script>