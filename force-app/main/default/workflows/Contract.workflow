<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Contract_End_Date_Update</fullName>
        <field>EndDate</field>
        <formula>DATE ( 

/*YEAR*/ 
YEAR (  StartDate  ) + FLOOR ( (MONTH ( StartDate ) +  ContractTerm  - 1)/12), 

/*MONTH*/ 
CASE ( MOD ( MONTH ( StartDate )+ContractTerm , 12 ),0,12,MOD ( MONTH ( StartDate )+ContractTerm , 12 )), 

/*DAY*/ 
MIN ( DAY ( StartDate ), 
CASE ( MOD ( MONTH ( StartDate )+ContractTerm ,12 ) ,9,30,4,30,6,30,11,30,2, 

/* return max days for February dependent on if end date is leap year */ IF ( MOD ( YEAR ( StartDate ) + FLOOR ( (MONTH ( StartDate ) + ContractTerm )/12) , 400 ) = 0 || ( MOD ( YEAR ( StartDate ) + FLOOR ( (MONTH ( StartDate ) + ContractTerm )/12) , 4 ) = 0 &amp;&amp; MOD ( YEAR ( StartDate ) + FLOOR ( (MONTH ( StartDate ) + ContractTerm )/12) , 100 ) &lt;&gt; 0 
) 
, 29,28) 

,31 ) ) 
)</formula>
        <name>Contract End Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contract_Start_Date</fullName>
        <field>StartDate</field>
        <formula>Related_Opportunity__r.CloseDate</formula>
        <name>Contract Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Reminder_45_Days</fullName>
        <field>OwnerExpirationNotice</field>
        <literalValue>45</literalValue>
        <name>Update Reminder - 45 Days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Contract End Date Update</fullName>
        <actions>
            <name>Contract_End_Date_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contract.ContractTerm</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Contract Expire</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Contract.Status</field>
            <operation>equals</operation>
            <value>Activated</value>
        </criteriaItems>
        <description>This deals with the contract expiration date at 90 days.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Contract.StartDate</offsetFromField>
            <timeLength>275</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Contract Start Date</fullName>
        <actions>
            <name>Contract_Start_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contract.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Updates Contract Start Date from Opportunity Close Date</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Renewal Date</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Contract.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Reminder - 45 Days</fullName>
        <actions>
            <name>Update_Reminder_45_Days</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contract.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
