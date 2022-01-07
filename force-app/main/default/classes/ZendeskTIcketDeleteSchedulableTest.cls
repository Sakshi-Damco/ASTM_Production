/**
 * Created by johnpernock from OpenGate Consulting on 9/28/18.
 */

@IsTest
private class ZendeskTIcketDeleteSchedulableTest {
    @TestSetup
    static void setupZendeskTicketDeleteSchedulableTestData() {
        Zendesk__Zendesk_Ticket__c zendeskTicket = new Zendesk__Zendesk_Ticket__c();
        Datetime selectedDate = System.now().addDays(-181);
        zendeskTicket.Zendesk__Description__c = 'Test Ticker';
        zendeskTicket.Zendesk__Date_Time_created__c = selectedDate;
        insert zendeskTicket;
    }
    @IsTest
    static void testSchedulerMethods() {
        ZendeskTicketDeleteSchedulable.RemoveSchedulerMethod();
        Test.startTest();
        ZendeskTicketDeleteSchedulable.SchedulerMethod();
        Test.stopTest();
    }
}