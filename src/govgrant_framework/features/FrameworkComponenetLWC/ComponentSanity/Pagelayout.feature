@ComponentSanity @PagelayoutComponentSanity @Page2 @ComponentSanity2 @ComponentSanity2_2

Feature: Test pagelayout component

  @549145
  Scenario:3.0: Page Layout: Admin:  To Verify that user is able to create Internal Program from Planning Phase module.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" from computer
    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"

  @549146
  Scenario: 3.0: Page Layout: Admin: To verify that the Page Instruction Message is displayed correctly on the Internal Program page layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                    | filterId         |
      | Page Layout           | Page Instruction Text | govgrants_config:PageInstructionText | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Page Instruction Text | {flexgrid:char255} | Grantor State Program |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Then I see "view more" option is displayed
    And I click on "view more" hyperlink in page instruction block
    Then I see "{flexgrid:char255}" shown as page instruction text
    And I pause execution for "5" seconds
    Then I see "view less" option is displayed
    And I click on "view less" hyperlink in page instruction block
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    Then I can see row level action button "View" against "Record Id" in flex table with id "---program:-:programsTableId---"
    Then I can see row level action button "Edit" against "Record Id" in flex table with id "---program:-:programsTableId---"
    Then I can see row level action button "Delete" against "Record Id" in flex table with id "---program:-:programsTableId---"

  @549147
  Scenario: 3.0: Page Layout: Admin: To verify the support of download as PDF and take snapshot action under page layout hamburger icon.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName              | fieldOrignalValue | filterId         |
      | Page Layout           | Hide Pdf Download      | false             | ApiGeneratedId:0 |
      | Page Layout           | Hide On Demand Snaphot | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName              | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Hide Pdf Download      | false         | Grantor State Program |                           |                            |
      | Page Layout:General   | Hide On Demand Snaphot | false         | Grantor State Program | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "History" sub tab
    And I click on Menu icon present on top right corner of the page
    And I click on "Take Snapshot" in the page details without processing
    Then I softly see confirmation box with message "You are attempting to take a snapshot of the current record. The PDF will be attached in Snapshot History. Do you want to proceed?" is displayed
    And I click "Continue" on modal confirmation box
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Snapshot created successfully. Please refresh the page. |
      | Please click here to download.                          |
    And I pause execution for "7" seconds
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SnapShot on" as name
    When I click on "Download as PDF" in the page details
    And I switch to tab number "1"
    Then I softly see new tab is opened

  @549149
  Scenario: 3.0: Page Layout: Admin: To verify that required header fields are visible on the Internal Program Page Layout Header.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "EGMS ID" inside page block
    Then I softly see field "Status" inside page block
    Then I softly see field "Organization" inside page block

  @549164
  Scenario: 3.0: Page Layout: SPI:  Verify all Field under header overview page block display correctly and load fields properly.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    Then I softly see field "Status" as "Published"
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "EGMS ID" inside page block


  @549165
  Scenario:3.0: Page Layout: SPI: Verify all tabs are displayed correctly under recipient preapplication page layout and load their respective page blocks.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "4" seconds
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

  @549166
  Scenario: 3.0: Page Layout: SPI: Verify all page block under overview tab display correctly and field under page block loads correctly.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly see "Budget Periods" page block displayed
    Then I softly see "Budget Narrative" page block displayed

  @549167
  Scenario: 3.0: Page Layout: SPI: Verify all field under page block display correctly and loads correctly.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    Then I softly see field "Applicant Organization" inside page block
    Then I softly see field "Address" inside page block
    Then I softly see field "EIN" inside page block
    Then I softly see field "UEI" inside page block
    Then I softly see field "SAM Expiration Date" inside page block
    When I navigate to "Budget" sub tab
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block
    Then I softly see field "Budgeted Amount" inside page block

  @549206
  Scenario: 3.0: Page Layout: SPI: To verify page tab config of Header overview display setting.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Highlights Panel? | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Highlights Panel? | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName         | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Highlights Panel? | false         | Recipient ApplicationView | Name                      | TAB-4406                   |
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
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    Then I see complete header overview tab is displayed at view detail page
    Then I see field "EGMS ID" inside page block
    Then I see "Overview" Tab title displays on pagelayout
    Then I see "Overview" subtab is present with icon "knowledge_base" in page details

  @549209
  Scenario: 3.0: Page Layout: SPI: To verify opportunity overview page block detail config.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    Then I softly see field "Applicant Organization" inside page block
    Then I softly see field "Address" inside page block
    Then I softly see field "EIN" inside page block
    Then I softly see field "UEI" inside page block
    Then I softly see field "SAM Expiration Date" inside page block

  @549210
  Scenario: 3.0: Page Layout: SPI: To verify page block config of opportunity overview for fields config.
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
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I cannot see "EGMS ID" on page "1" of "govgrants" pdf file

  @549211
  Scenario: 3.0: Page Layout: SPI: To verify opportunity overview page block config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Header Instruction Text |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName               | fieldNewValue                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Header Instruction Text | Test Automation header instruction Test | Recipient ApplicationView | Name                      | TAB-4406                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    Then I see "Test Automation header instruction Test" shown as header instruction text

  @549433 @549433_1
  Scenario: 3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                             | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO X_4-Digit Zip Code Extension | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                            | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                            | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I see field "FLO X_4-Digit Zip Code Extension" inside page block
    Then I softly see fields "ZipCode4Externsion__c" is in edit mode

  @549433 @549433_2
  Scenario: 3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | true          | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly cannot see field "X_4-Digit Zip Code Extension" inside page block
    Then I softly see field "ZipCode4Externsion__c" is not editable

  @549433 @549433_3
  Scenario: 3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly see asterisk mark at "X_4-Digit Zip Code Extension" field in LWC

  @549433 @549433_4
  Scenario: 3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true                | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false               | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly see required for submit symbol at "X_4-Digit Zip Code Extension" field
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Approach/Methodology Provide an explanation of the approach and methodology that will be used to meet the project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab. |
      | Capacity Provide an explanation of the capacity of the organization to meet the project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab.                           |
      | Qualifications Provide an explanation of the qualifications of the personnel as they relate to project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab.            |

  @549433 @549433_5
  Scenario: 3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                               | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                     | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                     | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly cannot see field "X_4-Digit Zip Code Extension" inside page block

  @549433 @549433_6
  Scenario: 3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                               | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                     | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                     | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:ContextInViewPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly see field "X_4-Digit Zip Code Extension" inside page block
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "X_4-Digit Zip Code Extension" inside page block

  @549433 @549433_7
  Scenario: 3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                  | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                        | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                        | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:UserTypeInternalPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
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
    Then I softly see field "X_4-Digit Zip Code Extension" inside page block

  @549433 @549433_8
  Scenario: 3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                   | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                         | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                         | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:UserTypeApplicantPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
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
    Then I softly cannot see field "X_4-Digit Zip Code Extension" inside page block

  @549433 @549433_8
  Scenario: 3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                   | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                         | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                         | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForProfileSPIPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
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
    Then I softly cannot see field "X_4-Digit Zip Code Extension" inside page block

  @549433 @549433_9
  Scenario: 3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                      | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                            | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                            | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideStatusForCreatedPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
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
    Then I softly cannot see field "X_4-Digit Zip Code Extension" inside page block

  @549433 @549433_10
  Scenario: 3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                          | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                         | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                               | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                               | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideFirstNameAutomationPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
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
    Then I softly cannot see field "X_4-Digit Zip Code Extension" inside page block

  @549433 @549433_11
  Scenario: 3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                           | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                 | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                 | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForUserAppAsRecipientPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
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
    Then I softly cannot see field "X_4-Digit Zip Code Extension" inside page block

  @549433 @549433_12
  Scenario: 3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                        | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                 | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                                | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                      | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                      | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForUserAppAsStateAsGrantorPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ZipCode4Externsion__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see field "X_4-Digit Zip Code Extension" inside page block

  @549150
  Scenario: 3.0: Page Layout: Admin: To verify that the active tab is visible under the Page Layout section.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - My Records"
    When I perform quick search for "Created" in "---program:-:programsTableId---" panel
    Then I can see row level action button "Delete" against "Created" in flex table with id "---program:-:programsTableId---"
    Then I can see row level action button "View" against "Created" in flex table with id "---program:-:programsTableId---"
    Then I can see row level action button "Edit" against "Created" in flex table with id "---program:-:programsTableId---"
    When I click on "View" icon for "Created" inside table
    Then I see "Overview" Tab title displays on pagelayout
    Then I see "Setup" Tab title displays on pagelayout
    Then I see "Responsibilities" Tab title displays on pagelayout
    Then I see "Files" Tab title displays on pagelayout

  @549151 @549151_1
  Scenario: 3.0: Page Layout: Admin: To verify that, tab Configuration Details should be visible on Page Layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Header Instruction Text |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName               | fieldNewValue                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Header Instruction Text | Overview Tab Header instruction text | Grantor State Program | Name                      | TAB-4156                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - My Records"
    When I perform quick search for "Created" in "---program:-:programsTableId---" panel
    Then I can see row level action button "Delete" against "Created" in flex table with id "---program:-:programsTableId---"
    Then I can see row level action button "View" against "Created" in flex table with id "---program:-:programsTableId---"
    Then I can see row level action button "Edit" against "Created" in flex table with id "---program:-:programsTableId---"
    When I click on "View" icon for "Created" inside table
    Then I see "Overview" Tab title displays on pagelayout
    Then I see "Overview" subtab is present with icon "knowledge_base" in page details
    Then I see "Overview Tab Header instruction text" shown as header instruction text

  @549151 @549151_2
  Scenario: 3.0: Page Layout: Admin: To verify that, tab Configuration Details should be visible on Page Layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Header Instruction Text |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName               | fieldNewValue                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Header Instruction Text | Overview Tab Header instruction text | Grantor State Program | Name                      | TAB-4156                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - My Records"
    When I perform quick search for "Created" in "---program:-:programsTableId---" panel
    Then I can see row level action button "Delete" against "Created" in flex table with id "---program:-:programsTableId---"
    Then I can see row level action button "View" against "Created" in flex table with id "---program:-:programsTableId---"
    Then I can see row level action button "Edit" against "Created" in flex table with id "---program:-:programsTableId---"
    When I click on "View" icon for "Created" inside table
    Then I see "Overview" Tab title displays on pagelayout
    Then I see "Overview" subtab is present with icon "knowledge_base" in page details
    Then I see "Overview Tab Header instruction text" shown as header instruction text
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I see "Overview" on page "1" of "govgrants" pdf file

  @549153
  Scenario: 3.0: Page Layout: Admin: To verify that all Page Blocks under the Overview tab are displayed correctly
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - My Records"
    When I perform quick search for "Created" in "---program:-:programsTableId---" panel
    Then I can see row level action button "Delete" against "Created" in flex table with id "---program:-:programsTableId---"
    Then I can see row level action button "View" against "Created" in flex table with id "---program:-:programsTableId---"
    Then I can see row level action button "Edit" against "Created" in flex table with id "---program:-:programsTableId---"
    When I click on "View" icon for "Created" inside table
    Then I softly see field "Information" inside page block
    Then I softly see field "Description" inside page block
    Then I softly see field "Contacts" inside page block
    Then I softly see field "System Information" inside page block
    When I "Collapse" page block contaninig value "Information"
    Then I softly do not see fields "ProgramName__c" is visible
    When I "Expanded" page block contaninig value "Information"
    Then I softly see fields "ProgramName__c" is visible

  @549205
  Scenario: 3.0: Page Layout: SPI: To verify page tab config of Header overview page Tab Details.
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
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I see complete header overview tab is displayed at view detail page

  @549207 @549207_1
  Scenario: 3.0: Page Layout: SPI: To verify page tab config of Header overview hide logic.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                | Recipient ApplicationView | Name                      | TAB-4275                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | Recipient ApplicationView | Name                      | TAB-4275                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    #Context IN ( Edit ))
    Then I do not see "Revision" Tab title displays on pagelayout

  @549207 @549207_2
  Scenario: 3.0: Page Layout: SPI: To verify page tab config of Header overview hide logic.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                | Recipient ApplicationView | Name                      | TAB-4275                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:ContextInViewPostCreateApplication | Recipient ApplicationView | Name                      | TAB-4275                   |
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
    And I click on "Collapse" in page detail
    Then I see "Revision" Tab title displays on pagelayout
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I navigate to "Revision" sub tab
    When I click on "Save" in the page details
    #Context IN ( View ))
    Then I do not see "Revision" Tab title displays on pagelayout

  @549207 @549207_3
  Scenario: 3.0: Page Layout: SPI: To verify page tab config of Header overview hide logic.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                    | Recipient ApplicationView | Name                      | TAB-4275                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:UserTypeApplicantPostCreateApplication | Recipient ApplicationView | Name                      | TAB-4275                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    #UserType IN ( Applicant )
    Then I do not see "Revision" Tab title displays on pagelayout

  @549207 @549207_4
  Scenario: 3.0: Page Layout: SPI: To verify page tab config of Header overview hide logic.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                    | Recipient ApplicationView | Name                      | TAB-4275                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideForProfileSPIPostCreateApplication | Recipient ApplicationView | Name                      | TAB-4275                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    #Profile IN ( SPI )
    Then I do not see "Revision" Tab title displays on pagelayout

  @549207 @549207_5
  Scenario: 3.0: Page Layout: SPI: To verify page tab config of Header overview hide logic.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                       | Recipient ApplicationView | Name                      | TAB-4275                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideStatusForCreatedPostCreateApplication | Recipient ApplicationView | Name                      | TAB-4275                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    #Status__c = Created
    Then I do not see "Revision" Tab title displays on pagelayout

  @549207 @549207_6
  Scenario: 3.0: Page Layout: SPI: To verify page tab config of Header overview hide logic.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                            | Recipient ApplicationView | Name                      | TAB-4275                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideForUserAppAsRecipientPostCreateApplication | Recipient ApplicationView | Name                      | TAB-4275                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    #UserApp = Receipient
    Then I do not see "Revision" Tab title displays on pagelayout

  @549156
  Scenario: 3.0: Page Layout: Admin: To verify that, configuration settings for the Information Page Block.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Header Instruction Text |                   | Grantor State Program | ApiGeneratedId:1 |
      | Page Block            | Help Text               |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text | Page block Header Instruction Text | Grantor State Program | Name                      | PB-11276                   |
      | Page Block:Page Block Detail | Help Text               | Page block Help Text               | Grantor State Program | Name                      | PB-11276                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - My Records"
    When I perform quick search for "Created" in "---program:-:programsTableId---" panel
    Then I can see row level action button "Delete" against "Created" in flex table with id "---program:-:programsTableId---"
    Then I can see row level action button "View" against "Created" in flex table with id "---program:-:programsTableId---"
    Then I can see row level action button "Edit" against "Created" in flex table with id "---program:-:programsTableId---"
    When I click on "View" icon for "Created" inside table
    #page block validation with icon
    Then I see "Overview" subtab is present with icon "knowledge_base" in page details
    Then I see "Page block Header Instruction Text" shown as header instruction text
    #page block help text
    When I hovering mouse on help text icon inside page block detail "Information"
    Then I softly see "Page block Help Text" shown as help text

  @549158
  Scenario: 3.0: Page Layout: Admin: To verify that, all supported data-type fields are displayed correctly under the information Page Block.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - My Records"
    When I perform quick search for "Created" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "Created" inside table
    Then I softly see fields "ProgramName__c" is visible
    Then I softly see fields "CreatedById" is visible
    Then I softly see fields "CreatedDate" is visible
    Then I softly see fields "LastModifiedDate" is visible
    Then I softly see fields "Objectives__c" is visible
    Then I softly see fields "Date_And_Time__c" is visible
    Then I softly see fields "Abbreviation__c" is visible
    Then I softly see fields "WebsiteAddress__c" is visible
    Then I softly see fields "PrimaryFunderType__c" is visible

  @549212 @549212_1
  Scenario: 3.0: Page Layout: SPI: To verify opportunity overview page block config hide logic.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField                     | filterId         |
      | Page Block            | Hide Expression JSON |                   | Qualified Annoucement External Grantor | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                 | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:QuilifyPageHideForSPIProfile | Annoucement External Profile-FOA | Name                      | {SavedValue:OpportunityInformation} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I pause execution for "3" seconds
    Then I do not see "Opportunity Information" page block displayed

  @549212 @549212_2
  Scenario: 3.0: Page Layout: SPI: To verify opportunity overview page block config hide logic.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField                     | filterId         |
      | Page Block            | Hide Expression JSON |                   |Annoucement External Profile-FOA | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                  | coreComponentField                     | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:QuilifyPageHideForContextView | Annoucement External Profile-FOA | Name                      | {SavedValue:OpportunityInformation} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I pause execution for "3" seconds
    Then I do not see "Opportunity Information" page block displayed

  @549212 @549212_3
  Scenario: 3.0: Page Layout: SPI: To verify opportunity overview page block config hide logic.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField                     | filterId         |
      | Page Block            | Hide Expression JSON |                   | Qualified Annoucement External Grantor | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                        | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:QuilifyPageHideForUserAppReciepient | Annoucement External Profile-FOA | Name                      | {SavedValue:OpportunityInformation} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I pause execution for "3" seconds
    Then I do not see "Opportunity Information" page block displayed

  @549212 @549212_3
  Scenario: 3.0: Page Layout: SPI: To verify opportunity overview page block config hide logic.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField                     | filterId         |
      | Page Block            | Hide Expression JSON |                   | Qualified Annoucement External Grantor | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                        | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:QuilifyPageHideForUserTypeApplicant | Annoucement External Profile-FOA | Name                      | {SavedValue:OpportunityInformation} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I pause execution for "3" seconds
    Then I do not see "Opportunity Information" page block displayed

  @549212 @549212_4
  Scenario: 3.0: Page Layout: SPI: To verify opportunity overview page block config hide logic.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField                     | filterId         |
      | Page Block            | Hide Expression JSON |                   | Qualified Annoucement External Grantor | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                       | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:QuilifyPageHideForUserTypeInternal | Annoucement External Profile-FOA | Name                      | {SavedValue:OpportunityInformation} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I pause execution for "3" seconds
    Then I see "Opportunity Information" page block displayed

