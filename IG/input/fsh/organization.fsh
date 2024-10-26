// 使用正则表达式校验统一社会信用代码长度（）
Invariant:   uscc-length-18
Description: "中国统一社会信用代码长度为18位,含17位数字和最后1位校验码"
Severity:    #error
Expression:  "value.matches('^[0-9]{17}[0-9A-Za-z]$')"
XPath:       "f:value"

// 扩展字段，按照国标GB/T 20091-2021记录组织机构类型
Extension: HealthcareInstitutionsTypeExtension
Id: hc-mdm-healthcareinstitutionstype
Title: "卫生机构（组织）分类"
Context: HealthcareMDMOrganization
* value[x] only Coding
* value[x] from HealthcareInstitutionsTypeVS (required)

// Organization Profile
Profile: HealthcareMDMOrganization
Id: hc-mdm-organization
Title: "卫生健康机构主数据"
Parent: Organization
Description: "中国卫生健康机构主数据数据模型"
* language from $lan (required)
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
* identifier ^slicing.ordered = false   // can be omitted, since false is the default
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
* identifier[miplrn].type = ChineseIdentifierTypeCS#MIPLRN "医疗机构执业许可证登记号"
// 机构主索引切片
* identifier[moi] ^short = "机构主索引号码"
* identifier[moi] ^definition = "机构主索引号码，由主数据管理平台分配和维护"
* identifier[moi].use = $iduse#official
* identifier[moi].type = ChineseIdentifierTypeCS#MOI "机构主索引号码"
// 统一社会信用代码切片
* identifier[uscc] ^short = "统一社会信用代码"
* identifier[uscc] ^definition = "统一社会信用代码，必须符合格式约束"
* identifier[uscc].use = $iduse#official
* identifier[uscc].type = ChineseIdentifierTypeCS#USCC "统一社会信用代码"
// 对社会信用代码字段添加约束
* identifier[uscc] obeys uscc-length-18
* address only OrganizationAddress
* partOf ^short = "上级单位"
* partOf ^comment = "引用上级单位，形成上级单位与下级单位的一对多关联"

Instance: OrganizationExample
InstanceOf: HealthcareMDMOrganization
Description: "An example of a Organization with a name."
* active = true 
* type = OrganizationTypeCS#121 "事业单位法人"
* name = "长宁市奉孝区中心医院"
* extension[HealthcareInstitutionsTypeExtension].valueCoding = HealthcareInstitutionsTypeCS#A1 "综合医院"
* identifier[miplrn].use = $iduse#official
* identifier[miplrn].type = ChineseIdentifierTypeCS#MIPLRN "医疗机构执业许可证登记号"
* identifier[miplrn].value = "561106500103211311"
* identifier[moi].use = $iduse#official
* identifier[moi].type = ChineseIdentifierTypeCS#MOI "机构主索引号码"
* identifier[moi].value = "82783739457838954"
* identifier[uscc].use = $iduse#official
* identifier[uscc].type = ChineseIdentifierTypeCS#USCC "统一社会信用代码"
* identifier[uscc].value = "12330000470051726F"

