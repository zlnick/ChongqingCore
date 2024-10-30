// 使用正则表达式校验统一社会信用代码格式（18）
Invariant:   uscc-length-18
Description: "中国统一社会信用代码长度为18位,含17位数字和最后1位校验码"
Severity:    #error
Expression:  "value.matches('^[0-9]{17}[0-9A-Za-z]$')"
XPath:       "f:value"

// 扩展字段，记录所属行政区域
Extension: AdministrativeDivisionExtension
Id: hc-mdm-administrativedivision
Title: "所属行政区域"
Description: "所属行政区域"
Context: MDMOrganization
* value[x] only Coding
* value[x] from CNAdministrativeDivisionVS (required)

// 扩展字段，记录重庆乡镇街道级行政区划
Extension: CQAdministrativeDivisionExtension
Id: hc-mdm-cqadministrativedivision
Title: "所属重庆街道级行政区域"
Description: "所属重庆街道级行政区域"
Context: MDMOrganization
* value[x] only Coding
* value[x] from CQAdministrativeDivisionVS (required)

// 扩展字段，记录组织机构经济类型
Extension: EconomicIndustryClassificationExtension
Id: hc-mdm-economicindustryclassification
Title: "经济类型分类"
Description: "经济类型分类"
Context: MDMOrganization
* value[x] only Coding
* value[x] from CNNationalEconomicIndustryClassificationVS

// 扩展字段，引用上级管理机构
Extension: SupervisedByExtension
Id: hc-mdm-supervisedby
Title: "上级监管机构"
Description: "由被监管机构引用监管机构，例如县医院引用县卫健委。"
Context: MDMOrganization
* value[x] only Reference

// Organization Profile
Profile: MDMOrganization
Id: hc-mdm-organization
Title: "组织机构主数据"
Parent: Organization
Description: "中国组织机构主数据数据模型"
* extension contains AdministrativeDivisionExtension named AdministrativeDivisionExtension 1..1 MS
* extension contains CQAdministrativeDivisionExtension named CQAdministrativeDivisionExtension 0..1 MS
* extension contains EconomicIndustryClassificationExtension named EconomicIndustryClassificationExtension 0..1 MS
* extension contains SupervisedByExtension named SupervisedByExtension 0..* MS
* active ^short = "记录有效标识"
* active ^comment = "以布尔值（true | false）表达记录是否有效，true为有效，false为无效"
* active 1..1 MS
* type ^short = "机构类型"
* type ^comment = "以国家标准GB/T 20091-2021 组织机构类型表述"
* type from OrganizationTypeVS
* name ^short = "与统一社会信用代码对应的组织机构名称"
* name ^comment = "其他名称应使用别名（alias）表述"
* name 1..1 MS 
* alias ^short = "除统一社会信用代码对应的组织机构名称之外的所有别名"
// identifier字段切片，用于指定统一社会信用代码，主索引号码和组织机构执业许可证登记号等
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "基于identifier类型的切片，使之可容纳组织机构所持统一社会信用代码"
// identifier contains规则
* identifier contains
    moi 0..1 MS and
    uscc 1..1 MS
// 机构主索引切片
* identifier[moi] ^short = "机构主索引号码"
* identifier[moi] ^definition = "机构主索引号码，由主数据管理平台分配和维护"
* identifier[moi].use = $iduse#official
* identifier[moi].type = ChineseIdentifierTypeCS#MOI
// 统一社会信用代码切片
* identifier[uscc] ^short = "统一社会信用代码"
* identifier[uscc] ^definition = "统一社会信用代码，必须符合格式约束"
* identifier[uscc].use = $iduse#official
* identifier[uscc].type = ChineseIdentifierTypeCS#USCC
// 对社会信用代码字段添加约束
* identifier[uscc] obeys uscc-length-18
// telecom字段切片，用于指定组织电话和电子邮箱
* telecom ^slicing.discriminator.type = #pattern
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #open
* telecom ^slicing.ordered = false 
* telecom ^slicing.description = "telecom字段切片，用于指定组织电话和电子邮箱"
// telecom contains规则
* telecom contains
    phone 0..1 MS and
    email 0..1 MS and
    website 0..1 MS