########################

  @549617
  Scenario: LWC - Page Layout - Admin - Action Config: Verify Hide Logic of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName              | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active              | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Standard Action        | Edit              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName              | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active              | true          | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message | Test Warning  | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Standard Action        | Edit          | Grantor State Program | Name                      | Test Button                |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Test Button" in the page details without processing
    And I pause execution for "3" seconds
    Then I see confirmation box with message "Test Warning" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "Continue" on modal confirmation box
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message Long |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true              | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message Long | Test Warning Long | Grantor State Program | Name                      | Test Button                |
    And I refresh the page
    And I click on "Test Button" in the page details without processing
    Then I see confirmation box with message "Test Warning Long" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "Continue" on modal confirmation box
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | RefreshBehaviour |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue           | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true                    | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | RefreshBehaviour | Refresh the entire page | Grantor State Program | Name                      | Test Button                |
    And I refresh the page
    And I click on "Test Button" in the page details
    Then I see entire page is refreshing

  @549616
  Scenario: LWC - Page Layout - Admin - Action Config: Verify Hide Logic of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Context |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true          | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide for Context | View          | Grantor State Program | Name                      | Test Button                |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #Hide For Context
    Then I softly do not see "Test Button" button is displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active     | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for User |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName     | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active     | true          | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide for User | Internal      | Grantor State Program | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "2" seconds
    #Hide For User
    Then I softly do not see "Test Button" button is displayed

  @549616_1
  Scenario: LWC - Page Layout - Admin - Action Config: Verify Hide Logic of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName      | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active      | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Queue |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName      | fieldNewValue       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active      | true                | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide for Queue | GovGrant Test Queue | Grantor State Program | Name                      | Test Button                |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    #Hide For Queue
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true          | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide for Profile | PM            | Grantor State Program | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "2" seconds
    #Hide For Profile
    Then I softly do not see "Test Button" button is displayed

  @549615
  Scenario: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - Field of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Hide for Context     |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                            | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJFieldStatusCreatedEqualsPM | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide for Context     |                                                 | Grantor State Program | Name                      | Test Button                |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #Field-Status-Equals-Created
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                               | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJFieldStatusCreatedNotEqualsPM | Grantor State Program | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
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
    And I click on "Submit For Approval" in the page details
    #Field-Status-NotEquals-Created
    Then I softly do not see "Test Button" button is displayed

  @549615_1
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - Field of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action                       | Is Active            | true              | ApiGeneratedId:1 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                   | Grantor State Program | Name                      | {CommonConfigFileTest:CurrencyField_FundedAmount} |
      | Page Layout Action                       | Is Active            | true                                                                   | Grantor State Program | Name                      | Test Button                                       |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:HEBJActionFieldFundedAmountLessThanEqualsFreeText3000 | Grantor State Program | Name                      | Test Button                                       |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    #Field-FundedAmount-LessThanEquals-3000
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action                       | Is Active            | true              | ApiGeneratedId:1 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                           | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                    | Grantor State Program | Name                      | {CommonConfigFileTest:CurrencyField_FundedAmount} |
      | Page Layout Action                       | Is Active            | true                                                                    | Grantor State Program | Name                      | Test Button                                       |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:HEBJActionFieldFundedAmountGrterThanEqualsFreeText2999 | Grantor State Program | Name                      | Test Button                                       |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-FundedAmount-GreaterThanEquals-2999
    Then I softly do not see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549615_2
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - Field of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action                       | Is Active            | true              | ApiGeneratedId:1 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                             | Grantor State Program | Name                      | {CommonConfigFileTest:CurrencyField_FundedAmount} |
      | Page Layout Action                       | Is Active            | true                                                             | Grantor State Program | Name                      | Test Button                                       |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:HEBJActionFieldFundedAmountLessThanFreeText3001 | Grantor State Program | Name                      | Test Button                                       |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    #Field-FundedAmount-LessThan-3001
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action                       | Is Active            | true              | ApiGeneratedId:1 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                | Grantor State Program | Name                      | {CommonConfigFileTest:CurrencyField_FundedAmount} |
      | Page Layout Action                       | Is Active            | true                                                                | Grantor State Program | Name                      | Test Button                                       |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:HEBJActionFieldFundedAmountGreaterThanFreeText2999 | Grantor State Program | Name                      | Test Button                                       |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-FundedAmount-GreaterThan-2999
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                           | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                    | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionActionFieldTypeContainsFreeTextProjectGrants | Grantor State Program | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-Type-Contais-ProjectGrants
    Then I softly do not see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549615_3
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - Field of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action                       | Is Active            | true              | ApiGeneratedId:1 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Layout Action                       | Is Active            | true                                                   | Grantor State Program | Name                      | Test Button                             |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:HEBJActionFieldFocusAresInFreeTextYes | Grantor State Program | Name                      | Test Button                             |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I enter value "Yes" into field "FocusAreaRequired__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    #Field-FocusArea-In-Yes
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action                       | Is Active            | true              | ApiGeneratedId:1 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                           | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Layout Action                       | Is Active            | true                                                           | Grantor State Program | Name                      | Test Button                             |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:HEBJActionFieldTypeNotInFreeTextProjectGrants | Grantor State Program | Name                      | Test Button                             |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-Type-NotIn-ProjectGrants
    Then I softly see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549614
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - $User of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action                       | Is Active            | true              | ApiGeneratedId:1 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                          | Grantor State Program | Name                      | {CommonConfigFileTest:CurrencyField_FundedAmount} |
      | Page Layout Action                       | Is Active            | true                                                          | Grantor State Program | Name                      | Test Button                                       |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:HEBJAction$UserFNameEqualsFreeTextAutomation | Grantor State Program | Name                      | Test Button                                       |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    #Field-$User-Equals-Automation
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action                       | Is Active            | true              | ApiGeneratedId:1 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                             | Grantor State Program | Name                      | {CommonConfigFileTest:CurrencyField_FundedAmount} |
      | Page Layout Action                       | Is Active            | true                                                             | Grantor State Program | Name                      | Test Button                                       |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:HEBJAction$UserFNameNotEqualsFreeTextAutomation | Grantor State Program | Name                      | Test Button                                       |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-$User-NotEquals-Automation
    Then I softly see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549613
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - User Type of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                   | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionUserTypeInFreeTextApplicant | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    #Field-UserType-In-Applicant
    Then I softly see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                      | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionUserTypeNotInFreeTextApplicant | Grantor State Program | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-UserType-NotIn-Applicant
    Then I softly do not see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549613_1
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - User Type of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                         | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                  | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionUserTypeInFreeTextInternal | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    #Field-UserType-In-Internal
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                            | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                     | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionUserTypeNotInFreeTextInternal | Grantor State Program | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-UserType-NotIn-Internal
    Then I softly see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549612
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - Profile of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                        | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HideForPmProfileProgram__c | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    #Field-Profile-In-PM
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                              | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionProfileNotInFreeTextPM | Grantor State Program | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-Profile-NotIn-PM
    Then I softly see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549611
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - User App of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                          | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantor | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    #Field-UseApp-In-StateAsGrantor
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                             | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExpressionBuilderUserAppNotInStateAsGrantor | Grantor State Program | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-UserApp-NotIn-StateAsGrantor
    Then I softly see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549611_1
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - User App of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                               | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionUserAppInStateAsGrantee | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    #Field-UseApp-In-StateAsGrantee
    Then I softly see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                         | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                  | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionUserAppNotInStateAsGrantee | Grantor State Program | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-UserApp-NotIn-StateAsGrantee
    Then I softly do not see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549611_2
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - User App of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                          | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionUserAppInRecipient | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    #Field-UseApp-In-Recipient
    Then I softly see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                             | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionUserAppNotInRecipient | Grantor State Program | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-UserApp-NotIn-Recipient
    Then I softly do not see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549567 @549567_1
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of text-based field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue              | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true                           | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                                | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long    | Internal program abbreviation. | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true                           | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save              | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
      | Page Block Config:Page Block Rule Detail | Help Text Long    | Internal program abbreviation. | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see "Create Program" opens in overLay window
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see asterisk mark at "Abbreviation" field in LWC
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Abbreviation is required to save. Enter it in the Information section on the Overview tab. |

  @549567 @549567_2
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of text-based field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue              | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Internal program abbreviation. | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Internal program abbreviation. | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Abbreviation" inside page block
    When I hovering mouse on help text icon inside page block detail "Abbreviation"
    Then I softly see "Internal program abbreviation." shown as help text

  @549567 @549567_3
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of text-based field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName   | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | <fieldName> |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName   | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | <fieldName> | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "<fieldNewValue>" inside page block

    Examples:
      | fieldName                        | fieldNewValue              |
      | Field Label Override             | FLO Abbreviation           |
      | Field Label Override (Rich Text) | FLO Rich Text Abbreviation |

  @549567 @549567_4
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of text-based field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "Abbreviation" inside page block

    Examples:
      | Hide Logic                                                    |
      | govgrants_config:HideForProfilePMforPBD                       |
      | govgrants_config:HideForContextForEditforPBDProgram__c        |
      | govgrants_config:HideForUserTypeInternalforPBDProgram__c      |
      | govgrants_config:HideForUserappStateAsGrantorforPBDProgram__c |


  @549567 @549567_5
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of text-based field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Hide Label           |               | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "Abbreviation" inside page block

    Examples:
      | Hide Logic                                                  |
      | govgrants_config:HideForUserTypeApplicantforPBDProgram__c   |
      | govgrants_config:HideForUserTypeInReviewverforPBDProgram__c |

  @549567 @549567_6
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of text-based field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                                                     | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForContextForNotEditforPBDProgram__c | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Abbreviation" inside page block
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I cannot see field "Abbreviation" inside page block

  @549567 @549567_7
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of text-based field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Abbreviation" inside page block
    Then I softly do not see fields "Abbreviation__c" is in edit mode

  @549567 @549567_9
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of text-based field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                               | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                               | Grantor State Program | Name                      | {SavedValue:CountNumber__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideCountNumber__cEqualToText1000 | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "1000" into field "CountNumber__c"
    Then I softly see fields "Abbreviation__c" is in edit mode
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #Hide field Depend upon CountNumber__c
    Then I cannot see field "Abbreviation" inside page block

  @549567 @549567_10
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of text-based field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:CountNumber__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserFNameEqualsFreeTextAutomation | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "Abbreviation" inside page block

  @549567 @549567_11
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of text-based field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:CountNumber__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "Abbreviation" inside page block
    Then I softly do not see fields "Abbreviation__c" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                             |
      | Read Only Expression JSON | govgrants_config:HEBFieldStatusCreated                                    |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeInternalforPBDProgram__c                  |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextEdit                      |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantor             |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserFirstNameEQUALSFreeTextUsed |

  @549567 @549567_12
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of text-based field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "Abbreviation" inside page block
    Then I softly see fields "Abbreviation__c" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                 |
      | Read Only Expression JSON | govgrants_config:ExpressionForProfileInSPI                    |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeApplicantforPBDProgram__c     |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeInReviewverforPBDProgram__c   |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextCreate        |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextView          |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantee |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInRecipient      |

  @549568 @549568_1
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Numeric & Calculated Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long    |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
      | Page Block Config:Page Block Rule Detail | Help Text Long    |                   | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see "Create Program" opens in overLay window
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see asterisk mark at "X_Number of Approval Steps" field in LWC
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | X_Number of Approval Steps is required to save. Enter it in the Information section on the Overview tab. |

  @549568 @549568_2
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Numeric & Calculated Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName   | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | <fieldName> |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName   | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | <fieldName> | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "<fieldNewValue>" inside page block

    Examples:
      | fieldName                        | fieldNewValue                            |
      | Field Label Override             | FLO X_Number of Approval Steps           |
      | Field Label Override (Rich Text) | FLO Rich Text X_Number of Approval Steps |

  @549568 @549568_3
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Numeric & Calculated Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long                   |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                                              | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                                              | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
      | Page Block Config:Page Block Rule Detail | Help Text Long                   | Internal program X_Number of Approval Steps. | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "X_Number of Approval Steps" inside page block
    When I hovering mouse on help text icon inside page block detail "X_Number of Approval Steps"
    Then I softly see "Internal program X_Number of Approval Steps." shown as help text


  @549568 @549568_4
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Numeric & Calculated Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "X_Number of Approval Steps" inside page block

    Examples:
      | Hide Logic                                                    |
      | govgrants_config:HideForProfilePMforPBD                       |
      | govgrants_config:HideForContextForEditforPBDProgram__c        |
      | govgrants_config:HideForUserTypeInternalforPBDProgram__c      |
      | govgrants_config:HideForUserappStateAsGrantorforPBDProgram__c |

  @549568 @549568_5
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Numeric & Calculated Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "X_Number of Approval Steps" inside page block

    Examples:
      | Hide Logic                                                  |
      | govgrants_config:HideForUserTypeApplicantforPBDProgram__c   |
      | govgrants_config:HideForUserTypeInReviewverforPBDProgram__c |

  @549567 @549567_6
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Numeric & Calculated Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                                                     | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForContextForNotEditforPBDProgram__c | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "X_Number of Approval Steps" inside page block
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I cannot see field "X_Number of Approval Steps" inside page block

  @549567 @549567_7
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Numeric & Calculated Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "X_Number of Approval Steps" inside page block
    Then I softly do not see fields "NumberOfApprovalSteps__c" is in edit mode

  @549567 @549567_9
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Numeric & Calculated Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                               | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                               | Grantor State Program | Name                      | {SavedValue:CountNumber__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideCountNumber__cEqualToText1000 | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "1000" into field "CountNumber__c"
    Then I softly see fields "NumberOfApprovalSteps__c" is in edit mode
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #Hide field Depend upon CountNumber__c
    Then I cannot see field "X_Number of Approval Steps" inside page block

  @549567 @549567_10
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Numeric & Calculated Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:CountNumber__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserFNameEqualsFreeTextAutomation | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "X_Number of Approval Steps" inside page block

  @549567 @549567_11
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Numeric & Calculated Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:CountNumber__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "X_Number of Approval Steps" inside page block
    Then I softly do not see fields "NumberOfApprovalSteps__c" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                             |
      | Read Only Expression JSON | govgrants_config:HEBFieldStatusCreated                                    |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeInternalforPBDProgram__c                  |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextEdit                      |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantor             |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserFirstNameEQUALSFreeTextUsed |

  @549567 @549567_12
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Numeric & Calculated Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "X_Number of Approval Steps" inside page block
    Then I softly see fields "NumberOfApprovalSteps__c" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                 |
      | Read Only Expression JSON | govgrants_config:ExpressionForProfileInSPI                    |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeApplicantforPBDProgram__c     |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeInReviewverforPBDProgram__c   |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextCreate        |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextView          |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantee |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInRecipient      |

  @549572 @549572_1
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Email/Phone/URL Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see "Create Program" opens in overLay window
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see asterisk mark at "X_Number of Approval Steps" field in LWC
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Email Test is required to save. Enter it in the Information section on the Overview tab.      |
      | Phone Number is required to save. Enter it in the Information section on the Overview tab.    |
      | Website Address is required to save. Enter it in the Information section on the Overview tab. |

  @549572 @549572_2
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Email/Phone/URL Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Help Text Long |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active      | true                           | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Long Phone Number    | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Is Active      | true                           | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Long Email Test      | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active      | true                           | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Long Website Address | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I hovering mouse on help text icon inside page block detail "Phone Number"
    Then I softly see "Help Text Long Phone Number" shown as help text
    When I hovering mouse on help text icon inside page block detail "Email Test"
    Then I softly see "Help Text Long Email Test" shown as help text
    When I hovering mouse on help text icon inside page block detail "Website Address"
    Then I softly see "Help Text Long Website Address" shown as help text

  @549572 @549572_3
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Email/Phone/URL Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "Phone Number" inside page block
    Then I cannot see field "Email Test" inside page block
    Then I cannot see field "Website Address" inside page block

    Examples:
      | Hide Logic                                                    |
      | govgrants_config:HideForProfilePMforPBD                       |
      | govgrants_config:HideForContextForEditforPBDProgram__c        |
      | govgrants_config:HideForUserTypeInternalforPBDProgram__c      |
      | govgrants_config:HideForUserappStateAsGrantorforPBDProgram__c |

  @549572 @549572_4
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Email/Phone/URL Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Phone Number" inside page block
    Then I softly see field "Email Test" inside page block
    Then I softly see field "Website Address" inside page block

    Examples:
      | Hide Logic                                                  |
      | govgrants_config:HideForUserTypeApplicantforPBDProgram__c   |
      | govgrants_config:HideForUserTypeInReviewverforPBDProgram__c |

  @549572 @549572_5
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Email/Phone/URL Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                                                     | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForContextForNotEditforPBDProgram__c | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                                                     | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForContextForNotEditforPBDProgram__c | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                                                     | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForContextForNotEditforPBDProgram__c | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Phone Number" inside page block
    Then I softly see field "Email Test" inside page block
    Then I softly see field "Website Address" inside page block
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly cannot see field "Phone Number" inside page block
    Then I softly cannot see field "Email Test" inside page block
    Then I softly cannot see field "Website Address" inside page block

  @549572 @549572_6
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Email/Phone/URL Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly do not see fields "Phone_Number__c" is in edit mode
    Then I softly do not see fields "Email_Test__c" is in edit mode
    Then I softly do not see fields "WebsiteAddress__c" is in edit mode

  @549572 @549572_7
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Email/Phone/URL Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                               | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                               | Grantor State Program | Name                      | {SavedValue:CountNumber__c}     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                               | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                               | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideCountNumber__cEqualToText1000 | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideCountNumber__cEqualToText1000 | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideCountNumber__cEqualToText1000 | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "1000" into field "CountNumber__c"
    Then I softly see fields "Phone_Number__c" is in edit mode
    Then I softly see fields "Email_Test__c" is in edit mode
    Then I softly see fields "WebsiteAddress__c" is in edit mode
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #Hide field Depend upon CountNumber__c
    Then I softly cannot see field "Phone Number" inside page block
    Then I softly cannot see field "Email Test" inside page block
    Then I softly cannot see field "Website Address" inside page block

  @549572 @549572_8
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Email/Phone/URL Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserFNameEqualsFreeTextAutomation | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserFNameEqualsFreeTextAutomation | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserFNameEqualsFreeTextAutomation | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly cannot see field "Phone Number" inside page block
    Then I softly cannot see field "Email Test" inside page block
    Then I softly cannot see field "Website Address" inside page block

  @549572 @549572_9
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Email/Phone/URL Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:CountNumber__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Phone Number" inside page block
    Then I softly see field "Email Test" inside page block
    Then I softly see field "Website Address" inside page block
    Then I softly do not see fields "Phone_Number__c" is in edit mode
    Then I softly do not see fields "Email_Test__c" is in edit mode
    Then I softly do not see fields "WebsiteAddress__c" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                             |
      | Read Only Expression JSON | govgrants_config:HEBFieldStatusCreated                                    |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeInternalforPBDProgram__c                  |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextEdit                      |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantor             |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserFirstNameEQUALSFreeTextUsed |

  @549572 @549572_10
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Email/Phone/URL Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}  |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see fields "Phone_Number__c" is in edit mode
    Then I softly see fields "Email_Test__c" is in edit mode
    Then I softly see fields "WebsiteAddress__c" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                 |
      | Read Only Expression JSON | govgrants_config:ExpressionForProfileInSPI                    |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeApplicantforPBDProgram__c     |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeInReviewverforPBDProgram__c   |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextCreate        |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextView          |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantee |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInRecipient      |

  @549574 @549574_1
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long    |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Help Text Long    |                   | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see "Create Program" opens in overLay window
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see asterisk mark at "Primary Funding Organization" field in LWC
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Primary Funding Organization is required to save. Enter it in the Information section on the Overview tab. |

  @549574 @549574_2
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue                                                        | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Identifies the organization that is the primary funder for this program. | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue                                                            | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Identifies the organization that is the primary funder for this program. | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Primary Funding Organization" inside page block
    When I hovering mouse on help text icon inside page block detail "Primary Funding Organization"
    Then I softly see "Identifies the organization that is the primary funder for this program." shown as help text

  @549574 @549574_3
  Scenario Outline:3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName   | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | <fieldName> | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "<fieldNewValue>" inside page block

    Examples:
      | fieldName                        | fieldNewValue                              |
      | Field Label Override             | FLO Primary Funding Organization           |
      | Field Label Override (Rich Text) | FLO Rich Text Primary Funding Organization |

  @549574 @549574_4
  Scenario Outline:3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false         | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "Primary Funding Organization" inside page block

    Examples:
      | Hide Logic                                                    |
      | govgrants_config:HideForProfilePMforPBD                       |
      | govgrants_config:HideForContextForEditforPBDProgram__c        |
      | govgrants_config:HideForUserTypeInternalforPBDProgram__c      |
      | govgrants_config:HideForUserappStateAsGrantorforPBDProgram__c |

  @549574 @549574_5
  Scenario Outline:3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Hide Label                       |               | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "Primary Funding Organization" inside page block

    Examples:
      | Hide Logic                                                  |
      | govgrants_config:HideForUserTypeApplicantforPBDProgram__c   |
      | govgrants_config:HideForUserTypeInReviewverforPBDProgram__c |

  @549574 @549574_6
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Hide Label                       |                                                           | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             | govgrants_config:HideForContextForNotEditforPBDProgram__c | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                                                           | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                                                           | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Abbreviation" inside page block
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I cannot see field "Primary Funding Organization" inside page block

  @549574 @549574_7
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Primary Funding Organization" inside page block
    Then I softly do not see fields "PrimaryFundingOrganization__c" is in edit mode

  @549574 @549574_8
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                               | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                               | Grantor State Program | Name                      | {SavedValue:CountNumber__c}                         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideCountNumber__cEqualToText1000 | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "1000" into field "CountNumber__c"
    Then I softly see fields "PrimaryFundingOrganization__c" is in edit mode
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #Hide field Depend upon CountNumber__c
    Then I cannot see field "Primary Funding Organization" inside page block

  @549574 @549574_9
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:CountNumber__c}                         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserFNameEqualsFreeTextAutomation | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "Primary Funding Organization" inside page block

  @549574 @549574_10
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:CountNumber__c}                         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "Primary Funding Organization" inside page block
    Then I softly do not see fields "PrimaryFundingOrganization__c" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                             |
      | Read Only Expression JSON | govgrants_config:HEBFieldStatusCreated                                    |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeInternalforPBDProgram__c                  |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextEdit                      |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantor             |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserFirstNameEQUALSFreeTextUsed |

  @549574 @549574_11
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "Primary Funding Organization" inside page block
    Then I softly see fields "PrimaryFundingOrganization__c" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                 |
      | Read Only Expression JSON | govgrants_config:ExpressionForProfileInSPI                    |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeApplicantforPBDProgram__c     |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeInReviewverforPBDProgram__c   |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextCreate        |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextView          |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantee |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInRecipient      |

  @549569 @549569_1
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Date & Time Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long    |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long    |                   | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see "Create Program" opens in overLay window
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see asterisk mark at "FLO Rich Text Date And Time" field in LWC
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | FLO Rich Text Date And Time is required in the Overview tab under the Information section. |

  @549569 @549569_2
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Date & Time Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Internal program Date And Time. | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "FLO Rich Text Date And Time" inside page block
    When I hovering mouse on help text icon inside page block detail "FLO Rich Text Date And Time"
    Then I softly see "Internal program Date And Time." shown as help text

  @549569 @549569_3
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Date & Time Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName   | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | <fieldName> | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "<fieldNewValue>" inside page block

    Examples:
      | fieldName                        | fieldNewValue               |
      | Field Label Override             | FLO Date And Time           |
      | Field Label Override (Rich Text) | FLO Rich Text Date And Time |

  @549569 @549569_4
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Date & Time Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "FLO Rich Text Date And Time" inside page block

    Examples:
      | Hide Logic                                                    |
      | govgrants_config:HideForProfilePMforPBD                       |
      | govgrants_config:HideForContextForEditforPBDProgram__c        |
      | govgrants_config:HideForUserTypeInternalforPBDProgram__c      |
      | govgrants_config:HideForUserappStateAsGrantorforPBDProgram__c |

  @549569 @549569_5
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Date & Time Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Hide Label           |               | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "FLO Rich Text Date And Time" inside page block

    Examples:
      | Hide Logic                                                  |
      | govgrants_config:HideForUserTypeApplicantforPBDProgram__c   |
      | govgrants_config:HideForUserTypeInReviewverforPBDProgram__c |

  @549569 @549569_6
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Date & Time Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue           | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                       | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | FLO Rich Text Date And Time | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Hide Label                       |                                                           | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             | govgrants_config:HideForContextForNotEditforPBDProgram__c | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | FLO Rich Text Date And Time                               | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "FLO Rich Text Date And Time" inside page block
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I cannot see field "FLO Rich Text Date And Time" inside page block

  @549569 @549569_7
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Date & Time Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                        | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only                        | false                       | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | FLO Rich Text Date And Time | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                        | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | Read Only                        | true                        | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | FLO Rich Text Date And Time | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "FLO Rich Text Date And Time" inside page block
    Then I softly do not see fields "Date_And_Time__c" is in edit mode

  @549569 @549569_8
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Date & Time Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                        | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                        | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | FLO Rich Text Date And Time | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                                               | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                                               | Grantor State Program | Name                      | {SavedValue:CountNumber__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             | govgrants_config:HideCountNumber__cEqualToText1000 | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | FLO Rich Text Date And Time                        | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "1000" into field "CountNumber__c"
    Then I softly see field "FLO Rich Text Date And Time" inside page block
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #Hide field Depend upon CountNumber__c
    Then I cannot see field "FLO Rich Text Date And Time" inside page block

  @549569 @549569_9
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:CountNumber__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserFNameEqualsFreeTextAutomation | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "FLO Rich Text Date And Time" inside page block

  @549569 @549569_10
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:CountNumber__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I see field "FLO Rich Text Date And Time" inside page block
    Then I softly do not see fields "Date_And_Time__c" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                             |
      | Read Only Expression JSON | govgrants_config:HEBFieldStatusCreated                                    |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeInternalforPBDProgram__c                  |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextEdit                      |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantor             |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserFirstNameEQUALSFreeTextUsed |

  @549569 @549569_11
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "FLO Rich Text Date And Time" inside page block
    Then I softly see fields "Date_And_Time__c" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                 |
      | Read Only Expression JSON | govgrants_config:ExpressionForProfileInSPI                    |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeApplicantforPBDProgram__c     |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeInReviewverforPBDProgram__c   |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextCreate        |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextView          |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantee |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInRecipient      |

  @549570 @549570_1
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long    |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
      | Page Block Config:Page Block Rule Detail | Help Text Long    |                   | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see "Create Program" opens in overLay window
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see asterisk mark at "X_CFDA Data" field in LWC
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | X_CFDA Data is required to save. Enter it in the Information section on the Overview tab. |

  @549570 @549570_2
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Internal program X_CFDA Data. | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "X_CFDA Data" inside page block
    When I hovering mouse on help text icon inside page block detail "X_CFDA Data"
    Then I softly see "Internal program X_CFDA Data." shown as help text

  @549570 @549570_3
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName   | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | <fieldName> |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName   | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | <fieldName> | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "<fieldNewValue>" inside page block

    Examples:
      | fieldName                        | fieldNewValue             |
      | Field Label Override             | FLO X_CFDA Data           |
      | Field Label Override (Rich Text) | FLO Rich Text X_CFDA Data |

  @549570 @549570_4
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "X_CFDA Data" inside page block

    Examples:
      | Hide Logic                                                    |
      | govgrants_config:HideForProfilePMforPBD                       |
      | govgrants_config:HideForContextForEditforPBDProgram__c        |
      | govgrants_config:HideForUserTypeInternalforPBDProgram__c      |
      | govgrants_config:HideForUserappStateAsGrantorforPBDProgram__c |

  @549570 @549570_5
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Hide Label           |               | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "X_CFDA Data" inside page block

    Examples:
      | Hide Logic                                                  |
      | govgrants_config:HideForUserTypeApplicantforPBDProgram__c   |
      | govgrants_config:HideForUserTypeInReviewverforPBDProgram__c |

  @549570 @549570_6
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Hide Label           |                                                           | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForContextForNotEditforPBDProgram__c | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "X_CFDA Data" inside page block
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I cannot see field "X_CFDA Data" inside page block

  @549570 @549570_7
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "X_CFDA Data" inside page block
    Then I softly do not see fields "CFDA_Data__c" is in edit mode

  @549570 @549570_8
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                               | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                               | Grantor State Program | Name                      | {SavedValue:CountNumber__c}  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideCountNumber__cEqualToText1000 | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "1000" into field "CountNumber__c"
    Then I softly see field "X_CFDA Data" inside page block
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #Hide field Depend upon CountNumber__c
    Then I cannot see field "X_CFDA Data" inside page block

  @549570 @549570_9
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:CountNumber__c}  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserFNameEqualsFreeTextAutomation | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "X_CFDA Data" inside page block

  @549570 @549570_10
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:CountNumber__c}  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "X_CFDA Data" inside page block
    Then I softly do not see fields "CFDA_Data__c" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                             |
      | Read Only Expression JSON | govgrants_config:HEBFieldStatusCreated                                    |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeInternalforPBDProgram__c                  |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextEdit                      |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantor             |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserFirstNameEQUALSFreeTextUsed |

  @549570 @549570_11
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "X_CFDA Data" inside page block
    Then I softly see fields "CFDA_Data__c" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                 |
      | Read Only Expression JSON | govgrants_config:ExpressionForProfileInSPI                    |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeApplicantforPBDProgram__c     |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeInReviewverforPBDProgram__c   |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextCreate        |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextView          |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantee |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInRecipient      |

  @549571 @549571_1
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long    |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long    |                   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see "Create Program" opens in overLay window
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    Then I softly see asterisk mark at "Types Of Assistance" field in LWC
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Types Of Assistance is required to save. Enter it in the Information section on the Overview tab. |

  @549571 @549571_2
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue                     | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Internal program Types Of Assistance. | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue                         | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Internal program Types Of Assistance. | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Types Of Assistance" inside page block
    When I hovering mouse on help text icon inside page block detail "Types Of Assistance"
    Then I softly see "Internal program Types Of Assistance." shown as help text

  @549571 @549571_3
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName   | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | <fieldName> |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName   | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | <fieldName> | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "<fieldNewValue>" inside page block

    Examples:
      | fieldName                        | fieldNewValue                     |
      | Field Label Override             | FLO Types Of Assistance           |
      | Field Label Override (Rich Text) | FLO Rich Text Types Of Assistance |

  @549571 @549571_4
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "Types Of Assistance" inside page block

    Examples:
      | Hide Logic                                                    |
      | govgrants_config:HideForProfilePMforPBD                       |
      | govgrants_config:HideForContextForEditforPBDProgram__c        |
      | govgrants_config:HideForUserTypeInternalforPBDProgram__c      |
      | govgrants_config:HideForUserappStateAsGrantorforPBDProgram__c |

  @549571 @549571_5
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <Hide Logic>  | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "Types Of Assistance" inside page block
    Then I softly see fields "TypesOfAssistance__c" is in edit mode

    Examples:
      | Hide Logic                                                |
      | govgrants_config:HideForUserTypeApplicantforPBDProgram__c |
    #  | govgrants_config:HideForUserTypeInReviewverforPBDProgram__c |

  @549571 @549571_6
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Hide Label           |                                                           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForContextForNotEditforPBDProgram__c | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Types Of Assistance" inside page block
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I cannot see field "Types Of Assistance" inside page block

  @549571 @549571_7
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Types Of Assistance" inside page block
    Then I softly do not see fields "TypesOfAssistance__c" is in edit mode

  @549571 @549571_8
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of Checkbox Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                               | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                               | Grantor State Program | Name                      | {SavedValue:CountNumber__c}                              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideCountNumber__cEqualToText1000 | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "1000" into field "CountNumber__c"
    Then I softly see field "Types Of Assistance" inside page block
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #Hide field Depend upon CountNumber__c
    Then I cannot see field "Types Of Assistance" inside page block

  @549571 @549571_9
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {SavedValue:CountNumber__c}                              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserFNameEqualsFreeTextAutomation | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "Types Of Assistance" inside page block

  @549571 @549571_10
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:CountNumber__c}                              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "Types Of Assistance" inside page block
    Then I softly do not see fields "TypesOfAssistance__c" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                             |
      | Read Only Expression JSON | govgrants_config:HEBFieldStatusCreated                                    |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeInternalforPBDProgram__c                  |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextEdit                      |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantor             |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserFirstNameEQUALSFreeTextUsed |

  @549571 @549571_11
  Scenario Outline: 3.0: Page Block Detail: Admin: To verify page block detail of lookup Field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "Authorized Signatory" inside page block
    Then I softly see fields "AuthorizedSignatory__c" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                 |
      | Read Only Expression JSON | govgrants_config:ExpressionForProfileInSPI                    |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeApplicantforPBDProgram__c     |
      | Read Only Expression JSON | govgrants_config:HideForUserTypeInReviewverforPBDProgram__c   |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextCreate        |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderPBDContextView          |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantee |
      | Read Only Expression JSON | govgrants_config:hideExpressionBuilderUserAppInRecipient      |


  @549434 @549434_1
  Scenario: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue            | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                     | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Assistance Listing # | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                    | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                    | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I see field "FLO Assistance Listing #" inside page block
    Then I softly see fields "CFDANumber__c" is in edit mode

  @549434 @549434_2
  Scenario: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | true          | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
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
    Then I softly cannot see field "Assistance Listing #" inside page block
    Then I softly see field "CFDANumber__c" is not editable

  @549434 @549434_3
  Scenario: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    Then I softly see asterisk mark at "Assistance Listing #" field in LWC
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Assistance Listing # is required to save. Enter it in the Information section on the Overview tab.                                                                                                                 |
      | Approach/Methodology Provide an explanation of the approach and methodology that will be used to meet the project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab. |
      | Capacity Provide an explanation of the capacity of the organization to meet the project objectives.is required to save. Enter it in the Technical Proposal section on the Proposal tab.                            |
      | Qualifications Provide an explanation of the qualifications of the personnel as they relate to project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab.            |

  @549434 @549434_4
  Scenario: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active         | true                | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false               | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly see required for submit symbol at "Assistance Listing #" field

  @549434 @549434_5
  Scenario: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                               | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                     | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                     | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly cannot see field "Assistance Listing #" inside page block

  @549434 @549434_6
  Scenario: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                               | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                     | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                     | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:ContextInViewPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly see field "Assistance Listing #" inside page block
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Assistance Listing #" inside page block

  @549434 @549434_7
  Scenario: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                  | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                        | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                        | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:UserTypeInternalPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
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
    Then I softly see field "Assistance Listing #" inside page block

  @549434 @549434_8
  Scenario: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                   | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                         | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                         | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:UserTypeApplicantPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
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
    Then I softly cannot see field "Assistance Listing #" inside page block

  @549434 @549434_8
  Scenario: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                   | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                         | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                         | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForProfileSPIPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
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
    Then I softly cannot see field "Assistance Listing #" inside page block

  @549434 @549434_9
  Scenario: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                      | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                            | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                            | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideStatusForCreatedPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
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
    Then I softly cannot see field "Assistance Listing #" inside page block

  @549434 @549434_10
  Scenario: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                          | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                         | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                               | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                               | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideFirstNameAutomationPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
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
    Then I softly cannot see field "Assistance Listing #" inside page block

  @549434 @549434_11
  Scenario: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                           | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                 | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                 | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForUserAppAsRecipientPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
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
    Then I softly cannot see field "Assistance Listing #" inside page block

  @549434 @549434_12
  Scenario: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                        | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                 | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                                | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                      | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                      | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForUserAppAsStateAsGrantorPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see field "Assistance Listing #" inside page block


  @549435 @549435_1
  Scenario: 3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue            | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                     | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Application Deadline | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                    | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                    | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I see field "FLO Application Deadline" inside page block
    Then I softly see fields "ApplicationDeadlineWithDateTime__c" is in edit mode

  @549435 @549435_2
  Scenario: 3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
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
    Then I softly cannot see field "Application Deadline" inside page block
    Then I softly see field "ApplicationDeadlineWithDateTime__c" is not editable

  @549435 @549435_3
  Scenario: 3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    Then I softly see asterisk mark at "Application Deadline" field in LWC
    Then I softly do not see asterisk mark at "Application Deadline" field in LWC
    Then I softly see asterisk mark at "Application Deadline" field in LWC
    Then I do not see asterisk mark at "Application Deadline" field in LWC
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Application Deadline is required to save. Enter it in the Information section on the Overview tab.                                                                                                                 |
      | Approach/Methodology Provide an explanation of the approach and methodology that will be used to meet the project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab. |
      | Capacity Provide an explanation of the capacity of the organization to meet the project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab.                           |
      | Qualifications Provide an explanation of the qualifications of the personnel as they relate to project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab.            |

  @549435 @549435_4
  Scenario: 3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active         | true                | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly see required for submit symbol at "Application Deadline" field

  @549435 @549435_5
  Scenario: 3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                     | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                     | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly cannot see field "Application Deadline" inside page block

  @549435 @549435_6
  Scenario: 3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                     | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                     | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:ContextInViewPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly see field "Application Deadline" inside page block
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Application Deadline" inside page block

  @549435 @549435_7
  Scenario: 3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                  | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                        | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                        | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:UserTypeInternalPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
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
    Then I softly see field "Application Deadline" inside page block

  @549435 @549435_8
  Scenario: 3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                   | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                         | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                         | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:UserTypeApplicantPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
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
    Then I softly cannot see field "Application Deadline" inside page block

  @549435 @549435_8
  Scenario: 3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                   | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                         | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                         | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForProfileSPIPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
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
    Then I softly cannot see field "Application Deadline" inside page block

  @549435 @549435_9
  Scenario: 3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                      | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                            | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                            | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideStatusForCreatedPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
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
    Then I softly cannot see field "Application Deadline" inside page block

  @549435 @549435_10
  Scenario: 3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                         | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideFirstNameAutomationPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
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
    Then I softly cannot see field "Application Deadline" inside page block

  @549435 @549435_11
  Scenario: 3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                           | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                 | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                 | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForUserAppAsRecipientPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
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
    Then I softly cannot see field "Application Deadline" inside page block

  @549435 @549435_12
  Scenario: 3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                        | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                 | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                                | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                      | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                      | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForUserAppAsStateAsGrantorPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see field "Application Deadline" inside page block

  @549436 @549436_1
  Scenario: 3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                       | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Are any state specific forms attached? | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                                      | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                                      | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I see field "FLO Are any state specific forms attached?" inside page block
    Then I softly see fields "AreAnyStateSpecificFormsAttached__c" is in edit mode

  @549436 @549436_2
  Scenario: 3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | true          | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
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
    Then I softly cannot see field "Are any state specific forms attached?" inside page block
    Then I softly see field "AreAnyStateSpecificFormsAttached__c" is not editable

  @549436 @549436_3
  Scenario: 3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    Then I softly see asterisk mark at "Are any state specific forms attached?" field in LWC
    Then I softly do not see asterisk mark at "Are any state specific forms attached?" field in LWC
    Then I softly see asterisk mark at "Are any state specific forms attached?" field in LWC
    Then I do not see asterisk mark at "Are any state specific forms attached?" field in LWC
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Are any state specific forms attached? is required to save. Enter it in the Information section on the Overview tab.                                                                                               |
      | Approach/Methodology Provide an explanation of the approach and methodology that will be used to meet the project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab. |
      | Capacity Provide an explanation of the capacity of the organization to meet the project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab.                           |
      | Qualifications Provide an explanation of the qualifications of the personnel as they relate to project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab.            |

  @549436 @549436_4
  Scenario: 3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active         | true                | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false               | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly see required for submit symbol at "Are any state specific forms attached?" field

  @549436 @549436_5
  Scenario: 3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                               | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                     | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                     | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly cannot see field "Are any state specific forms attached?" inside page block

  @549436 @549436_6
  Scenario: 3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                               | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                     | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                     | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:ContextInViewPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly see field "Are any state specific forms attached?" inside page block
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Are any state specific forms attached?" inside page block

  @549436 @549436_7
  Scenario: 3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                  | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                        | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                        | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:UserTypeInternalPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
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
    Then I softly see field "Are any state specific forms attached?" inside page block

  @549436 @549436_8
  Scenario: 3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                   | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                         | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                         | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:UserTypeApplicantPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
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
    Then I softly cannot see field "Are any state specific forms attached?" inside page block

  @549436 @549436_8
  Scenario: 3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                   | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                         | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                         | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForProfileSPIPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
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
    Then I softly cannot see field "Are any state specific forms attached?" inside page block

  @549436 @549436_9
  Scenario: 3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                      | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                            | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                            | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideStatusForCreatedPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
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
    Then I softly cannot see field "Are any state specific forms attached?" inside page block

  @549436 @549436_10
  Scenario: 3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                          | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                         | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                               | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                               | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideFirstNameAutomationPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
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
    Then I softly cannot see field "Are any state specific forms attached?" inside page block

  @549436 @549436_11
  Scenario: 3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                           | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                 | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                 | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForUserAppAsRecipientPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
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
    Then I softly cannot see field "Are any state specific forms attached?" inside page block

  @549436 @549436_12
  Scenario: 3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                        | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                 | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                                | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                      | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                      | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForUserAppAsStateAsGrantorPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see field "Are any state specific forms attached?" inside page block

  @549438 @549438_1
  Scenario: 3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Authorized Representative Phone | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                               | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                               | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I see field "FLO Authorized Representative Phone" inside page block
    Then I softly see fields "AuthorizedRepresentativePhone__c" is in edit mode

  @549438 @549438_2
  Scenario: 3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | true          | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
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
    Then I softly cannot see field "Authorized Representative Phone" inside page block
    Then I softly see field "AuthorizedRepresentativePhone__c" is not editable

  @549438 @549438_3
  Scenario: 3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    Then I softly see asterisk mark at "Authorized Representative Phone" field in LWC
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Authorized Representative Phone is required to save. Enter it in the Information section on the Overview tab.                                                                                                      |
      | Approach/Methodology Provide an explanation of the approach and methodology that will be used to meet the project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab. |
      | Capacity Provide an explanation of the capacity of the organization to meet the project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab.                           |
      | Qualifications Provide an explanation of the qualifications of the personnel as they relate to project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab.            |

  @549438 @549438_4
  Scenario: 3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true                | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false               | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly see required for submit symbol at "Authorized Representative Phone" field

  @549438 @549438_5
  Scenario: 3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                               | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                     | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                     | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly cannot see field "Authorized Representative Phone" inside page block

  @549438 @549438_6
  Scenario: 3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                               | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                     | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                     | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:ContextInViewPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly see field "Authorized Representative Phone" inside page block
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Authorized Representative Phone" inside page block

  @549438 @549438_7
  Scenario: 3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                  | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                        | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                        | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:UserTypeInternalPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
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
    Then I softly see field "Authorized Representative Phone" inside page block

  @549438 @549438_8
  Scenario: 3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                   | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                         | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                         | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:UserTypeApplicantPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
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
    Then I softly cannot see field "Authorized Representative Phone" inside page block

  @549438 @549438_8
  Scenario: 3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                   | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                         | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                         | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForProfileSPIPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
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
    Then I softly cannot see field "Authorized Representative Phone" inside page block

  @549438 @549438_9
  Scenario: 3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                      | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                            | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                            | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideStatusForCreatedPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
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
    Then I softly cannot see field "Authorized Representative Phone" inside page block

  @549438 @549438_10
  Scenario: 3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                          | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                         | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                               | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                               | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideFirstNameAutomationPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
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
    Then I softly cannot see field "Authorized Representative Phone" inside page block

  @549438 @549438_11
  Scenario: 3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                           | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                 | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                 | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForUserAppAsRecipientPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
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
    Then I softly cannot see field "Authorized Representative Phone" inside page block

  @549438 @549438_12
  Scenario: 3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                        | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                 | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                                | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                      | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                      | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForUserAppAsStateAsGrantorPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see field "Authorized Representative Phone" inside page block

  @549521 @549521_1
  Scenario: 3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO AOR Contact | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false           | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false           | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I see field "FLO AOR Contact" inside page block
    Then I softly see fields "AOR_Contact__c" is in edit mode

  @549521 @549521_2
  Scenario: 3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | true          | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
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
    Then I softly cannot see field "AOR Contact" inside page block
    Then I softly see field "AOR_Contact__c" is not editable

  @549521 @549521_3
  Scenario: 3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block
