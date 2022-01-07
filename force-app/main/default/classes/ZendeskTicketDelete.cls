/**
 * Created by johnpernock from OpenGate Consulting on 9/28/18.
 */

global without sharing class ZendeskTicketDelete implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext BC) {
        DateTime selectDate = system.now().addDays(-180);
        String strDate = selectDate.format('yyyy-MM-dd\'T\'hh:mm:ss\'Z\'');
        String query = 'SELECT Id, Zendesk__Date_Time_created__c FROM Zendesk__Zendesk_Ticket__c WHERE Zendesk__Date_Time_created__c <= ' + strDate;
        System.debug(query);
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Zendesk__Zendesk_Ticket__c> scope) {
        delete scope;
    }

    global void finish(Database.BatchableContext BC) {
    }
}