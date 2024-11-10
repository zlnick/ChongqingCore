// 扩展字段，使用WS 218-2002 卫生机构（组织）分类与代码记录卫生机构类型
Extension: HealthcareInstitutionsTypeExtension
Id: hc-mdm-healthcareinstitutionstype
Title: "卫生机构（组织）分类"
Description: "使用WS 218-2002 卫生机构（组织）分类与代码"
Context: HealthcareOrganization
* value[x] only Coding
* value[x] from HealthcareInstitutionsTypeVS (required)

// 扩展字段，记录中国医院三级评审等级
Extension: HospitalLevelExtension
Id: hc-mdm-hospitallevel
Title: "中国医院三级评审等级"
Description: "中国医院三级评审等级"
Context: HealthcareOrganization
* value[x] only Coding
* value[x] from CNHospitalLevelVS (required)

// 扩展字段，记录医院管理类型
Extension: HospitalManagementTypeExtension
Id: hc-mdm-hospitalmanagementype
Title: "医院管理类型"
Description: "医院管理类型"
Context: HealthcareOrganization
* value[x] only Coding
* value[x] from CNHospitalManagementTypeVS (required)

// 扩展字段，记录次要组织机构类型信息
Extension: SecondaryHealthcareInstitutionsInfoExtension
Id: hc-mdm-secondaryhealthcareinstitutionsinfo
Title: "次要组织机构信息"
Description: "包含次要组织机构名称与类型两个属性，其中次要组织机构类型需使用WS 218-2002 卫生机构（组织）分类与代码。"
Context: HealthcareOrganization
* extension contains
    secondaryType 0..1 MS and
    secondaryName 0..1
* extension[secondaryType] ^short = "次要组织机构类型"
* extension[secondaryType].value[x] only Coding
* extension[secondaryType].value[x] from HealthcareInstitutionsTypeVS (required) // OmbEthnicityCategories is a value set defined by US Core
* extension[secondaryName] ^short = "次要组织机构名称"
* extension[secondaryName].value[x] only string

// Organization Profile
Profile: HealthcareOrganization
Id: hc-healthcare-organization
Title: "卫生健康机构主数据"
Parent: MDMOrganization
Description: "中国卫生健康机构主数据数据模型"
* extension contains HealthcareInstitutionsTypeExtension named HealthcareInstitutionsTypeExtension 1..1 MS
* extension contains HospitalLevelExtension named HospitalLevelExtension 1..1 MS
* extension contains HospitalManagementTypeExtension named HospitalManagementTypeExtension 1..1 MS
* extension contains SecondaryHealthcareInstitutionsInfoExtension named SecondaryHealthcareInstitutionsInfoExtension 0..* MS
// identifier字段切片，用于指定统一社会信用代码，主索引号码和医疗机构执业许可证登记号等
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "基于identifier类型的切片，使之可容纳组织机构所持统一社会信用代码"
// identifier contains规则
* identifier contains
    miplrn 0..1 MS
// 医疗机构执业许可证登记号切片
* identifier[miplrn] ^short = "医疗机构执业许可证登记号"
* identifier[miplrn] ^definition = "医疗机构执业许可证登记号"
* identifier[miplrn].use = $iduse#official
* identifier[miplrn].type = ChineseIdentifierTypeCS#MIPLRN