// 组织机构电话号码切片
* telecom[phone] ^short = "组织机构电话号码"
* telecom[phone] ^definition = "组织机构电话号码"
* telecom[phone].system = http://hl7.org/fhir/contact-point-system#phone
* telecom[phone].use = $conuse#work 
// 组织机构电子邮件地址切片
* telecom[email] ^short = "组织机构电子邮件地址"
* telecom[email] ^definition = "组织机构电子邮件地址"
* telecom[email].system = http://hl7.org/fhir/contact-point-system#email
* telecom[email].use = $conuse#work 
// 组织机构网站地址切片
* telecom[website] ^short = "组织机构网站地址"
* telecom[website] ^definition = "组织机构网站地址"
* telecom[website].system = http://hl7.org/fhir/contact-point-system#url
* telecom[website].use = $conuse#work 
// 地址经过扩展，需要容纳经纬度
* address only OrganizationAddress
// 引用主机构
* partOf ^short = "主机构"
* partOf ^comment = "引用主机构，形成分支机构与主机构的多对一关联，例如分院区引用主院区。"
// contact字段切片，用于指定组织联系人或负责人等
* contact ^slicing.discriminator.type = #pattern
* contact ^slicing.discriminator.path = "purpose"
* contact ^slicing.rules = #open
* contact ^slicing.ordered = false 
* contact ^slicing.description = "contact字段切片，用于指定组织联系人或负责人等"
// telecom contains规则
* contact contains
    contactor 0..1 MS
// 联系人切片
* contact[contactor] ^short = "联系人"
* contact[contactor] ^definition = "组织机构联系人"
* contact[contactor].purpose = ChineseContactorTypeCS#CON
// contact[contactor].telecom字段切片，用于指定联系人电话和电子邮箱
* contact[contactor].telecom ^slicing.discriminator.type = #pattern
* contact[contactor].telecom ^slicing.discriminator.path = "system"
* contact[contactor].telecom ^slicing.rules = #open
* contact[contactor].telecom ^slicing.ordered = false 
* contact[contactor].telecom ^slicing.description = "contact[contactor].telecom字段切片，用于指定联系人电话和电子邮箱"
// contact[contactor].telecom contains规则
* contact[contactor].telecom contains
    phone 0..1 MS and
    email 0..1 MS
// 联系人电话号码切片
* contact[contactor].telecom[phone] ^short = "联系人电话号码"
* contact[contactor].telecom[phone] ^definition = "联系人电话号码"
* contact[contactor].telecom[phone].system = http://hl7.org/fhir/contact-point-system#phone
* contact[contactor].telecom[phone].use = $conuse#work 
// 联系人电子邮件地址切片
* contact[contactor].telecom[email] ^short = "联系人电子邮件地址"
* contact[contactor].telecom[email] ^definition = "联系人电子邮件地址"
* contact[contactor].telecom[email].system = http://hl7.org/fhir/contact-point-system#email
* contact[contactor].telecom[email].use = $conuse#work 


Instance: OrganizationExample
InstanceOf: MDMOrganization
Description: "重庆市卫生健康委员会"
* active = true 
* type = OrganizationTypeCS#121 "事业单位法人"
* name = "重庆市卫生健康委员会"
* extension[AdministrativeDivisionExtension].valueCoding = CNAdministrativeDivisionCS#110101 "东城区"
* extension[CQAdministrativeDivisionExtension].valueCoding = CQAdministrativeDivisionCS#500112005 "龙山街道"
* telecom[phone].system = http://hl7.org/fhir/contact-point-system#phone
* telecom[phone].use = $conuse#work
* telecom[phone].value = "+86-23-67706707"
* telecom[email].system = http://hl7.org/fhir/contact-point-system#email
* telecom[email].use = $conuse#work
* telecom[email].value = "abc@cnu.org"
* telecom[website].system = http://hl7.org/fhir/contact-point-system#url
* telecom[website].use = $conuse#work
* telecom[website].value = "https://wsjkw.cq.gov.cn"
* identifier[moi].use = $iduse#official
* identifier[moi].type = ChineseIdentifierTypeCS#MOI "机构主索引号码"
* identifier[moi].value = "82783739457838954"
* identifier[uscc].use = $iduse#official
* identifier[uscc].type = ChineseIdentifierTypeCS#USCC "统一社会信用代码"
* identifier[uscc].value = "11500000MB1670604W"
* address[0].extension[LongitudeExtension].valueDecimal = 106.55
* address[0].extension[LatitudeExtension].valueDecimal = 29.55
* address[0].use = http://hl7.org/fhir/address-use#work
* address[0].type = http://hl7.org/fhir/address-type#physical
* address[0].line = " 重庆市渝北区旗龙路6号"
* address[0].postalCode = "401147"

