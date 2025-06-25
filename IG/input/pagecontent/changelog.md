本 FHIR 实施指南的所有重大更改都将记录在此页面上。

### 0.1.5 (2025-06-19)

#### 新增

#### 变更
* [卫生机构（组织）分类与代码](CodeSystem-healthcareinstitutionstype-code-system.html)：  
根据卫健委要求，追加了一部分代码，修改了一部分代码以与华宇系统相兼容。 又将“部队医院”改为“部队综合医院”，追加 A730 "护理中心"  
* [统一社会信用代码](StructureDefinition-hc-mdm-organization-definitions.html#key_Organization.identifier:uscc)格式校验规则：  
对首位追加可用字符[A]，使之能兼容特殊的部队医院。

### 0.1.4 (2025-04-28)

#### 新增

#### 变更
根据卫健委当前的数据现状，进一步放宽规则校验的严格程度，包括：
* [卫生机构（组织）分类与代码](CodeSystem-healthcareinstitutionstype-code-system.html)中追加用于兼容备案制卫生机构的代码共6项
* 标准中所有的“行政区划”统一改为“行政区划”
* [组织机构](StructureDefinition-hc-mdm-organization.html)中[邮政编码](StructureDefinition-hc-mdm-organization-definitions.html#key_Organization.address.postalCode)放宽限制，只判定6位数字，不再限于重庆本地邮政编码。

另外，配合FHIR Publisher的更新。
* 取消sushi-config.yaml中的语言设置，便于使用中文字典表。

### 0.1.3 (2025-03-18)

#### 新增

#### 变更
为满足年底卫健委其他部门数据统计要求，暂时取消除组织机构名称外的所有数据校验需求，以期数据入库并分配主索引号，供统计使用。
* [卫生机构](StructureDefinition-hc-healthcare-organization.html)中[卫生机构（组织）代码](StructureDefinition-hc-healthcare-organization-definitions.html#Organization.identifier:hcoc)取消格式限制

### 0.1.2 (2025-01-03)

#### 新增

#### 变更
为满足年底卫健委其他部门数据统计要求，暂时取消除组织机构名称外的所有数据校验需求，以期数据入库并分配主索引号，供统计使用。
* [组织机构](StructureDefinition-hc-mdm-organization.html)中[行政区划(区县)](StructureDefinition-hc-mdm-organization-definitions.html#Organization.extension:AdministrativeDivisionExtension)改为非必填
* [组织机构](StructureDefinition-hc-mdm-organization.html)中[机构运营状态](StructureDefinition-hc-mdm-organization-definitions.html#Organization.extension:OperatingStatusExtension)改为非必填
* [组织机构](StructureDefinition-hc-mdm-organization.html)中[组织机构电话号码](StructureDefinition-hc-mdm-organization-definitions.html#Organization.telecom:phone)改为非必填
* [卫生机构](StructureDefinition-hc-healthcare-organization.html)中[经济类型分类](StructureDefinition-hc-healthcare-organization-definitions.html#Organization.extension:EconomicIndustryClassificationExtension)改为非必填
* [卫生机构](StructureDefinition-hc-healthcare-organization.html)中[卫生机构（组织）分类](StructureDefinition-hc-healthcare-organization-definitions.html#Organization.extension:HealthcareInstitutionsTypeExtension)改为非必填
* [卫生机构](StructureDefinition-hc-healthcare-organization.html)中[医院管理类型](StructureDefinition-hc-healthcare-organization-definitions.html#Organization.extension:HospitalManagementTypeExtension)改为非必填
* [卫生机构](StructureDefinition-hc-healthcare-organization.html)中[卫生机构（组织）代码](StructureDefinition-hc-healthcare-organization-definitions.html#Organization.identifier:hcoc)改为非必填
* [卫生机构](StructureDefinition-hc-healthcare-organization.html)中[医疗机构执业许可证登记号](StructureDefinition-hc-healthcare-organization-definitions.html#Organization.identifier:miplrn)改为非必填




#### 修正


### 0.1.1 (2024)

#### 新增

#### 变更
* 卫生健康机构 统一改名为 卫生机构
* [卫生机构（组织）代码](StructureDefinition-hc-healthcare-organization-definitions.html#key_Organization.identifier:hcoc)遵循[卫生机构（组织）分类与代码](http://www.nhc.gov.cn/wjw/s9497/202305/1091ee3f9c9d491c88e2fe4677f6e4ec.shtml)标准要求，为22位(不含连字符)或者23位代码（含连字符）字符串，只包括数字，大写字母和连字符'-'
* [中国医院三级评审等级](CodeSystem-cn-hospitalleve-code-system.html)中，“X级未定等”统一改为“X级未评”

#### 修正
* [卫生机构（组织）分类与代码](CodeSystem-healthcareinstitutionstype-code-system.html)中
    * 删除分类名称中的无效空格
    * 将分类名称中的半角字符转为全角字符


### 0.1.0 (2024)
初始提交
