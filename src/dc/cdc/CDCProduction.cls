Class dc.cdc.CDCProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="dc.cdc.CDCProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="SalesSqlService" Category="" ClassName="EnsLib.SQL.Service.GenericService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="KeyFieldName">id</Setting>
    <Setting Target="Adapter" Name="Query">select * from sales</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">org.postgresql.Driver</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:postgresql://sales_db:5432/sales_db</Setting>
    <Setting Target="Adapter" Name="JDBCClasspath">/home/irisowner/dev/postgresql-42.7.8.jar</Setting>
    <Setting Target="Adapter" Name="JGService">Java</Setting>
    <Setting Target="Adapter" Name="Credentials">pg_cred</Setting>
    <Setting Target="Host" Name="TargetConfigNames">SalesProcess</Setting>
  </Item>
  <Item Name="SalesKafkaOperation" Category="" ClassName="EnsLib.Kafka.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Servers">kafka:9092</Setting>
  </Item>
  <Item Name="Java" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="SalesOperation" Category="" ClassName="dc.cdc.SalesOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="SalesProcess" Category="" ClassName="dc.cdc.SalesProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="SalesMetric" Category="" ClassName="dc.cdc.SalesMetric" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
</Production>
}

}
