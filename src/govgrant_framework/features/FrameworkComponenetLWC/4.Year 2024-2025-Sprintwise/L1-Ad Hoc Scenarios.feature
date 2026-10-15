@Ad-hoc-FW-24902 @bug
Feature: Test Suite: https://reisystems.atlassian.net/browse/FW-24902
  3.0 - Bug - Test Cases Automation - Test Set - L1 Ad-hoc Scenario Coverage - TC Drafting - sprint 9 2026 https://reisystems.atlassian.net/browse/FW-24902

  @FW-24903
  Scenario: LWC - Approvers Table - Admin - To verify that, Time field should be editable when adding new row in Approvers Table
#    Given I have "default" configuration as below:
#      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
#      | Flex Table            | Display Field Names | {SavedValue:ApprovaTableDFN} | ApiGeneratedId:0 |
#    Given I setup test configuration as below:
#      | configurationCategory | fieldName           | fieldNewValue                        | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
#      | Flex Table:General    | Display Field Names | Time__c,{SavedValue:ApprovaTableDFN} | ProgramRolesAndResponsibilitiesInternalProgram |                           |                            |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name              | Program |
#      | Automation ADMIN1 | Step 1  |
#    And I click on "Edit" icon for "Automation ADMIN1" inside flex table with id "---program:-:approverTableId---" without waiting for record
#    Then I softly see fields "Time__c" is in edit mode

  @FW-24904
  Scenario: LWC - Approvers Table - Admin - To verify that, Time field should be editable when adding new row in Approvers Table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ApprovaTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                        | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Time__c,{SavedValue:ApprovaTableDFN} | ProgramRolesAndResponsibilitiesInternalProgram |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    And I click on "Edit" icon for "Automation PM" inside flex table with id "---program:-:approverTableId---" without waiting for record
    Then I softly see fields "Time__c" is in edit mode

  @FW-24905
  Scenario: LWC - Forms - SPI - To verify that "Form Saved Successfully" message should be displayed after saving a form using top level edit
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see "Form saved successfully" page message displayed in page layout

  @FW-24906
  Scenario: LWC - Forms - SPI - To verify that "Form Saved Successfully" message should be displayed after saving a form using field level edit
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "5" seconds
    When I hovering mouse on help text icon inside page block detail "1a. Describe the activities and/or services to be provided. (10 points)"
    And I click the inline edit button for the "Question1__c" field with field label "1a. Describe the activities and/or services to be provided. (10 points)"
    And I enter value "Test Announcement" into field "Question1__c"
    And I click on inline edit footer button "Save"
    Then I see "Form saved successfully" page message displayed in page layout

   @FW-24907
  Scenario: LWC - Forms - PM - To verify that "Form Saved Successfully" message should be displayed after saving a form using field level edit
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Activities" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "3" seconds
    When I hovering mouse on help text icon inside page block detail "1a. Describe the activities and/or services to be provided. (10 points)"
    And I click the inline edit button for the "Question1__c" field with field label "1a. Describe the activities and/or services to be provided. (10 points)"
    And I enter value "Test Announcement" into field "Question1__c"
    And I click on inline edit footer button "Save"
    Then I see "Form saved successfully" page message displayed in page layout

  @FW-24911
  Scenario: LWC - Modal - PM - To verify that the user should be able to delete a record using the Modal Delete action after creating a new record using top level action
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Runtime" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    Then I see "Create Contact" opens in overLay window
    And I click modal button "Delete"
    Then I see "DataTableEnhanceProgramContacts" flex table is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    When I perform quick search for "{SavedValue:uniqueEmailID}" in "---program:-:associateContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:associateContactsTableId---"

  @FW-24912
  Scenario: LWC - Modal - PM - To verify that the user should be able to delete a record using the Modal Delete action after creating a new record using row level action
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    When I click on "New Test" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Runtime" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    Then I see "Create Contact" opens in overLay window
    And I click modal button "Delete"
    And I pause execution for "3" seconds
    Then I see "DataTableEnhanceProgramContacts" flex table is displayed

  @FW-24913
  Scenario: LWC - Modal - PM - To verify that the user should be able to delete a record using the Modal Delete action after viewing a new record
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    When I click on "New Test" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Runtime" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    Then I see "Create Contact" opens in overLay window
    And I close "Create Contact" modal by clicking the top right x button
    And I pause execution for "3" seconds
    Then I see "DataTableEnhanceProgramContacts" flex table is displayed
    And I click on "View" icon for "{SavedValue:uniqueEmailID}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click modal button "Delete"
    And I pause execution for "3" seconds
    Then I see "DataTableEnhanceProgramContacts" flex table is displayed

  @FW-24914
  Scenario: LWC - Modal - PM - To verify that the user should be able to delete a record using the Modal Delete action after edit and saving a record
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    When I click on "New Test" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Runtime" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    Then I see "Create Contact" opens in overLay window
    And I close "Create Contact" modal by clicking the top right x button
    And I pause execution for "3" seconds
    Then I see "DataTableEnhanceProgramContacts" flex table is displayed
    And I click on "Edit Test" icon for "{SavedValue:uniqueEmailID}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    When I enter in modal value "9876543212" into field "Phone"
    When I enter in modal value "Test" into field "MailingStreet"
    When I enter in modal value "CA" into field "MailingCity"
    When I enter in modal value "AL: Alabama" into field "State__c"
    When I enter in modal value "20171" into field "MailingPostalCode"
    When I enter in modal value "USA" into field "MailingCountry"
    And I click modal button "Save"
    And I click modal button "Delete"
    And I pause execution for "3" seconds
    Then I see "DataTableEnhanceProgramContacts" flex table is displayed

  @FW-24915
  Scenario: LWC - Modal - SPI - To verify that the user should be able to delete a record using the Modal Delete action after creating a new record using top level action
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Runtime" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    Then I see "AppContact" opens in overLay window
    And I click modal button "Delete"
    Then I see "AppContactFlexGrid" flex table is displayed

  @FW-24916
  Scenario: LWC - Modal - SPI - To verify that the user should be able to delete a record using the Modal Delete action after creating a new record using row level action
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    When I click on "New Test" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Runtime" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    Then I see "AppContact" opens in overLay window
    And I click modal button "Delete"
    And I pause execution for "3" seconds
    Then I see "AppContactFlexGrid" flex table is displayed

  @FW-24917
  Scenario: LWC - Modal - SPI - To verify that the user should be able to delete a record using the Modal Delete action after viewing a new record
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    Then I see "AppContactFlexGrid" flex table is displayed
    And I click on "View" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    And I click modal button "Delete"
    And I pause execution for "3" seconds
    Then I see "AppContactFlexGrid" flex table is displayed

  @FW-24918
  Scenario: LWC - Modal - SPI - To verify that the user should be able to delete a record using the Modal Delete action after edit and saving a record
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    When I click on "New Test" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Runtime" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    Then I see "AppContact" opens in overLay window
    And I close "AppContact" modal by clicking the top right x button
    And I pause execution for "3" seconds
    Then I see "AppContactFlexGrid" flex table is displayed
    And I click on "Edit Test" icon for "{SavedValue:uniqueEmailID}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    When I enter in modal value "9876543212" into field "Phone"
    When I enter in modal value "Test" into field "MailingStreet"
    When I enter in modal value "CA" into field "MailingCity"
    When I enter in modal value "AL: Alabama" into field "State__c"
    When I enter in modal value "20171" into field "MailingPostalCode"
    When I enter in modal value "USA" into field "MailingCountry"
    And I click modal button "Save"
    And I click modal button "Delete"
    And I pause execution for "3" seconds
    Then I see "AppContactFlexGrid" flex table is displayed