#    Given I have "default" configuration as below:
#      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
#      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
#      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | ApiGeneratedId:1 |
#      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:2 |
#      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | ApiGeneratedId:3 |
#    Given I setup test configuration as below:
#      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
#      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
#      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
#      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
#      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    Then I softly see asterisk mark at "AOR Contact" field in LWC
    And I navigate to url "https://test8-internal--afsautoqa.sandbox.my.site.com/recipient/s/application/a1hDa000003LoBqIAK/aptao4926?c__Mode=ZWRpdA%3D%3D"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | AOR Contact is required to save. Enter it in the Information section on the Overview tab.                                                                                                                          |
      | Approach/Methodology Provide an explanation of the approach and methodology that will be used to meet the project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab. |
      | Capacity Provide an explanation of the capacity of the organization to meet the project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab.                           |
      | Qualifications Provide an explanation of the qualifications of the personnel as they relate to project objectives. is required to save. Enter it in the Technical Proposal section on the Proposal tab.            |

  @549521 @549521_4
  Scenario: 3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true                | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field   | false               | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly see required for submit symbol at "AOR Contact" field

  @549521 @549521_5
  Scenario: 3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                               | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                     | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                     | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly cannot see field "AOR Contact" inside page block

  @549521 @549521_6
  Scenario: 3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                               | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                     | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                     | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:ContextInViewPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly see field "AOR Contact" inside page block
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "AOR Contact" inside page block

  @549521 @549521_7
  Scenario: 3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                  | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                        | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                        | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:UserTypeInternalPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
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
    Then I softly see field "AOR Contact" inside page block

  @549521 @549521_8
  Scenario: 3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                   | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                         | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                         | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:UserTypeApplicantPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
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
    Then I softly cannot see field "AOR Contact" inside page block

  @549521 @549521_8
  Scenario: 3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                   | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                         | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                         | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForProfileSPIPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
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
    Then I softly cannot see field "AOR Contact" inside page block

  @549521 @549521_9
  Scenario: 3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                      | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                            | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                            | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideStatusForCreatedPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
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
    Then I softly cannot see field "AOR Contact" inside page block

  @549521 @549521_10
  Scenario: 3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                          | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                         | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                               | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                               | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideFirstNameAutomationPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
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
    Then I softly cannot see field "AOR Contact" inside page block

  @549521 @549521_11
  Scenario: 3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                           | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                 | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                 | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForUserAppAsRecipientPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
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
    Then I softly cannot see field "AOR Contact" inside page block

  @549521 @549521_12
  Scenario: 3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                        | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                 | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                                                                | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                      | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                                      | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForUserAppAsStateAsGrantorPostCreateApplication | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see field "AOR Contact" inside page block


  @549433_13 @549434_13 @549435_13 @549436_13 @549438_13 @549521_13
  Scenario Outline: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
  |3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.|
  |3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field           | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false           | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                 | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
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
    #Read Only Expression JSON - for Profile SPI
    Then I softly see field "<field label>" inside page block
    Then I softly see field "<field api>" is not editable

    Examples:
      | fieldName                 | fieldNewValue                                           | coreComponentSubFieldValue                       | field label                            | field api                           |
      | Read Only Expression JSON | govgrants_config:HideForProfileSPIPostCreateApplication | {SavedValue:CFDANumber__c}                       | Assistance Listing #                   | CFDANumber__c                       |
      | Read Only Expression JSON | govgrants_config:HideForProfileSPIPostCreateApplication | {SavedValue:ZipCode4Externsion__c}               | X_4-Digit Zip Code Extension           | ZipCode4Externsion__c               |
      | Read Only Expression JSON | govgrants_config:HideForProfileSPIPostCreateApplication | {SavedValue:ApplicationDeadlineWithDateTime__c}  | Application Deadline                   | ApplicationDeadlineWithDateTime__c  |
      | Read Only Expression JSON | govgrants_config:HideForProfileSPIPostCreateApplication | {SavedValue:AreAnyStateSpecificFormsAttached__c} | Are any state specific forms attached? | AreAnyStateSpecificFormsAttached__c |
      | Read Only Expression JSON | govgrants_config:HideForProfileSPIPostCreateApplication | {SavedValue:AuthorizedRepresentativePhone__c}    | Authorized Representative Phone        | AuthorizedRepresentativePhone__c    |
      | Read Only Expression JSON | govgrants_config:HideForProfileSPIPostCreateApplication | {SavedValue:AOR_Contact__c}                      | AOR Contact                            | AOR_Contact__c                      |

  @549433_14 @549434_14 @549435_14 @549436_14 @549438_14 @549521_14
  Scenario Outline: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
  |3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.|
  |3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field           | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false           | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                 | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
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
    #Read Only Expression JSON - for User Type Applicant
    Then I softly see field "<field label>" inside page block
    Then I softly see field "<field api>" is not editable

    Examples:
      | fieldName                 | fieldNewValue                                           | coreComponentSubFieldValue                       | field label                            | field api                           |
      | Read Only Expression JSON | govgrants_config:UserTypeApplicantPostCreateApplication | {SavedValue:CFDANumber__c}                       | Assistance Listing #                   | CFDANumber__c                       |
      | Read Only Expression JSON | govgrants_config:UserTypeApplicantPostCreateApplication | {SavedValue:ZipCode4Externsion__c}               | X_4-Digit Zip Code Extension           | ZipCode4Externsion__c               |
      | Read Only Expression JSON | govgrants_config:UserTypeApplicantPostCreateApplication | {SavedValue:ApplicationDeadlineWithDateTime__c}  | Application Deadline                   | ApplicationDeadlineWithDateTime__c  |
      | Read Only Expression JSON | govgrants_config:UserTypeApplicantPostCreateApplication | {SavedValue:AreAnyStateSpecificFormsAttached__c} | Are any state specific forms attached? | AreAnyStateSpecificFormsAttached__c |
      | Read Only Expression JSON | govgrants_config:UserTypeApplicantPostCreateApplication | {SavedValue:AuthorizedRepresentativePhone__c}    | Authorized Representative Phone        | AuthorizedRepresentativePhone__c    |
      | Read Only Expression JSON | govgrants_config:UserTypeApplicantPostCreateApplication | {SavedValue:AOR_Contact__c}                      | AOR Contact                            | AOR_Contact__c                      |

  @549433_15 @549434_15 @549435_15 @549436_15 @549438_15 @549521_15
  Scenario Outline: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
  |3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.|
  |3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field           | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false           | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                 | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
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
    #Read Only Expression JSON - for Context In Edit
    Then I softly see field "<field label>" inside page block
    Then I softly see field "<field api>" is not editable

    Examples:
      | fieldName                 | fieldNewValue                                                       | coreComponentSubFieldValue                       | field label                            | field api                           |
      | Read Only Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | {SavedValue:CFDANumber__c}                       | Assistance Listing #                   | CFDANumber__c                       |
      | Read Only Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | {SavedValue:ZipCode4Externsion__c}               | X_4-Digit Zip Code Extension           | ZipCode4Externsion__c               |
      | Read Only Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | {SavedValue:ApplicationDeadlineWithDateTime__c}  | Application Deadline                   | ApplicationDeadlineWithDateTime__c  |
      | Read Only Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | {SavedValue:AreAnyStateSpecificFormsAttached__c} | Are any state specific forms attached? | AreAnyStateSpecificFormsAttached__c |
      | Read Only Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | {SavedValue:AuthorizedRepresentativePhone__c}    | Authorized Representative Phone        | AuthorizedRepresentativePhone__c    |
      | Read Only Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | {SavedValue:AOR_Contact__c}                      | AOR Contact                            | AOR_Contact__c                      |

  @549433_16 @549434_16 @549435_16 @549436_16 @549438_16 @549521_16
  Scenario Outline: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
  |3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.|
  |3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field           | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false           | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                 | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
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
    #Read Only Expression JSON - for UserApp Reciepient
    Then I softly see field "<field label>" inside page block
    Then I softly see field "<field api>" is not editable

    Examples:
      | fieldName                 | fieldNewValue                                                   | coreComponentSubFieldValue                       | field label                            | field api                           |
      | Read Only Expression JSON | govgrants_config:HideForUserAppAsRecipientPostCreateApplication | {SavedValue:CFDANumber__c}                       | Assistance Listing #                   | CFDANumber__c                       |
      | Read Only Expression JSON | govgrants_config:HideForUserAppAsRecipientPostCreateApplication | {SavedValue:ZipCode4Externsion__c}               | X_4-Digit Zip Code Extension           | ZipCode4Externsion__c               |
      | Read Only Expression JSON | govgrants_config:HideForUserAppAsRecipientPostCreateApplication | {SavedValue:ApplicationDeadlineWithDateTime__c}  | Application Deadline                   | ApplicationDeadlineWithDateTime__c  |
      | Read Only Expression JSON | govgrants_config:HideForUserAppAsRecipientPostCreateApplication | {SavedValue:AreAnyStateSpecificFormsAttached__c} | Are any state specific forms attached? | AreAnyStateSpecificFormsAttached__c |
      | Read Only Expression JSON | govgrants_config:HideForUserAppAsRecipientPostCreateApplication | {SavedValue:AuthorizedRepresentativePhone__c}    | Authorized Representative Phone        | AuthorizedRepresentativePhone__c    |
      | Read Only Expression JSON | govgrants_config:HideForUserAppAsRecipientPostCreateApplication | {SavedValue:AOR_Contact__c}                      | AOR Contact                            | AOR_Contact__c                      |

  @549524 @549524_1
  Scenario: 3.0: Page Layout: SPI: Page Block Details Config: Formula (Text)/Standard Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue          | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false                      | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Indirect Budget Categories | Recipient Pre-Application | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                      | Recipient Pre-Application | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                         | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                                  | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Automation Indirect Budget Categories | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                                 | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Activities" subheader on left panel
    When I click toggle button to select "Pre-Applications - My Records"
    And I perform quick search for "Created" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    Then I can see row level action button "View" against "Created" in flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
