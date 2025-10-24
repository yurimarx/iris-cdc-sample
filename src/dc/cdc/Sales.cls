Class dc.cdc.Sales Extends %Persistent [ DdlAllowed, Final ]
{

Parameter STORAGEDEFAULT = "columnar";

Parameter USEEXTENTSET = 1;

Property ProductName As %String;

Property StoreName As %String;

Property SalesValue As %Double;

Storage Default
{
<Data name="_CDM_ProductName">
<Attribute>ProductName</Attribute>
<ColumnarGlobal>^eBI3.D7Iv.1.V1</ColumnarGlobal>
<SmallChunkSize>12800</SmallChunkSize>
<Structure>vector</Structure>
</Data>
<Data name="_CDM_SalesDate">
<Attribute>SalesDate</Attribute>
<ColumnarGlobal>^eBI3.D7Iv.1.V4</ColumnarGlobal>
<SmallChunkSize>64000</SmallChunkSize>
<Structure>vector</Structure>
</Data>
<Data name="_CDM_SalesValue">
<Attribute>SalesValue</Attribute>
<ColumnarGlobal>^eBI3.D7Iv.1.V2</ColumnarGlobal>
<Structure>vector</Structure>
</Data>
<Data name="_CDM_StoreName">
<Attribute>StoreName</Attribute>
<ColumnarGlobal>^eBI3.D7Iv.1.V3</ColumnarGlobal>
<SmallChunkSize>12800</SmallChunkSize>
<Structure>vector</Structure>
</Data>
<DataLocation>^eBI3.D7Iv.1</DataLocation>
<ExtentLocation>^eBI3.D7Iv</ExtentLocation>
<ExtentSize>2</ExtentSize>
<IdLocation>^eBI3.D7Iv.1</IdLocation>
<Index name="$Sales">
<Location>^eBI3.D7Iv.2</Location>
</Index>
<Index name="IDKEY">
<Location>^eBI3.D7Iv.1</Location>
</Index>
<IndexLocation>^eBI3.D7Iv.I</IndexLocation>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="ProductName">
<AverageFieldSize>9</AverageFieldSize>
<OutlierSelectivity>.999999:"Laranja"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="SalesValue">
<AverageFieldSize>4</AverageFieldSize>
<OutlierSelectivity>.999999:$double(1000)</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="StoreName">
<AverageFieldSize>4</AverageFieldSize>
<OutlierSelectivity>.999999:"so"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="$Sales">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="_CDM_ProductName">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="_CDM_SalesValue">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="_CDM_StoreName">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^eBI3.D7Iv.S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
