/// 
Class dc.cdc.SalesProcess Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.StreamContainer' response='Ens.StringResponse' height='2000' width='2000' >
<context>
<property name='Sales' type='Ens.StringResponse' instantiate='1' />
<property name='KafkaMessage' type='EnsLib.Kafka.Message' instantiate='1' />
</context>
<sequence xend='200' yend='650' >
<call name='Save to Sales Table' target='SalesOperation' async='0' xpos='200' ypos='250' >
<request type='Ens.StreamContainer' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='Ens.StringResponse' >
<assign property="context.Sales" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<code name='Populate Kafka Message' xpos='200' ypos='350' >
<![CDATA[ 
 Set context.KafkaMessage.topic = "sales-topic" 
 Set context.KafkaMessage.value = context.Sales.StringValue 
 Set context.KafkaMessage.key = "iris" ]]>
</code>
<call name='Send To Kafka Sales Topic' target='SalesKafkaOperation' async='1' xpos='200' ypos='450' >
<request type='%Library.Persistent' >
<assign property="callrequest" value="context.KafkaMessage" action="set" languageOverride="" />
</request>
</call>
<assign name="Send response" property="response.StringValue" value="&quot;Process finished!&quot;" action="set" languageOverride="" xpos='200' ypos='550' />
</sequence>
</process>
}

}
