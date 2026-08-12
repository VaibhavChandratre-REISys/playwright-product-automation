@applicationIntake @grantor-regression @grantor-parallel-regression @regression @ApplicationExecution-reg @app-preapp
Feature: Validate all scenarios in the Application Intake

  Background: Qualify Announcement and Create Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition-app" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details

    @70455 @kpiValuesAreMandatoryToSubmitApplication
  Scenario:  To verify that if KPI value is unfilled while creating and application and upon clicking on the Submit Application on the top right corner of the page validation error must be thrown.
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       |  Is Key Contact |
      | {SavedValue:SPI1 Username} |  Checked        |
    And I navigate to "Forms and Files" sub tab
    And  I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    And I click on "Edit" in the split screen page details
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "2" seconds
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I click on "Edit" in the split screen page details
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    When I click on "Submit Application" in the page details
    Then I see the following messages in the page details contains:
      | Proposal Tab - Provide Target Values for all Key Performance Indicators. |

  @70528 @70470 @validateVariousRolesAppearApplication
  Scenario: To Validate that various roles appear in the project roles dropdown in contact table on application of  SPI profile |Validate the Created Date of Application display on Overview Tab
  Validate whether Application Title field is editable after creating the Application
    When I navigate to "Overview" sub tab
    Then I softly see field "Created Date" is not editable
    When I click on "Edit" icon for "{SavedValue:SPI1 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly verify that All the following projects roles are available in picklist :
      | Principal Investigator   |
      | Fiscal Contact           |
      | Grants Administrator     |
      | Ebiz POC                 |
      | Other                    |
      | Project Director/Manager |
      | Authorized Signatory     |

  @70527 @applicationAttachmentAndNotes   @buglogged169487
  Scenario: Validate whether user can add attachment checklist and Notes on the Application
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I upload attachment "AttachmentTesting.pdf" of type "General Assurances" from computer
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly see "General Assurances" has been added in "Application Files" flex table
    And I click on "Edit" icon for "General Assurances" inside flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Suspension" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    Then I softly see value "Automation.pdf" for title "Title" inside table "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly see value "Suspension" for title "Classification" inside table "---applicationIntake:-:ApplicationAttachmentTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---applicationIntake:-:ApplicationNotesTableId---"

  @73521 @70526 @snapshotAfterApplicationIsSubmitted
  Scenario Outline: Validate SR user is able to view the Snapshot after Application is Submitted to Grantor status| Validate once the Application is submitted to Grantor then the field Submitted by on Overview Tab will get updated by the User Name.
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI1 Username} | Project Director/Manager | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And  I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit Application" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Submitted By" as "{SavedValue:SPI1 Username}"
    Given I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:appAllTableId---" panel
    When I click on "View" icon for "<Application Name>" inside table
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Snapshot_Application_Submission.pdf"
    And I wait for "7" seconds
    When I download the file
    Then I see "Submitted to Grantor" on page "1" of "govgrants" pdf file
    Examples:
      | Application Name                                         |
      | {SavedValue:Automation Runtime Announcement Application} |

  @70525 @userCanAssociateNewContact
  Scenario:Validate whether user is able to associate new contacts while creating an application
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I click "Add" after selection of "Automation SPA" by showing entries "All" in flex table with id "---applicationIntake:-:associateNewContactsTableId---"
    And I refresh the page
    #When I perform quick search for "Automation SPA" in "---applicationReview:-:flexGridAppContactTableId---" panel
    Then I softly see value "Automation SPA" for title "Name" inside table "---applicationReview:-:flexGridAppContactTableId---"

  @73944 @73945 @71409 @73947 @73950 @73948 @73949
  Scenario: Validate whether User  will be able to view the following error message "Reached the Maximum number of Applications" when the limit has been reached.
  To verify Converted Opportunities should reflect under Opportunities "Converted to Application - Open" list view to External user
  | To verify ,search functionality for Opportunities Converted to Application - All section in opportunities tab
  | To verify ,view functionality for Opportunities Converted to Application - All section in opportunities tab
  | To verify, filter functionality for Opportunities converted to application:All table for Opportunity
    Given I save the field containing "EGMS ID" as "APPId"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       |  Is Key Contact |
      | {SavedValue:SPI1 Username} |  Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And  I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    And I click on "Edit" in the split screen page details
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "2" seconds
    And I click on "Splitview" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I click on "Edit" in the split screen page details
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI1 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Converted to Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement Application}" for title "Opportunity Name" inside table "---applicationIntake:-:convertedToApplicationTableID---"
    And I click toggle button to select "Opportunities Converted to Application - Open"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement Application}" for title "Opportunity Name" inside table "---applicationIntake:-:convertedToApplicationTableID---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    And I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Converted to Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement Application}" for title "Opportunity Name" inside table "---applicationIntake:-:convertedToApplicationTableID---"
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    Then I softly see field "Opportunity Name" as "{SavedValue:Automation Runtime Announcement Application}"