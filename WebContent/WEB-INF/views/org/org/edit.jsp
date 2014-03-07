<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<form id="editFormId" action="" method="post">
	<input type="hidden" name='id' value="${org.id}">
	<div id="tabs">
	<ul>
		<li class="tabs-1"><span>基本信息</span></li>
		<li class="tabs-2"><span>硬件信息</span></li>
		<li class="tabs-3"><span>物资数量</span></li>
		<li class="tabs-4"><span>考核信息</span></li>
	</ul>
	<div id="tabs-1">
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
				<th>机构名称<span class="must_field">*</span></th>
				<td><input type='text' value='${org.name}' id='name' name='name' maxlength='100' /></td>
				<th>机构第二名称</th>
				<td><input type='text' value='${org.orgSecondName}' id='orgSecondName' name='orgSecondName' maxlength='50' /></td>
				<th>机构编码<span class="must_field">*</span></th>
				<td><input type='text' value='${org.orgCode}' id='orgCode' name='orgCode' maxlength='10' /></td>
			</tr>
			<tr>
				<th>上级机构</th>
				<td><hs:dic dicName='ORG' defalt="${org.parentId}" id='parentId' name='parentId' value3="1"></hs:dic></td>
				<th>机构隶属关系代码</th>
				<td><hs:dic dicName='ORG_MEMBERSHIP' defalt="${org.orgMembershipCode}" id='orgMembershipCode' name='orgMembershipCode'></hs:dic></td>
				<th>机构行政级别<span class="must_field">*</span></th>
				<td><hs:dic dicName='ORG_LEVEL' defalt="${org.orgAdminLevel}" id='orgAdminLevel' name='orgAdminLevel'></hs:dic></td>
			</tr>
			<tr>
				<th>机构性质</th>
				<td><hs:dic dicName='ORG_NATURE' defalt="${org.orgNature}" id='orgNature' name='orgNature'></hs:dic></td>
				<th>机构分类管理代码</th>
				<td><input type='text' value='${org.orgClassManageCode}' id='orgClassManageCode' name='orgClassManageCode' maxlength='10' /></td>
				<th>经济类型代码</th>
				<td><hs:dic dicName='ECONOMIC_NATURE' defalt="${org.economicNatureCode}" id='economicNatureCode' name='economicNatureCode'></hs:dic></td>
			</tr>
			<tr>
				<th>行政区划代码</th>
				<td id="adminDivisionCodeContainer" colspan="3"></td>
			</tr>
			<tr>
				<th>单位负责人<span class="must_field">*</span></th>
				<td><input type='text' value='${org.unitLeader}' id='unitLeader' name='unitLeader' maxlength='20' /></td>
				<th>机构成立时间年</th>
				<td><tag:dateInput onlypast="false" id='orgFoundDate' name='orgFoundDate' date="${org.orgFoundDate}"/></td>
				<th>机构所在地街道</th>
				<td><input type='text' value='${org.orgResidentDistrict}' id='orgResidentDistrict' name='orgResidentDistrict' maxlength='50' /></td>
			</tr>
			<tr>
				<th>机构所在地区划代码</th>
				<td id="orgAdminDivisionCodeContainer" colspan="3"></td>
				<th>机构所在地乡镇名称</th>
				<td><input type='text' value='${org.orgVillageName}' id='orgVillageName' name='orgVillageName' maxlength='200' /></td>
			</tr>
			<tr>
				<th>机构所在地是否民族自治地方</th>
				<td><hs:dic type='radio'  dicName='BOOLEAN_TYPE' defalt="${org.isNationalAutonomy}" id='isNationalAutonomy' name='isNationalAutonomy'></hs:dic></td>
				<th>地址<span class="must_field">*</span></th>
				<td><input type='text' value='${org.address}' id='address' name='address' maxlength='200' /></td>
				<th>邮政编码<span class="must_field">*</span></th>
				<td><input type='text' value='${org.zipcode}' id='zipcode' name='zipcode' maxlength='6' /></td>
			</tr>
			<tr>
				<th>值班电话</th>
				<td><input type='text' value='${org.dutyTelephone}' id='dutyTelephone' name='dutyTelephone' maxlength='40' /></td>
				<th>举报电话</th>
				<td><input type='text' value='${org.complainsTelephone}' id='complainsTelephone' name='complainsTelephone' maxlength='20' /></td>
				<th>传真</th>
				<td><input type='text' value='${org.fax}' id='fax' name='fax' maxlength='20' /></td>
			</tr>
			<tr>
				<th>电子邮箱</th>
				<td><input type='text' value='${org.email}' id='email' name='email' maxlength='100' /></td>
				<th>自办网站域名</th>
				<td><input type='text' value='${org.selfWebsiteDomain}' id='selfWebsiteDomain' name='selfWebsiteDomain' maxlength='200' /></td>
				<th>访问域</th>
				<td><input type='text' value='${org.accessDomain}' id='accessDomain' name='accessDomain' maxlength='200' /></td>
			</tr>
			<tr>
				<th>法定代表人(单位负责人)</th>
				<td><input type='text' value='${org.legalRepresent}' id='legalRepresent' name='legalRepresent' maxlength='50' /></td>
				<th>报出日期</th>
				<td><tag:dateInput onlypast="false" id='submitDate' name='submitDate' date="${org.submitDate}"/></td>
				<th>填报人</th>
				<td><input type='text' value='${org.fillPersonId}' id='fillPersonId' name='fillPersonId' maxlength='32' /></td>
			</tr>
		</tbody>
	</table>
	</div>
	<div id="tabs-2">
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
				<th>执法模式（可多选）：综合执法</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.lawType1}" id='lawType1' name='lawType1'></hs:dic></td>
				<th>执法模式（可多选）：专业执法</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.lawType2}" id='lawType2' name='lawType2'></hs:dic></td>
				<th>成立独立的学校卫生科室</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.isIndependetSchoolClinical}" id='isIndependetSchoolClinical' name='isIndependetSchoolClinical'></hs:dic></td>
			</tr>
			<tr>
				<th>成立独立的职业卫生科室</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.isIndependetProClinical}" id='isIndependetProClinical' name='isIndependetProClinical'></hs:dic></td>
				<th>下设直属分所(局)等派出(分支)机构数</th>
				<td><input type='text' value='${org.directlyUnderOrgNum}' id='directlyUnderOrgNum' name='directlyUnderOrgNum' maxlength='10' /></td>
				<th>承担食品安全综合协调工作</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.isFoodSafeWork}" id='isFoodSafeWork' name='isFoodSafeWork'></hs:dic></td>
			</tr>
			<tr>
				<th>承担食品企业标准备案工作</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.isFoodStandardRecordWork}" id='isFoodStandardRecordWork' name='isFoodStandardRecordWork'></hs:dic></td>
				<th>承担食品安全地方标准制定工作</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.isFoodStandardDrawWork}" id='isFoodStandardDrawWork' name='isFoodStandardDrawWork'></hs:dic></td>
				<th>承担食品安全事故调查处理工作</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.foodSecurity}" id='foodSecurity' name='foodSecurity'></hs:dic></td>
			</tr>
			<tr>
				<th>承担餐饮服务监管工作</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.cateringRegulation}" id='cateringRegulation' name='cateringRegulation'></hs:dic></td>
				<th>承担职业卫生作业场所监管工作</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.healthRegulation}" id='healthRegulation' name='healthRegulation'></hs:dic></td>
				<th>编制人数</th>
				<td><input type='text' value='${org.establishmentCount}' id='establishmentCount' name='establishmentCount' maxlength='9' /></td>
			</tr>
			<tr>
				<th>行政(公务员)编制</th>
				<td><input type='text' value='${org.civilServantsCount}' id='civilServantsCount' name='civilServantsCount' maxlength='10' /></td>
				<th>参照公务员管理的事业编制</th>
				<td><input type='text' value='${org.civilCareerCount}' id='civilCareerCount' name='civilCareerCount' maxlength='10' /></td>
				<th>一般事业编制</th>
				<td><input type='text' value='${org.generalCareerCount}' id='generalCareerCount' name='generalCareerCount' maxlength='10' /></td>
			</tr>
			<tr>
				<th>工勤技能及其他编制</th>
				<td><input type='text' value='${org.skillsCount}' id='skillsCount' name='skillsCount' maxlength='10' /></td>
				<th>职工总数</th>
				<td><input type='text' value='${org.employeeCount}' id='employeeCount' name='employeeCount' maxlength='10' /></td>
				<th>卫生监督员</th>
				<td><input type='text' value='${org.supervisorsCount}' id='supervisorsCount' name='supervisorsCount' maxlength='10' /></td>
			</tr>
			<tr>
				<th>实际从事卫生监督工作的卫生监督员</th>
				<td><input type='text' value='${org.supervisorsDirectCount}' id='supervisorsDirectCount' name='supervisorsDirectCount' maxlength='10' /></td>
				<th>从事行政、后勤等管理工作的卫生监督员</th>
				<td><input type='text' value='${org.supervisorsMenegmentCount}' id='supervisorsMenegmentCount' name='supervisorsMenegmentCount' maxlength='10' /></td>
				<th>有卫生专业技术职称的卫生监督员</th>
				<td><input type='text' value='${org.healthSupervisorsCount}' id='healthSupervisorsCount' name='healthSupervisorsCount' maxlength='10' /></td>
			</tr>
			<tr>
				<th>有其他专业技术职称的卫生监督员</th>
				<td><input type='text' value='${org.otherSupervisorsCount}' id='otherSupervisorsCount' name='otherSupervisorsCount' maxlength='10' /></td>
				<th>离退休人员总数</th>
				<td><input type='text' value='${org.retireesCount}' id='retireesCount' name='retireesCount' maxlength='10' /></td>
				<th>年内离退休人员</th>
				<td><input type='text' value='${org.recentlyRetireesCount}' id='recentlyRetireesCount' name='recentlyRetireesCount' maxlength='10' /></td>
			</tr>
			<tr>
				<th>助理卫生监督员（协管员、检查员）数量</th>
				<td><input type='text' value='${org.assisSupervisorsCount}' id='assisSupervisorsCount' name='assisSupervisorsCount' maxlength='10' /></td>
				<th>房屋总面积(平方米)</th>
				<td><input type='text' value='${org.houseArea}' id='houseArea' name='houseArea' maxlength='10' /></td>
				<th>业务用房面积</th>
				<td><input type='text' value='${org.businessArea}' id='businessArea' name='businessArea' maxlength='10' /></td>
			</tr>
			<tr>
				<th>后勤保障及其他用房面积</th>
				<td><input type='text' value='${org.logisticsArea}' id='logisticsArea' name='logisticsArea' maxlength='10' /></td>
				<th>危房面积</th>
				<td><input type='text' value='${org.dangerousArea}' id='dangerousArea' name='dangerousArea' maxlength='10' /></td>
				<th>租借房屋面积</th>
				<td><input type='text' value='${org.rentArea}' id='rentArea' name='rentArea' maxlength='10' /></td>
			</tr>
			<tr>
				<th>本年批准基建项目(个)</th>
				<td><input type='text' value='${org.approveConstructionCount}' id='approveConstructionCount' name='approveConstructionCount' maxlength='10' /></td>
				<th>本年批准基建项目建筑面积(平方米)</th>
				<td><input type='text' value='${org.approveArea}' id='approveArea' name='approveArea' maxlength='10' /></td>
				<th>本年实际完成投资额(万元)</th>
				<td><input type='text' value='${org.investmentThisYear}' id='investmentThisYear' name='investmentThisYear' maxlength='10' /></td>
			</tr>
			<tr>
				<th>财政性投资</th>
				<td><input type='text' value='${org.investmentFinancial}' id='investmentFinancial' name='investmentFinancial' maxlength='12' /></td>
				<th>单位自有资金</th>
				<td><input type='text' value='${org.investmentOwn}' id='investmentOwn' name='investmentOwn' maxlength='12' /></td>
				<th>银行贷款及其他借款</th>
				<td><input type='text' value='${org.investmentCredit}' id='investmentCredit' name='investmentCredit' maxlength='12' /></td>
			</tr>
			<tr>
				<th>本年房屋竣工面积(平方米)</th>
				<td><input type='text' value='${org.completionArea}' id='completionArea' name='completionArea' maxlength='10' /></td>
				<th>本年新增固定资产(万元)</th>
				<td><input type='text' value='${org.investmentFixedNew}' id='investmentFixedNew' name='investmentFixedNew' maxlength='10' /></td>
			</tr>
		</tbody>
	</table>
	</div>
	<div id="tabs-3">
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
				<th>万元以上设备总价值(万元)</th>
				<td><input type='text' value='${org.equipmentValue}' id='equipmentValue' name='equipmentValue' maxlength='10' /></td>
				<th>万元以上设备台数(台)</th>
				<td><input type='text' value='${org.tenThousandEquipCount}' id='tenThousandEquipCount' name='tenThousandEquipCount' maxlength='9' /></td>
				<th>千元以上监测仪器设备台数(台)</th>
				<td><input type='text' value='${org.oneThousandEquipCount}' id='oneThousandEquipCount' name='oneThousandEquipCount' maxlength='9' /></td>
			</tr>
			<tr>
				<th>＜1万元的数量</th>
				<td><input type='text' value='${org.smallCount}' id='smallCount' name='smallCount' maxlength='10' /></td>
				<th>1万元～10万元的数量</th>
				<td><input type='text' value='${org.middleCount}' id='middleCount' name='middleCount' maxlength='10' /></td>
				<th>≥10万元的数量</th>
				<td><input type='text' value='${org.bigCount}' id='bigCount' name='bigCount' maxlength='10' /></td>
			</tr>
			<tr>
				<th>小型机及服务器台数</th>
				<td><input type='text' value='${org.serverCount}' id='serverCount' name='serverCount' maxlength='9' /></td>
				<th>接入互联网方式(1宽带2专线3拨号)</th>
				<td><hs:dic dicName='INTERNET_TYPE' defalt="${org.internetConnection}" id='internetConnection' name='internetConnection'></hs:dic></td>
				<th>台式计算机的数量(台)</th>
				<td><input type='text' value='${org.deskComputerCount}' id='deskComputerCount' name='deskComputerCount' maxlength='10' /></td>
			</tr>
			<tr>
				<th>便携式计算机</th>
				<td><input type='text' value='${org.laptopCount}' id='laptopCount' name='laptopCount' maxlength='10' /></td>
				<th>手持执法终端设备的数量</th>
				<td><input type='text' value='${org.handheldDeviceCount}' id='handheldDeviceCount' name='handheldDeviceCount' maxlength='10' /></td>
				<th>行政许可系统</th>
				<td><hs:dic dicName='SYSTEM_TYPE' defalt="${org.system1}" id='system1' name='system1'></hs:dic></td>
			</tr>
			<tr>
				<th>日常监督检查系统</th>
				<td><hs:dic dicName='SYSTEM_TYPE' defalt="${org.system2}" id='system2' name='system2'></hs:dic></td>
				<th>行政处罚系统</th>
				<td><hs:dic dicName='SYSTEM_TYPE' defalt="${org.system3}" id='system3' name='system3'></hs:dic></td>
				<th>投诉举报系统</th>
				<td><hs:dic dicName='SYSTEM_TYPE' defalt="${org.system4}" id='system4' name='system4'></hs:dic></td>
			</tr>
			<tr>
				<th>办公系统</th>
				<td><hs:dic dicName='SYSTEM_TYPE' defalt="${org.system5}" id='system5' name='system5'></hs:dic></td>
				<th>摄像机的数量</th>
				<td><input type='text' value='${org.dvCount}' id='dvCount' name='dvCount' maxlength='10' /></td>
				<th>照相机的数量</th>
				<td><input type='text' value='${org.cameraCount}' id='cameraCount' name='cameraCount' maxlength='10' /></td>
			</tr>
			<tr>
				<th>录音机(笔)的数量</th>
				<td><input type='text' value='${org.recorderCount}' id='recorderCount' name='recorderCount' maxlength='10' /></td>
				<th>其中：现场快速检测车的数量</th>
				<td><input type='text' value='${org.rapidTestVehicleCount}' id='rapidTestVehicleCount' name='rapidTestVehicleCount' maxlength='10' /></td>
				<th>汽车(辆)的数量</th>
				<td><input type='text' value='${org.carCount}' id='carCount' name='carCount' maxlength='10' /></td>
			</tr>
			<tr>
				<th>摩托车(辆)的数量</th>
				<td><input type='text' value='${org.motorbikeCount}' id='motorbikeCount' name='motorbikeCount' maxlength='10' /></td>
				<th>船(艘)的数量</th>
				<td><input type='text' value='${org.boatCount}' id='boatCount' name='boatCount' maxlength='10' /></td>
				<th>其它交通工具</th>
				<td><input type='text' value='${org.otherTraffic}' id='otherTraffic' name='otherTraffic' maxlength='10' /></td>
			</tr>
			<tr>
				<th>快速检测设备台数（台）</th>
				<td><input type='text' value='${org.fleetCheckEquipCount}' id='fleetCheckEquipCount' name='fleetCheckEquipCount' maxlength='9' /></td>
				<th>总收入</th>
				<td><input type='text' value='${org.totalIncome}' id='totalIncome' name='totalIncome' maxlength='12' /></td>
				<th>其中：财政补助收入</th>
				<td><input type='text' value='${org.finalcialSubsidies}' id='finalcialSubsidies' name='finalcialSubsidies' maxlength='12' /></td>
			</tr>
			<tr>
				<th>事业收入</th>
				<td><input type='text' value='${org.undertakingRevenue}' id='undertakingRevenue' name='undertakingRevenue' maxlength='12' /></td>
				<th>总支出</th>
				<td><input type='text' value='${org.totalExpenditure}' id='totalExpenditure' name='totalExpenditure' maxlength='12' /></td>
				<th>其中：人员支出</th>
				<td><input type='text' value='${org.personalExpenditure}' id='personalExpenditure' name='personalExpenditure' maxlength='12' /></td>
			</tr>
			<tr>
				<th>离退休费</th>
				<td><input type='text' value='${org.pension}' id='pension' name='pension' maxlength='10' /></td>
				<th>培训经费支出</th>
				<td><input type='text' value='${org.trainingCost}' id='trainingCost' name='trainingCost' maxlength='12' /></td>
				<th>5.3负债</th>
				<td><input type='text' value='${org.liabilities}' id='liabilities' name='liabilities' maxlength='10' /></td>
			</tr>
			<tr>
				<th>是否有独立信息科室</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.ownInfoDivision}" id='ownInfoDivision' name='ownInfoDivision'></hs:dic></td>
				<th>信息工作专职人数人</th>
				<td><input type='text' value='${org.fullTimeCount}' id='fullTimeCount' name='fullTimeCount' maxlength='11' /></td>
				<th>信息工作兼职人数人</th>
				<td><input type='text' value='${org.partTimeCount}' id='partTimeCount' name='partTimeCount' maxlength='9' /></td>
			</tr>
			<tr>
				<th>信息化建设历年投入（截止2010年底）万元</th>
				<td><input type='text' value='${org.investmentInYears}' id='investmentInYears' name='investmentInYears' maxlength='10' /></td>
				<th>本年度预算投入万元</th>
				<td><input type='text' value='${org.inputBudgetThisYear}' id='inputBudgetThisYear' name='inputBudgetThisYear' maxlength='10' /></td>
				<th>本年度日常信息工作经费万元</th>
				<td><input type='text' value='${org.infoworkPayThisYear}' id='infoworkPayThisYear' name='infoworkPayThisYear' maxlength='10' /></td>
			</tr>
			<tr>
				<th>本年度中央及上级财政信息化建设补助经费万元</th>
				<td><input type='text' value='${org.capitalGrantThisYear}' id='capitalGrantThisYear' name='capitalGrantThisYear' maxlength='10' /></td>
				<th>是否有独立机房</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.independentMachineRoom}" id='independentMachineRoom' name='independentMachineRoom'></hs:dic></td>
				<th>是否建立局域网(内网)</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.lan}" id='lan' name='lan'></hs:dic></td>
			</tr>
			<tr>
				<th>是否制定卫生监督信息化建设发展规划</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.developmentProgram}" id='developmentProgram' name='developmentProgram'></hs:dic></td>
				<th>是否开展卫生监督信息报告系统使用人员培训</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.infoSysTraining}" id='infoSysTraining' name='infoSysTraining'></hs:dic></td>


			</tr>
		</tbody>
	</table>
	</div>
	<div id="tabs-4">
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
				<th>本年参与卫生监督员资格考试的人数</th>
				<td><input type='text' value='${org.qualifyingExamCount}' id='qualifyingExamCount' name='qualifyingExamCount' maxlength='9' /></td>
				<th>卫生监督员资格考试合格人数</th>
				<td><input type='text' value='${org.qualifyingExamPassCount}' id='qualifyingExamPassCount' name='qualifyingExamPassCount' maxlength='9' /></td>
				<th>新聘任卫生监督员人数</th>
				<td><input type='text' value='${org.newHealthSupervisorCount}' id='newHealthSupervisorCount' name='newHealthSupervisorCount' maxlength='9' /></td>
			</tr>
			<tr>
				<th>是否参加卫生监督机构绩效考核：</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.orgPeParticipate}" id='orgPeParticipate' name='orgPeParticipate'></hs:dic></td>
				<th>绩效考核结果：优秀合格不合格</th>
				<td><hs:dic dicName='ASSESS_RESULT' defalt="${org.orgPeResult}" id='orgPeResult' name='orgPeResult'></hs:dic></td>
				<th>是否开展卫生监督人员绩效考核：</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.personalPeCheck1}" id='personalPeCheck1' name='personalPeCheck1'></hs:dic></td>
			</tr>
			<tr>
				<th>绩效考核结果优秀人数</th>
				<td><input type='text' value='${org.peAppraisalCount722}' id='peAppraisalCount722' name='peAppraisalCount722' maxlength='9' /></td>
				<th>绩效考核结果称职人数</th>
				<td><input type='text' value='${org.peCompetentCount722}' id='peCompetentCount722' name='peCompetentCount722' maxlength='9' /></td>
				<th>绩效考核结果基本称职人数</th>
				<td><input type='text' value='${org.peJustCount722}' id='peJustCount722' name='peJustCount722' maxlength='9' /></td>
			</tr>
			<tr>
				<th>绩效考核结果不称职人数</th>
				<td><input type='text' value='${org.peIncompetentCount722}' id='peIncompetentCount722' name='peIncompetentCount722' maxlength='10' /></td>
				<th>是否开展卫生监督人员绩效考核</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.personalPeCheck2}" id='personalPeCheck2' name='personalPeCheck2'></hs:dic></td>
				<th>绩效考核结果优秀人数</th>
				<td><input type='text' value='${org.peAppraisalCount731}' id='peAppraisalCount731' name='peAppraisalCount731' maxlength='9' /></td>
			</tr>
			<tr>
				<th>绩效考核结果称职人数</th>
				<td><input type='text' value='${org.peCompetentCount731}' id='peCompetentCount731' name='peCompetentCount731' maxlength='9' /></td>
				<th>绩效考核结果基本称职人数</th>
				<td><input type='text' value='${org.peJustCount731}' id='peJustCount731' name='peJustCount731' maxlength='9' /></td>
				<th>绩效考核结果不称职人数</th>
				<td><input type='text' value='${org.peIncompetentCount731}' id='peIncompetentCount731' name='peIncompetentCount731' maxlength='10' /></td>
			</tr>
			<tr>
				<th>是否开展卫生监督机构绩效考核</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.orgPeCheck}" id='orgPeCheck' name='orgPeCheck'></hs:dic></td>
				<th>稽查机构是否专设</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.specialSetCheck}" id='specialSetCheck' name='specialSetCheck'></hs:dic></td>
				<th>专职稽查人员数</th>
				<td><input type='text' value='${org.fulltimeInspectorsCount}' id='fulltimeInspectorsCount' name='fulltimeInspectorsCount' maxlength='10' /></td>
			</tr>
			<tr>
				<th>兼职稽查人员数</th>
				<td><input type='text' value='${org.parttimeInspectorsCount}' id='parttimeInspectorsCount' name='parttimeInspectorsCount' maxlength='10' /></td>
				<th>受理涉及卫生监督执法行为的投诉举报数</th>
				<td><input type='text' value='${org.acceptanceComplainsCount}' id='acceptanceComplainsCount' name='acceptanceComplainsCount' maxlength='10' /></td>
				<th>查处涉及卫生监督执法行为的投诉举报数</th>
				<td><input type='text' value='${org.investigationComplainsCount}' id='investigationComplainsCount' name='investigationComplainsCount' maxlength='10' /></td>
			</tr>
			<tr>
				<th>开展对本级的稽查次数</th>
				<td><input type='text' value='${org.sameLevelInspectorsCount}' id='sameLevelInspectorsCount' name='sameLevelInspectorsCount' maxlength='10' /></td>
				<th>开展对下级的稽查次数(仅要求地市级以上填写)</th>
				<td><input type='text' value='${org.lowerLevelInspectorsCount}' id='lowerLevelInspectorsCount' name='lowerLevelInspectorsCount' maxlength='10' /></td>
				<th>发出稽查意见书数量（份）</th>
				<td><input type='text' value='${org.numberOfAuditOpinion}' id='numberOfAuditOpinion' name='numberOfAuditOpinion' maxlength='10' /></td>
			</tr>
			<tr>
				<th>针对稽查意见已落实整改措施的数量（个）</th>
				<td><input type='text' value='${org.correctiveActionsCount}' id='correctiveActionsCount' name='correctiveActionsCount' maxlength='10' /></td>
				<th>稽查后移送相关部门的案件数</th>
				<td><input type='text' value='${org.afterInspectorsCaseCount}' id='afterInspectorsCaseCount' name='afterInspectorsCaseCount' maxlength='10' /></td>
				<th>稽查后移送相关部门的人员数</th>
				<td><input type='text' value='${org.afterInspectorsStaffCount}' id='afterInspectorsStaffCount' name='afterInspectorsStaffCount' maxlength='10' /></td>
			</tr>
			<tr>
				<th>是否开展执法考核评议</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.carryOutReviewCheck}" id='carryOutReviewCheck' name='carryOutReviewCheck'></hs:dic></td>
				<th>发生执法过错的下级责任单位数(仅要求地市级以上填写)</th>
				<td><input type='text' value='${org.faultLowerLevelCount}' id='faultLowerLevelCount' name='faultLowerLevelCount' maxlength='10' /></td>
				<th>本机构发生执法过错的责任人次数</th>
				<td><input type='text' value='${org.faultDutyOfficerCount}' id='faultDutyOfficerCount' name='faultDutyOfficerCount' maxlength='10' /></td>
			</tr>
			<tr>
				<th>本机构被行政处分的人次数</th>
				<td><input type='text' value='${org.punishPeolpleCount}' id='punishPeolpleCount' name='punishPeolpleCount' maxlength='10' /></td>
				<th>本机构被追究刑事责任的人员数</th>
				<td><input type='text' value='${org.gotPunishmentCount}' id='gotPunishmentCount' name='gotPunishmentCount' maxlength='10' /></td>
				<th>国家级（党中央、国务院及各部门）</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.nationalReward}" id='nationalReward' name='nationalReward'></hs:dic></td>
			</tr>
			<tr>
				<th>国家级奖励情况</th>
				<td><input type='text' value='${org.nationalRewardRemark}' id='nationalRewardRemark' name='nationalRewardRemark' maxlength='200' /></td>
				<th>省级</th>
				<td><hs:dic type='radio' dicName='BOOLEAN_TYPE' defalt="${org.provincialReward}" id='provincialReward' name='provincialReward'></hs:dic></td>
				<th>市（厅）级奖励情况</th>
				<td><input type='text' value='${org.cityRewardRemark}' id='cityRewardRemark' name='cityRewardRemark' maxlength='200' /></td>
			</tr>
		</tbody>
	</table>
	</div>
	</div>  
</form>
<script type="text/javascript">
districtHelper.createDistrict("adminDivisionCodeContainer", "adminDivisionCode", { hideProvince : false, defaultValue : '${org.adminDivisionCode}' });
districtHelper.createDistrict("orgAdminDivisionCodeContainer", "orgAdminDivisionCode", { hideProvince : false, defaultValue : '${org.orgAdminDivisionCode}' });
tabs.createTabs("tabs");
</script>
