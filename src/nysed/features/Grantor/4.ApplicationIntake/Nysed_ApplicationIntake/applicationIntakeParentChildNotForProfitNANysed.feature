@applicationIntakeNysed @applicationIntakeParentChildNysed @applicationIntakeParentChildNysed2
Feature: Validate all scenarios in the Application Intake parent child realationship for Not For Profit NA

  Background:Set Parent Organization Field as Yes On Subrecipient Organization for Application Intake parent child realationship for Not For Profit NA
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:AutomationPermanentNotforProfitNAOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:AutomationPermanentNotforProfitNAOrg---" inside table
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Yes" into field "NYSED_IsParentOrganization__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds

  @539349 @539351 @NYSEDSprint-15 @US-502891 @M05
  Scenario Outline: Verify that a new picklist field, 'Not For Profit', has been added on the Create Application modal, and it is a reference field from the respective subrecipient organization profile. - Not for Profit: NA
    And I save the field labeled "Not For Profit" as "NotForProfit"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "NOTFORPROFIT_NA_ANOTHER_ORG_BAFA"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    #539349
    Then I softly see default value "NA" for the field "NYSED_NotForProfit__c"
    Then I softly see field "Not For Profit" as "{SavedValue:NotForProfit}"
    Then I softly see that "Not For Profit" rendered in view mode only
    And I click modal button "Save and Continue"
    #539351
    Then I softly see the following messages in the page details contains:
      | 'Not For Profit' value is not available for the organization. Contact LEA Admin or Submit and Certify user to update the value at the organization profile. |

    Examples:
      | UserType                    | Announcement Name                                        |
      | PARENT_ORG_EXTERNAL_USER_SC | {SavedValue:Automation Runtime Announcement Application} |
#      | PARENT_ORG_EXTERNAL_USER_CE | {SavedValue:Automation Runtime Announcement Application} |