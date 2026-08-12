@GranteeCloseout
Feature: Validate all scenarios for closeout

  @456081 @ValidateCloseoutAdminPOFDFOListViewFunctionalitythelistviewfunctionalityverifythesession @GRegression2 @P4_Grantee @ADMIN_Grantee
  Scenario: Validate Closeout Admin PO FD FO List View Functionality the list view functionality & verify the session
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Closeout" tab
    And I wait for "2" seconds
    Then I softly see default toggle as "Project Period Closeout - My Records" for table "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Draft"
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - Draft" for table "---grantee_tableId:-:phaseCloseoutTableId---"

  @456081_1 @ValidateCloseoutAdminPOFDFOListViewFunctionalitythelistviewfunctionalityverifythesession @GRegression2 @P4_Grantee @PO_Grantee
  Scenario: Validate Closeout Admin PO FD FO List View Functionality the list view functionality & verify the session
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Closeout" tab
    And I wait for "2" seconds
    Then I softly see default toggle as "Project Period Closeout - My Records" for table "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Draft"
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - Draft" for table "---grantee_tableId:-:phaseCloseoutTableId---"

  @456081_2 @ValidateCloseoutAdminPOFDFOListViewFunctionalitythelistviewfunctionalityverifythesession @GRegression2 @P4_Grantee @FD_Grantee
  Scenario: Validate Closeout Admin PO FD FO List View Functionality the list view functionality & verify the session
    Given I login to "As a Grantee" app as "GRANTEE FD" user
    And I navigate to "Closeout" tab
    And I wait for "2" seconds
    Then I softly see default toggle as "Project Period Closeout - My Records" for table "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Draft"
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - Draft" for table "---grantee_tableId:-:phaseCloseoutTableId---"

  @456081_3 @ValidateCloseoutAdminPOFDFOListViewFunctionalitythelistviewfunctionalityverifythesession @GRegression2 @P4_Grantee @FO_Grantee
  Scenario: Validate Closeout Admin PO FD FO List View Functionality the list view functionality & verify the session
    Given I login to "As a Grantee" app as "GRANTEE FD" user
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - My Records" for table "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Draft"
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - Draft" for table "---grantee_tableId:-:phaseCloseoutTableId---"

  @484052 @ValidateFromAppGPCloseoutwithPOProfileIfCloseoutisinCreatedstatetheabletoseetheaccessofsection @PO_Grantee @P3_Grantee @GRegression2
  Scenario: Validate From App GP Closeout with PO Profile If Closeout is in Created state then able to see the access of section
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-Grantee PO user"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly can see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Override" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    And I navigate to "Files" sub tab
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Supporting Documents" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "View" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Override" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    And I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "View" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"

  @446143 @446138 @ValidateGPCloseoutwithPMProfileIfCloseoutisinApprovedstatethenabletoseetheaccessofsection @P2_Grantee @PM_Grantee @GRegression2
  Scenario: Validate GP Closeout with PM Profile ,If Closeout is in Approved state then able to see the access of section
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name       | Closeout |
      | Victor EXE | Step 1   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Override" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I navigate to "Overview" sub tab
    Then I softly see "Grant Overview" page block displayed
    Then I softly see "Closeout Request Details" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Open  Items" sub tab
    Then I softly see "Pending Amendment Requests" page block displayed
    Then I softly see "Pending Progress Reports" page block displayed
    Then I softly see "Pending Financial Reports" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    Then I softly can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly see "Closeout Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:closeoutNotesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Supporting Documents" from computer
    Then I softly see the following messages in the page details contains:
      | File Attachment.pdf Uploaded successfully. |
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "View" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I softly see status in Progress-bar is "Overridden" and is "dark blue"
    When I navigate to "Files" sub tab
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Funder Closeout Document" from computer
    Then I softly see the following messages in the page details contains:
      | File Attachment.pdf Uploaded successfully. |
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Closeout has been validated successfully. Please proceed. |
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PhasePendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PhasePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly see field "Status" as "Approved"
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit to Grantor" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:closeoutNotesTableId---" by clicking "Edit" :
      | Created By | Title               | Description      |
      | Sarah PM   | Notes Record Edited | Automation Notes |
    Then I softly see value "Notes Record Edited" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.23@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly see field "Status" as "Approved"
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly cannot see top right button "Submit to Grantor" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Edited" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Edited" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly see value "Notes Record Edited" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "govgrantsuat@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"

  @446125 @ValidateGPCloseoutwithEXEprofileifGrantisnotactivethenunabletoseenewbuttontocreatecloseout @GRegression1 @GranteeTBE
  Scenario: Validate GP Closeout with EXE  profile ,if Grant is not active then unable to see new button to create closeout
    And I "Submitted for Approval" standalone subaward "Automation Runtime award" with properties "ALL_SETTING_NO-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    When I login to "As a Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Draft"
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Submitted for Approval" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I softly see field "Status" as "Draft"
    Then I softly cannot see "Closeout" sub tab at view detail page

  @484027 @484035 @ValidateApplicationGPCloseoutwithEXEprofileifGrantisnotactivethenunabletoseenewbuttontocreatecloseout @P2_Grantee @PM_Grantee @GRegression2
  Scenario: Validate application GP Closeout with PM  profile ,if Grant is not active then unable to see new button to create closeout
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    Then I softly see field "Status" as "Draft"
    Then I softly cannot see "Closeout" sub tab at view detail page

  @449022 @ValidateGPCloseoutwithEXEProfileunabletoseebudgetperiodcloseout @P2_Grantee @EXE_Grantee @GRegression4
  Scenario Outline: Validate GP Closeout with EXE Profile unable to see budget period closeout
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Closeout" tab
    Then I do not see "Budget Period Closeouts" inside "Closeouts" is displayed
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "{grantee_testData:AutomationRecordforCloseout}" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "{grantee_testData:AutomationRecordforCloseout}" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly cannot see "Budget Period Closeouts" sub tab at view detail page
    Examples:
      | userType    |
      | GRANTEE EXE |

  @446148 @ValidateGPCloseoutwithPMProfileunabletoseebudgetperiodcloseout @P2_Grantee @PM_Grantee @GRegression1
  Scenario Outline: Validate GP Closeout with PM Profile unable to see budget period closeout
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Closeout" tab
    Then I do not see "Budget Period Closeouts" inside "Closeouts" is displayed
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "{grantee_testData:AutomationRecordforCloseout}" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "{grantee_testData:AutomationRecordforCloseout}" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly cannot see "Budget Period Closeouts" sub tab at view detail page
    Examples:
      | userType    |
      | GRANTEE PM  |

  @446128 @ValidateGPCloseoutWithEXEProfileOncecreatetheadhoccloseoutNewbuttonofcloseoutgetdisable @GRegression1 @GranteeTBE
  Scenario: Validate GP Closeout With EXE Profile Once create the adhoc closeout New button of closeout get disable
    And I "Created" standalone subaward "Automation Runtime award" with properties "ALL_SETTING_NO-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "As a Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I can see row level action button "View" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I can see row level action button "Edit" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"

  @449051 @GPCloseoutVerifyWithPOAuditorFOFDProfileAsanonownerCloseoutabletoseeonlyviewmode @GRegression3 @GranteeTBE
  Scenario Outline: GP Closeout - "Verify With PO /Auditor / FO /FD Profile,As a non owner Closeout  able to see only view mode."
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I can see row level action button "View" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    Then I softly cannot see top right button "Override" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Overview" sub tab
    Then I softly see "Grant Overview" page block displayed
    Then I softly see "Closeout Request Details" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Open  Items" sub tab
    Then I softly see "Pending Amendment Requests" page block displayed
    Then I softly see "Pending Progress Reports" page block displayed
    Then I softly see "Pending Financial Reports" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly see "Closeout Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:closeoutNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"

    Examples:
      | userType   |
      | GRANTEE PO |
      | GRANTEE FO |
      | GRANTEE FD |

  @449051_1 @GPCloseoutVerifyWithPOAuditorFOFDProfileAsanonownerCloseoutabletoseeonlyviewmode @GRegression3 @GranteeTBE
  Scenario: GP Closeout - "Verify With Auditor,As a non owner Closeout  able to see only view mode."
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I can see row level action button "View" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    Then I softly cannot see top right button "Override" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Overview" sub tab
    Then I softly see "Grant Overview" page block displayed
    Then I softly see "Closeout Request Details" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Open  Items" sub tab
    Then I softly see "Pending Amendment Requests" page block displayed
    Then I softly see "Pending Progress Reports" page block displayed
    Then I softly see "Pending Financial Reports" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly see "Closeout Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:closeoutNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly do not see top right button "Send Email" inside flex table "CommunicationHistory"

  @449974 @ValidateGPCloseoutwhileoverrideifthereisnoopenitemstillabletodooverrideandcontinuetheflow @GRegression1 @GranteeTBE
  Scenario: Validate GP Closeout while override if there is no open item still able to do override and continue the flow.
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name       | Closeout |
      | Victor EXE | Step 1   |
    When I navigate to "Open  Items" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingFinancialReport---"
    Then I softly can see top right button "Override" in page detail
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I clear the value from field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Override" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Justification for overriding open items to closure and proceed with the closeout. |
    And I click on "Edit" in the page details
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I softly see status in Progress-bar is "Overridden" and is "dark blue"
    When I navigate to "Open  Items" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingFinancialReport---"

  @446127 @ValidateGPCloseoutwithEXEProfileOnactivegrantabletoseeNewbuttontocreateadhoccloseout @GRegression1 @GranteeTBE
  Scenario: Validate GP Closeout with EXE Profile On active grant able to see New button to create adhoc closeout
    And I "Created" standalone subaward "Automation Runtime award" with properties "ALL_SETTING_NO-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "As a Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Active"
    When I navigate to "Closeout" sub tab
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Closeout Effective Date cannot be less than the Project Period Start Date. |
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I softly see "Collapse" button for header
    Then I see the header is "Closeout Request" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:closeoutID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Grant Number" as "GT1234"
    Then I softly see field "Closeout Type" as "Early Completion"
    Then I softly see "Resize" button for page
    Then I softly see "Collapse" button for page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:PhasePendingTask---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PhasePendingTask---"

  @484040 @ValidateAPPGPCloseoutwithPMProfileOnactivegrantabletoseeNewbuttontocreateadhoccloseout @P2_Grantee @PM_Grantee @GRegression2
  Scenario: Validate App GP Closeout with PM Profile On active grant able to see New button to create adhoc closeout
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Closeout Effective Date cannot be less than the Project Period Start Date. |
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I softly see "Collapse" button for header
    Then I see the header is "Closeout Request" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:closeoutID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Grant Number" as "GT1234"
    Then I softly see field "Closeout Type" as "Early Completion"
    Then I softly see "Resize" button for page
    Then I softly see "Collapse" button for page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:PhasePendingTask---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PhasePendingTask---"

  @484076 @ValidateFromAppGPCloseoutwhileoverrideifthereisnoopenitemstillabletodooverrideandcontinuetheflow @GRegression1 @GranteeTBE
  Scenario: Validate From App GP Closeout while override if there is no open item still able to do override and continue the flow
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name       | Closeout |
      | Victor EXE | Step 1   |
    When I navigate to "Open  Items" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingFinancialReport---"
    Then I softly can see top right button "Override" in page detail
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I clear the value from field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Override" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Justification for overriding open items to closure and proceed with the closeout. |
    And I click on "Edit" in the page details
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I softly see status in Progress-bar is "Overridden" and is "dark blue"
    When I navigate to "Open  Items" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingFinancialReport---"

  @484028 @484070 @ValidateFromAppGPCloseoutwithPMProfileunabletoseebudgetperiodcloseout
  Scenario: Validate From App GP Closeout with PM Profile unable to see budget period closeout
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    And I click on "Edit" in the page details
    And I enter "Grantee_Qualifiedleads_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I refresh the page
    And I wait for "3" seconds
    And I enter "Grantee_Opp_PreAppNo_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:opportunityExternalProgramTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:opportunityExternalProgramModalTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name       | Opportunity |
      | Victor EXE | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | The Funding Opportunity has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Add Line Item Details" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grantor" in page detail
    When I click on "Submit To Grantor" in the page details
    When I enter values into fields
      | Value | Field          |
      | 0     | SubmittedOn__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value           | Field                |
      | Awarded         | Decision__c          |
      | Automation Test | RejectionComments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Awarded"
    Then I can see top right button "Create Award" in page detail
    When I click on "Create Award" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I see the header is "Award" in the page details
    And I click on "Edit" in the page details
    When I enter "Grantee_AppToAward_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "12345" into field "GrantNumber__c"
    And I enter value "Project Grant" into field "GrantType__c"
    When I click on "Save" in the page details
    #484028
    Then I softly see field "Status" as "Draft"
    When I navigate to "Closeout" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly cannot see "Budget Period Closeouts" sub tab at view detail page
    And I navigate to "Closeout" tab
    Then I do not see "Budget Period Closeouts" inside "Closeouts" is displayed

  @484057 @ValidateFromAppGPCloseoutwithPMProfileIfCloseoutisinApprovedstatethenabletoseetheaccessofsection @P1_Grantee @PM_Grantee @GRegression1
  Scenario: Validate From AppGP Closeout with PM Profile If Closeout is in Approved state then able to see the access of section
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name       | Closeout |
      | Victor EXE | Step 1   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Override" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I navigate to "Overview" sub tab
    Then I softly see "Grant Overview" page block displayed
    Then I softly see "Closeout Request Details" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Open  Items" sub tab
    Then I softly see "Pending Amendment Requests" page block displayed
    Then I softly see "Pending Progress Reports" page block displayed
    Then I softly see "Pending Financial Reports" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    Then I softly can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly see "Closeout Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:closeoutNotesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Supporting Documents" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "View" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I softly see status in Progress-bar is "Overridden" and is "dark blue"
    When I navigate to "Files" sub tab
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Funder Closeout Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Closeout has been validated successfully. Please proceed. |
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly see field "Status" as "Approved"
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit to Grantor" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:closeoutNotesTableId---" by clicking "Edit" :
      | Created By | Title               | Description      |
      | Sarah PM   | Notes Record Edited | Automation Notes |
    Then I softly see value "Notes Record Edited" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.23@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"

  @484063 @ValidateFromAppGPCloseoutwithPMProfileabletocreateProjectperiodcloseoutandabletocompletethecloseout @GRegression1
  Scenario: Validate From App GP Closeout with PM Profile Able to create Project period closeout and able to complete the closeout
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Awards" sub tab
    And I save the value from row "1" for column name "Award EGMS ID" as "AwardEGMSID" from flex table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    When I navigate to "Closeout" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Delete" icon for "Created" inside table with table id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---" without processing
    Then I softly see confirmation box with body "Are you sure, you want to permanently delete the project period closeout?" is displayed
    When I click modal button "OK"
    And I wait for "2" seconds
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see field "Status" as "Created"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Check List" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Override" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see "Grant Overview" page block displayed
    Then I softly see "Closeout Request Details" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Open  Items" sub tab
    Then I softly see "Pending Amendment Requests" page block displayed
    Then I softly see "Pending Progress Reports" page block displayed
    Then I softly see "Pending Financial Reports" page block displayed
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingFinancialReport---"
    When I navigate to "Check List" sub tab
    Then I softly see "Expenses" page block displayed
    Then I softly see "Record Changes" page block displayed
    Then I softly see "Report/Finance" page block displayed
    Then I softly see "Monitoring" page block displayed
    Then I softly see "Overall" page block displayed
    Then I softly see "Link to Disclosure of Lobbying form (SF-LLL)" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:closeoutApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly see "Closeout Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:closeoutNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---" without waiting for record
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly see status in Progress-bar is "Reviewed" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name       | Closeout |
      | Victor EXE | Step 1   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I softly see status in Progress-bar is "Overridden" and is "dark blue"
    When I navigate to "Open  Items" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingFinancialReport---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Closeout has been validated successfully. Please proceed. |
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Forward | Send to Owner |
    When I select radio button "Forward" in the approval decision
    And I select user "David FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Send to Owner" in the approval decision
    And I wait for "100" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "Edit" :
      | Closeout | Name       |
      | Step 1   | Victor EXE |
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    Then I softly see "Submit to Grantor" opens in overLay window
    And I wait for "2" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Submitted to Grantor On is required. |
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    Then I softly can see top right button "Complete Closeout" in page detail
    When I click on "Complete Closeout" in the page details
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Grantor Closeout Date is required. |
    When I enter values into fields
      | Value | Field                  |
      | 0     | FederalCloseoutDate__c |
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    Then I softly see field "Status" as "Completed"
    Then I softly see status in Progress-bar is "Completed" and is "dark blue"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Completed" for title "New Value" inside field history table
    Then I softly see value "Submitted to Grantor" for title "Original Value" inside field history table
    And I click on back arrow
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I softly see field "Status" as "Closed/Completed"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Closed"

  @484041 @ValidateFrommAppGPCloseoutWithPMProfileOncecreatetheadhoccloseoutNewbuttonofcloseoutgetdisable @GRegression1 @GranteeTBE
  Scenario: Validate Fromm App_GP Closeout With PM Profile Once create the adhoc closeout New button of closeout get disable
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I can see row level action button "View" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I can see row level action button "Edit" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"

  @484062 @ValidateFromAppGPCloseoutWithPMProfileinawardunabletoseeBudgetPeriodcloseoutSection @GRegression1 @GranteeTBE
  Scenario: Validate From App GP Closeout With PM Profile in award unable to see Budget Period closeout Section
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly cannot see "Budget Period Closeouts" sub tab at view detail page
    And I navigate to "Closeout" tab
    Then I do not see "Budget Period Closeouts" inside "Closeouts" is displayed

  @484043 @ValidateFromAppGPCloseoutwithPMProfileAbletocreateschedulecloseout @P2_Grantee @PM_Grantee @GRegression1
  Scenario: Validate From App GP Closeout with PM Profile, Able to create schedule closeout
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I create schedule closeout "{SavedValue:Automation Runtime Opportunity}" for status "Created" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly can see row level action button "View" against "Scheduled" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "Edit" against "Scheduled" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly cannot see row level action button "Delete" against "Scheduled" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on "View" icon for "Scheduled" inside flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I click on back arrow
    And I wait for "2" seconds
    And I click on "Edit" icon for "Scheduled" inside flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Check List" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page