#    Then I can see row level action button "Edit" against "Created" in flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    When I click on "View" icon for "Created" inside flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    Then I softly see "Edit" button is displayed
    Then I softly see field "Automation Indirect Budget Categories" inside page block
    Then I softly see "Applicant Information" page block displayed
    Then I softly see "Opportunity Overview" page block displayed
    Then I softly see "Pre-Application Overview" page block displayed
    Then I softly see "Project Information" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Acknowledgement" page block displayed
    Then I softly see "System Information" page block displayed

  @549524 @549524_2
  Scenario: 3.0: Page Layout: SPI: Page Block Details Config: Formula (Text)/Standard Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue                                       | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Applicant organization’s Employer Identification Number | Recipient Pre-Application | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Applicant organization’s Employer Identification Number | Recipient Pre-Application | Name                      | PBD-37855                  |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Activities" subheader on left panel
    When I click toggle button to select "Pre-Applications - My Records"
    And I perform quick search for "Created" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    When I click on "View" icon for "Created" inside flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
   #page block help text
    Then I softly see Help Text Post "Help Text Post Automation" for the field "Address"
    When I hovering mouse on help text icon inside page block detail "EIN"
    Then I softly see "Applicant organization’s Employer Identification Number" shown as help text

  @549524 @549524_3
  Scenario: 3.0: Page Layout: SPI: Page Block Details Config: Formula (Text)/Standard Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue          | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                       | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Indirect Budget Categories | Recipient Pre-Application | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                      | Recipient Pre-Application | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                       | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Indirect Budget Categories | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | true                       | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Activities" subheader on left panel
    When I click toggle button to select "Pre-Applications - My Records"
    And I perform quick search for "Created" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    Then I can see row level action button "View" against "Created" in flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    Then I can see row level action button "Edit" against "Created" in flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    When I click on "View" icon for "Created" inside flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    Then I softly see "Edit" button is displayed
    Then I softly cannot see field "Indirect Budget Categories" inside page block

  @549520 @549520_1
  Scenario: 3.0: Page Layout: SPI: To verify field level attachment Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field level attachment | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | Recipient ApplicationView | Name                      | {SavedValue:ITRequirementsComments__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field level attachment | Recipient ApplicationView | Name                      | {SavedValue:ITRequirementsComments__c} |
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
    Then I see field "Field level attachment" inside page block
    And I click on "Upload File" in the page details
    And I pause execution for "5" seconds
    Then I softly see "Add File" opens in overLay window
    Then I see "Upload File from Computer" subtab is present in page details
    Then I see "Files Uploaded" subtab is present in page details
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select classification | Certification Regarding Debarment | Civil rights assurances | General Assurances | IDEA assurances | Ineligibility and Voluntary Exclusion Lower Tier Covered Transactions | Justification for project cost | Suspension | Title I, II, III assurances |
    Then I see "Upload" button is disabled at modal under library
    And I enter value "Description Test" inside "Description" in LWC modal
    And I upload attachment without random number "AttachmentTesting.pdf" of type "General Assurances" from computer
    And I click on "Files Uploaded" tab at files library upload modal
    Then I softly can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "FieldLevelFilesTable"
    Then I softly can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "FieldLevelFilesTable"
    Then I softly can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "FieldLevelFilesTable"
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "FieldLevelFilesTable"

  @549520 @549520_2
  Scenario: 3.0: Page Layout: SPI: To verify field level attachment Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field level attachment | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save      | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | Recipient ApplicationView | Name                      | {SavedValue:ITRequirementsComments__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field level attachment | Recipient ApplicationView | Name                      | {SavedValue:ITRequirementsComments__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save      | Recipient ApplicationView | Name                      | {SavedValue:ITRequirementsComments__c} |
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
    Then I see field "Field level attachment" inside page block
    And I click on "Upload File" in the page details
    And I pause execution for "5" seconds
    Then I softly see "Add File" opens in overLay window
    Then I softly see asterisk mark at "Field level attachment" field in LWC


  @549520 @549520_3
  Scenario Outline: 3.0: Page Layout: SPI: To verify field level attachment Fields under opportunity overview page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                        | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                        | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field level attachment | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false                  | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                        | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue>        | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field level attachment | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
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
    #Hide Expression JSON - for UserApp Reciepient
    Then I softly cannot see field "<field label>" inside page block

    Examples:
      | fieldName            | fieldNewValue                                                       | coreComponentSubFieldValue             | field label            |
      | Hide Expression JSON | govgrants_config:HideForUserAppAsRecipientPostCreateApplication     | {SavedValue:ITRequirementsComments__c} | Field level attachment |
      | Hide Expression JSON | govgrants_config:HideForProfileSPIPostCreateApplication             | {SavedValue:ITRequirementsComments__c} | Field level attachment |
      | Hide Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | {SavedValue:ITRequirementsComments__c} | Field level attachment |

  @549573 @549573_1
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of field level attachment Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field level attachment | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | Grantor State Program | Name                      | {SavedValue:AwardProcedure__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field level attachment | Grantor State Program | Name                      | {SavedValue:AwardProcedure__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "Field level attachment" inside page block
    And I click on "Upload File" in the page details
    And I pause execution for "5" seconds
    Then I softly see "Add File" opens in overLay window
    Then I see "Upload File from Computer" subtab is present in page details
    Then I see "Files Uploaded" subtab is present in page details
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Financial Artifacts | Program Artifacts | Other Artifacts |
    Then I see "Upload" button is disabled at modal under library
    And I enter value "Description Test" inside "Description" in LWC modal
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I click on "Files Uploaded" tab at files library upload modal
    Then I softly can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "FieldLevelFilesTable"
    Then I softly can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "FieldLevelFilesTable"
    Then I softly can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "FieldLevelFilesTable"
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "FieldLevelFilesTable"


  @549573 @549573_2
  Scenario: 3.0: Page Block Detail: Admin: To verify page block detail of field level attachment Fields.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field level attachment | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | Grantor State Program | Name                      | {SavedValue:AwardProcedure__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field level attachment | Grantor State Program | Name                      | {SavedValue:AwardProcedure__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save      | Grantor State Program | Name                      | {SavedValue:AwardProcedure__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "Field level attachment" inside page block
    And I click on "Upload File" in the page details
    Then I softly see asterisk mark at "Field level attachment" field in LWC

  @549213
  Scenario Outline: 3.0: Page Layout: SPI: To verify opportunity overview page block config hide expression builder.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block            | Hide Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName   | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | <fieldName> | <fieldNewValue> | Recipient Pre-Application | Name                      | {SavedValue:OpportunityOverview} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Activities" subheader on left panel
    When I click toggle button to select "Pre-Applications - My Records"
    And I perform quick search for "Created" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    Then I can see row level action button "View" against "Created" in flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    Then I can see row level action button "Edit" against "Created" in flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    When I click on "View" icon for "Created" inside flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    Then I softly see "Edit" button is displayed
    Then I softly do not see "Opportunity Overview" page block displayed

    Examples:
      | fieldName            | fieldNewValue                                                                 |
      | Hide Expression JSON | govgrants_config:HideExpressionJsonForProfileSPIonPreApplication              |
      | Hide Expression JSON | govgrants_config:HideExpressionJsonForContextInViewSPIonPreApplication        |
      | Hide Expression JSON | govgrants_config:hideTabForUserAppInReciepient                                |
      | Hide Expression JSON | govgrants_config:HideExpressionJsonForStatusAsCreatedSPIonPreApplication      |
      | Hide Expression JSON | govgrants_config:HideExpressionJsonForDollarUserAutomationSPIonPreApplication |

  @549208
  Scenario Outline: 3.0: Page Layout: SPI: To verify page tab config of Header overview Hide expression builder.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName   | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Tabs Config:Page Layout Action | Is Active   | true            | Recipient Pre-Application | Name                      | {SavedValue:AttachmentsTab} |
      | Page Tabs Config:Page Layout Action | <fieldName> | <fieldNewValue> | Recipient Pre-Application | Name                      | {SavedValue:AttachmentsTab} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Activities" subheader on left panel
    When I click toggle button to select "Pre-Applications - My Records"
    And I perform quick search for "Created" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    Then I can see row level action button "View" against "Created" in flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    Then I can see row level action button "Edit" against "Created" in flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    When I click on "View" icon for "Created" inside flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    Then I softly see "Edit" button is displayed
    And I click on "Collapse" in page detail
    Then I do not see "Attachments" Tab title displays on pagelayout
    Then I do not see "Attachments" subtab is present with icon "attach" in page details

    Examples:
      | fieldName            | fieldNewValue                                                                 |
     # | Hide Expression JSON | govgrants_config:HideExpressionJsonForProfileSPIonPreApplication              |
      | Hide Expression JSON | govgrants_config:HideExpressionJsonForContextInViewSPIonPreApplication        |
      | Hide Expression JSON | govgrants_config:hideTabForUserAppInReciepient                                |
      | Hide Expression JSON | govgrants_config:HideExpressionJsonForStatusAsCreatedSPIonPreApplication      |
      | Hide Expression JSON | govgrants_config:HideExpressionJsonForDollarUserAutomationSPIonPreApplication |
