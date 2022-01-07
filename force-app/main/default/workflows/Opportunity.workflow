<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_John_Pace_for_Approval_of_Opp</fullName>
        <description>Email John Pace for Approval of Opp</description>
        <protected>false</protected>
        <recipients>
            <recipient>maxelman@astm.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/API_Request_Available</template>
    </alerts>
    <alerts>
        <fullName>Reseller_Opportunity_Approval_Status_Changed</fullName>
        <description>Reseller Opportunity Approval Status Changed</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Reseller_Opportunity_Approval_Status_Change</template>
    </alerts>
    <alerts>
        <fullName>Reseller_Opportunity_Pending_Approval</fullName>
        <description>Reseller Opportunity Pending Approval</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Reseller_Opportunity_Pending_Approval</template>
    </alerts>
    <alerts>
        <fullName>Reseller_Opportunity_Stage_Closed_Won_Lost</fullName>
        <description>Reseller Opportunity Stage Closed Won/Lost</description>
        <protected>false</protected>
        <recipients>
            <field>Account_Owner_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Reseller_Opportunity_Stage_Closed_Won_Lost</template>
    </alerts>
    <alerts>
        <fullName>Send_Approved_Email_to_IHS</fullName>
        <description>Send Approved Email to IHS</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>nicole.medina@ihsmarkit.com.astm</recipient>
            <type>partnerUser</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/IHS_Approval_Accepted</template>
    </alerts>
    <alerts>
        <fullName>Send_Denied_Email_to_IHS</fullName>
        <description>Send Denied Email to IHS</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/IHS_Approval_Denied</template>
    </alerts>
    <alerts>
        <fullName>Send_IHS_Lost_Notification_to_ASTM</fullName>
        <description>Send IHS Lost Notification to ASTM</description>
        <protected>false</protected>
        <recipients>
            <field>Regional_Approver_Email_Workflow__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/IHS_Opportunity_Lost</template>
    </alerts>
    <alerts>
        <fullName>Send_IHS_Won_Notification_to_ASTM</fullName>
        <description>Send IHS Won Notification to ASTM</description>
        <protected>false</protected>
        <recipients>
            <field>Regional_Approver_Email_Workflow__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/IHS_Opportunity_Won</template>
    </alerts>
    <alerts>
        <fullName>Send_John_Pace_Approved_email</fullName>
        <description>Send John Pace Approved email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/John_Pace_Approved</template>
    </alerts>
    <alerts>
        <fullName>Send_John_Pace_Denied_Email</fullName>
        <description>Send John Pace Denied Email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/John_Pace_Denied</template>
    </alerts>
    <alerts>
        <fullName>Send_New_Approval_Request_Notification</fullName>
        <description>Send New Approval Request Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Regional_Approver_Email_Workflow__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_IHS_Approval_Request</template>
    </alerts>
    <fieldUpdates>
        <fullName>Lost_Update</fullName>
        <field>Lost__c</field>
        <formula>&quot;YES&quot;</formula>
        <name>Lost Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Name_Update</fullName>
        <field>Name</field>
        <formula>TEXT( YEAR( CloseDate ) ) + 
