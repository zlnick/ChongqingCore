// 使用正则表达式校验统一社会信用代码长度（）
Invariant:   uscc-length-18
Description: "中国统一社会信用代码长度为18位,含17位数字和最后1位校验码"
Severity:    #error
Expression:  "value.matches('^[0-9]{17}[0-9A-Za-z]$')"
XPath:       "f:value"

// 扩展字段，按照国标GB/T 20091-2021记录组织机构类型
Extension: HealthcareMDMOrganizationTypeExtension
Id: hc-mdm-organizationTypeExtension
Title: "组织机构主类型"
Context: HealthcareMDMOrganization
* value[x] only Coding
* value[x] from OrganizationTypeVS (required)

// Organization Profile
Profile: HealthcareMDMOrganization
Id: hc-mdm-organization
Title: "卫生健康机构主数据"
Parent: Organization
Description: "An example profile of the Organization resource."
* language from $lan (required)
* active 1..1 MS
* name ^short = "与统一社会信用代码对应的组织机构名称"
* name ^comment = "其他名称应使用别名（alias）表述"
* alias ^short = "除统一社会信用代码对应的组织机构名称之外的所有别名"
* name 1..1 MS 
* extension contains HealthcareMDMOrganizationTypeExtension named HealthcareMDMOrganizationTypeExtension 1..1 MS
// identifier字段切片，用于指定组织机构所持统一社会信用代码
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
// 机构主索引切片
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

Instance: OrganizationExample
InstanceOf: HealthcareMDMOrganization
Description: "An example of a Organization with a name."
* active = true 
* name = "长宁市奉孝区中心医院"
* extension[HealthcareMDMOrganizationTypeExtension].valueCoding = OrganizationTypeCS#121 "事业单位法人"
* identifier[miplrn].use = $iduse#official
* identifier[miplrn].type = ChineseIdentifierTypeCS#MIPLRN "医疗机构执业许可证登记号"
* identifier[miplrn].value = "561106500103211311"
* identifier[moi].use = $iduse#official
* identifier[moi].type = ChineseIdentifierTypeCS#MOI "机构主索引号码"
* identifier[moi].value = "82783739457838954"
* identifier[uscc].use = $iduse#official
* identifier[uscc].type = ChineseIdentifierTypeCS#USCC "统一社会信用代码"
* identifier[uscc].value = "12330000470051726F"

