本 FHIR 实施指南的所有重大更改都将记录在此页面上。

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
