@auditorAmendmentRequest @auditor @parallel-regression @regression
Feature: Validate all scenarios for Auditor Profile in Amendment Request module

  @69172 @auditorCannotCreateAmendmentRequest @smoke
  Scenario: Validate Auditor should not be  able to  Create Amendment request
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I login to "As a Grantor" app as "Auditor" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Management" sub tab
    Then I cannot see top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"

  @69174 @auditorViewAccessToAmendmentRequest
  Scenario: Validate Auditor should have view Amendment Request Record that is created by PM user - Budget Period Change
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    When I click on "Edit" in the page details
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "Auditor" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Created" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I can see row level action button "View" against "Created" in flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"

  @69871 @audiorCanViewAmendmentRecordsofAllStatus
  Scenario: Validate whether Audior Profile all the amendment records created by PM profile
    Given I login to "As a Grantor" app as "AUDITOR" user
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "Funding Change" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I wait for "2" seconds
    Then I see values "Funding Change" and "State" inside table

  @Terms&conditionAmendment @ValidatePeriodicRenewalAmendmentRequestrowLevelButtonsforTerms&Conditions @Bug-Ticket-530918
  Scenario: Validate Periodic Renewal Amendment Request row level buttons for Terms & Conditions
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "PeriodicID"
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:AmendmentSpecialConditionTableId---"
    And I enter in modal value "Automation Special Conditions" into field "Title__c"
    And I enter in modal value "Automation Special Conditions description" into field "Description__c"
    And I enter in modal value "1" into field "Sequence__c"
    And I enter in modal value "0" into field "EffectiveFrom__c"
    And I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "3" seconds
    When I perform quick search for "Automation Special Conditions" in "---amendment:-:AmendmentSpecialConditionTableId---" panel
    Then I softly see value "Automation Special Conditions" for title "Name" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly can see row level action button "View" against "Automation Special Conditions" in flex table with id "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly can see row level action button "Edit" against "Automation Special Conditions" in flex table with id "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly can see row level action button "Delete" against "Automation Special Conditions" in flex table with id "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:PeriodicID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:PeriodicID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly can see row level action button "View" against "Automation Special Conditions" in flex table with id "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Special Conditions" in flex table with id "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Special Conditions" in flex table with id "---amendment:-:AmendmentSpecialConditionTableId---"