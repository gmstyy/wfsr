var relativePersonValid = {
	applicant : {must : true, fieldName : "名称（单位/个人）"},
	type : {must : true, fieldName : "类别"},
	ecmcode : {must : true, fieldName : "经济类型"},
	//telephone : {must : true, fieldName : "联系电话"},
	address : {must : true, fieldName : "地址"},
	regaddr : {must : true, fieldName : "注册地址"},
	legalPersonName : {must : true, fieldName : "法人姓名"},
	legalIdType : {must : true, fieldName : "法人证件类型"},
	legalIdNo : {fieldName : "法人证件号码", customValidate : function(value, container) {
		var message = "";
		if (value == null || value == "") {
			return message;
		}
		var idType = $(container).find("#legalIdType").val();
		if (idType == "01") {
			var result = analyzeCardNo(value);
			if (!result.valid) {
				message = "[法人证件号码]" + result.message;
			}
		}
		return message;
	}}
};

var constructionValid = mergeObject(relativePersonValid, {
	projectName : {must : true, fieldName : "项目名称"},
	projectNo : {must : true, fieldName : "项目编号"},
	projectAddress : {must : true, fieldName : "工程地址"},
	projectStartDate : {must : true, fieldName : "工程起始时间"},
	projectEndDate : {must : true, fieldName : "工程终止时间"}
});

var publicValid = mergeObject(relativePersonValid, {
	applyItem : {must : true, fieldName : "申请项目"},
	productCategory : {must : true, fieldName : "单位类别"}
});

var waterValid = mergeObject(relativePersonValid, {
	productName : {must : true, fieldName : "产品名称"},
	productModel : {must : true, fieldName : "产品型号"},
	productCategory : {must : true, fieldName : "产品类别"},
	manufacturer : {must : true, fieldName : "生产企业"},
	manufacturerAddress : {must : true, fieldName : "产品生产地址"}
});

var restaurantValid = mergeObject(relativePersonValid, {
	applyItem : {must : true, fieldName : "申请项目"},
	scale : {must : true, fieldName : "餐饮类型"}
});

var radiateValid = mergeObject(relativePersonValid, {
	productCategory : {must : true, fieldName : "单位类别"}
});

var adValid = mergeObject(relativePersonValid, {
	registerNumber : {must : true, fieldName : "《医疗机构执业许可证》登记号"},
	issuingDepartment : {must : true, fieldName : "发证卫生行政部门"},
	applyOrgType : {must : true, fieldName : "申请机构类别"},
	institutionsCategories : {must : true, fieldName : "医疗机构类别"},
	diagnosisTreatmentSubject : {must : true, fieldName : "诊疗科目"},
	publishMediaCategory : {must : true, fieldName : "发布媒体类别"},
	agentIdNo : {type : "identify", fieldName : "经办人身份证号"},
	advertisTime : {type : "number", fieldName : "广告时长"}
});

var transportValid = mergeObject(relativePersonValid, {
	applyItem : {must : true, fieldName : "申请项目"},
	name : {must : true, fieldName : "菌（毒）种或样本名称"},
	sampleType : {must : true, fieldName : "样品分类/UN编号"},
	source : {must : true, fieldName : "来源"},
	transportPurpose : {must : true, fieldName : "运输目的"}
});

var doctorValid = mergeObject(relativePersonValid, {
	pracInstName : {must : true, fieldName : "执业机构（单位）名称"},
	fillingTime : {must : true, fieldName : "填表时间"},
	gender : {must : true, fieldName : "性别"},
	birthYearMonth : {must : true, fieldName : "出生年月"},
	nativePlace : {must : true, fieldName : "籍贯"},
	nation : {must : true, fieldName : "民族"},
	degree : {must : true, fieldName : "学历/学位"},
	applyMajor : {must : true, fieldName : "申请专业"}
});

var saltValid = mergeObject(relativePersonValid, {
	applyItem : {must : true, fieldName : "申请项目"},
	actualProductionAddress : {must : true, fieldName : "实际生产地址"},
	productionProject : {must : true, fieldName : "生产项目"},
	productionMode : {must : true, fieldName : "生产方式"},
	productionCategory : {must : true, fieldName : "生产类别"}
});

var getAppValidate = function(licenseType) {
	switch (licenseType) {
		case "1":
			return constructionValid;
		case "2":
			return publicValid;
		case "3":
			return waterValid;
		case "4":
			return restaurantValid;
		case "5":
			return radiateValid;
		case "6":
			return adValid;
		case "7":
			return transportValid;
		case "8":
			return doctorValid;
		case "9":
			return saltValid;
		default :
			return null;
	}
};