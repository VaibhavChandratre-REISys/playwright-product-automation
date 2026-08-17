@AlaskaRegression @AlaskaPlanning @AlaskaProgram
Feature: Internal Programs

  @Sprint-6-US-393871 @401328 @401327 @403838 @403841 @403837 @403839
  Scenario: Internal Programs: Grantor - Setup Shared Revenue Program
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    #401328 #401327
    Then I softly see fields "IsthisASharedRevenueProgram__c" is visible
    #403838 #403837
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition1" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    #403841
    And I check the checkbox in modal with field value "Is this a Shared Revenue Program?"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
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
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
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
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    #403839
    When I navigate to "Overview" sub tab
    Then I softly see "Program Specific Settings" page block displayed
    Then I softly see fields "IsthisASharedRevenueProgram__c" is visible
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Active" and is "dark blue"

  @Sprint-8-US-437678 @439833 @439719 @439808 @439732 @439722 @439725 @439729
  Scenario: Program: Add "Program Type" field for all programs
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation_NoProgramType" values from "Program_Field_Values.xlsx"
    #439719
    Then I softly see "Program Specific Settings" page block displayed
    #439722
    Then I softly see fields "DcraProgramType_DCRA__c" is visible
    And I click modal button "Save and Continue"
    #439833
    Then I see the following messages in the page details :
      | Program Type is required to save. |
    And I click modal button "Close"
    #439808
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    #439725
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    Then I softly see "Program Specific Settings" page block displayed
    #439732
    Then I softly see fields "DcraProgramType_DCRA__c" is visible
    Then I softly see fields "IsGoalsRequired__c" is visible
    Then I softly see fields "KPIsRequired__c" is visible
    #439729
    Then I softly see field "Program Type" as "NFR"

  @Sprint-6-US-412852 @421760 @421838 @421839 @421742 @421825 @421827 @421696 @421824 @421840 @421829 @421820 @422270 @421821
  Scenario: Internal Program: Add a GA and DCCED field for shared revenue programs
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see fields "IsthisASharedRevenueProgram__c" is visible
    #421821
    Then I see only the following ordered options in dropdown field "DcraProgramType_DCRA__c" :
      | --None-- | CAP | ACCIMP | ACMP | AKSSF | ARDOR | ARPA | ARPA-LGLR | ARRA | BEAD | Capital Matching | CCIAP | CCP | CDBG | CDBG-CV | CDBG-DR | CEDS | CIAP | CNW | Community Mapping Project | Community Priorities | CPV | CRS | CSBG | CSHE | CSMI | DECO | ELEA | FDA | Fish Business | Fish Landing | FMA | IAID | Legislative | Mini-Grant | Multi-Use | NAFS | NFR | None | NPR-A | NTIADE | Opilio | Other | PILT | RSA | Safe | SCRF | Serve Alaska | SFT | Shelter | SPGM | SPRP | SRS | TAS | TFR | UCAP | UCOMM |
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    Then I softly see "Program Specific Settings" page block displayed
    #421760
    Then I softly see fields "DCCED_DCRA__c" is visible
    #421838
    And I click on lookup field for "DCCED_DCRA__c"
    #421839
    Then I softly see the text containing :
      | Simon Barlow    |
      | John Rambo      |
      | Patrick Smith   |
      | Sarah Johnson   |
      | Danielle Garcia |
      | Robert Williams |
      | Automation PM   |
      | Automation EXE  |
    #421742
    Then I softly see fields "GrantAdministrator__c" is visible
    #421825
    And I click on lookup field for "GrantAdministrator__c"
    #421827
    Then I softly see the text containing :
      | Simon Barlow    |
      | John Rambo      |
      | Patrick Smith   |
      | Sarah Johnson   |
      | Danielle Garcia |
      | Robert Williams |
      | Automation PM   |
      | Automation EXE  |
    #422270
    Then I softly cannot see the text containing :
      | Nathan Gill |
    When I navigate to "Overview" sub tab
    Then I softly see "Program Specific Settings" page block displayed
    #421696
    Then I softly see fields "IsthisASharedRevenueProgram__c" is visible
    Then I softly see fields "DcraProgramType_DCRA__c" is visible
    #421820
    Then I softly see field "Program Type" as "NFR"
    #421824
    Then I softly see "Information" page block displayed
    Then I softly see fields "Type__c" is visible
    #421840
    When I enter "Edition2" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I see the following messages in the page details :
      | Overview Tab - Provide the Program Specific Settings DCCED field. |
    And I wait for "3" seconds
    Then I refresh the page
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter value as "Automation PM" into "DCCED" on old form
    And I wait for "2" seconds
    When I clear the value from field "GrantAdministrator__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    #421829
    Then I see the following messages in the page details :
      | Overview Tab - Provide the Program Specific Settings Grant Administrator field. |