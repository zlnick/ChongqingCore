ValueSet: OrganizationTypeVS
Id: organizationtype-vs
Title: "组织机构类型值集"
Description: "国家标准GB/T 20091-2021 组织机构类型值集"
* include codes from system OrganizationTypeCS

ValueSet: HealthcareInstitutionsTypeVS
Id: healthcareinstitutionstype-vs
Title: "卫生机构（组织）分类与代码值集"
Description: "行业标准WS 218-2002 卫生机构（组织）分类与代码值集"
* include codes from system HealthcareInstitutionsTypeCS

ValueSet: CNIdentifierTypeVS
Id: cn-identifierType-vs
Title: "标识类型值集"
Description: "标识类型值集"
* include codes from valueset http://hl7.org/fhir/ValueSet/identifier-type
* include codes from system ChineseIdentifierTypeCS

ValueSet: CNContactorTypeVS
Id: cn-contactorType-vs
Title: "中文联系人类型值集"
Description: "中文联系人类型值集"
* include codes from valueset http://terminology.hl7.org/CodeSystem/contactentity-type
* include codes from system ChineseContactorTypeCS