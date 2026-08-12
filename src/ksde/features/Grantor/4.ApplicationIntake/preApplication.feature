@preApplicationExecution @preApplication @grantor-regression @grantor-parallel-regression @app @ApplicationAndPre-App
Feature: Validate all scenarios in the Pre-Application

  Background: Qualify Announcement and Create PreApplication
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I get the "EGMS ID"

  @67063 @validateVariousRolesAppearsPreApplication
  Scenario: To Validate that various roles appear in the project roles dropdown in contact tableon preapplication of  SPI profile
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    Then I verify that All the following projects roles are available in picklist :
      | Principal Investigator   |
      | Fiscal Contact           |
      | Grants Administrator     |
      | Ebiz POC                 |
      | Other                    |
      | Project Director/Manager |
      | Authorized Signatory     |

  @67065 @67077 @contactsAtPreApplicationFromSameOrganization
  Scenario: To verify that the contacts appearing in the Associate button in Contact table of preapplication is of the Same organisation |To validate that the new contact can be associated in the contact table in SPI user profile Preapplication
    When I navigate to "Overview" sub tab
    And I click table top right button "Associate" in flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    When I click "Add" after selection of "Automation SPA" by showing entries "All" in flex table with id "---preApplication:-:associatePreAppContactsTableId---"
    And I wait for "3" seconds
    When I close "Associate Contacts" modal by clicking the top right x button
    Then I softly see value "Automation SPA" for title "Name" inside table "---preApplication:-:flexGridPreAppContactTableId---"
    When I click on "View" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I save the field labeled "Organization" as "orgName1"
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "Record Id" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    When I click on "View" icon for "Automation SPA" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I save the field labeled "Organization" as "orgName2"
    Then I softly see that the saved value "{SavedValue:orgName1}" and "{SavedValue:orgName2}" are equal

  @53153 @preApplicationEdition
  Scenario: Validate edition of pre-application
    When I click on "Edit" in the page details
    And I wait for "5" seconds
    And I enter "Edition" values from "PreApplication_Field_Values"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"

  @75596 @70248 @70664 @53154 @addBudgetDetailsToPreApplication @smoke
  Scenario: Validate addition of budget in the budget grid to an pre-application |
  Validate User will be able to view the opportunity focus area in the application budget grid when the focus area settings as Yes while announcement creation
  Validate the SPI Users will be able to add new focus areas while creating an pre-application | Validate when the oppurtunity has only one focus area then user will not be able see any other focus areas when clicked on Add focus areas
    When I navigate to "Budget" sub tab
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    When I click on top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:focusAreaAssociateTableId---"
    When I close "Associate Focus Area" modal by clicking the top right x button
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area :" inside rows of enhanced grid id "---preApplication:-:SubRecipientBudgetPeriodTableId---"
    When I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 1000       | 5000           | 100            |
#    And I expand nested table containing column value "BP01"
    And I wait for "5" seconds
    Then I softly see value "$5,000.00" for title "Budget" against the value "Construction" inside table "---preApplication:-:SubRecipientBudgetPeriodTableId---"
    Then I softly see value "$1,000.00" for title "Cash Match" against the value "Construction" inside table "---preApplication:-:preApplicationAttachmentId---"
    Then I softly see value "$5,000.00" for title "Non-Cash Match" against the value "Construction" inside table "---preApplication:-:preApplicationAttachmentId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---preApplication:-:preApplicationAttachmentId---"

  @70466 @53160 @70467 @submitPreApplication @smoke
  Scenario: Submitting an pre application to Grantor |To verify that the budget field is editable for the Subrecipient (SPI User) under budget tab on pre-application
  Validate whether SPI user can view the edit button once pre - application has been submitted to Grantor |  Validate whether the user can submit the Pre Application Submission before the due date
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
#    Given I expand nested table containing column value "BP01"
    Then I softly see value "$10,150.00" for title "Total Project Cost" against the value "Construction" inside table "---preApplication:-:preApplicationAttachmentId---"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
#    And I click on "Back" in the page details
    And I switch to parent tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I click on "Edit" icon for "Other" inside flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Justification Of Project Cost" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    Then I softly see value "Automation.pdf" for title "Title" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"
    Then I softly see value "Justification Of Project Cost" for title "Classification" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly cannot see top right button "Edit" in page detail

  @34150 @70524 @70250 @70249 @75584 @70247 @70251 @53162 @34023 @preApplicationToApplication
  Scenario Outline: Validate Grantor accept the submitted pre-application and converted it to application | Validate the subrecipient users able to create application from the approved Pre Application
  Validate Announcement owner will be able to view the Accept and Reject button |Validate the subrecipient users able to create application from the approved Pre Application
  Validate Announcement Owner will be able to view the pending task under announcement tab after every pre application submission happens. |Validate pre-application is converted to Application |Verify whether PM, FO,EXE internal user is able to view Accepted Pre Application
  Validate SPI user will not able to create application before Pre-Application is Accepted by Grantor | Validate the SPI user can view the Accepted pre-applications under Pre-Applications - Submitted table list
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       |  Is Key Contact |
      | {SavedValue:SPI3 Username} |  Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
