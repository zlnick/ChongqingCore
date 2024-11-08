Class MDMDemo.Utils.FHIRObjectUtils Extends Ens.Rule.FunctionSet
{

/// GetAt implementation for rulesets
ClassMethod GetProfile(pObj As HS.FHIR.DTL.vR4.Model.Base.DomainResource) As %String
{
    Set profile = ""
    Try {
        Set profile = pObj.meta.profile.GetAt(1)
    }
    Catch ex {
        Set profile=""
    }
    Quit profile
}

ClassMethod MergeOutcomes(ByRef tempResp As HS.FHIRServer.Interop.Response, errors As %String) As %Status
{
    Set tSC = $$$OK
    Try {
        If ("" '= errors)
        {
            Set tempOutcome = ##Class(HS.FHIR.DTL.vR4.Model.Resource.OperationOutcome).FromJSON(##class(HS.SDA3.QuickStream).%OpenId(tempResp.QuickStreamId),"vR4")
            Set strList = $LISTFROMSTRING(errors,";")
            For i = 1:1:$LISTLENGTH(strList)
            {
                Set issue = ##Class(HS.FHIR.DTL.vR4.Model.Element.OperationOutcome.issue).%New()
                Set issue.diagnostics = $LIST(strList,i)
                Set issue.code = "business-rule"
                Set issue.severity = "error"
                Do tempOutcome.issue.Insert(issue)
            }
            Set quickStream = ##class(HS.SDA3.QuickStream).%New()
            Set tSC = quickStream.CopyFrom(tempOutcome.ToJSON())
            Set tempResp.QuickStreamId = quickStream.%Id()
        }
    }
    Catch ex {
        Set tSC=$$$ERROR("Error in reading errors String")
    }
    Quit tSC
}

}
