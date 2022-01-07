/**
 * Created by johnpernock from OpenGate Consulting on 2019-08-26.
 */

@IsTest
private class OppCloneComponentControllerTest {
    @IsTest
    static void testGetOppClone() {
        Account ca = new Account(Name='testaccount');
        insert ca;

        Opportunity testopp = new Opportunity(Name='testopp', Industry_Tag__c='Academic',AccountId=ca.Id, StageName='Renewal', CloseDate=date.today());
        insert testopp;

        Test.startTest();
        OppCloneComponentController.CloneOppDetails details = OppCloneComponentController.getOppDetails(testopp.Id);
        String oppString = JSON.serialize(details.opp);
        Id clone = OppCloneComponentController.saveCloneOppData(oppString, '', oppString, 2);
        Test.stopTest();
    }
}