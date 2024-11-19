本标准中包括如下数据模型。

## [组织机构](StructureDefinition-hc-mdm-organization.html)

本标准中所指的组织机构，是指除[卫生健康机构](#卫生健康机构)外的，为实现某种形式的集体行动而组成的正式或非正式认可的人员或组织团体。包括公司、机构、企业、部门、社区团体、付款人/承保人等。  
本标准中的组织机构定义基于[HL7 FHIR](https://hl7.org/fhir/R4/)标准的[Organization](https://hl7.org/fhir/R4/organization.html)资源进行扩展，加入了适应国内应用所需的国标机构类型，联系人等信息。  
组织机构数据模型中覆盖的数据需求如下：   

| 数据需求 | 基数 | 元素含义 | 约束 | FHIR路径 |
| -------------- | ---- | ------------------------ | ---------------- | -------- |
| 机构主索引号 | 0..1 | 由平台统一分配管理的主索引号码 | 无 | [Organization.identifier:moi](StructureDefinition-hc-mdm-organization-definitions.html#Organization.identifier:moi) |
| 机构名称 | 1..1 | 与统一社会信用代码对应的组织机构名称 | 无 | [Organization.name](StructureDefinition-hc-mdm-organization-definitions.html#Organization.name) |
| 别名 | 0..* | 除首要名称之外的其他名称，例如简称或其他非官方名称 | 无 | [Organization.alias](StructureDefinition-hc-mdm-organization-definitions.html#Organization.alias) |
| 统一社会信用代码 | 0..1 | 法人和其他组织统一社会信用代码主体标识 | 源于GB 32100-2015 《法人和其他组织统一社会信用代码编码规则》，中国统一社会信用代码长度为18位。| [Organization.identifier:uscc](StructureDefinition-hc-mdm-organization-definitions.html#Organization.identifier:uscc) |
| 机构运营状态 | 1..1 | 机构处于何种运营状态 | [operatingstatus-vs](ValueSet-operatingstatus-vs.html) | [Organization.extension:OperatingStatusExtension](StructureDefinition-hc-mdm-organization-definitions.html#Organization.extension:OperatingStatusExtension) |
| 上级监管机构 | 0..* | 引用上级监管机构 | 建立对上级监管机构的引用 | [Organization.extension:SupervisedByExtension](StructureDefinition-hc-mdm-organization-definitions.html#Organization.extension:SupervisedByExtension) |
| 经济类型分类 | 0..1 | 按照国家标准划定的经济类型 | [cn-nationaleconomicindustryclassification-vs](ValueSet-cn-nationaleconomicindustryclassification-vs.html) | [Organization.extension:EconomicIndustryClassificationExtension](StructureDefinition-hc-mdm-organization-definitions.html#Organization.extension:EconomicIndustryClassificationExtension) |
| 民政区划(区县) | 1..1 | 机构所处民政区划(区县) | [cq-administrativedivision-vs](ValueSet-cq-administrativedivision-vs.html) | [Organization.extension:AdministrativeDivisionExtension](StructureDefinition-hc-mdm-organization-definitions.html#Organization.extension:AdministrativeDivisionExtension) |
| 民政区划(街道) | 0..1 | 机构所处民政区划(街道) | [cq-streetdivision-vs](ValueSet-cq-streetdivision-vs.html) | [Organization.extension:StreetDivisionExtension](StructureDefinition-hc-mdm-organization-definitions.html#Organization.extension:StreetDivisionExtension) |
| 详细地址 | 0..1 | 详细地址 | 无 | [Organization.address.line](StructureDefinition-hc-mdm-organization-definitions.html#Organization.address.line) |
| 地理位置坐标 | 0..1 | 机构所处经纬度 | 无 | [Organization.address.extension:OrganizationGISExtension](StructureDefinition-hc-mdm-organization-definitions.html#Organization.address.extension:OrganizationGISExtension) |
| 机构邮政编码 | 0..1 | 机构邮政编码 | 无 | [Organization.address.postalCode](StructureDefinition-hc-mdm-organization-definitions.html#Organization.address.postalCode) |
| 机构联系电话 | 0..1 | 组织机构电话号码 | 无 | [Organization.telecom:phone](StructureDefinition-hc-mdm-organization-definitions.html#Organization.telecom:phone) |
| 机构电子邮箱 | 0..1 | 组织机构电子邮件地址 | 无 | [Organization.telecom:email](StructureDefinition-hc-mdm-organization-definitions.html#Organization.telecom:email) |
| 机构网站域名 | 0..1 | 组织机构网站地址 | 无 | [Organization.telecom:website](StructureDefinition-hc-mdm-organization-definitions.html#Organization.telecom:website) |
| 联系人姓名 | 0..1 | 联系人姓名 | 无 | [Organization.contact:contactor.name](StructureDefinition-hc-mdm-organization-definitions.html#Organization.contact:contactor.name) |
| 联系人电话 | 0..1 | 联系人电话号码 | 无 | [Organization.contact:contactor.telecom:phone](StructureDefinition-hc-mdm-organization-definitions.html#Organization.contact:contactor.telecom:phone) |
| 联系人邮箱 | 0..1 | 联系人电子邮件地址 | 无 | [Organization.contact:contactor.telecom:email](StructureDefinition-hc-mdm-organization-definitions.html#Organization.contact:contactor.telecom:email) |
{:.grid}



## [卫生健康机构](StructureDefinition-hc-healthcare-organization.html)
卫生健康机构提供卫生健康服务，是组织机构的一种细分类型。 卫生健康机构是组织机构的子类型，通过在本标准的组织机构资源之上扩展卫生健康机构所具有的卫生机构分类行标、医疗机构执业许可证登记号的数据元素获得。  
除包括组织机构中所有的数据元素外，卫生健康机构包括的数据元素如下：  

| 数据需求 | 基数 | 元素含义 | 约束 | FHIR路径 |
| -------------- | ---- | ------------------------------------ | ------------ | -------- |
| 医疗机构执业许可证登记号 | 0..1 | 医疗机构执业许可证登记号 | 无 | [Organization.identifier:miplrn](StructureDefinition-hc-healthcare-organization-definitions.html#Organization.identifier:miplrn) |
| 卫生机构分类 | 1..1 | 卫生机构（组织）分类 | [healthcareinstitutionstype-vs](ValueSet-healthcareinstitutionstype-vs.html) | [Organization.extension:HealthcareInstitutionsTypeExtension](StructureDefinition-hc-healthcare-organization-definitions.html#Organization.extension:HealthcareInstitutionsTypeExtension) |
| 次要组织机构名称 | 0..* | 次要组织机构名称，与次要组织机构类型成对出现。次要组织机构名称为医疗机构除与统一社会信用代码对应的名称外还具有的其他具备医疗服务职能的官方名称，如某市胸痛中心，某市急救中心等，与非官方的别名不同。 | 无 | [Organization.extension:SecondaryHealthcareInstitutionsInfoExtension.extension:secondaryName](StructureDefinition-hc-mdm-secondaryhealthcareinstitutionsinfo-definitions.html#Extension.extension:secondaryName) |
| 次要组织机构类型 | 0..* | 次要组织机构类型，与次要组织机构名称成对出现。 次要组织机构类型需使用WS 218-2002 卫生机构（组织）分类与代码。| [healthcareinstitutionstype-vs](ValueSet-healthcareinstitutionstype-vs.html) | [Organization.extension:SecondaryHealthcareInstitutionsInfoExtension.extension:secondaryType](StructureDefinition-hc-mdm-secondaryhealthcareinstitutionsinfo-definitions.html#Extension.extension:secondaryType) |
| 中国医院三级评审等级 | 1..1 | 中国医院三级评审等级 | [cn-hospitalleve-vs](ValueSet-cn-hospitalleve-vs.html) | [Organization.extension:HospitalLevelExtension](StructureDefinition-hc-healthcare-organization-definitions.html#Organization.extension:HospitalLevelExtension) |
| 医院管理类型 | 1..1 | 医院管理类型 | [cn-hospitalmanagementype-vs](ValueSet-cn-hospitalmanagementype-vs.html) | [Organization.extension:HospitalManagementTypeExtension](StructureDefinition-hc-healthcare-organization-definitions.html#Organization.extension:HospitalManagementTypeExtension) |
| 主机构 | 0..1 | 为分支机构时引用主机构 | 建立对主机构的引用 | [Organization.partOf](StructureDefinition-hc-healthcare-organization-definitions.html#Organization.partOf) |
{:.grid}


组织机构与卫生健康机构两种类型都是Organization资源的子类型，具有Organization资源的所有属性，但遵循不同的规范，通过绑定不同的术语集，扩展[Extension](https://hl7.org/fhir/R4/extensibility.html#Extension)元素获得适合中国国情的更多信息。    
组织机构对应的profile是：[标准发布地址]/StructureDefinition/hc-mdm-organization|0.1.0  
卫生健康机构对应的profile是：[标准发布地址]/StructureDefinition/hc-healthcare-organization|0.1.0  




