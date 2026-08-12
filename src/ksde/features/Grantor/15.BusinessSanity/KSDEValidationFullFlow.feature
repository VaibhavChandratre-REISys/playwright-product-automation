@KSDEValidationFullFlow
Feature: Validate KSDE Complete Flow

  @ViewAllPageBlockSection @ListViewFilterOFPtogram @ViewAllTabs @VerifyEmailSFA @VerifySupportDocument @progressBarUpdate
  @ValidateStatus
  Scenario: View Actions of all sections of all tabs of Program
  |List View Filter Of Program|
  |View of all tabs of Program|
  |Supporting Document checklist and add files and add notes on files tab|
  |Progress Bar Updation|
  |check status during flow|
  |Verify the Emails and Pending task of Submitted for approval actions of internal programs|
    When I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    Then I softly see "Internal Programs - Draft" page block displayed
    Then I see the following ordered headers in table with id "---program:-:programsTableId---" :
      | Actions | EGMS ID | Program Name | Type | Created By | Status |
    And I click toggle button to select "Internal Programs - Active"
    Then I softly see "Internal Programs - Active" page block displayed
    Then I see the following ordered headers in table with id "---program:-:programsTableId---" :
      | Actions | EGMS ID | Program Name | Type | Created By | Status |
    And I click toggle button to select "Internal Programs - Rejected"
    Then I softly see "Internal Programs - Rejected" page block displayed
    Then I see the following ordered headers in table with id "---program:-:programsTableId---" :
      | Actions | EGMS ID | Program Name | Type | Created By | Status |
    And I click toggle button to select "Internal Programs - All"
    Then I softly see "Internal Programs - All" page block displayed
    Then I see the following ordered headers in table with id "---program:-:programsTableId---" :
      | Actions | EGMS ID | Program Name | Type | Created By | Status |
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Created" as "Active"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ProgramID"
    Then I softly can see "Overview" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Information" page block displayed
    Then I softly see "Description" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Program Specific Settings" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly can see "Setup" sub tab at view detail page
    When I navigate to "Setup" sub tab
    Then I softly see "Business Forms" page block displayed
    Then I softly see "Supporting Documents Checklist" page block displayed
    When I click on parallel lines menu bar with data target value "Supporting Documents Checklist"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    Then I see the following rows under the following columns in table with id "---program:-:checklistTableId---" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    Then I softly can see row level action button "Edit" against "Automation test description" in flex table with id "---program:-:checklistTableId---"
    Then I softly can see row level action button "Upload Template" against "Automation test description" in flex table with id "---program:-:checklistTableId---"
    Then I softly can see row level action button "Delete" against "Automation test description" in flex table with id "---program:-:checklistTableId---"
    Then I softly see "Review Steps" page block displayed
    Then I softly see "Related Focus Areas" page block displayed
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly can see "Responsibilities" sub tab at view detail page
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly can see "Files" sub tab at view detail page
    When I navigate to "Files" sub tab
    Then I softly see "Program Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see "History" sub tab at view detail page
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    Then I softly can see top right button "Edit" in page detail
    When I navigate to "Overview" sub tab
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "{SavedValue:FocusAreaTitle_2}" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "{SavedValue:StrategicObjective}" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "{SavedValue:KPITitle}" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    And I checkout to yopmail with mailid "{SavedValue:PM_EmailID}"
    And I pause execution for "180" seconds
    And I click on mail with subject "Sandbox: Notification: Request to Approve {SavedValue:ProgramID}"
    Then I see the mail subject is as follows :
    """
    Sandbox: Notification: Request to Approve {SavedValue:ProgramID}
    """
    And I am on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    Then I see status in Progress-bar is "Active" and is "dark blue"

  @ProgramActivation @PlanningSanity @PreAwardSanity @EditActionProgram
  Scenario: Validate the activation of Internal Program and the status changes to Active
  |Edit action of page layout and all sections |
  |Revise Program and complete flow of program|
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
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "{SavedValue:FocusAreaTitle_2}" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "{SavedValue:StrategicObjective}" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "{SavedValue:KPITitle}" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 2  |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I upload attachment "Attachment.pdf" of type "Other Artifacts" from computer
    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send back |
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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
    Then I see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Amend Program" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see field "Status" as "Being Amended"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted For Approval"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"


  @ProgramApprover
  Scenario: Validate task reassignment in Internal Program approval flow
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
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "{SavedValue:FocusAreaTitle_2}" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "{SavedValue:StrategicObjective}" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "{SavedValue:KPITitle}" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I upload attachment "Attachment.pdf" of type "Other Artifacts" from computer
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description            | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "ProgramID"
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "3" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I wait for "3" seconds
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I can see top right button "Submit For Approval" in page detail
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "ProgramRolesAndResponsibilitiesInternalProg"


  @FundingSourceActivation @DownloadAsPdfFA @ProgressBarUpdation
  Scenario: Validate the activation of Funding Source HappyPath and the status is Active
  |Download as PDF of all sections/Page Layout by clicking Hamburger Menu option  of all submodules of Funding account and source.|
  |Progress Bar Updation|
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    And I wait for "3" seconds
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And  I wait for "4" seconds
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition_KSDE" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    Then I softly see field "Status" as "Active"
    And I navigate to "Related Log" sub tab
    When I click on parallel lines menu bar with data target value "Related Announcements"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on parallel lines menu bar with data target value "Related Subawards (Grantor)"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "Messages" sub tab
    When I click on parallel lines menu bar with data target value "Messages"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown

    #Announcement


  @ActionsofAnnouncement @TabsOfAnnouncement @ProgressBarUpdationAnn
  Scenario:Verify that internal user can add Pre-Encumbrance value in funding accounts
  |View of all tabs of Announcement|
  |View Actions of all sections of  all tabs of Announcement|
  |Progress Bar Updation|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see field "Eligible Applicant Types" as "School District"
    Then I softly see that "EligibleApplicantTypes__c" rendered in view mode only
    When I navigate to "Financials" sub tab
    Then I softly see value "Only First Budget Period" for the edit mode field "BudgetingPeriod__c"
    And I enter "Edition_KSDE" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Setup" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Information" page block displayed
    Then I softly see "Federal/NGO Program" page block displayed
    Then I softly see "Description" page block displayed
    Then I softly see "Eligibility Details" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Key Dates" page block displayed
    Then I softly see "Q&A Information" page block displayed
    Then I softly see "Focus Areas" page block displayed
    And I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    Then I softly see "Business Forms" page block displayed
    Then I softly see "Supporting Documents Checklist" page block displayed
    Then I softly see "Review Steps" page block displayed
    Then I softly see "Goals and Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    When I navigate to "Financials" sub tab
    Then I softly see "Budget Categories" page block displayed
    Then I softly see "Financial Details" page block displayed
    Then I softly see "Funding Accounts" page block displayed
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    And I select value inside table "---announcement:-:announcementBudgetCategory---" is "All"
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 2000            |
    Then I softly see value "$2,000.00" for title "Pre-Encumbrance" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Source12" in "---announcement:-:fundingAccTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    Then I softly see field "Deficit Amount" as "$8,000.00"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---announcement:-:annoucementContactTableId---"
    And I click modal button "Close"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Files" sub tab
    Then I softly see "Announcement Files" page block displayed
    Then I softly see "Notes" page block displayed
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see the following messages in the page details contains:
      | Financial Tab - The Announcement has a funding deficit. Either associate a funding account or enter a justification for the deficit. |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    Then I softly see field "Status" as "Published"

  @ReviseAnnouncemennt
  Scenario:Revise Announcemennt and Republish
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    And I enter "Edition_KSDE" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I select value inside table "---announcement:-:announcementBudgetCategory---" is "All"
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 2000            |
    And I wait for "5" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---announcement:-:annoucementContactTableId---"
    And I click modal button "Close"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Revise" in the page details
    Then I softly see field "Status" as "Under Revision"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit For Approval" in page detail

    #application
  @QualifyingApplication @AllStatusApplication @AllForms @SubmitButton
  Scenario: Verify that Subrecipient can validate Standard Assurance Form by adding all mandatory fields
  |Qualifying to opportunity and creating application|
  |On Opportunity Tab -> Left navigation -> List View Fiter Opportunity Visibility ->Not Yet Qualified / Qualified / Converted to award|
  |All forms|
  |Submit to grantor button|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    When I am on "SUBPORTAL" portal
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
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly can see "Proposal" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name              |
      | Special Populations        |
      | Supplies                   |
      | Software and Subscriptions |
      | Computing Devices          |
      | Equipment                  |
      | Professional Development   |
      | Contracted Services        |
      | Salaries                   |
      | Honorarium or Stipend      |
      | Travel Expenses            |
      | Advisory Committee         |
      | CTSO Advisor Expenses      |
      | Substitutes                |
      | Externships                |
      | Institutional Memberships  |
      | Administrative Costs       |
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name   | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Health Science | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name   | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Health Science | $1,000.00  | $1,000.00                    | $0.00                      | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $1,000.00        | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "Edit" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Supplies    | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $1,000.00                    |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | Supplies    | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $1,000.00                    | $0.00                      | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    #KSDE-675
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Reserve Grant Application" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see "Announcement Information" page block displayed
    Then I softly see "Description of Activity (What will you do?)" page block displayed
    Then I softly see "Expected Result / Evaluation of the Activity (What is the expected outcome?)" page block displayed
    Then I softly see "Budget Narrative" page block displayed
    Then I softly see "Contractual Provisions and Local Assurances" page block displayed
    Then I softly see "Contractual Provisions and Local Assurances" page block displayed
    Then I softly see "Certification" page block displayed
    And I select below checkbox options for field "KSDE_PathwayPicklist__c"
      | Agricultural Technology & Mechanical Systems          |
      | Animal Science, Health & Related Industries           |
      | Diversified Agricultural Science                      |
      | Food Products & Processing Systems                    |
      | Plant Science & Industry Operations                   |
      | Natural Resources & Environmental Sustainability      |
      | Energy                                                |
      | Business Management & Entrepreneurship                |
      | Business Finance                                      |
      | Marketing                                             |
      | Restaurant & Event Management                         |
      | Travel & Tourism                                      |
      | Teaching/Training                                     |
      | Early Childhood Development & Services                |
      | Government & Public Administration                    |
      | Corrections, Security, Law & Law Enforcement Services |
      | Emergency & Fire Management Services                  |
      | Information Support & Services                        |
      | Media Design & Communications                         |
      | Networking & Telecommunications                       |
      | Programming & Software Development                    |
      | Construction & Design                                 |
      | Manufacturing                                         |
      | Automation Engineering                                |
      | Aviation Production                                   |
      | Engineering & Applied Mathematics                     |
      | Aviation Maintenance & Operations                     |
      | Vehicle Maintenance & Repair                          |
      | Family, Community & Consumer Services                 |
      | Biotechnology                                         |
      | Health Science                                        |
    When I enter "KSDE_ApplicationForm-1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Upload Files" in the page details
    And I wait for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Back" in the page details
    Then I softly can see top right button "Submit Application" in page detail
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Budget" sub tab
    And I save the field labeled "Budgeted Amount" as "BudgetedAmount"
    Then I softly see field "Budgeted Amount" as "{SavedValue:BudgetedAmount}"
    Then I softly see field "Initial Budgeted Amount" as "{SavedValue:BudgetedAmount}"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:announcementListTableId---" panel
    And I wait for "2" seconds
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    Then I see status in Progress-bar is "Published" and is "dark blue"
