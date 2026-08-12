@organizationalDeskReviewWB @grantor-regression @grantor-parallel-regression @siteVisit @regression @siteAndDeskReview
Feature: Validate all scenarios in Organizational Desk Review Without Background

  @235444 @ValidateDeskReviewFOusercanabletoreassigndeskreviewownershipfromFOtootherFOuserInProgressstateofdeskreview @sprint-14-US-234219  @reassignment @FieldHistoryExclude
  Scenario: Validate Desk Review FO user can able to reassign desk review ownership from FO to other FO user 'In Progress' state of desk review
    Given I login to "As a Grantor" app as "FO" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Subrecipient Org" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "Automation Permanent Subrecipient Org" inside table
    And I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I perform quick search for "{SavedValue:SPI1 Username}" in "---orgLevelDeskReview:-:associateContactsId---" panel
    When I click "Associate" after selection of "{SavedValue:SPI1 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I refresh the page
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation FO" into field "input-1"
    And I select value "Automation FO1" into field "input-2"
    And I select module "Site Visit/Desk Review" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I softly see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I softly see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Subrecipient Org" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "Automation Permanent Subrecipient Org" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
    Then I softly can see top right button "Submit for Approval" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FO1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---deskreview:-:approverDeskReviewTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewFilesTableId---"
    Then I can see top right button "New" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewNotesTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation FO1" for title "New Value" inside field history table
    Then I softly see value "Automation FO" for title "Original Value" inside field history table

  @236049 @ValidateDeskReviewPOusercanabletochangeownershipinsenttosubrecipientstateofdeskreview @sprint-14-US-234219  @reassignment @FieldHistoryExclude
  Scenario: Validate Desk Review PO user can able to change ownership in 'sent to subrecipient' state of desk review
    Given I login to "As a Grantor" app as "PO" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Subrecipient Org" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "Automation Permanent Subrecipient Org" inside table
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI1 Username}" by showing entries "All" in flex table with id "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I refresh the page
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:PO Username} | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    And I pause execution for "3" seconds
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "input-1"
    And I select value "Automation PO1" into field "input-2"
    And I select module "Site Visit/Desk Review" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I softly see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I softly see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Subrecipient Org" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "Automation Permanent Subrecipient Org" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation PO1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation PO1" for title "New Value" inside field history table
    Then I softly see value "Automation PO" for title "Original Value" inside field history table

  @236065 @ValidateDeskReviewFOusercanabletochangetheownershipSubmittoGrantorstateofdeskreview @sprint-14-US-234219  @reassignment @FieldHistoryExclude
  Scenario: Validate Desk Review FO user can able to change the ownership in 'Submit to Grantor'state of desk review
    Given I login to "As a Grantor" app as "FO" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Subrecipient Org" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "Automation Permanent Subrecipient Org" inside table
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI1 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I refresh the page
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:FO Username} | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    When I collapse nested table containing column value "Automation Observation"
    And I refresh the page
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    When I collapse nested table containing column value "Automation Concern"
    And I refresh the page
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    And I collapse nested table containing column value "Automation Finding"
    And I refresh the page
    When I navigate to "Reports and Outcomes" sub tab
    When I click on "Submit to Grantor" in the page details
    #Bug428393
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation FO" into field "input-1"
    And I select value "Automation FO1" into field "input-2"
    And I select module "Site Visit/Desk Review" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I softly see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I softly see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Subrecipient Org" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "Automation Permanent Subrecipient Org" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly can see top right button "Accept And Close" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FO1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation FO1" for title "New Value" inside field history table
    Then I softly see value "Automation FO" for title "Original Value" inside field history table

  @236178 @ValidateDeskReviewEXEusercanabletodobusinessflowafterreassignownershipofdeskreviewfromEXEtootherEXEuserinINprogressstateofdeskreview @sprint-14-US-234219  @reassignment @FieldHistoryExclude
  Scenario: Validate Desk Review EXE user can able to do business flow after reassign ownership of desk review from EXE to other EXE user in 'IN progress' state of desk review
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Subrecipient Org" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "Automation Permanent Subrecipient Org" inside table
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI1 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I refresh the page
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Site Visit/Desk Review" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I softly see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I softly see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Subrecipient Org" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "Automation Permanent Subrecipient Org" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
    Then I softly can see top right button "Submit for Approval" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation EXE1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---deskreview:-:approverDeskReviewTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewFilesTableId---"
    Then I can see top right button "New" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewNotesTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation EXE1" for title "New Value" inside field history table
    Then I softly see value "Automation EXE" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name            | Desk Review |
      | Automation EXE1 | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    When I collapse nested table containing column value "Automation Observation"
    And I refresh the page
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    When I collapse nested table containing column value "Automation Concern"
    And I refresh the page
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    And I collapse nested table containing column value "Automation Finding"
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "EGMS ID" inside table "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Start" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "dark blue"

  @236027 @ValidateDeskReviewFDusercanabletochangeownershipinSubmittedforApprovalstateofdeskreview @sprint-14-US-234219  @reassignment @FieldHistoryExclude
  Scenario: Validate Desk Review FD user can able to change ownership in 'Submitted for Approval' state of desk review
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Subrecipient Org" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "Automation Permanent Subrecipient Org" inside table
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI1 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I refresh the page
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I pause execution for "3" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:FD Username} | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation FD" into field "input-1"
    And I select value "Automation FD1" into field "input-2"
    And I select module "Site Visit/Desk Review" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I softly see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I softly see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Subrecipient Org" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "Automation Permanent Subrecipient Org" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FD1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation FD1" for title "New Value" inside field history table
    Then I softly see value "Automation FD" for title "Original Value" inside field history table