&quot;-&quot;+ 
IF(LEN(Account.Name)&gt;90,LEFT(Account.Name, 90),Account.Name)+
&quot;-&quot;+ 
TEXT(Opportunity_Type__c )+
&quot;-&quot;+
TEXT(Type)</formula>
        <name>Opportunity Name Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Past_Due_Opp_Field</fullName>
        <field>Past_Due_Opportunity__c</field>
        <formula>&quot;YES&quot;</formula>
        <name>Past Due Opp Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reseller_Opportunity_Stage_Closed_Lost</fullName>
        <description>Reseller Opportunity Stage Closed Lost</description>
        <field>StageName</field>
        <literalValue>Closed Lost</literalValue>
        <name>Reseller Opportunity Stage Closed Lost</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Approval_Field_to_Pending</fullName>
        <field>IHS_Approval__c</field>
        <literalValue>Pending</literalValue>
        <name>Update Approval Field to Pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Approver_Email</fullName>
        <field>Regional_Approver_Email_Workflow__c</field>
        <formula>Account.Country__r.Owner:User.Email</formula>
        <name>Update Approver Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Opp_Stage_to_PriceQuote</fullName>
        <field>StageName</field>
        <literalValue>Proposal/Price Quote</literalValue>
        <name>Update Opp Stage to Price Quote</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Required_Login_to_No</fullName>
        <field>Required_Log_In__c</field>
        <literalValue>No</literalValue>
        <name>Update Required Login to No</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_State_to_Closed_Lost</fullName>
        <field>StageName</field>
        <literalValue>Closed Lost</literalValue>
        <name>Update State to Closed Lost</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_to_IHS_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>IHS</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update to IHS Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_to_Pending</fullName>
        <field>RecordTypeId</field>
        <lookupValue>IHS_Pending_Approval</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update to Pending Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Email John Pace for approval</fullName>
        <actions>
            <name>Email_John_Pace_for_Approval_of_Opp</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Needs Approval 3pc</value>
        </criteriaItems>
        <description>When an opportunity is changes to the stage ‘Needs John Pace Approval’, an email notification will be sent.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email Opp Owner John Pace Approval</fullName>
        <actions>
            <name>Send_John_Pace_Approved_email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.John_Pace_Approval__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <description>Sends an email to the account owner when John Pace changes his approval field to Approved</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email Opp Owner John Pace Denied</fullName>
        <actions>
            <name>Send_John_Pace_Denied_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.John_Pace_Approval__c</field>
            <operation>equals</operation>
            <value>Denied</value>
        </criteriaItems>
        <description>Sends an email to the account owner when John Pace changes his approval field to Denied</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>IHS Approval - Accepted</fullName>
        <actions>
            <name>Send_Approved_Email_to_IHS</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Approver_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_to_IHS_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IHS_Approval__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>IHS Approval - Denied</fullName>
        <actions>
            <name>Send_Denied_Email_to_IHS</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Approver_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_State_to_Closed_Lost</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_to_Pending</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IHS_Approval__c</field>
            <operation>equals</operation>
            <value>Denied</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>IHS Approval - Pending</fullName>
        <actions>
            <name>Update_to_Pending</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IHS_Approval__c</field>
            <operation>equals</operation>
            <value>Pending</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>IHS Opportunity Lost</fullName>
        <actions>
            <name>Send_IHS_Lost_Notification_to_ASTM</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Approver_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>contains</operation>
            <value>IHS</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>IHS Opportunity Won</fullName>
        <actions>
            <name>Send_IHS_Won_Notification_to_ASTM</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Approver_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>contains</operation>
            <value>IHS</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>IHS Submit for Approval</fullName>
        <actions>
            <name>Send_New_Approval_Request_Notification</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Approval_Field_to_Pending</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Approver_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IHS_Submit_for_Approval__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lost Opportunity Update</fullName>
        <actions>
            <name>Lost_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost,Non Renewal</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp status when created from lead</fullName>
        <actions>
            <name>Update_Opp_Stage_to_PriceQuote</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Created_from_Lead__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Auto-Naming</fullName>
        <actions>
            <name>Opportunity_Name_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CreatedById</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Change_of_Scope__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Changes the name of an opportunity to reflect the Account Short Name - Opportunity Short Name - Month and Year the deal is closing.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Past Due Opp Field Update</fullName>
        <actions>
            <name>Past_Due_Opp_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Closed Lost,Non Renewal,Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CloseDate</field>
            <operation>lessThan</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reseller Opportunity Approval Status Changed</fullName>
        <actions>
            <name>Reseller_Opportunity_Approval_Status_Changed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Approval_Status__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reseller Opportunity Approval Status Denied Set Stage Closed Lost</fullName>
        <actions>
            <name>Reseller_Opportunity_Stage_Closed_Lost</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Denied</value>
        </criteriaItems>
        <description>Reseller Opportunity Approval Status Denied Set Stage Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Reseller Opportunity Pending Approval</fullName>
        <actions>
            <name>Reseller_Opportunity_Pending_Approval</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Submit_for_Approval__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Reseller Opportunity Stage Closed Lost</fullName>
        <actions>
            <name>Reseller_Opportunity_Stage_Closed_Won_Lost</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Royalty</value>
        </criteriaItems>
        <description>Reseller Opportunity Stage Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Reseller Opportunity Stage Closed Won</fullName>
        <actions>
            <name>Reseller_Opportunity_Stage_Closed_Won_Lost</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Royalty</value>
        </criteriaItems>
        <description>Reseller Opportunity Stage Closed Won</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Required Login</fullName>
        <actions>
            <name>Update_Required_Login_to_No</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Industry_Tag__c</field>
            <operation>equals</operation>
            <value>Academic</value>
        </criteriaItems>
        <description>Update Required Login based on Industry tag = Academic</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
