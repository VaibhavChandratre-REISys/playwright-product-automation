@lwcpagelayout @PageLayout @PageLayout1 @ViewLayout
Feature: Page Layout Scenarios
Business Need: to ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @401533 @401534 @379088 @379089 @379090 @wip
  Scenario Outline: Sanity Testing- Page Layout- Admin- To verify page blocks are aligned properly on page layout.
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    When I navigate to "Files" sub tab
    And I pause execution for "5" seconds
    Then I see page block "Notes" aligned properly on page layout
    Examples:
      | User |
     # | Admin |
      | PM   |

  @401527 @401528 @lwcsanity @lwcsanitypagelayout
  Scenario Outline: Sanity Testing- Page Layout- Admin- To verify on View page layout, fields are not editable.
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    When I enter value "Automation Runtime Internal Program" into field "ProgramName__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "ProgramName__c" is not editable
    Then I softly see field "StartDate__c" is not editable
    Then I softly see field "EndDate__c" is not editable
    Then I softly see field "Abbreviation__c" is not editable
    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @379071 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- SPI- To verify on View page layout, fields are not editable.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "fieldAddressline1__c" is not editable
    Then I softly see field "fieldAddressline2__c" is not editable
    Then I softly see field "fieldCity__c" is not editable
    Then I softly see field "fieldCounty__c" is not editable

  @401531 @401530 @lwcsanity @lwcsanitypagelayout
  Scenario Outline: Sanity Testing- Page Layout- PM- To verify Step Progress bar is visible on page layout
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see step progress bar is displayed
    Examples:
      | Users |
     # | Admin |
      | PM    |

  @401536 @320271 @320273 @320281 @320290 @lwcsanity @lwcsanitypagelayout @wip
  Scenario: Sanity Testing- Page Layout- Admin- To verify page tabs and tab icons are showing as expected.
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    Then I see "Overview" subtab is present with icon "knowledge_base" in page details
    Then I see "Setup" subtab is present with icon "setting" in page details
    Then I see "Files" subtab is present with icon "page" in page details
    Then I see "Responsibilities" subtab is present with icon "favorite" in page details
    Then I see "History" subtab is present with icon "skip_back" in page details
    Then I see "Messages" subtab is present with icon "chat" in page details

  @401537 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- Admin- To verify page tabs and tab icons are showing as expected.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    Then I see "Overview" subtab is present with icon "knowledge_base" in page details
    Then I see "Setup" subtab is present with icon "setting" in page details
    Then I see "Files" subtab is present with icon "page" in page details
    Then I see "Responsibilities" subtab is present with icon "favorite" in page details
    Then I see "History" subtab is present with icon "skip_back" in page details
    Then I see "Messages" subtab is present with icon "chat" in page details

  @401539 @lwcsanity @lwcsanitypagelayout @wip
  Scenario: Sanity Testing- Page Layout- Admin- To verify number of page tabs are showing correct which are added in the config
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see "Overview" subtab is present in page details
    Then I see "Setup" subtab is present in page details
    Then I see "Responsibilities" subtab is present in page details
    Then I see "Related Log" subtab is present in page details
    Then I see "Files" subtab is present in page details
    Then I see "Messages" subtab is present in page details

  @401540 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- PM- To verify number of page tabs are showing correct which are added in the config
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see "Overview" subtab is present in page details
    Then I see "Setup" subtab is present in page details
    Then I see "Responsibilities" subtab is present in page details
    Then I see "Files" subtab is present in page details
    Then I see "Messages" subtab is present in page details

  @401542 @401543 @lwcsanity @lwcsanitypagelayout
  Scenario Outline: Sanity Testing- Page Layout- PM- To verify number of page blocks are showing correct which are added in the config
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Files" sub tab
    Then I softly see "Attachments" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Program Files" page block displayed
    Then I softly see "Notes" page block displayed
    Examples:
      | Users |
     # | Admin |
      | PM    |

  @379386 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- SPI- To verify number of page blocks are showing correct which are added in the config
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Notes" page block displayed
    Then I softly see "Application Files" page block displayed
    Then I softly see "Notes" page block displayed

  @401545 @lwcsanity @lwcsanitypagelayout @wip
  Scenario: Sanity Testing- Page Layout- Admin- To verify fields of all data type are rendering in the page blocks
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "StartDate__c" inside page block
    Then I softly see field "WebsiteAddress__c" inside page block
    Then I softly see field "ProgramName__c" inside page block
    Then I softly see field "PrimaryFundingOrganization__c" inside page block
    Then I softly see field "Objectives__c" inside page block
    Then I softly see field "KPIsRequired__c" inside page block

  @401546 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- PM- To verify fields of all data type are rendering in the page blocks    When I login to "As a Grantor" app as "PM" user
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:URLField_WebsiteAddress}                |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:ProgramNameField}                       |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:ObjectiveField}                         |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:PicklistField_KPIRequired}              |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "WebsiteAddress__c" inside page block
    Then I softly see field "ProgramName__c" inside page block
    Then I softly see field "PrimaryFundingOrganization__c" inside page block
    Then I softly see field "Objectives__c" inside page block
    Then I softly see field "KPIsRequired__c" inside page block

  @401548 @lwcsanity @lwcsanitypagelayout @wip
  Scenario: Sanity Testing- Page Layout- Admin- To verify page message type - Success is getting displayed on page layout.
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see "Automation Test Success" page message displayed in page layout

  @401549  @401552  @401555 @401562 @401559 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- PM- To verify page message type - Success is getting displayed on page layout.
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Automation Testing Information |
      | Automation Testing Alert       |
      | Automation Testing Warning     |
      | Automation Testing Success     |
      | Automation Testing Error       |

  @379392 @379395 @379398  @379402 @379405 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- SPI- To verify page message type - Success is getting displayed on page layout.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see "Automation Test Success" page message displayed in page layout
    Then I see "Automation Test Information" page message displayed in page layout
    Then I see "Automation Test Alert" page message displayed in page layout
    Then I see "Automation Test Warning" page message displayed in page layout
    Then I see "Automation Test Error" page message displayed in page layout

  @401551 @lwcsanity @lwcsanitypagelayout @wip
  Scenario: Sanity Testing- Page Layout- Admin- To verify page message type - Information is getting displayed on page layout.
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see "Automation Test Information" page message displayed in page layout

  @401554 @lwcsanity @lwcsanitypagelayout @wip
  Scenario: Sanity Testing- Page Layout- Admin- To verify page message type - Alert is getting displayed on page layout.
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see "Automation Test Alert" page message displayed in page layout

  @401558 @lwcsanity @lwcsanitypagelayout @wip
  Scenario: Sanity Testing- Page Layout- Admin- To verify page message type - Warning is getting displayed on page layout.
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see "Automation Test Warning" page message displayed in page layout

  @401561 @lwcsanity @lwcsanitypagelayout @wip
  Scenario: Sanity Testing- Page Layout- Admin- To verify page message type - Warning is getting displayed on page layout.
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see "Automation Test Error" page message displayed in page layout

  @401564 @lwcsanity @lwcsanitypagelayout @wip
  Scenario: Sanity Testing- Page Layout- Admin- To verify all page layout actions are displaying which are mentioned in the config.
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    Then I see "Save" button is displayed
    Then I see "Cancel" button is displayed
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I click on top right button "Associate" in flex table with id "DataTableEnhanceProgramContacts"
    When I click "Associate" after selection of "Automation Admin" in the table "DataTableEnhanceProgramContacts"
    When I navigate to "Overview" sub tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "ProgramRolesAndResponsibilitiesInternalProg" by clicking "New" :
      | Name             | Program | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | Automation Admin | Step 1  | Step 1       | Step 1 | Step 1 | Step 1                  | Step 1   |
    And I pause execution for "15" seconds
    And I click on "menu" button inside page details in lwc
    Then I see "Submit For Approval" button is displayed

  @401565 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- PM- To verify all page layout actions are displaying which are mentioned in the config.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    When I enter value "Automation Runtime Internal Program" into field "ProgramName__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Overview" sub tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "ProgramRolesAndResponsibilitiesInternalProg" by clicking "New" :
      | Name          | Program | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | Automation PM | Step 1  | Step 1       | Step 1 | Step 1 | Step 1                  | Step 1   |
    And I pause execution for "15" seconds
    And I click on "menu" button inside page details in lwc
    Then I see "Submit For Approval" button is displayed

  @379408 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- SPI- To verify all page layout actions are displaying which are mentioned in the config.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see "Submit Application" button is displayed
    Then I see "Edit" button is displayed

  @401567 @lwcsanity @lwcsanitypagelayout @wip
  Scenario: Sanity Testing- Page Layout- Admin- To verify for page tabs if Highlights Panel? is true then its showing top of the page layout.
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Name" inside page block
    Then I softly see field "Status__c" inside page block
    Then I softly see field "Account__c" inside page block

  @401568 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- PM- To verify for page tabs if Highlights Panel? is true then its showing top of the page layout.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Name" inside page block
    Then I softly see field "Status__c" inside page block
    Then I softly see field "Account__c" inside page block

  @379411 @lwcsanity @lwcsanitypagelayout @wip @highlightspanelcheckmanually
  Scenario: Sanity Testing- Page Layout- SPI- To verify for page tabs if Highlights Panel? is true then its showing top of the page layout.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "fieldInternalOrganization__c" inside page block
    Then I softly see field "fieldType__c" inside page block

  @401571 @401572 @320238 @320237 @lwcsanity @lwcsanitypagelayout
  Scenario Outline: Sanity Testing- Page Layout- Admin- To verify sort order of page tabs are showing correct.
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see "Overview" shown at number "0" inside subtabs
    Then I see "Setup" shown at number "1" inside subtabs
    Then I see "Responsibilities" shown at number "2" inside subtabs
    Then I see "Files" shown at number "3" inside subtabs
    Then I see "History" shown at number "4" inside subtabs
    Then I see "Messages" shown at number "5" inside subtabs
    Examples:
      | User |
      #| Admin |
      | PM   |

  @379414 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- SPI- To verify sort order of page tabs are showing correct.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see "Overview" shown at number "0" inside subtabs
    Then I see "Financials" shown at number "1" inside subtabs
    Then I see "Files" shown at number "2" inside subtabs
    Then I see "History" shown at number "3" inside subtabs
    Then I see "Collab" shown at number "3" inside subtabs

  @401582 @lwcsanity @lwcsanitypagelayout @wip
  Scenario: Sanity Testing- Page Layout- Admin- To verify help icon is visible on layout when help text is provided in page block config
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see helpIcon displayed beside "Contacts" respective field or column
    Then I see helpIcon displayed beside "Information" respective field or column

  @401583 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- PM- To verify help icon is visible on layout when help text is provided in page block config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Block            | Help Text | Test              | ApiGeneratedId:0 |
      | Page Block            | Help Text | Test              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Help Text | Test          | Grantor State Program | Name                      | {pagelayout:Information_Program} |
      | Page Block:Page Block Detail | Help Text | Test          | Grantor State Program | Name                      | {pagelayout:Description_Program} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Overview" sub tab
    Then I see helpIcon displayed beside "Description" respective field or column
    Then I see helpIcon displayed beside "Information" respective field or column

  @379422 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- PM- To verify help icon is visible on layout when help text is provided in page block config
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    Then I see helpIcon displayed beside "Contacts" respective field or column

  @379423 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- SPI- To verify help icon is visible on layout when help text is provided in page block config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Block            | Is Active | true              | ApiGeneratedId:0 |
      | Page Block            | Help Text | Test              | ApiGeneratedId:1 |
      | Page Block            | Is Active | true              | ApiGeneratedId:2 |
      | Page Block            | Help Text | Test              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block:Page Block Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:ApplicationInformation_Application} |
      | Page Block:Page Block Detail | Help Text | Test          | Recipient ApplicationView | Name                      | {pagelayout:ApplicationInformation_Application} |
      | Page Block:Page Block Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:SystemInformation_Application}      |
      | Page Block:Page Block Detail | Help Text | Test          | Recipient ApplicationView | Name                      | {pagelayout:SystemInformation_Application}      |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see helpIcon displayed beside "Application Information" respective field or column
    Then I see helpIcon displayed beside "System Information" respective field or column

  @379424 @314831 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- Admin- To verify help icon is visible on layout when help text is provided in page block detail config
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see helpIcon displayed beside "Abbreviation" respective field or column
    Then I see helpIcon displayed beside "Type" respective field or column
    #Then I see helpIcon displayed beside "Project Period Start Date" respective field or column
    #Then I see helpIcon displayed beside "Project Period End Date" respective field or column
    Then I see helpIcon displayed beside "Internal Organization" respective field or column

  @379425 @314832 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- PM- To verify help icon is visible on layout when help text is provided in page block detail config
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see helpIcon displayed beside "Abbreviation" respective field or column
    Then I see helpIcon displayed beside "Type" respective field or column
    #Then I see helpIcon displayed beside "Project Period Start Date" respective field or column
    #Then I see helpIcon displayed beside "Project Period End Date" respective field or column
    Then I see helpIcon displayed beside "Internal Organization" respective field or column

  @379426 @lwcsanity @lwcsanitypagelayout
  Scenario: Sanity Testing- Page Layout- SPI- To verify help icon is visible on layout when help text is provided in page block detail config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Test              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Test              | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Test              | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active      | true          | Recipient ApplicationView | Name                      | {pagelayout:DateField_StartDateSPI} |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Test          | Recipient ApplicationView | Name                      | {pagelayout:DateField_StartDateSPI} |
      | Page Block Config:Page Block Rule Detail | Is Active      | true          | Recipient ApplicationView | Name                      | {pagelayout:DateField_EndDateSPI}   |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Test          | Recipient ApplicationView | Name                      | {pagelayout:DateField_EndDateSPI}   |
      | Page Block Config:Page Block Rule Detail | Is Active      | true          | Recipient ApplicationView | Name                      | {pagelayout:RefField_DueDateSPI}    |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Test          | Recipient ApplicationView | Name                      | {pagelayout:RefField_DueDateSPI}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see helpIcon displayed beside "Estimated Project Period Start Date" respective field or column
    Then I see helpIcon displayed beside "Estimated Project Period End Date" respective field or column
    Then I see helpIcon displayed beside "Application Due Date" respective field or column

