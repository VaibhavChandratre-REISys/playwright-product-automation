@FW-433 @US-FW-433
Feature:  Scenarios
Business Need: to ensure that thLayout, form, modal - Support to display top action under tab of layout, form, modal

  @FW-476 @FW-634
  Scenario: TC - LWC - Layout - PM - To verify that configured top-level actions should displayed in tab footer in view mode
  |TC - LWC - Layout/Forms/Modal - Config - To verify that, after selecting tab name under "Tab Config" config, that action should display under particular tab footer section|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active  | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName  | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active  | true            | Grantor State Program | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config | a1NDV000002RGwF | Grantor State Program | Name                      | Tab Config                 |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I wait for "4" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Tab Config" button displayed under "Overview" tab

  @FW-529
  Scenario: TC - LWC - Layout - PM - To verify that tab footer action click behavior should work properly in view mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active  | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config |                   | ApiGeneratedId:1 |
     # | Page Tabs Config      | Is Active  | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName  | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active  | true            | Grantor State Program | Name                      | Submit For Approval        |
      | Page Layout Action    | Tab Config | a1NDV000002RGwF | Grantor State Program | Name                      | Submit For Approval        |
     # | Page Tabs Config:Page Layout Action | Is Active  | true          | Grantor State Program | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
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
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    Then I softly see "Tab Config" button displayed under "Overview" tab
      #Tab config button confired like 'Submit For Approval'-(Consider as Submit For Approval button)
    And I click on "Tab Config" in the page details
    And I pause execution for "4" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"

  @FW-531
  Scenario: TC - LWC - Forms - PM - To verify that, tab footer action click behavior should work properly in view mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true                                  | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | {SavedValue:PAFDetailsTabUniqueValue} | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config                            | Program Specific Application form | Name                      | Tab Config                 |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Submitted"
    And I click on "View" action for first record of table
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see "Tab Config" button displayed under "Details" tab
    And I click on "Tab Config" in the page details
    Then I softly see the following messages in the page details :
      | Form Validated Successfully. |

  @FW-541
  Scenario: TC - LWC - Layout - PM - To verify that, in view mode user should configure which top-level action is shown at bottom
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
    Then I see "Submit For Approval" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active  | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active  | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName  | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                         |
      | Page Layout Action                  | Is Active  | true            | Grantor State Program | Name                      | Submit For Approval                                |
      | Page Layout Action                  | Tab Config | a1NDV000002RGwF | Grantor State Program | Name                      | Submit For Approval                                |
      | Page Tabs Config:Page Layout Action | Is Active  | true            | Grantor State Program | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly see "Submit For Approval" button displayed under "Overview" tab

  @FW-543
  Scenario: TC - LWC - Layout - PM - To verify that, after removing configuration removes the action from the UI.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active  | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active  | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName  | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                         |
      | Page Layout Action                  | Is Active  | true            | Grantor State Program | Name                      | Tab Config                                         |
      | Page Layout Action                  | Tab Config | a1NDV000002RGwF | Grantor State Program | Name                      | Tab Config                                         |
      | Page Tabs Config:Page Layout Action | Is Active  | true            | Grantor State Program | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
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
    Then I softly see "Tab Config" button displayed under "Overview" tab
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active  | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active  | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName  | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                         |
      | Page Layout Action                  | Is Active  | false           | Grantor State Program | Name                      | Tab Config                                         |
      | Page Layout Action                  | Tab Config | a1NDV000002RGwF | Grantor State Program | Name                      | Tab Config                                         |
      | Page Tabs Config:Page Layout Action | Is Active  | true            | Grantor State Program | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see "Tab Config" button displayed under "Overview" tab

  @FW-544
  Scenario: TC - LWC - Layout - PM - To verify that, after modifying configuration modifies the action from the UI.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
      | Page Tabs Config      | Is Active   | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName   | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                         |
      | Page Layout Action                  | Is Active   | true            | Grantor State Program | Name                      | Tab Config                                         |
      | Page Layout Action                  | Tab Config  | a1NDV000002RGwF | Grantor State Program | Name                      | Tab Config                                         |
      | Page Layout Action                  | Action Name | New Tab Config  | Grantor State Program | Name                      | Tab Config                                         |
      | Page Tabs Config:Page Layout Action | Is Active   | true            | Grantor State Program | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
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
    Then I softly see "New Tab Config" button displayed under "Overview" tab

  @FW-545 @FW-546
  Scenario: TC - LWC - Layout - PM - To verify that, user should be able to modify or remove the configured action at any time.
  |TC - LWC - Layout - PM - To verify that, system should ensure that the configured action is dynamically updated and reflected immediately based on configuration changes.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active  | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active  | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName  | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                         |
      | Page Layout Action                  | Is Active  | true            | Grantor State Program | Name                      | Tab Config                                         |
      | Page Layout Action                  | Tab Config | a1NDV000002RGwF | Grantor State Program | Name                      | Tab Config                                         |
      | Page Tabs Config:Page Layout Action | Is Active  | true            | Grantor State Program | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I wait for "4" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Tab Config" button displayed under "Overview" tab

  @FW-547
  Scenario: TC - LWC - Layout - PM - To verify that, behavior and display of the configured action should remain consistent across both Layout views.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active  | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active  | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName  | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                         |
      | Page Layout Action                  | Is Active  | true            | Grantor State Program | Name                      | Tab Config                                         |
      | Page Layout Action                  | Tab Config | a1NDV000002RGwF | Grantor State Program | Name                      | Tab Config                                         |
      | Page Tabs Config:Page Layout Action | Is Active  | true            | Grantor State Program | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I wait for "4" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Tab Config" button displayed under "Overview" tab
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I wait for "4" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see "Tab Config" button displayed under "Overview" tab

  @FW-548
  Scenario: TC - LWC - Layout - PM - To verify that, action displaying under tab action section should not display under page layout menu section.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active  | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active  | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName  | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                         |
      | Page Layout Action                  | Is Active  | true            | Grantor State Program | Name                      | Tab Config                                         |
      | Page Layout Action                  | Tab Config | a1NDV000002RGwF | Grantor State Program | Name                      | Tab Config                                         |
      | Page Tabs Config:Page Layout Action | Is Active  | true            | Grantor State Program | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I wait for "4" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Tab Config" button displayed under "Overview" tab
    When I navigate to "Setup" sub tab
    And I click on "menu" button inside page details in lwc
    Then I softly do not see "Tab Config" button is displayed

  @FW-549
  Scenario: TC - LWC - Layout - PM - To verify that, all action under tab sections should be properly aligned with layout
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active  | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active  | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName  | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                         |
      | Page Layout Action                  | Is Active  | true            | Grantor State Program | Name                      | Tab Config                                         |
      | Page Layout Action                  | Tab Config | a1NDV000002RGwF | Grantor State Program | Name                      | Tab Config                                         |
      | Page Tabs Config:Page Layout Action | Is Active  | true            | Grantor State Program | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I wait for "4" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Tab Config" button displayed under "Overview" tab
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

  @FW-550
  Scenario: TC - LWC - Layout - SPI - To verify that, in view mode user should configure which top-level action is shown at bottom
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active  | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config |                   | ApiGeneratedId:1 |
      #| Page Tabs Config      | Is Active  | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName  | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active  | true            | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config | a1NDV000002RH0H | Recipient ApplicationView | Name                      | Tab Config                 |
     # | Page Tabs Config:Page Layout Action | Is Active  | true            | Recipient ApplicationView | Name                      | {SavedValue:RecipientApplicationViewOverviewTab} |
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
    Then I softly see "Tab Config" button displayed under "Overview" tab
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active  | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config |                   | ApiGeneratedId:1 |
      #| Page Tabs Config      | Is Active  | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName  | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active  | false           | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config | a1NDV000002RH0H | Recipient ApplicationView | Name                      | Tab Config                 |
     # | Page Tabs Config:Page Layout Action | Is Active  | true            | Recipient ApplicationView | Name                      | {SavedValue:RecipientApplicationViewOverviewTab} |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I see "Submit For Approval" button is displayed

  @FW-552
  Scenario: TC - LWC - Layout - SPI - To verify that, after removing configuration removes the action from the UI.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active  | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config |                   | ApiGeneratedId:1 |
     # | Page Tabs Config      | Is Active  | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName  | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active  | true            | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config | a1NDV000002RH0H | Recipient ApplicationView | Name                      | Tab Config                 |
     # | Page Tabs Config:Page Layout Action | Is Active  | true            | Recipient ApplicationView | Name                      | {SavedValue:RecipientApplicationViewOverviewTab} |
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
    Then I softly see "Tab Config" button displayed under "Overview" tab
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active  | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config |                   | ApiGeneratedId:1 |
     # | Page Tabs Config      | Is Active  | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName  | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active  | false           | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config | a1NDV000002RH0H | Recipient ApplicationView | Name                      | Tab Config                 |
     # | Page Tabs Config:Page Layout Action | Is Active  | true            | Recipient ApplicationView | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see "Tab Config" button displayed under "Overview" tab

  @FW-553 @FW-554 @FW-555
  Scenario: TC - LWC - Layout - SPI - To verify that, after modifying configuration modifies the action from the UI.
  |TC - LWC - Layout - SPI - To verify that, user should be able to modify or remove the configured action at any time.|
  |TC - LWC - Layout - SPI - To verify that, system should ensure that the configured action is dynamically updated and reflected immediately based on configuration changes.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
     # | Page Tabs Config      | Is Active   | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true            | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | a1NDV000002RH0H | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | New Tab Config  | Recipient ApplicationView | Name                      | Tab Config                 |
     # | Page Tabs Config:Page Layout Action | Is Active   | true            | Recipient ApplicationView | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
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
    Then I softly see "New Tab Config" button displayed under "Overview" tab

  @FW-556
  Scenario: TC - LWC - Layout - SPI - To verify that, behavior and display of the configured action should remain consistent across both Layout views.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
     # | Page Tabs Config      | Is Active   | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true            | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | a1NDV000002RH0H | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config      | Recipient ApplicationView | Name                      | Tab Config                 |
     # | Page Tabs Config:Page Layout Action | Is Active   | true            | Recipient ApplicationView | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
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
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see "Tab Config" button displayed under "Overview" tab
    And I navigate to "Applications" tab
    When I perform quick search for "{SavedValue:APPEGMSID}" in "{applicationIntake:recipientApplications}" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside table
    When I navigate to "Overview" sub tab
    Then I softly see "Tab Config" button displayed under "Overview" tab

  @FW-557
  Scenario: TC - LWC - Layout - SPI - To verify that, action displaying under tab action section should not display under page layout menu section.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
     # | Page Tabs Config      | Is Active   | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true            | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | a1NDV000002RH0H | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config      | Recipient ApplicationView | Name                      | Tab Config                 |
     # | Page Tabs Config:Page Layout Action | Is Active   | true            | Recipient ApplicationView | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
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
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see "Tab Config" button displayed under "Overview" tab
    When I navigate to "Budget" sub tab
    And I click on "menu" button inside page details in lwc
    Then I softly do not see "Tab Config" button is displayed

  @FW-558
  Scenario: TC - LWC - Layout - SPI - To verify that, all action under tab sections should be properly aligned with layout, form.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
     # | Page Tabs Config      | Is Active   | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true            | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | a1NDV000002RH0H | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config      | Recipient ApplicationView | Name                      | Tab Config                 |
     # | Page Tabs Config:Page Layout Action | Is Active   | true            | Recipient ApplicationView | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
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
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see "Tab Config" button displayed under "Overview" tab
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

  @FW-523
  Scenario: TC - LWC - Layout - SPI - To verify that configured top-level actions should displayed in tab footer in view mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
     # | Page Tabs Config      | Is Active   | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true          | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  |               | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config    | Recipient ApplicationView | Name                      | Tab Config                 |
     # | Page Tabs Config:Page Layout Action | Is Active   | true            | Recipient ApplicationView | Name                      | {SavedValue:ProgramGrantorStateProgramOverviewTab} |
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
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see "Tab Config" button displayed under "Overview" tab

  @FW-559
  Scenario: TC - LWC - Forms - PM - To verify that, in view mode user should configure which top-level action is shown at bottom
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true                                  | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | {SavedValue:PAFDetailsTabUniqueValue} | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config                            | Program Specific Application form | Name                      | Tab Config                 |
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
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:appAllTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:appAllTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds


  @FW-494
  Scenario: TC - LWC - Forms - PM - To verify that, configured top-level actions should displayed in tab footer in view mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true                                  | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | {SavedValue:PAFDetailsTabUniqueValue} | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config                            | Program Specific Application form | Name                      | Tab Config                 |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Submitted"
    And I click on "View" action for first record of table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly see "Tab Config" button displayed under "Details" tab

  @FW-535 @FW-523
  Scenario: TC - LWC - Layout - SPI - To verify that, tab footer action click behavior should work properly in view mode
  TC - LWC - Layout - SPI - To verify that configured top-level actions should displayed in tab footer in view mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true                                           | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | {SavedValue:ApplicationOverviewTabUniqueValue} | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config                                     | Recipient ApplicationView | Name                      | Tab Config                 |
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
    Then I softly see "Tab Config" button displayed under "Overview" tab

  @FW-537
  Scenario: TC - LWC - Layout - SPI - To verify that, tab footer action click behavior should work properly in edit mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true                                           | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | {SavedValue:ApplicationOverviewTabUniqueValue} | Recipient ApplicationView | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config                                     | Recipient ApplicationView | Name                      | Tab Config                 |
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
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Tab Config" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"

  @FW-525
  Scenario: TC - LWC - Forms - SPI - To verify that, configured top-level actions should displayed in tab footer in view mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true                                  | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | {SavedValue:PAFDetailsTabUniqueValue} | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config                            | Program Specific Application form | Name                      | Tab Config                 |
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
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see "Tab Config" button displayed under "Details" tab
    And I click on "Tab Config" in the page details
    Then I softly see the following messages in the page details :
      | Form Validated Successfully. |

  @FW-568 @FW-573
  Scenario: TC - LWC - Forms - SPI - To verify that, in view mode user should configure which top-level action is shown at bottom
  |TC - LWC - Forms - SPI - To verify that, system should ensure that the configured action is dynamically updated and reflected immediately based on configuration changes.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true                                  | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | {SavedValue:PAFDetailsTabUniqueValue} | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config                            | Program Specific Application form | Name                      | Tab Config                 |
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
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see "Tab Config" button displayed under "Details" tab

  @FW-570 @FW-571 @FW-572
  Scenario: TC - LWC - Forms - SPI - To verify that, after removing configuration removes the action from the UI.
  |TC - LWC - Forms - SPI - To verify that, after modifying configuration modifies the action from the UI.|
  |TC - LWC - Forms - SPI - To verify that, user should be able to modify or remove the configured action at any time.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true          | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  |               | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config    | Program Specific Application form | Name                      | Tab Config                 |
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
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly do not see "Tab Config" button displayed under "Details" tab

  @FW-574
  Scenario: TC - LWC - Forms - SPI - To verify that, behavior and display of the configured action should remain consistent across both Form views.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true                                  | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | {SavedValue:PAFDetailsTabUniqueValue} | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config                            | Program Specific Application form | Name                      | Tab Config                 |
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
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see "Tab Config" button displayed under "Details" tab
    Then I softly see "Project Characteristics" page block displayed
    Then I softly see "Need for Project" page block displayed
    Then I softly see "Significance" page block displayed
    Then I softly see "Project Goals" page block displayed
    Then I softly see "Organization Capacity" page block displayed
    Then I softly see "Project Goals" page block displayed
    Then I softly see "Organization Capacity" page block displayed
    Then I softly see "1a. Describe the activities and/or services to be provided. (10 points)" as "Describe the activities and/or services to be provided" in page details
    Then I softly see "1b. Describe the methodologies that will be used to complete activities/provide services. (10 points)" as "Describe the methodologies that will be used to complete activities/provide services" in page details
    Then I softly see "1c. Describe how the project will be completed within the required 24-month timeline. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "2a. Describe the critical need that will be addressed including how other resources are not available to meet the need. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "2b. Describe the characteristics of population to be served. (10 points)" as "Describe how the project will be completed within the required 24-month timeline" in page details
    Then I softly see "3a. Explain the expected results of the proposed project and how it will result in the provision of a new service or the expansion of an existing service. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "4a. Identify the goals of the project and describe how these goals will be met. (5 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "4b. Describe how the project goals support the goals of Project H.E.A.T. (5 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "5a. Experience in successful implementation of Public Services Projects. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "5b. Describe your organization’s experience in successfully implementing projects of similar scope and of comparable complexity. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "5c. Describe your organization’s experience in providing services to low and moderate income residents, other high need populations. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details

  @FW-575
  Scenario: TC - LWC - Forms - SPI - To verify that, action displaying under tab action section should not display under form menu section.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true                                  | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | {SavedValue:PAFDetailsTabUniqueValue} | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config                            | Program Specific Application form | Name                      | Tab Config                 |
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
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see "Tab Config" button displayed under "Details" tab
    And I click on "menu" button inside page details in lwc
    Then I softly do not see "Tab Config" button is displayed

  @FW-561
  Scenario: TC - LWC - Forms - PM - To verify that, after removing configuration removes the action from the UI.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true          | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  |               | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config    | Program Specific Application form | Name                      | Tab Config                 |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Submitted"
    And I click on "View" action for first record of table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly do not see "Tab Config" button displayed under "Details" tab

  @FW-562
  Scenario: TC - LWC - Forms - PM - To verify that, after modifying configuration modifies the action from the UI.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true          | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  |               | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config    | Program Specific Application form | Name                      | Tab Config                 |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Submitted"
    And I click on "View" action for first record of table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly do not see "Tab Config" button displayed under "Details" tab
    Then I see "Validate" button is displayed
    Then I see "Edit" button is displayed
    Then I see "Back" button is displayed
    Then I see "Tab Config" button is displayed

  @FW-563
  Scenario: TC - LWC - Forms - PM - To verify that, user should be able to modify or remove the configured action at any time.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true                                  | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | {SavedValue:PAFDetailsTabUniqueValue} | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config                            | Program Specific Application form | Name                      | Tab Config                 |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Submitted"
    And I click on "View" action for first record of table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly see "Tab Config" button displayed under "Details" tab
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true          | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  |               | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config    | Program Specific Application form | Name                      | Tab Config                 |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Tab Config" button displayed under "Details" tab

  @FW-564
  Scenario: TC - LWC - Forms - PM - To verify that, system should ensure that the configured action is dynamically updated and reflected immediately based on configuration changes.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true                                  | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | {SavedValue:PAFDetailsTabUniqueValue} | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config                            | Program Specific Application form | Name                      | Tab Config                 |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Submitted"
    And I click on "View" action for first record of table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly see "Tab Config" button displayed under "Details" tab
    Then I see "Validate" button is displayed
    Then I see "Edit" button is displayed
    Then I see "Back" button is displayed
    Then I do not see "Tab Config" button is displayed

  @FW-565
  Scenario:TC - LWC - Forms - PM - To verify that, behavior and display of the configured action should remain consistent across both Form views.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true                                  | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | {SavedValue:PAFDetailsTabUniqueValue} | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config                            | Program Specific Application form | Name                      | Tab Config                 |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Submitted"
    And I click on "View" action for first record of table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly see "Tab Config" button displayed under "Details" tab
    Then I softly see "Project Characteristics" page block displayed
    Then I softly see "Need for Project" page block displayed
    Then I softly see "Significance" page block displayed
    Then I softly see "Project Goals" page block displayed
    Then I softly see "Organization Capacity" page block displayed
    Then I softly see "Project Goals" page block displayed
    Then I softly see "Organization Capacity" page block displayed
    Then I softly see "1a. Describe the activities and/or services to be provided. (10 points)" as "Describe the activities and/or services to be provided" in page details
    Then I softly see "1b. Describe the methodologies that will be used to complete activities/provide services. (10 points)" as "Describe the methodologies that will be used to complete activities/provide services" in page details
    Then I softly see "1c. Describe how the project will be completed within the required 24-month timeline. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "2a. Describe the critical need that will be addressed including how other resources are not available to meet the need. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "2b. Describe the characteristics of population to be served. (10 points)" as "Describe how the project will be completed within the required 24-month timeline" in page details
    Then I softly see "3a. Explain the expected results of the proposed project and how it will result in the provision of a new service or the expansion of an existing service. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "4a. Identify the goals of the project and describe how these goals will be met. (5 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "4b. Describe how the project goals support the goals of Project H.E.A.T. (5 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "5a. Experience in successful implementation of Public Services Projects. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "5b. Describe your organization’s experience in successfully implementing projects of similar scope and of comparable complexity. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "5c. Describe your organization’s experience in providing services to low and moderate income residents, other high need populations. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details

  @FW-565
  Scenario: TC - LWC - Forms - PM - To verify that, action displaying under tab action section should not display under form menu section.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Tab Config  |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Action Name | Tab Config        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true                                  | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Tab Config  | {SavedValue:PAFDetailsTabUniqueValue} | Program Specific Application form | Name                      | Tab Config                 |
      | Page Layout Action    | Action Name | Tab Config                            | Program Specific Application form | Name                      | Tab Config                 |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Submitted"
    And I click on "View" action for first record of table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly see "Tab Config" button displayed under "Details" tab
    And I click on "menu" button inside page details in lwc
    Then I softly do not see "Tab Config" button is displayed

  @FW-632
  Scenario: TC - LWC - Layout/Forms/Modal - Config - To verify that, after selecting Both under "Display Area" config of action, that action should display under header and menu sections
    Given I have "default" configuration as below:
      | configurationCategory | fieldName    | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active    | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Display Area | Page Header       | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName    | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active    | true          | Grantor State Program | Name                      | Tab Config                 |
      | Page Layout Action    | Display Area | Menu          | Grantor State Program | Name                      | Tab Config                 |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I wait for "4" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on "menu" button inside page details in lwc
    And I pause execution for "2" seconds
    Then I softly see "Tab Config" button is displayed

  @FW-631
  Scenario: TC - LWC - Layout/Forms/Modal - Config - To verify that, after selecting Tab under "Display Area" config of action, that action should display under tab footer section
    Given I have "default" configuration as below:
      | configurationCategory | fieldName    | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active    | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Display Area | Page Header       | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName    | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active    | true          | Grantor State Program | Name                      | Tab Config                 |
      | Page Layout Action    | Display Area | Page Header   | Grantor State Program | Name                      | Tab Config                 |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I wait for "4" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "2" seconds
    Then I softly see "Tab Config" button is displayed

