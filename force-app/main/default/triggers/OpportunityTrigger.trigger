/**
 * Created by wmccu on 9/24/2020.
 */

trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {
    new OpportunityTriggerHandler().run();
}