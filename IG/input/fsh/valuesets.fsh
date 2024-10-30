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
* include codes from valueset http://hl7.org/fhir/ValueSet/contactentity-type
* include codes from system ChineseContactorTypeCS

ValueSet: CNHospitalLevelVS
Id: cn-hospitalleve-vs
Title: "中国医院三级评审等级值集"
Description: "中国医院三级评审等级值集"
* include codes from system CNHospitalLevelCS

ValueSet: CNAdministrativeDivisionVS
Id: cn-administrativedivision-vs
Title: "中国行政区划值集"
Description: "中国行政区划值集"
* include codes from system CNAdministrativeDivisionCS

ValueSet:  CNNationalEconomicIndustryClassificationVS
Id: cn-nationaleconomicindustryclassification-vs
Title: "经济类型分类值集"
Description:  "国家标准GB-T12402-2000《经济类型分类与代码》值集"
* include codes from system NationalEconomicIndustryClassificationCS

ValueSet:  CNHospitalManagementTypeVS
Id: cn-hospitalmanagementype-vs
Title: "医院管理类型值集"
Description:  "医院管理类型值集"
* include codes from system CNHospitalManagementTypeCS

ValueSet: CQAdministrativeDivisionVS
Id: cq-administrativedivision-vs
Title: "重庆（乡镇街道级）行政区划值集"
Description: "重庆（乡镇街道级）行政区划值集"
* include codes from system CQAdministrativeDivisionCS