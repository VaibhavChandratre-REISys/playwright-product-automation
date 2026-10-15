@FW-433 @US-FW-23313 @US-551604 @GovSBIR-RollUp
Feature:  Scenarios
Business Need: To ensure that, GOVSBIR – Support for filter clause on the ROLL UP field in SUM and COUNT

  @FW-23314
  Scenario: LWC : Layout : PM : To verify that COUNT & SUM are updated in Rollup fields as per Aggregate Field API Name specified in Custom Metadata.
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
    And I save the field labeled "EGMS ID" as "PEGMSID"
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
      | {SavedValue:PO Username} | Step 1  |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see "COUNT OF ANNOUNCEMENT" as "" in page details
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click on cross icon for field "Program__c"
    And I enter value "{SavedValue:PEGMSID}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I enter value "2" into field "SUM__c"
    And I click on "Save" in the page details
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see "COUNT OF ANNOUNCEMENT" as "1.00" in page details

  @FW-23314_1
  Scenario: LWC : Layout : PM : To verify that COUNT & SUM are updated in Rollup fields as per Aggregate Field API Name specified in Custom Metadata.
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
    And I save the field labeled "EGMS ID" as "PEGMSID"
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
      | {SavedValue:PO Username} | Step 1  |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see "SUM OF ANNOUNCEMENT" as "" in page details
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click on cross icon for field "Program__c"
    And I enter value "{SavedValue:PEGMSID}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I enter value "2" into field "SUM__c"
    And I click on "Save" in the page details
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see "SUM OF ANNOUNCEMENT" as "2.00" in page details

  @FW-23315
  Scenario: LWC : Layout : PM : To Verify that COUNT and SUM are updated in Rollup fields when no Aggregate Field API Name is present in Custom Metadata.
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
    And I save the field labeled "EGMS ID" as "PEGMSID"
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
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see "SUM OF ANNOUNCEMENT" as "" in page details
    Then I softly see "COUNT OF ANNOUNCEMENT" as "" in page details
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click on cross icon for field "Program__c"
    And I enter value "{SavedValue:PEGMSID}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I enter value "2" into field "SUM__c"
    And I click on "Save" in the page details
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see "COUNT OF ANNOUNCEMENT" as "1.00" in page details
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    When I perform quick search for "{SavedValue:ANNEGMSID}" in "---program:-:allAnnouncementTableId---" panel
    Then I softly can see row level action button "Delete" against "{SavedValue:ANNEGMSID}" in flex table with id "---program:-:allAnnouncementTableId---"
    And I click on "Delete" icon for "{SavedValue:ANNEGMSID}" inside flex table with id "---program:-:allAnnouncementTableId---" without waiting for record
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see "COUNT OF ANNOUNCEMENT" as "0.00" in page details

  @FW-23315_1
  Scenario: LWC : Layout : PM : To Verify that COUNT and SUM are updated in Rollup fields when no Aggregate Field API Name is present in Custom Metadata.
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
    And I save the field labeled "EGMS ID" as "PEGMSID"
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
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see "SUM OF ANNOUNCEMENT" as "" in page details
    Then I softly see "COUNT OF ANNOUNCEMENT" as "" in page details
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click on cross icon for field "Program__c"
    And I enter value "{SavedValue:PEGMSID}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I enter value "2" into field "SUM__c"
    And I click on "Save" in the page details
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see "SUM OF ANNOUNCEMENT" as "2.00" in page details
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    When I perform quick search for "{SavedValue:ANNEGMSID}" in "---program:-:allAnnouncementTableId---" panel
    Then I softly can see row level action button "Delete" against "{SavedValue:ANNEGMSID}" in flex table with id "---program:-:allAnnouncementTableId---"
    And I click on "Delete" icon for "{SavedValue:ANNEGMSID}" inside flex table with id "---program:-:allAnnouncementTableId---" without waiting for record
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see "SUM OF ANNOUNCEMENT" as "1.00" in page details

  @FW-23316
  Scenario:  LWC : Layout : SPI : To verify that COUNT & SUM are updated in Rollup fields as per Aggregate Field API Name specified in Custom Metadata.
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardFromFDM:-:RecipientGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardFromFDM:-:RecipientSubAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentId"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    Then I see table id "---amendment:-:RecipientKeyPersonalAssociateTableId---" flex table render in modal view

  @FW-23324
  Scenario: LWC : Layout : PM : To verify that COUNT & SUM are updated in Rollup fields as per Aggregate Filter Criteria specified in Custom Metadata.(CHECKBOX)
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
    And I save the field labeled "EGMS ID" as "PEGMSID"
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
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see "SUM OF ANNOUNCEMENT" as "" in page details
    Then I softly see "COUNT OF ANNOUNCEMENT" as "" in page details
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click on cross icon for field "Program__c"
    And I enter value "{SavedValue:PEGMSID}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I enter value "2" into field "SUM__c"
    And I click on "Save" in the page details
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see "SUM OF ANNOUNCEMENT" as "2.00" in page details
    Then I softly see "COUNT OF ANNOUNCEMENT" as "1.00" in page details
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    Then I softly see "COUNT OF ANNOUNCEMENT" as "1.00" in page details

  @FW-23326
  Scenario: LWC : Layout : SPI : To verify that COUNT & SUM are updated in Rollup fields as per Aggregate Filter Criteria specified in Custom Metadata. (CHECKBOX)
    Given I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardFromFDM:-:RecipientGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardFromFDM:-:RecipientSubAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentId"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I enter value "Test Announcement" into field "AnnouncementName__c"
    And I click on "Save" in the page details
    Then I softly see "Count of SPI" as "2.000000" in page details

  @FW-23326_1
  Scenario: LWC : Layout : SPI : To verify that COUNT & SUM are updated in Rollup fields as per Aggregate Filter Criteria specified in Custom Metadata. (CHECKBOX)
    Given I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardFromFDM:-:RecipientGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardFromFDM:-:RecipientSubAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentId"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I enter value "Test Announcement" into field "AnnouncementName__c"
    And I click on "Save" in the page details
    Then I softly see "SUM OF SPI" as "20,011.111100" in page details

  @FW-23326_2
  Scenario: LWC : Layout : SPI : To verify that COUNT & SUM are updated in Rollup fields as per Aggregate Filter Criteria specified in Custom Metadata. (CHECKBOX)
    Given I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardFromFDM:-:RecipientGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardFromFDM:-:RecipientSubAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentId"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I enter value "Test Announcement" into field "AnnouncementName__c"
    And I click on "Save" in the page details
    Then I softly see "SUM OF SPI" as "20,011.111100" in page details

