@applicationIntake @grantor-regression @grantor-parallel-regression @app @regression @ApplicationExecution-reg
Feature: Validate all scenarios in the Application Intake

  Background: Qualify Announcement and Create Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
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

  @34044 @70332 @applicationCreation
  Scenario: Validate creation of an Application | Validate once application is in created status, the user can view the Submit Application Button in page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly can see top right button "Submit Application" in page detail

  @34045 @applicationEdition
  Scenario: Edition of an application
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"

  @34303 @addFocusAreaToApplication
  Scenario Outline: Addition of Focus area to an application
    When I navigate to "Budget" sub tab
    Then I see that "<Focus Area>" has been added in flextable with Id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Examples:
      | Focus Area                      |
      | Automation Permanent Focus Area |

  @50964 @addBudgetDetailsToApplication
  Scenario: Addition of budget in the budget grid to an application
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 100    | 100        | 100            | 100            |
    Then I refresh the page
    When I navigate to "Budget" sub tab
    Then I see value "$100.00" for title "Budget" against the value "Construction" inside table "---applicationIntake:-:budgetPeriodTableId---"
    Then I see value "$100.00" for title "Cash Match" against the value "Construction" inside table "---applicationIntake:-:budgetPeriodTableId---"
    Then I see value "$100.00" for title "Non-Cash Match" against the value "Construction" inside table "---applicationIntake:-:budgetPeriodTableId---"
    Then I see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---applicationIntake:-:budgetPeriodTableId---"

  @50967 @addTargetToKPIInApplication
  Scenario: Addition of KPI target to an application
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    Then I see the following messages in the page details contains:
      | Saved Successfully! |

  @70333 @69367 @50969 @formFillingApplication @smoke
  Scenario: To fill and complete the form in Application | Validate whether user is allowed to proceed without filling Mandatory forms
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
      | {SavedValue:SPI3 Username} |  Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Forms and Files Tab - All mandatory forms must be 100% completed. |
    When I navigate to "Forms and Files" sub tab
    Then I see only the following headers in table with id "---applicationReview:-:allFormsTableId---" :
    | Actions | Form Name |Report Type |Mandatory | Percentage | Last Modified By | Last Modified Date |
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    And I click on "Edit" in the split screen page details
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "2" seconds
    And I click on "Splitview" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And  I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" in the split screen page details
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "2" seconds
    And I refresh the page
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "100.00%" for title "Percentage" against the value "Program Application Form" inside table "---applicationIntake:-:allFormsTableId---"
    Then I softly see value "100.00%" for title "Percentage" against the value "Standard Assurances Form" inside table "---applicationIntake:-:allFormsTableId---"

  @34346 @73602 @34334 @70459 @viewSubmitedApplication @smoke
  Scenario Outline: Validate Viewing the application submitted by sub-recipient as Internal user | Validate whether user can view the edit button once application has been submitted to Grantor
  Verify whether PM, FO,EXE internal user is able to view Submitted Application | Verify when SPI (Record owner of Application) submit the Application to Grantor then it is displayed in the list of Submitted Applications
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
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
    And I wait for "2" seconds
    And I click on "Edit" in the split screen page details
    And I wait for "2" seconds
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Submitted"
    When I perform quick search for "<Application Name>" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see "<Application Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    Given I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "<Application Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | Application Name                                         | User |
      | {SavedValue:Automation Runtime Announcement Application} | PM   |
      | {SavedValue:Automation Runtime Announcement Application} | FO   |
      | {SavedValue:Automation Runtime Announcement Application} | EXE  |

  @70458 @73514 @73515 @70456 @acknowledgeReqiredToSave
  Scenario: Validate the system should throw an validation message if the application is submitted with Acknowledging it
  Validate whether user has ability to add and remove new focus area while creating an application |Validate whether system should throws a validation message on screen when user tries to remove the existing focus area while submitting an application
  Validate whether user is able to add more focus area to the table while submitting an application
    Given I click on "Edit" in the page details
    And I enter "EditionAcknowledge" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
   And I click on "Remove Focus Area" icon for "Automation Permanent Focus Area" inside flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
      #73514
    Then I softly see the following messages in the page details :
      | Can not remove focus area as funding opportunity associates only one focus area. |
    When I click on top right button "Add Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:AddFocusAreaTableAppId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       |  Is Key Contact |
      | {SavedValue:SPI3 Username} |  Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And  I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    And I click on "Edit" in the split screen page details
    And I wait for "2" seconds
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "2" seconds
    And I click on "Splitview" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "2" seconds
    And I click on "Edit" in the split screen page details
    And I wait for "2" seconds
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    Then I see the following messages in the page details :
      | Overview Tab - Enter an Acknowledgement for project cost before submitting this Application. |

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
      | {SavedValue:SPI3 Username} |  Checked        |
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
    And I wait for "2" seconds
    And I click on "Edit" in the split screen page details
    And I wait for "2" seconds
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
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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

  @73521 @70526 @snapshotAfterApplicationIsSubmitted @snapExecution
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
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
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
    Then I softly see field "Submitted By" as "{SavedValue:SPI3 Username}"
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
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
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
      | {SavedValue:SPI3 Username} |  Checked        |
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
    And I wait for "2" seconds
    And I click on "Edit" in the split screen page details
    And I wait for "2" seconds
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
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