#    And I click on "Back" in the page details
    And I close the tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "<Announcement Name>" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    And I get the "EGMS ID"
    Then I softly cannot see top right button "Create Application" in page detail
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    Then I softly can see top right button "Accept" in page detail
    Then I softly can see top right button "Reject" in page detail
    When I click on "Accept" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - Submitted"
    And I perform quick search for "<Announcement Name>" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    Then I softly see "<Announcement Name>" inside flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    When I click on "View" icon for "<Announcement Name>" inside table
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    And I enter value "New York" into field "City__c"
    And I enter value "GA" into field "State__c"
    And I enter value "12345" into field "Zip4__c"
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
    And I get the "EGMS ID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
#    And I click on "Back" in the page details
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
#    And I click on "Back" in the page details
    And I close the tab
    When I click on "Submit Application" in the page details
    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Given I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see status in Progress-bar is "Submitted" and is "dark blue"
    Examples:
      | Announcement Name                                        | User |
      | {SavedValue:Automation Runtime Announcement Application} | PM   |
      | {SavedValue:Automation Runtime Announcement Application} | FO   |
      | {SavedValue:Automation Runtime Announcement Application} | EXE  |

  @70468 @acknowledgeRequiredForPre-App
  Scenario: Validate the system should throw an validation message if the pre-application is submitted with Acknowledging it
    And I wait for "5" seconds
    And I enter "Edition1" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:SubRecipientBudgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab - Enter an Acknowledgement before submitting this Pre-Application. |

  @70523 @snapshotAfterPreApplicationIsSubmitted  @skipOnJenkins @snapExecution
  Scenario:  Validate SR user is able to view the Snapshot after Pre- Application is Submitted to Grantor status
    Given I click on "Edit" in the page details
    And I wait for "5" seconds
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I switch to parent tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    And I wait for "5" seconds
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Submission"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I see "Submitted to Grantor" on page "1" of "govgrants" pdf file

  @34155 @75585 @34025 @preApplicationRejectionByGrantor  @buglogged169487
  Scenario Outline: Validate when Grantor Rejects the submitted pre-application then the status of Pre-Application status will be in rejected status
  Validate other than Record Owner PM, FO user will not able to Reject submitted Pre-Application | Validate the SPI user can view the rejected pre-applications under Pre-Applications - Submitted table list
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
#    And I click on "Back" in the page details
    And I switch to parent tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I softly cannot see top right button "Reject" in page detail
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---preApplication:-:pendingTaskTableId---"
    When I click on "Reject" in the page details
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "<Announcement Name>" in "RecipientPreApplications" panel
    Then I softly see value "<Announcement Name>" for title "Pre-Application Title" against the value "Rejected" inside table "RecipientPreApplications"
    When I click on "View" icon for "<Announcement Name>" inside table
    Then I softly cannot see top right button "Create Application" in page detail
    Examples:
      | Announcement Name                                        |
      | {SavedValue:Automation Runtime Announcement Application} |

  @75523 @77655 @75522 @preApplicationPDFRelatedLog
  Scenario Outline: To verify system allow to download PDF for Pre-application section in Related log tab of announcement | To verify user able to view Pre-Applications in Pre-Applications section in Related log tab of announcement
  Validate whether user can view the Accepted Status on progress bar once the pre-application is accepted by Grantor
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       |  Is Key Contact |
      | {SavedValue:SPI3 Username} |  Checked        |
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I wait for "2" seconds
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "<Announcement Name>" in "RecipientPreApplications" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    Then I softly cannot see top right button "Create Application" in page detail
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---preApplication:-:pendingTaskTableId---" panel
    Then I softly see that "Record Id" has been added in flextable with Id "---preApplication:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record id" inside flex table with id "---preApplication:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - Submitted"
    And I perform quick search for "<Announcement Name>" in "RecipientPreApplications" panel
    Then I softly see value "<Announcement Name>" for title "Pre-Application Title" against the value "Accepted" inside table "RecipientPreApplications"
    When I click on "View" icon for "<Announcement Name>" inside table
    Then I softly see status in Progress-bar is "Accepted" and is "dark blue"
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I wait for "4" seconds
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I get the "EGMS ID"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "2" seconds
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "2" seconds
    And I switch to tab number "1"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Given I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    When I navigate to "Related Log" sub tab
    And I click on parallel menu button in flex table title "Submitted Pre-Applications"
    And I select "Download as PDF" from dropdown
    And I wait for "5" seconds
    And I download the file
    Then I softly see "Submitted Pre-Applications" on page "1" of "govgrants" pdf file
    Examples:
      | Announcement Name                                        |
      | {SavedValue:Automation Runtime Announcement Application} |