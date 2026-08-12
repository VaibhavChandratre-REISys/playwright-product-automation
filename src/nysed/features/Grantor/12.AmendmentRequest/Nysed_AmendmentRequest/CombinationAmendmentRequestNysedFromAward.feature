@amendmentRequestsNysed @CombinationamendmentRequestsNysed
Feature: Validate all scenarios in the Combination Amendment Request

  @NYSED-10892 @NYSED-Sprint-29 @US-NYSED-10421 @M06
  Scenario Outline: Verify that the Internal User can see that the fields below are removed from the respective amendment combinations.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Grantor_BP_TC_FC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                         | Field                       |
      | Subaward Terms and Conditions | NYSED_SubTermsConditions__c |
    And I wait for "3" seconds
    And I click on "Save" in the page details
    #NYSED-10892
    Then I softly cannot see field "Justification for Budget Period Change" inside page block
    Then I softly cannot see field "Justification for Funding Change" inside page block
    Then I softly cannot see field "Justification for Terms and Conditions Change" inside page block

    Examples:
      | GrantName                                        | InternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | PM           |
#      | {SavedValue:Automation Runtime FDM Announcement} | PO           |