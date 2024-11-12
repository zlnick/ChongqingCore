本标准中包括如下数据模型。

## [组织机构](StructureDefinition-hc-mdm-organization.html)

本标准中所指的组织机构，是指除[卫生健康机构](#卫生健康机构)外的，为实现某种形式的集体行动而组成的正式或非正式认可的人员或组织团体。包括公司、机构、企业、部门、社区团体、付款人/承保人等。  
本标准中的组织机构定义基于[HL7 FHIR](https://hl7.org/fhir/R4/)标准的[Organization](https://hl7.org/fhir/R4/organization.html)资源进行扩展，加入了适应国内应用所需的国标机构类型，联系人等信息。
组织机构数据模型中包含的数据元素如下：




## [卫生健康机构](StructureDefinition-hc-healthcare-organization.html)
卫生健康机构提供卫生健康服务，是组织机构的一种细分类型。 卫生健康机构是组织机构的子类型，通过在本标准的组织机构资源之上扩展卫生健康机构所具有的卫生机构分类行标、医疗机构执业许可证登记号的数据元素获得。
除包括组织机构中所有的数据元素外，卫生健康机构包括的数据元素如下：


组织机构与卫生健康机构两种类型都是Organization资源的子类型，具有Organization资源的所有属性，但遵循不同的规范，通过绑定不同的术语集，扩展[Extension](https://hl7.org/fhir/R4/extensibility.html#Extension)元素获得适合中国国情的更多信息。  



