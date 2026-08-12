@applicationIntakeNysed @applicationIntakeParentChildNysed @applicationIntakeParentChildNysed4
Feature: Validate all scenarios in the Application Intake parent child realationship for Not For Profit No

  Background:Set Parent Organization Field as Yes On Subrecipient Organization for Application Intake parent child realationship for Not For Profit No
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" inside table
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Yes" into field "NYSED_IsParentOrganization__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds

  @539352 @539364 @546124 @546123 @NYSEDSprint-15 @US-502891 @M05 @Bug-Ticket-NYSED-1896
  Scenario Outline: Verify that when Save & Continue is clicked on the Create Application modal, the grantee user is not stopped if it is set as No on the respective organization profile.
    And I save the field labeled "Not For Profit" as "NotForProfit"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ANOTHER_ORG_NOTFORPROFIT_NO_BAFA"
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
    #546124
    Then I softly see default value "No" for the field "NYSED_NotForProfit__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    #546124
    Then I softly see that "Not For Profit" rendered in view mode only
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    #539352
    Then I softly see field "Status" as "Created"
    When I navigate to "Overview" sub tab
    And I wait for "4" seconds
    #539364 #546123
    Then I softly see field "Not For Profit" as "{SavedValue:NotForProfit}"
    Then I softly see field "Not For Profit" as "No"
    #546124
    Then I softly see field "Not For Profit" added after "Creating For"
    When I navigate to "Budget" sub tab
    #539364
    Then I softly see field "Indirect Rate (%)" as "0.00%"

    Examples:
      | UserType    | Announcement Name                                        |
      | EXTERNAL_SC | {SavedValue:Automation Runtime Announcement Application} |
#      | EXTERNAL_CE | {SavedValue:Automation Runtime Announcement Application} |