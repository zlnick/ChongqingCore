/// 
Class MDMDemo.Process.FHIRDataFlowBPL Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='HS.FHIRServer.Interop.Request' response='HS.FHIRServer.Interop.Response' height='2250' width='2000' >
<context>
<property name='validatingStatus' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='validatingResult' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='2500' />
</parameters>
</property>
<property name='profile' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='2500' />
</parameters>
</property>
<property name='resource' type='HS.FHIR.DTL.vR4.Model.Base.DomainResource' instantiate='0' />
<property name='tempResp' type='HS.FHIRServer.Interop.Response' instantiate='0' />
<property name='tempOutCome' type='HS.FHIR.DTL.vR4.Model.Resource.OperationOutcome' instantiate='0' />
</context>
<sequence xend='200' yend='2000' >
<if name='是POST请求' condition='"POST" = request.Request.RequestMethod' xpos='200' ypos='250' xend='200' yend='1900' >
<true>
<switch name='按资源类型分支' xpos='470' ypos='400' xend='470' yend='1800' >
<case condition='"Organization" = request.Request.RequestPath' name='Organization' >
<assign name="构造FHIR Organization对象" property="context.resource" value="##class(HS.FHIR.DTL.vR4.Model.Resource.Organization).FromJSON(##class(HS.SDA3.QuickStream).%OpenId(request.QuickStreamId),&quot;vR4&quot;)" action="set" languageOverride="" xpos='740' ypos='550' />
<assign name="获得profile" property="context.profile" value="##class(MDMDemo.Utils.FHIRObjectUtils).GetProfile(context.resource)" action="set" languageOverride="" xpos='740' ypos='650' />
<rule name='运行Profile约束规则' rule='MDMDemo.Rules.OrganizationRule'  resultLocation='context.validatingResult' reasonLocation='context.validatingStatus' ruleContext='context' xpos='740' ypos='750' >
</rule>
<assign name="设置请求路径 - 调用FHIR校验" property="request.Request.RequestPath" value="request.Request.RequestPath_&quot;/$validate&quot;" action="set" languageOverride="" xpos='740' ypos='850' />
<assign name="设置profile路径 - 调用FHIR校验" property="request.Request.QueryString" value="&quot;profile=&quot;_context.profile" action="set" languageOverride="" xpos='740' ypos='950' />
<call name='调用FHIR校验' target='HS.FHIRServer.Interop.Operation' async='0' xpos='740' ypos='1050' >
<request type='HS.FHIRServer.Interop.Request' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='HS.FHIRServer.Interop.Response' >
<assign property="context.tempResp" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<trace value='context.validatingResult' xpos='740' ypos='1150' disabled="true"/>
<if name='如果有规则验证错误' condition='"" &apos;= context.validatingResult' xpos='740' ypos='1250' xend='740' yend='1500' >
<true>
<code name='将规则错误加入FHIR返回' xpos='875' ypos='1400' >
<![CDATA[ Set tSC = ##Class(MDMDemo.Utils.FHIRObjectUtils).MergeOutcomes(context.tempResp ,context.validatingResult)]]>
</code>
</true>
</if>
<assign name="构造FHIR返回对象" property="context.tempOutCome" value="##class(HS.FHIR.DTL.vR4.Model.Resource.OperationOutcome).FromJSON(##class(HS.SDA3.QuickStream).%OpenId(context.tempResp.QuickStreamId),&quot;vR4&quot;)" action="set" languageOverride="" xpos='1040' ypos='1501' />
<if name='包含error或fatal错误' condition='##Class(MDMDemo.Utils.FHIRObjectUtils).isOutcomeError(context.tempOutCome)' xpos='826' ypos='1624' xend='695' yend='1860' >
<true>
<assign name="返回FHIR验证结果" property="response" value="context.tempResp" action="set" languageOverride="" xpos='719' ypos='1731' />
</true>
<false>
<assign name="设置请求路径 - 调用FHIR保存" property="request.Request.RequestPath" value="&quot;Organization&quot;" action="set" languageOverride="" xpos='1060' ypos='1701' />
<call name='继续POST处理' target='HS.FHIRServer.Interop.Operation' async='0' xpos='1059' ypos='1824' >
<request type='HS.FHIRServer.Interop.Request' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='HS.FHIRServer.Interop.Response' >
<assign property="response" value="callresponse" action="set" languageOverride="" />
</response>
</call>
</false>
</if>
</case>
<default name='default' >
<call name='继续默认处理' target='HS.FHIRServer.Interop.Operation' async='0' xpos='470' ypos='550' >
<request type='HS.FHIRServer.Interop.Request' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='HS.FHIRServer.Interop.Response' >
<assign property="response" value="callresponse" action="set" languageOverride="" />
</response>
</call>
</default>
</switch>
</true>
<false>
<call name='继续由FHIR Server处理' target='HS.FHIRServer.Interop.Operation' async='0' xpos='200' ypos='400' >
<request type='HS.FHIRServer.Interop.Request' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='HS.FHIRServer.Interop.Response' >
<assign property="response" value="callresponse" action="set" languageOverride="" />
</response>
</call>
</false>
</if>
</sequence>
</process>
}

}
