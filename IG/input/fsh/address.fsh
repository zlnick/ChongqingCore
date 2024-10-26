
// 扩展字段，经度
Extension: LongitudeExtension
Id: hc-mdm-longitude
Title: "经度"
Description: "经度，以10进制WGS84经度表示"
Context: OrganizationAddress
* value[x] only decimal

// 扩展字段，纬度
Extension: LatitudeExtension
Id: hc-mdm-latitude
Title: "纬度"
Description: "纬度，以10进制WGS84纬度表示"
Context: OrganizationAddress
* value[x] only decimal

// Address Profile
Profile: OrganizationAddress
Id: hc-mdm-organizationaddress
Title: "组织机构地址"
Parent: Address
Description: "组织机构地址"
* extension contains LongitudeExtension named LongitudeExtension 0..1 MS
* extension contains LatitudeExtension named LatitudeExtension 0..1 MS


