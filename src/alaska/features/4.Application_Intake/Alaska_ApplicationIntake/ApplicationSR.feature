@AlaskaApplication @AlaskaRegression @AppShareRevenue
Feature: Validate all scenarios in the Application tab

  @Sprint-6-US-393903 @404295 @404296 @VaishaliD
  Scenario: Verify that External users DO NOT see Budget tab and its related fields for the application created from announcement having 'Is this a Shared Revenue Program?' as checked and Type as 'Directed'
    | Verify that External Application owner is able to successfully submit the application to grantor without any validations related to Budget tab or its related fields
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SR_CITY2"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY2" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "EditionSR" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    #404295
    Then I softly do not see "Financials" sub tab in page detail
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | Automation City2 SPI       | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "NFR - 2nd Class Municipality" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "NFRCity2-Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #404296
    Then I softly cannot see the following messages in the page details :
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
      | Budget Tab - Enter a Justification for project cost before submitting this Application.                                                             |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                                                                  |
    Then I softly see field "Status" as "Submitted to Grantor"