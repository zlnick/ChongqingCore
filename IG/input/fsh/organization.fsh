// 使用正则表达式校验统一社会信用代码格式（18）
Invariant:   uscc-length-18
Description: "中国统一社会信用代码长度为18位,含17位数字和最后1位校验码"
Severity:    #error
Expression:  "value.matches('^[0-9]{17}[0-9A-Za-z]$')"
XPath:       "f:value"

// 扩展字段，按照国标GB/T 20091-2021记录组织机构类型
Extension: HealthcareInstitutionsTypeExtension
Id: hc-mdm-healthcareinstitutionstype
Title: "卫生机构（组织）分类"
Description: "使用WS 218-2002 卫生机构（组织）分类与代码"
Context: HealthcareMDMOrganization
* value[x] only Coding
* value[x] from HealthcareInstitutionsTypeVS (required)

// Organization Profile
Profile: HealthcareMDMOrganization
Id: hc-mdm-organization
Title: "卫生健康机构主数据"
Parent: Organization
Description: "中国卫生健康机构主数据数据模型"
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
* extension contains HealthcareInstitutionsTypeExtension named HealthcareInstitutionsTypeExtension 1..1 MS
// identifier字段切片，用于指定统一社会信用代码，主索引号码和医疗机构执业许可证登记号等
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "基于identifier类型的切片，使之可容纳组织机构所持统一社会信用代码"
// identifier contains规则
* identifier contains
    miplrn 0..1 MS and
    moi 0..1 MS and
    uscc 1..1 MS
// 医疗机构执业许可证登记号切片
* identifier[miplrn] ^short = "医疗机构执业许可证登记号"
* identifier[miplrn] ^definition = "医疗机构执业许可证登记号"
* identifier[miplrn].use = $iduse#official
* identifier[miplrn].type = ChineseIdentifierTypeCS#MIPLRN
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
    email 0..1 MS
// 医疗机构电话号码切片
* telecom[phone] ^short = "医疗机构电话号码"
* telecom[phone] ^definition = "医疗机构电话号码"
* telecom[phone].system = http://hl7.org/fhir/contact-point-system#phone
* telecom[phone].use = $conuse#work 
// 医疗机构电子邮件地址切片
* telecom[email] ^short = "医疗机构电子邮件地址"
* telecom[email] ^definition = "医疗机构电子邮件地址"
* telecom[email].system = http://hl7.org/fhir/contact-point-system#email
* telecom[email].use = $conuse#work 
// 地址经过扩展，需要容纳经纬度
* address only OrganizationAddress
// 引用上级单位
* partOf ^short = "上级单位"
* partOf ^comment = "引用上级单位，形成上级单位与下级单位的一对多关联"
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
InstanceOf: HealthcareMDMOrganization
Description: "An example of a Organization with a name."
* active = true 
* type = OrganizationTypeCS#121 "事业单位法人"
* name = "长宁市奉孝区中心医院"
* extension[HealthcareInstitutionsTypeExtension].valueCoding = HealthcareInstitutionsTypeCS#A1 "综合医院"
* telecom[phone].system = http://hl7.org/fhir/contact-point-system#phone
* telecom[phone].use = $conuse#work
* telecom[phone].value = "+86-23-65100171"
* telecom[email].system = http://hl7.org/fhir/contact-point-system#email
* telecom[email].use = $conuse#work
* telecom[email].value = "abc@cnu.org"
* identifier[miplrn].use = $iduse#official
* identifier[miplrn].type = ChineseIdentifierTypeCS#MIPLRN "医疗机构执业许可证登记号"
* identifier[miplrn].value = "561106500103211311"
* identifier[moi].use = $iduse#official
* identifier[moi].type = ChineseIdentifierTypeCS#MOI "机构主索引号码"
* identifier[moi].value = "82783739457838954"
* identifier[uscc].use = $iduse#official
* identifier[uscc].type = ChineseIdentifierTypeCS#USCC "统一社会信用代码"
* identifier[uscc].value = "12330000470051726F"
* address[0].extension[LongitudeExtension].valueDecimal = 106.55
* address[0].extension[LatitudeExtension].valueDecimal = 29.55
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


