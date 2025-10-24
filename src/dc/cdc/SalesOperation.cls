Class dc.cdc.SalesOperation Extends Ens.BusinessOperation
{

Method ProcessSalesData(pRequest As Ens.StreamContainer, Output pResponse As Ens.StringResponse) As %Status
{
    Set tSC = $$$OK
    Set pResponse = ##class(Ens.StringResponse).%New()

    Try {
        
        Set tStream = pRequest.Stream
        
        Do tStream.Rewind()

        Set content = ""
        While 'tStream.AtEnd {
            Set content = content _ tStream.Read(4096) 
        }

        Set tDynamicObject = {}.%FromJSON(content)
        
        Set sales = ##class(dc.cdc.Sales).%New()
        Set sales.ProductName = tDynamicObject."product_name"
        Set sales.StoreName = tDynamicObject."store_name"
        Set sales.SalesValue = tDynamicObject."sales_value"
        Set tSC = sales.%Save()

        Set pResponse.StringValue = tDynamicObject.%ToJSON()
        
    } Catch (ex) {
        Set tSC = ex.AsStatus()
        Set pResponse.StringValue = "Error while saving sales data!"
        $$$LOGERROR("Error while saving sales data: " _ ex.DisplayString())
    }

    Quit tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Ens.StreamContainer">
    <Method>ProcessSalesData</Method>
  </MapItem>
</MapItems>
}

}
