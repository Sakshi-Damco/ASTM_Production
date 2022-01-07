/**
 * Created by johnpernock from OpenGate Consulting on 9/28/18.
 */

@IsTest
private class ZendeskTicketDeleteTest {
    @IsTest
    static void testDelete() {
        Zendesk__Zendesk_Ticket__c testticket = new Zendesk__Zendesk_Ticket__c();
        DateTime selectedDate = system.now().addDays(-181);
        testticket.Zendesk__Description__c = 'Test Ticker';
        testticket.Zendesk__Date_Time_created__c = selectedDate;
        insert testticket;
        Test.StartTest();
        ZendeskTicketDelete obj = new ZendeskTicketDelete();
        database.executebatch(obj,50);
        Test.stopTest();
    }
}