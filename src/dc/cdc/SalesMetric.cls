Class dc.cdc.SalesMetric Extends Ens.BusinessMetric
{

Property TotalSales As Ens.DataType.Metric(UNITS = "$US") [ MultiDimensional ];

Query MetricInstances() As %SQLQuery
{
  SELECT distinct(ProductName) FROM dc_cdc.Sales
}

Method OnCalculateMetrics() As %Status
{
    Set product = ..%Instance

    Set SalesSum = 0.0

    &sql(
        select sum(SalesValue) into :SalesSum from dc_cdc.Sales where ProductName = :product 
    )

    Set ..TotalSales = SalesSum

    Quit $$$OK
}

}
