<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Outreach_Reminder_Email</fullName>
        <description>Outreach Reminder Email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Outreach_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Reminder_Date_Alert</fullName>
        <description>Reminder Date Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/Outreach_Reminder</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Acct_Name_Text</fullName>
        <description>Update a hidden field for Outreach Agreement to show in global search</description>
        <field>Account_Name_Text__c</field>
        <formula>Account_Name__r.Name</formula>
        <name>Update Acct Name (Text)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Agreement_End_Date</fullName>
        <field>Agreement_End_date__c</field>
        <formula>Agreement_Start_Date__c  + 730</formula>
        <name>Update Agreement End Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Reminder_Date</fullName>
        <field>Reminder_Date__c</field>
        <formula>Agreement_Start_Date__c  + 180</formula>
        <name>Update Reminder Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Account Name Search</fullName>
        <actions>
            <name>Update_Acct_Name_Text</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Outreach_Agreement__c.Reminder_Date_is_Today__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outreach Reminder</fullName>
        <actions>
            <name>Outreach_Reminder_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Outreach_Agreement__c.Reminder_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Alert will be sent to the record owner when reminder date = TODAY</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Agreement End Date</fullName>
        <actions>
            <name>Update_Agreement_End_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Outreach_Agreement__c.CreatedDate</field>
            <operation>greaterOrEqual</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Reminder Date</fullName>
        <actions>
            <name>Update_Reminder_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Outreach_Agreement__c.CreatedDate</field>
            <operation>greaterOrEqual</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
