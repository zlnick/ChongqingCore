// 使用正则表达式校验邮政编码格式（6）
Invariant:   postalcode-length-6
Description: "中国邮政编码长度为6位,只包括数字"
Severity:    #warning
Expression:  "matches('^[0-9]{6}$')"
XPath:       "f"

// 扩展字段，经度
Extension: LongitudeExtension
Id: hc-mdm-longitude
Title: "经度"
Description: "经度，以10进制WGS84经度表示"
Context: Address
* value[x] only decimal

// 扩展字段，纬度
Extension: LatitudeExtension
Id: hc-mdm-latitude
Title: "纬度"
Description: "纬度，以10进制WGS84纬度表示"
Context: Address
* value[x] only decimal

// Address Profile
Profile: OrganizationAddress
Id: hc-mdm-organizationaddress
Title: "组织机构地址"
Parent: Address
Description: "组织机构地址，加入WGS84经纬度"
* extension contains LongitudeExtension named LongitudeExtension 0..1 MS
* extension contains LatitudeExtension named LatitudeExtension 0..1 MS
* line ^short = "详细地址"
* line ^comment = "以字符串记录"
* postalCode ^short = "邮政编码"
* postalCode ^comment = "邮政编码应为6位数字"
// 对邮编添加约束
* postalCode obeys postalcode-length-6

