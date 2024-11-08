/// 组织机构质控规则
Class MDMDemo.Rules.OrganizationRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="MDMDemo.Process.FHIRDataFlowBPL.Context" production="">
<ruleSet name="OrganizationValidatingRules" effectiveBegin="" effectiveEnd="">
<rule name="必须指定Profile" disabled="false">
<when condition="&quot;&quot;=(GetProfile(resource))" comment="">
<assign property="validatingResult" value="&quot;必须为Organization指定profile:Organization.meta.profile&quot;"></assign>
</when>
</rule>
<return>validatingResult</return>
</ruleSet>
</ruleDefinition>
}

}