Instance: ChangningFengxiaoDistrictCentralHospital
InstanceOf: HealthcareOrganization
Description: "长宁市奉孝区中心医院(虚拟医院)"
* active = true 
* type = OrganizationTypeCS#121 "事业单位法人"
* name = "长宁市奉孝区中心医院"
* extension[AdministrativeDivisionExtension].valueCoding = CQAdministrativeDivisionCS#500105 "江北区"
* extension[StreetDivisionExtension].valueCoding = CQStreetDivisionCS#500105011 "石马河街道"
* extension[HealthcareInstitutionsTypeExtension].valueCoding = HealthcareInstitutionsTypeCS#A1 "综合医院"
* extension[HospitalLevelExtension].valueCoding = CNHospitalLevelCS#2 "三级甲等"
* extension[EconomicIndustryClassificationExtension].valueCoding = NationalEconomicIndustryClassificationCS#110 "国有全资"
* extension[HospitalManagementTypeExtension].valueCoding = CNHospitalManagementTypeCS#1 "非营利性医疗机构"
* extension[SecondaryHealthcareInstitutionsInfoExtension][0].extension[secondaryType].valueCoding = HealthcareInstitutionsTypeCS#E100 "急救中心"
* extension[SecondaryHealthcareInstitutionsInfoExtension][0].extension[secondaryName].valueString = "长宁市急救中心"
* extension[SupervisedByExtension].valueReference.type = "Organization"
* extension[SupervisedByExtension].valueReference.identifier.type = ChineseIdentifierTypeCS#MOI "机构主索引号码"
* extension[SupervisedByExtension].valueReference.identifier.value = "1638748745645060"
* extension[SupervisedByExtension].valueReference.display = "重庆市渝中区卫生健康委员会"
* extension[IsBranchExtension].valueBoolean = false
* extension[OperatingStatusExtension].valueCoding = OperatingStatusCS#0 "开业"
* telecom[phone].system = http://hl7.org/fhir/contact-point-system#phone
* telecom[phone].use = $conuse#work
* telecom[phone].value = "+86-23-65100171"
* telecom[email].system = http://hl7.org/fhir/contact-point-system#email
* telecom[email].use = $conuse#work
* telecom[email].value = "abc@cnu.org"
* telecom[website].system = http://hl7.org/fhir/contact-point-system#url
* telecom[website].use = $conuse#work
* telecom[website].value = "https://abc.bj.org.cn"
* identifier[miplrn].use = $iduse#official
* identifier[miplrn].type = ChineseIdentifierTypeCS#MIPLRN "医疗机构执业许可证登记号"
* identifier[miplrn].value = "561106500103211311"
* identifier[moi].use = $iduse#official
* identifier[moi].type = ChineseIdentifierTypeCS#MOI "机构主索引号码"
* identifier[moi].value = "82783739457838954"
* identifier[uscc].use = $iduse#official
* identifier[uscc].type = ChineseIdentifierTypeCS#USCC "统一社会信用代码"
* identifier[uscc].value = "12330000470051726F"
* address[0].extension[OrganizationGISExtension].extension[longitude].valueDecimal = 106.55
* address[0].extension[OrganizationGISExtension].extension[latitude].valueDecimal = 29.55
* address[0].use = http://hl7.org/fhir/address-use#work
* address[0].type = http://hl7.org/fhir/address-type#physical
* address[0].line = "XX省长宁市奉孝区健康路1号"
* address[0].postalCode = "100210"
* contact[contactor].purpose = ChineseContactorTypeCS#CON
* contact[contactor].name.text = "张无忌"
* contact[contactor].telecom[phone].system = http://hl7.org/fhir/contact-point-system#phone
* contact[contactor].telecom[phone].use = $conuse#work
* contact[contactor].telecom[phone].value = "+86-18502032240"
* contact[contactor].telecom[email].system = http://hl7.org/fhir/contact-point-system#email
* contact[contactor].telecom[email].use = $conuse#work
* contact[contactor].telecom[email].value = "wj.z@cnu.org"

Instance: ChangningFengxiaoDistrictCentralHospitalBranch
InstanceOf: HealthcareOrganization
Description: "长宁市奉孝区中心医院龙翔路分院"
* active = true 
* type = OrganizationTypeCS#121 "事业单位法人"
* name = "长宁市奉孝区中心医院龙翔路分院"
* extension[AdministrativeDivisionExtension].valueCoding = CQAdministrativeDivisionCS#500117 "合川区"
* extension[StreetDivisionExtension].valueCoding = CQStreetDivisionCS#500117103 "官渡镇"
* extension[HealthcareInstitutionsTypeExtension].valueCoding = HealthcareInstitutionsTypeCS#A1 "综合医院"
* extension[HospitalLevelExtension].valueCoding = CNHospitalLevelCS#5 "二级甲等"
* extension[EconomicIndustryClassificationExtension].valueCoding = NationalEconomicIndustryClassificationCS#110 "国有全资"
* extension[HospitalManagementTypeExtension].valueCoding = CNHospitalManagementTypeCS#1 "非营利性医疗机构"
* extension[SupervisedByExtension].valueReference.type = "Organization"
* extension[SupervisedByExtension].valueReference.identifier.type = ChineseIdentifierTypeCS#MOI "机构主索引号码"
* extension[SupervisedByExtension].valueReference.identifier.value = "1638748745645060"
* extension[SupervisedByExtension].valueReference.display = "重庆市渝中区卫生健康委员会"
* extension[IsBranchExtension].valueBoolean = true
* extension[OperatingStatusExtension].valueCoding = OperatingStatusCS#1 "筹建"
* telecom[phone].system = http://hl7.org/fhir/contact-point-system#phone
* telecom[phone].use = $conuse#work
* telecom[phone].value = "+86-23-65203427"
* identifier[moi].use = $iduse#official
* identifier[moi].type = ChineseIdentifierTypeCS#MOI "机构主索引号码"
* identifier[moi].value = "82783739457838954"
* address[0].extension[OrganizationGISExtension].extension[longitude].valueDecimal = 106.58
* address[0].extension[OrganizationGISExtension].extension[latitude].valueDecimal = 29.51
* address[0].use = http://hl7.org/fhir/address-use#work
* address[0].type = http://hl7.org/fhir/address-type#physical
* address[0].line = "XX省长宁市奉孝区龙翔路42号"
* address[0].postalCode = "100210"
* contact[contactor].purpose = ChineseContactorTypeCS#CON
* contact[contactor].name.text = "李广利"
* contact[contactor].telecom[phone].system = http://hl7.org/fhir/contact-point-system#phone
* contact[contactor].telecom[phone].use = $conuse#work
* contact[contactor].telecom[phone].value = "+86-18412594521"
* contact[contactor].telecom[email].system = http://hl7.org/fhir/contact-point-system#email
* contact[contactor].telecom[email].use = $conuse#work
* contact[contactor].telecom[email].value = "lgl@fxh.orn.cn"
* partOf.type = "Organization"
* partOf.identifier.type = ChineseIdentifierTypeCS#MOI "机构主索引号码"
* partOf.identifier.value = "82783739457838954"
* partOf..display = "长宁市奉孝区中心医院"




