<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notification_Email_When_AENOR_Product_Added_to_Opp</fullName>
        <description>Notification Email When AENOR Product Added to Opp</description>
        <protected>false</protected>
        <recipients>
            <recipient>sradcliffe@astm.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>wmcnair@astm.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/AENOR_Initial_Product_Added_to_Opp</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_AENOR_Notification_sent_Checkbox</fullName>
        <description>Update AENOR Notification sent Checkbox</description>
        <field>AENOR_Notification_Sent__c</field>
        <literalValue>1</literalValue>
        <name>Update AENOR Notification sent Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>OpportunityId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>AENOR Product Added to Opp</fullName>
        <actions>
            <name>Notification_Email_When_AENOR_Product_Added_to_Opp</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_AENOR_Notification_sent_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Product2.Family</field>
            <operation>equals</operation>
            <value>3pc - AENOR</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.AENOR_Notification_Sent__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Sends Notification when AENOR product is added to Opp</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
