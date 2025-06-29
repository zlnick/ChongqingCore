Instance: institution-type
InstanceOf: SearchParameter
Usage: #definition
* url = "http://fhir.cq.hc/SearchParameter/institution-type"
* name = "institution-type"
* status = #active
* description = "Search by healthcare institution type code"
* code = #institution-type
* base = #Organization
* type = #token
* expression = "Organization.extension('http://fhir.cq.hc/StructureDefinition/hc-mdm-healthcareinstitutionstype').valueCoding"
* xpathUsage = #normal