##################### Page Block Type - Suite - 361860 ##################
  @361888 @361904
  Scenario Outline: LWC-Flex View Layout -Page Block Types - Config- Admin-To verify that page block should get render on tab when we provide page block type as 'field' in config.
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I see "Overview" subtab in page detail
    Then I see "Setup" subtab in page detail
    Then I see "Related Log" subtab in page detail
    Then I see "Setup" subtab in page detail
    Then I see "Files" subtab in page detail
    Then I see "History" subtab in page detail
    Then I see "Files" subtab in page detail
    Then I see "Messages" subtab in page detail
    Examples:
      | User |
     # | Admin |
      | PM   |

  @361909 @361910 @361914 @361915 @362920 @361921 @361931 @361932 @362935 @361936 @361953 @361954
  Scenario Outline: LWC-Flex View Layout -Page Block Types - Config- Admin-To verify that page block should get render on tab when we provide page block type as 'Attachments' in config.
  |LWC-Flex View Layout -Page Block Types - Config- Admin-To verify that page block should get render on tab when we provide page block type as 'Attachments' in config.|
  |LWC-Flex View Layout -Page Block Types - Config- Admin-To verify that page block should get render on tab when we provide page block type as 'Approval History' in config.|
  |LWC-Flex View Layout -Page Block Types -UI- PM-To verify that page block should get render on tab when we provide page block type as 'Approval History' in config.|
  |LWC-E-Grid-Lookup-(Admin)To verify lookup field title should be in bold with dark grey background|
  |LWC-Flex View Layout -Page Block Types - Config- Admin-To verify that page block should get render on tab when we provide page block type as 'Grid' in config.|
  |LWC-Flex View Layout -Page Block Types - UI-PM-To verify that page block should get render on tab when we provide page block type as 'Grid' in config.|
  |LWC-Flex View Layout -Page Block Types - Config- Admin-To verify that page block should get render on tab when we provide page block type as 'Notes and Attachments' in config.|
  |LWC-Flex View Layout -Page Block Types - Config- Admin-To verify that page block should get render on tab when we provide page block type as 'Record History' in config.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see "Information" page block displayed
    Then I softly see "Description" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Program Specific Settings" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Setup" sub tab
    Then I softly see "Business Forms" page block displayed
    Then I softly see "Supporting Documents Checklist" page block displayed
    Then I softly see "Review Steps" page block displayed
    Then I softly see "Related Focus Area" page block displayed
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    When I navigate to "Files" sub tab
    Then I softly see "Attachments" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Program Files" page block displayed
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    Examples:
      | User |
     # | Admin |
      | PM   |

  @361905 @361913 @361917 @361922 @361934 @361937 @361955
  Scenario:LWC-Flex View Layout -Page Block Types -SPI-PM-To verify that page block should get render on tab when we provide page block type as 'field' in config.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Information" page block displayed
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see "Opportunity Overview" page block displayed
    Then I softly see "Application Overview" page block displayed
    Then I softly see "Project Information" page block displayed
    Then I softly see "Contacts" page block displayed
    When I navigate to "Forms and Files" sub tab
    And I pause execution for "5" seconds
    Then I softly see "Supporting Documents Checklist" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Application Files" page block displayed
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    ###################### Header Overview - Suite - 319000 ####################
  @313811
  Scenario: LWC-Flex View Layout - Page Tab - UI- SPI- To verify 'Header Overview'  tab is available on view layout when "Is Active" checkbox is checked in page tab config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active | true          | Recipient ApplicationView | Name                      | TAB-4404                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see complete header overview tab is displayed at view detail page
    Then I see field "EGMS ID" inside page block

  @313842
  Scenario: LWC-Flex View Layout - Page Tab - UI- SPI- To verify 'Header Overview' tab is not available on view layout when "Is Active" checkbox is unchecked in page tab config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active | false         | Recipient ApplicationView | Name                      | TAB-4404                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I do not see "EGMS ID" subtab is present in page details

  @315317
  Scenario: LWC-Flex View Layout - Page Block Details - UI - SPI - To verify that if user added value in 'Field Label Override(Rich Text)' in page block details config then that label is rendering on page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Test Automation | Recipient ApplicationView | Name                      | PBD-37845                  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see field "Test Automation" inside page block

  @315310
  Scenario: LWC-Flex View Layout - Page Block Details - UI - SPI - To verify that field label is rendering on page block same as added in 'Field Label Override' in page block details config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Test Automation | Recipient ApplicationView | Name                      | PBD-37845                  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see field "Test Automation" inside page block

  @363695 @wip
  Scenario: Changing save attachment behaviour at attachment modal from config and validating it at attachment modal
    Given I have "default" configuration as below:
      | configurationCategory        | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block:Page Block Detail | Save Attachment Behaviour | Save              | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                 | fieldNewValue        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Save Attachment Behaviour | Save and Close Modal | Grantor State Program | GNT__PageBlockTitle__c    | Attachments                |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    When I navigate to "Files" sub tab
    When I click on "Edit" icon for "Program Artifacts" inside table
    Then I see "Save and Close" at bottom of Attachment Modal

  @363697
  Scenario: Changing save attachment behaviour at attachment modal from config and validating it at attachment modal
    Given I have "default" configuration as below:
      | configurationCategory        | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block:Page Block Detail | Save Attachment Behaviour | Save              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                 | fieldNewValue                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Save Attachment Behaviour | Save and Save and Close Modal | Grantor State Program | GNT__PageBlockTitle__c    | Attachments                |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    When I navigate to "Files" sub tab
    When I click on "Edit" icon for "Program Artifacts" inside table
    And I see "Save" at bottom of Attachment Modal
    Then I see "Save and Close" at bottom of Attachment Modal

  @363699 @wip
  Scenario: Changing value for required for save behaviour field for URL from config and checking error message at modal
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Announcement Create - Grantor | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Announcement Create - Grantor | Name                      | PBD-23616                  |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - Draft"
    When I click on top right button "Create" in flex table with id "ActiveFundingOpportunities"
    When I enter value "{flexgrid:ProgramRecord}" into field "Program__c"
    And I click modal button "Continue"
    Then I see the following message in the page details contains:
      | Funding Opportunity Web Address is required to save |

  @363700
  Scenario: Changing value for required for save behaviour field for URL from config and checking error message at modal
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {pagelayout:URLField_WebsiteAddressModal} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {pagelayout:URLField_WebsiteAddressModal} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    Then I see the following message in the page details contains:
      | To save, Website Address is required in the Information section. |

  @363702 @wip
  Scenario: validate alert message for enetering incorrect data at url field on modal
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - Draft"
    When I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I enter value "{flexgrid:ProgramRecord}" into field "Program__c"
    When I enter value "abc" into field "FundingOpportunityURL__c"
    And I click modal button "Continue"
    Then I see the following message in the page details contains:
      | Please enter valid URL value. |

  @363703
  Scenario: validate alert message for enetering incorrect data at url field on modal
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {pagelayout:URLField_WebsiteAddressModal} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    When I enter value "abc" into field "WebsiteAddress__c"
    And I click on "Save and Continue" in the page details
    Then I see the following message in the page details contains:
      | Please enter valid URL value. |

  @363705 @wip
  Scenario:validate if correct URL value entered in URL field on modal and click on continue button then it redirects to next page
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - Draft"
    When I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I enter value "{flexgrid:ProgramRecord}" into field "Program__c"
    When I enter value "www.google.com" into field "FundingOpportunityURL__c"
    And I click modal button "Continue"
    Then I see "Create Funding Opportunity" shown as over view header

  @363706 @wip
  Scenario: validate field message displayed for required for save and submit Field at page header for PM user
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I see field message with text as "Required to Save" and "Required to Submit"

  @363707
  Scenario: validate field message displayed for required for save and submit Field at page header for PM user
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I see field message with text as "Required to Save" and "Required to Submit"

  @363707 @wip
  Scenario: Changing value for required for save behaviour field from config and checking error message at program save for PM user
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | PBD-17697                  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | PBD-17697                  |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I clear the value from field "StartDate__c"
    When I click on "Save" in the page details
    Then I see the following message in the page details contains:
      | Project Period Start Date is required to save under Overview. |

  @363708
  Scenario: Changing value for required for save behaviour field from config and checking error message at program save for PM user
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {pagelayout:DateField_StartDate} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {pagelayout:DateField_StartDate} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I clear the value from field "StartDate__c"
    When I click on "Save" in the page details
    Then I see the following message in the page details contains:
      | To save, Project Period Start Date is required in the Overview tab under the Information section. |

  @364219 @wip
  Scenario: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify when 'is active' is set as true then field displays in the modal.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor Master Terms and Conditions | Name                      | PBD-32795                  |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:termsAndConditionsTableId---"
    Then I see field "Title" inside page block

  @364227
  Scenario: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify when 'is active' is set as true then field displays in the modal.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor Master Terms and Conditions | Name                      | PBD-32795                  |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:termsAndConditionsTableId---"
    Then I see field "Title" inside page block

  @364232 @wip
  Scenario: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify when 'is active' is set as False then field does not display in the modal.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Grantor Master Terms and Conditions | Name                      | PBD-32795                  |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:termsAndConditionsTableId---"
    Then I cannot see field "Title" inside page block

  @364233 @wip
  Scenario: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify when 'is active' is set as False then field does not display in the modal.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Grantor Master Terms and Conditions | Name                      | PBD-32795                  |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:termsAndConditionsTableId---"
    Then I cannot see field "Title" inside page block

  @364236 @wip @notgivensupportinlwc
  Scenario:LWC-Flex View Layout - Page Block Detail- Admin- To verify icon displays for the field if given in style css config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Grantor Master Terms and Conditions | Name                      | PBD-32795                  |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:termsAndConditionsTableId---"
    Then I cannot see field "Title" inside page block
    Then I see "Files" subtab is present with icon "fa fa-file" in page details

  @364238 @wip @notgivensupportinlwc
  Scenario:LWC-Flex View Layout - Page Block Detail- PM- To verify icon displays for the field if given in style css config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Grantor Master Terms and Conditions | Name                      | PBD-32795                  |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:termsAndConditionsTableId---"
    And I pause execution for "5" seconds
    Then I cannot see field "Title" inside page block
    Then I see "Files" subtab is present with icon "fa fa-file" in page details

  @364279
  Scenario: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify help text displays after field label in the page block detail if provided in config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Test              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active      | true          | Grantor State Program Create | Name                      | {pagelayout:ProgramName}   |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Test          | Grantor State Program Create | Name                      | {pagelayout:ProgramName}   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I see field "Program Name" inside page block
    #Then I see "This is a program abbreviation as determined by the internal organization" shown as help text
    Then I see helpIcon displayed beside "Program Name" respective field or column

  @364280
  Scenario: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify help text displays after field label in the page block detail if provided in config.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I hovering mouse on help text "Abbreviation" icon
    Then I see "This is a program abbreviation as determined by the internal organization" shown as help text

  @364298 @364299
  Scenario Outline: LWC-Flex View layout- Modal- Page Block Detail- PM- To verify 'Help Text Long' displays after field label in the page block detail if provided in config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue           | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Terms and Condition details | Grantor Master Terms and Conditions | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue                          | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Terms and Condition details | Grantor Master Terms and Conditions | Name                      | PBD-32795                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    And I pause execution for "30" seconds
    When I hovering mouse on help text "Title" icon
    Then I see "<helpTextInModal>" shown as help text

    Examples:
      | Users | helpTextInModal                        |
     # | Admin | Terms and Condition details |
      | PM    | Automation Terms and Condition details |

  @364301 @364302
  Scenario Outline: Sanity Testing- Modal- Page Block Detail- Admin- To verify 'Field Label Override' displays on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Title             | Grantor Master Terms and Conditions | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Title         | Grantor Master Terms and Conditions | Name                      | PBD-32795                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    Then I see field "EGMS ID" inside page block
    Examples:
      | Users |
      | PM    |

  @364312 @364313
  Scenario Outline:Sanity Testing- Modal- Page Tab- Admin- To verify Header Instruction Text displays in the modal if provided in the config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Tabs Config      | Header Instruction Text |                   | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName               | fieldNewValue  | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Header Instruction Text | <new_helpText> | Grantor Master Terms and Conditions | Name                      | TAB-3586                   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:termsAndConditionsTableId---"
    Then I softly see "<new_helpText>" shown as page instruction text
    Examples:
      | Users | new_helpText           |
      | ADMIN | Automation Header Text |
     # | PM    | Automation Header Text |


  @364033 @wip @notgivensupportinlwc
  Scenario: LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify icon displays for the field if given in style css config.
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see Required behavior under field "fa-fa-pencil" with star mark on modal

  @364034 @notgivensupportinlwc @wip
  Scenario: LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify icon displays for the field if given in style css config.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see Required behavior under field "fa-fa-pencil" with star mark on modal

  @364035 @notgivensupportinlwc @wip
  Scenario: LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify icon displays for the field if given in style css config.
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I see Required behavior under field "fa-fa-pencil" with star mark on modal


  @364035 @wip @notgivensupportinlwc
  Scenario: LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify icon displays for the field if given in style css config.
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I see field "Subrecipient Match Required?" inside page block

  @314812
  Scenario: LWC-Flex View Layout - Page Tab - UI - SPI - To verify that when 'Highlights Panel' checkbox is unchecked then header overview should be hidden
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Highlights Panel? | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName         | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Highlights Panel? | true          | Recipient ApplicationView | Name                      | TAB-4404                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see "Overview" subtab is present with icon "knowledge_base" in page details

  @314548
  Scenario:LWC-Flex View Layout - Page Block Details - UI - SPI - To verify that Field Label should not displayed on page block when "Hide Label" checkbox is checked.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Recipient ApplicationView | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Recipient ApplicationView | Name                      | PBD-37853                  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see "SAM Expiration Date" is not displayed inside page block detail

  @314547 @314545
  Scenario Outline:LWC-Flex View Layout - Page Block Details - UI - PM- To verify that Field Label should not displayed on page block when "Hide Label" checkbox is checked.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Grantor State Program | Name                      | PBD-35273                  |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Overview" sub tab
    Then I cannot see field "Status" inside page block
    Examples:
      | User |
      #| Admin |
      | PM   |

  @314477
  Scenario Outline:LWC-Flex View Layout - Page Block Details - UI - SPI - To verify that when user hover the 'i' icon infront of field label then help text should be displayed same as added in "Help Text Long" in page block details config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | <OldhelpText>     | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active      | true          | Recipient ApplicationView | PB-12069                  | PBD-42153                  |
      | Page Block Config:Page Block Rule Detail | Help Text Long | <NewhelpText> | Recipient ApplicationView | PB-12069                  | PBD-42153                  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I hovering mouse "Education Question" help text i icon in modal
    And I wait for "2" seconds
    Then I see help text "<NewhelpText>" is displayed releted field
    Examples:
      | Users | NewhelpText       | OldhelpText |
      | SPI3  | Test Organization |             |

  @314475 @314450 @askeddilip
  Scenario Outline: Test Case 314475: LWC-Flex View Layout - Page Block Details - UI - PM - To verify that when user hover the 'i' icon infront of field label then help text should be displayed same as added in "Help Text Long" in page block details config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Test              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active      | true          | Grantor State Program | PB-11276                  | PBD-35468                  |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Test          | Grantor State Program | PB-11276                  | PBD-35468                  |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    When I hovering mouse "Website Address" help text i icon in modal
    And I wait for "5" seconds
    Then I see help text "Test" is displayed releted field
    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @313969
  Scenario: LWC-Flex View Layout - Page Block - UI - SPI - To verify page block is not available on view layout when "Is Active" checkbox is unchecked in page block config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Block            | Is Active | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active | false         | Recipient ApplicationView | Name                      | PB-12069                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I cannot see field "EGMS ID" inside page block

  @313972
  Scenario: LWC-Flex View Layout - Page Block - UI - SPI - To verify page block is available on view layout when "Is Active" checkbox is checked in page block config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Block            | Is Active | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active | true          | Recipient ApplicationView | Name                      | PB-12069                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "EGMS ID" inside page block

  @313973 @313974 @skipOnJenkins
  Scenario Outline: LWC-Flex View Layout - Page Block - Config- Admin- To verify page block is not rendering on downloaded PDF when "Skip for Export" checkbox is checked in page block config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Tabs Config      | Skip for Export | false             | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName       | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Skip for Export | true          | Grantor State Program | Name                      | TAB-4156                   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I click on "menu" in the page details
    And I select "Download as PDF" from dropdown
    And I download the file
    And I pause execution for "5" seconds
    Then I cannot see "Overview" on page "1" of "govgrants" pdf file

    Examples:
      | User |
     # | Admin |
      | PM   |

  @313976 @skipOnJenkins
  Scenario: LWC-Flex View Layout - Page Block - UI - SPI - To verify page block is not rendering on downloaded PDF when "Skip for Export" checkbox is checked in page block config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Tabs Config      | Skip for Export | false             | Recipient ApplicationView | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName       | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Skip for Export | true          | Recipient ApplicationView | Name                      | TAB-4404                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I cannot see "EGMS ID" on page "1" of "govgrants" pdf file

  @313977 @313978 @skipOnJenkins
  Scenario Outline: LWC-Flex View Layout - Page Block - Config- Admin- To verify page block is rendering on downloaded PDF when "Skip for Export" checkbox is unchecked in page block config
  LWC - Flex View Layout - Page Layout Actions - UI - Admin - To verify when user click on 'Menu' icon then user should be able to see "Download as PDF" action in list
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Tabs Config      | Skip for Export | false             | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName       | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Skip for Export | false         | Grantor State Program | Name                      | TAB-4156                   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I see "Overview" on page "1" of "govgrants" pdf file

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @313979 @skipOnJenkins
  Scenario: LWC-Flex View Layout - Page Block - UI - SPI - To verify page block is rendering on downloaded PDF when "Skip for Export" checkbox is unchecked in page block config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Tabs Config      | Skip for Export | false             | Recipient ApplicationView | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName       | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Skip for Export | false         | Recipient ApplicationView | Name                      | TAB-4404                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I see "EGMS ID" on page "1" of "govgrants" pdf file

    ################ Page Tab - Suite Id - 320103 ##############

  @313832 @313826
  Scenario Outline: LWC-Flex View Layout - Page Tab- UI- PM- To verify 'Overview' tab is not available on view layout when "Is Active" checkbox is unchecked in page tab config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Tabs Config      | Is Active | true              | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active | false         | Grantor State Program | Name                      | TAB-4156                   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    Then I do not see "Overview" subtab is present in page details

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @313810 @313806
  Scenario Outline: LWC-Flex View Layout - Page Tab- UI- PM- To verify 'Overview'  tab is available on view layout when "Is Active" checkbox is checked in page tab config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Tabs Config      | Is Active | true              | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active | true          | Grantor State Program | Name                      | TAB-4156                   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    Then I see "Overview" subtab is present in page details

    Examples:
      | User |
     # | Admin |
      | PM   |

  @314811
  Scenario Outline: LWC-Flex View Layout - Page Tab - UI - PM - To verify that when 'Highlights Panel' checkbox is unchecked then tab should be display in tabs line
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Highlights Panel? | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName         | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Highlights Panel? | false         | Grantor State Program | Name                      | TAB-4156                   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - All"
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    Then I see "Overview" subtab is present in page details

    Examples:
      | User |
     # | Admin |
      | PM   |

  @315910 @315909
  Scenario Outline: LWC-Flex View Layout - Page Tab - UI - PM - To verify "Header Instruction Text" is rendering on left top of page tab same as text added in "Header Instruction Text" on page tab config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Tabs Config      | Tab Title               | Overview          | Grantor State Program | ApiGeneratedId:0 |
      | Page Tabs Config      | Header Instruction Text |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName               | fieldNewValue                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Tab Title               | Overview                           | Grantor State Program | Name                      | TAB-4156                   |
      | Page Tabs Config:Page Layout Action | Header Instruction Text | Test Automation header instruction | Grantor State Program | Name                      | TAB-4156                   |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see "Test Automation header instruction" shown as header instruction text
    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @337263 @337266
  Scenario Outline: LWC-Flex View Layout - Page Tab - Config- Admin- To verify "Header Instruction Text" is rendering properly on tab if added long value in "Header Instruction Text" field on page tab config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Tabs Config      | Tab Title               | Overview          | Grantor State Program | ApiGeneratedId:0 |
      | Page Tabs Config      | Header Instruction Text |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName               | fieldNewValue                                                                                                                              | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Tab Title               | Overview                                                                                                                                   | Grantor State Program | Name                      | TAB-4156                   |
      | Page Tabs Config:Page Layout Action | Header Instruction Text | Test Automation header instruction Test Automation header instruction Test Automation header instructionTest Automation header instruction | Grantor State Program | Name                      | TAB-4156                   |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see "Test Automation header instruction Test Automation header instruction Test Automation header instructionTest Automation header instruction" shown as header instruction text
    Examples:
      | User |
     # | ADMIN |
      | PM   |

  ############ Page Block Details : 324681 #################
  @314377 @314374
  Scenario Outline: LWC-Flex View Layout - Fields - UI - PM- To verify that Page block details not rendering on page block when "Is Active" checkbox is unchecked in page block details config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "FundedAmount__c" inside page block
    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @314289 @314285
  Scenario Outline: LWC-Flex View Layout - Fields - UI - PM- To verify that Page block details rendering on page block when "Is Active" checkbox is checked in page block details config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | PBD-35403                  |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "ProgramName__c" inside page block
    Examples:
      | User |
      #  | ADMIN |
      | PM   |

  @315307 @315308
  Scenario Outline: LWC-Flex View Layout - Fields - Config - Admin - To verify that field label is rendering on page block same as added in 'Field Label Override' in page block details config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue     | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                  | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue         | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                  | Grantor State Program | Name                      | PBD-35167                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization | Grantor State Program | Name                      | PBD-35167                  |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see field "Internal Organization" inside page block

    Examples:
      | User |
      #| Admin |
      | PM   |

  @315315 @315314
  Scenario Outline:LWC-Flex View Layout - Fields - UI - PM - To verify that if user added value in 'Field Label Override(Rich Text)' in page block details config then that label is rendering on page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue     | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                  | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Internal Organization | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                   | Grantor State Program | Name                      | PBD-35167                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Internal Organization1 | Grantor State Program | Name                      | PBD-35167                  |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see field "Internal Organization1" inside page block

    Examples:
      | User |
   #   | Admin |
      | PM   |

  @337138 @337140
  Scenario Outline: LWC-Flex View Layout - Fields - Config- Admin- To verify that the field is required to save record when required behavior is set to 'Required for Save' in Required config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | PBD-35403                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | PBD-35403                  |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #362113
    Then I see asterisk mark at "Type" field in LWC
    And I clear the value from field "ProgramName__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    Then I softly see the following messages in the page details contains:
      | To save, Program Name is required in the Overview tab under the Information section. |

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @337149 @337150
  Scenario Outline: LWC-Flex View Layout - Fields - Config- Admin- To verify that the field is required to submit record when required behavior is set to 'Required for Submit' in Required config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | PBD-35403                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | PBD-35403                  |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "SelectProgramServiceArea"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name           | Program |
      | Automation EXE | Step 2  |
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | To Submit, Description is required in the Overview tab under the Description section. |

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @337151 @337155
  Scenario Outline: LWC-Flex View Layout - Fields - Config- Admin- To verify that the field is required to save or submit record when required behavior is set to 'None' in Required config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Grantor State Program | Name                      | PBD-35403                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | None          | Grantor State Program | Name                      | PBD-35403                  |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I clear the value from field "ProgramName__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    Then I softly see the following messages in the page details contains:
      | To save, Program Name is required in the Overview tab under the Information section. |

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @337178 @337180
  Scenario Outline:LWC-Flex View Layout - Fields - Config - Admin - To verify that field label is rendering properly on page block if added long value in 'Field Label Override' in field config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Website Address   | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Website Name Test Automation Testing From Both User | Grantor State Program | Name                      | PBD-35468                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    Then I see field "Website Name Test Automation Testing From Both User" inside page block
    Examples:
      | Users |
     # | Admin |
      | PM    |

  ########## Actions - Custom Actions - Suite -319001 ############
  @318196 @318209 @318210 @318211 @318227 @318228
  Scenario Outline: LWC - Flex View Layout - Page Layout Actions - UI - Admin - To verify user should able to see "Edit" button on right top of view layout
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue   | coreComponentField    | coreCOmponentSubFieldName | filterId         |
      | Page Layout Action    | Is Active   | true                | Grantor State Program | Name                      | ApiGeneratedId:0 |
      | Page Layout Action    | Action Name | Edit                | Grantor State Program | Name                      | ApiGeneratedId:1 |
      | Page Layout Action    | Is Active   | true                | Grantor State Program | Name                      | ApiGeneratedId:2 |
      | Page Layout Action    | Action Name | Submit For Approval | Grantor State Program | Name                      | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true                | Grantor State Program | Name                      | Edit                       |
      | Page Layout Action    | Action Name | Edit                | Grantor State Program | Name                      | Edit                       |
      | Page Layout Action    | Is Active   | true                | Grantor State Program | Name                      | Submit For Approval        |
      | Page Layout Action    | Action Name | Submit For Approval | Grantor State Program | Name                      | Submit For Approval        |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---lwcprogram:-:programsTableId---"
    And I pause execution for "3" seconds
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "5" seconds
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    Then I see "Submit For Approval" button is displayed
    Then I see "Edit" button is displayed

    Examples:
      | User |
     # | Admin |
      | PM   |

  @337479 @337481
  Scenario Outline: LWC - Flex View Layout - Page Layout Actions - UI - PM- To verify when user click on action then entire page should be refreshed when Refresh Behavior is set to 'Refresh the entire page' in page layout action config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField    | coreCOmponentSubFieldName | filterId         |
      | Page Layout Action    | Is Active | true              | Grantor State Program | Name                      | ApiGeneratedId:0 |
      #| Page Layout Action    | RefreshBehaviour | None              | Grantor State Program | Name                      | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active | true          | Grantor State Program | Name                      | Edit                       |
      #| Page Layout Action    | RefreshBehaviour | Refresh the entire page | Grantor State Program | Name                      | Edit                       |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - My Records"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details

    Examples:
      | User |
     # | Admin |
      | PM   |

  @337482 @337483
  Scenario Outline: LWC - Flex View Layout - Page Layout Actions - UI - PM- To verify when user click on action then it will only execute action when Refresh Behavior is set to 'None' in page layout action config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField    | coreCOmponentSubFieldName | filterId         |
      | Page Layout Action    | Is Active | true              | Grantor State Program | Name                      | ApiGeneratedId:0 |
    #  | Page Layout Action    | RefreshBehaviour | None              | Grantor State Program | Name                      | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active | true          | Grantor State Program | Name                      | Edit                       |
     # | Page Layout Action    | RefreshBehaviour | None          | Grantor State Program | Name                      | Edit                       |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - My Records"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    Then I softly see field "ProgramName__c" is editable
    Examples:
      | User |
  #    | Admin |
      | PM   |

  @364305 @364306
  Scenario Outline: LWC-Flex View layout- Modal- Page Block Detail- Admin- To verify 'Field Label Override (Rich Text)' displays on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Test              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Grantor State Program Create | Name                      | {pagelayout:EmailField_Email} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Email Check   | Grantor State Program Create | Name                      | {pagelayout:EmailField_Email} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I see field "Email Check" inside page block
    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @364308 @364310
  Scenario Outline:LWC-Flex View layout- Modal- Page Block Detail- Admin- To verify  if 'Hide Label' set as true then label of text field gets hidden.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active  | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active  | true          | Grantor State Program Create | Name                      | {pagelayout:EmailField_Email} |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Grantor State Program Create | Name                      | {pagelayout:EmailField_Email} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I see field "Email Test" inside page block

    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @364316 @wip
  Scenario: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify Field gets hide for the profile selected in 'Hide for Profile'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide For Profile |                   | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue        | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail |           | System Administrator | Grantor Master Terms and Conditions | Name                      | PBD-32920                  |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    Then I cannot see field "EGMS ID" inside page block

  @364316
  Scenario: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify Field gets hide for the profile selected in 'Hide for Profile'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide For Profile |                   | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue   | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide For Profile | Project Manager | Grantor Master Terms and Conditions | Name                      | {pagelayout:PicklistField_Status} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    Then I see field "Status" inside page block

  @364323
  Scenario: LWC-Flex View Layout- Modal- Page Block Detail- PM- To verify Field gets hide for the Context selected in 'Hide for Context'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide for Context |                   | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide for Context | view          | Grantor Master Terms and Conditions | Name                      | {pagelayout:PicklistField_Status} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    Then I cannot see field "Status" inside page block

  @364323 @wip
  Scenario: LWC-Flex View Layout- Modal- Page Block Detail- PM- To verify Field gets hide for the Context selected in 'Hide for Context'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide for Context |                   | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide for Context | view          | Grantor Master Terms and Conditions | Name                      | {pagelayout:PicklistField_Status} |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    Then I see field "Status" inside page block

  @364326 @wip
  Scenario: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify Field gets hide for the User selected in 'Hide for User'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide for User |                   | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide for User | Internal      | Grantor Master Terms and Conditions | Name                      | {pagelayout:PicklistField_Status} |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    Then I see field "Status" inside page block

  @364327
  Scenario: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify Field gets hide for the User selected in 'Hide for User'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide for User |                   | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide for User | Internal      | Grantor Master Terms and Conditions | Name                      | {pagelayout:PicklistField_Status} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    Then I cannot see field "Status" inside page block

  @364330 @364331
  Scenario Outline: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify field with data type 'Standard Field' Displays on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor Master Terms and Conditions | Name                      | PBD-33053                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    Then I see field "Type" inside page block
    Examples:
      | Users |
    #  | Admin |
      | PM    |

  @364335 @364336
  Scenario Outline: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify field with data type 'Text' Displays on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor Master Terms and Conditions | Name                      | PBD-32848                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    Then I see field "EGMS ID" inside page block
    Examples:
      | Users |
     # | Admin |
      | PM    |

  @364339 @364340
  Scenario Outline: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify field with data type 'Picklist' Displays on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor Master Terms and Conditions | Name                      | PBD-32997                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    Then I see field "Legislative/Managment Reference" inside page block
    Examples:
      | Users |
      | Admin |
    #  | PM    |

  @364343 @364344
  Scenario Outline: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify field with data type 'Lookup' Displays on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor Master Terms and Conditions | Name                      | {pagelayout:LookupField_GranteePOC} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    Then I see field "Grantee POC" inside page block
    Examples:
      | Users |
      | Admin |
     # | PM    |


  @364346 @364347
  Scenario Outline: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify field with data type 'Number' Displays on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor Master Terms and Conditions | Name                      | {pagelayout:NumberField_DaysAfterEndDate} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    Then I see field "Days After End Date" inside page block
    Examples:
      | Users |
     # | Admin |
      | PM    |

  @364350 @364351
  Scenario Outline:
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor Master Terms and Conditions | Name                      | PBD-32997                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    Then I see field "Effective To Date" inside page block
    Examples:
      | Users |
    #  | Admin |
      | PM    |

  @364354 @364355
  Scenario Outline: LWC-Flex View Layout- Modal- Page Block Detail- Admin- To verify field with data type 'Date and time' Displays on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField                  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor Master Terms and Conditions | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor Master Terms and Conditions | Name                      | PBD-32997                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Terms and Conditions" in "---program:-:termsAndConditionsTableId---" panel
    When I click on "View" icon for "Automation Terms and Conditions" inside table
    Then I see field "EffectiveFrom__c" inside page block
    Examples:
      | Users |
   #   | Admin |
      | PM    |