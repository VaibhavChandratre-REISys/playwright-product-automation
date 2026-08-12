@GranteeCloseout
Feature: Validate all scenarios for closeout

  @456081 @ValidateCloseoutAdminPOFDFOListViewFunctionalitythelistviewfunctionalityverifythesession @GRegression2 @P4_Grantee @ADMIN_Grantee
  Scenario: Validate Closeout Admin PO FD FO List View Functionality the list view functionality & verify the session
    Given I login to "Grantee" app as "GRANTEE ADMIN" user
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
    Given I login to "Grantee" app as "GRANTEE PO" user
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
    Given I login to "Grantee" app as "GRANTEE FD" user
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
    Given I login to "Grantee" app as "GRANTEE FD" user
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
    Given I login to "Grantee" app as "GRANTEE PO" user
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
    And I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
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
    When I login to "Grantee" app as "GRANTEE PM" user
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
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PhasePendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PhasePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
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
    Then I softly see value "sarah.pm.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
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
    When I login to "Grantee" app as "GRANTEE EXE" user
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
    Given I login to "Grantee" app as "GRANTEE PM" user
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
    When I login to "Grantee" app as "<userType>" user
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
    When I login to "Grantee" app as "<userType>" user
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
      | userType   |
      | GRANTEE PM |

  @446128 @ValidateGPCloseoutWithEXEProfileOncecreatetheadhoccloseoutNewbuttonofcloseoutgetdisable @GRegression1 @GranteeTBE
  Scenario: Validate GP Closeout With EXE Profile Once create the adhoc closeout New button of closeout get disable
    And I "Created" standalone subaward "Automation Runtime award" with properties "ALL_SETTING_NO-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE EXE" user
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
    When I login to "Grantee" app as "GRANTEE PM" user
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
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
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
    When I login to "Grantee" app as "GRANTEE PM" user
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
    When I re-login to "Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
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
    When I login to "Grantee" app as "GRANTEE PM" user
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
    When I login to "Grantee" app as "GRANTEE EXE" user
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
    Given I login to "Grantee" app as "GRANTEE PM" user
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
    Given I login to "Grantee" app as "GRANTEE PM" user
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
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Sarah PM"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Sarah PM"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "{SavedValue:Automation Runtime}" with properties "DAVID_FO_APPROVER"
    And I "Created" award from application for opportunity "{SavedValue:Automation Runtime}" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    #484028
    Then I softly see field "Status" as "Draft"
    Then I softly cannot see "Closeout" sub tab at view detail page
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly cannot see "Budget Period Closeouts" sub tab at view detail page
    And I navigate to "Closeout" tab
    Then I do not see "Budget Period Closeouts" inside "Closeouts" is displayed

  @484057 @ValidateFromAppGPCloseoutwithPMProfileIfCloseoutisinApprovedstatethenabletoseetheaccessofsection @P1_Grantee @PM_Grantee @GRegression1
  Scenario: Validate From AppGP Closeout with PM Profile If Closeout is in Approved state then able to see the access of section
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
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
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
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
    Then I softly see value "sarah.pm.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"

  @484063 @ValidateFromAppGPCloseoutwithPMProfileabletocreateProjectperiodcloseoutandabletocompletethecloseout @GRegression1
  Scenario: Validate From App GP Closeout with PM Profile Able to create Project period closeout and able to complete the closeout
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
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
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
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
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
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
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I select radio button "Forward" in the approval decision
    And I select user "David FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
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
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
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
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
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
    Given I login to "Grantee" app as "GRANTEE PM" user
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
    Given I login to "Grantee" app as "GRANTEE PM" user
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

  @495232 @484043 @ValidateFromAppGPCloseoutwithPMProfileAbletocreateschedulecloseout @P2_Grantee @PM_Grantee @GRegression1 @GranteeP_Q4
  Scenario: Validate From App GP Closeout with PM Profile, Able to create schedule closeout
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
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

  @446130 @validatewithpmprofileabletocreateschedulecloseout  @P1_Grantee @PM_Grantee @GRegression1
  Scenario: Validate with PM Profile able to create schedule closeout
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I create schedule closeout "{SavedValue:Automation Runtime Award}" for status "Created" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
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

  @484074 @AppGPCloseoutVerifyWithPOAuditorFOFDProfileAsanonownerCloseoutabletoseeonlyviewmode @GRegression3 @PO_Grantee @P3_Grantee
  Scenario Outline: App GP Closeout - "Verify With PO /Auditor / FO /FD Profile,As a non owner Closeout  able to see only view mode."
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
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
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
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

  @484074_1 @AppGPCloseoutVerifyWithPOAuditorFOFDProfileAsanonownerCloseoutabletoseeonlyviewmode @GRegression3 @AUDITOR_Grantee @P3_Grantee
  Scenario: App GP Closeout - "Verify With Auditor,As a non owner Closeout  able to see only view mode."
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
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
    When I re-login to "Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
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

  @496009 @ValidatePMuserseethecreatedSubmitforapprovalsendforreviewReviewedProgressreportisinopenitemoncecloseoutishappenedforthatGrant @P1_Grantee @PM_Grantee @GRegression1
  Scenario: Validate PM user see the created, Submit for approval, send for review, Reviewed Progress report is in open item once closeout is happened for that Grant
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I enter "Grantee_Creation" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I enter "Grantee_Creation" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "progressEGMSID1"
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "Grantee PO" inside table
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I enter "Grantee_Creation" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "progressEGMSID2"
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "Grantee PO" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID2}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID2}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    When I perform quick search for "{SavedValue:progressEGMSID2}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID2}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I enter "Grantee_Creation" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "progressEGMSID3"
    When I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 1          |
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I enter "Grantee_Creation" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "progressEGMSID4"
    When I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 1          |
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I enter "Grantee_Creation" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "progressEGMSID5"
    When I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 1          |
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I enter in modal "Grantee_Submit Details" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I navigate to "Management" sub tab
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Submitted for Review" for title "Status" against the value "{SavedValue:progressEGMSID1}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Reviewed" for title "Status" against the value "{SavedValue:progressEGMSID2}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:progressEGMSID3}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Approved" for title "Status" against the value "{SavedValue:progressEGMSID4}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:progressEGMSID5}" inside table "---grantee_tableId:-:ProgressReportTableId---"
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
    When I navigate to "Open  Items" sub tab
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see value "Submitted for Review" for title "Status" against the value "{SavedValue:progressEGMSID1}" inside table "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see value "Reviewed" for title "Status" against the value "{SavedValue:progressEGMSID2}" inside table "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:progressEGMSID3}" inside table "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly do not see value "{SavedValue:progressEGMSID4}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly do not see value "{SavedValue:progressEGMSID5}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:PendingProgressReprt---"

  @446149 @ValidateGPCloseoutwithPMProfileAbletocreateProjectperiodcloseoutandabletocompletethecloseout @Grantee_Smoke1 @GranteeP_Q4
  Scenario: Validate GP Closeout with PM Profile Able to create Project period closeout and able to complete the closeout
    And I "Created" standalone subaward "Automation Runtime award" with properties "INDIRECT_COST_NO"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "amendmentEGMSID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Delete" icon for "Created" inside table with table id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---" without processing
    Then I softly see confirmation box with body "Are you sure, you want to permanently delete the project period closeout?" is displayed
    When I click modal button "OK"
    And I wait for "4" seconds
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
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:amendmentEGMSID}" inside table "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
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
    And I pause execution for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
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
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:amendmentEGMSID}" inside table "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Closeout has been validated successfully. Please proceed. |
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I select radio button "Forward" in the approval decision
    And I select user "David FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I wait for "100" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "Edit" :
      | Closeout | Name       |
      | Step 1   | Victor EXE |
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    Then I softly see "Submit to Grantor" opens in overLay window
    And I wait for "1" seconds
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

  @490298 @ValidateGPCloseoutwithPOProfileIfCloseoutisinsubmitedforapprovalstatethenOnclicksendtoownerrecordgoesincreatedstateandagainabletocompletethecloseout @GRegression5 @PO_Grantee @P3_Grantee
  Scenario: Validate GP Closeout with PO Profile If Closeout is in submited for approval state then On click send to owner record goes in created state and again able to complete the closeout
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
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
    Then I softly see field "Status" as "Created"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name       | Closeout |
      | Victor EXE | Step 1   |
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Closeout has been validated successfully. Please proceed. |
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I wait for "100" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    And I wait for "1" seconds
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Complete Closeout" in the page details
    When I enter values into fields
      | Value | Field                  |
      | 0     | FederalCloseoutDate__c |
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    Then I softly see field "Status" as "Completed"
    Then I softly see status in Progress-bar is "Completed" and is "dark blue"

  @499041 @Validatefourstepapproverabletoapprovethecloseout @GRegression5 @PM_Grantee @P2_Grantee
  Scenario: Validate four step approver able to approve the closeout
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
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
    Then I softly see field "Status" as "Created"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name     | Closeout |
      | David FO | Step 1   |
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name       | Closeout |
      | Grantee PO | Step 2   |
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name       | Closeout |
      | Victor EXE | Step 3   |
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name               | Closeout |
      | Danielle FD Garcia | Step 4   |
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Closeout has been validated successfully. Please proceed. |
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I wait for "100" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "Sarah PM" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I wait for "100" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "Sarah PM" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I wait for "100" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "Sarah PM" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I wait for "100" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "Sarah PM" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"

  @499896 @ValidateAmendmentstatusasnotacceptedshouldnotgetoverriddenincloseout @GRegression5 @PM_Grantee @P3_Grantee
  Scenario: Validate Amendment status as not accepted should not get overridden in closeout
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I "Approved" of type "Budget Period Change" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value        | Field       |
      | Not Accepted | Decision__c |
    When I enter values into fields
      | Value | Field       |
      | Test  | Comments__c |
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    Then I softly see field "Status" as "Not Accepted"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
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
    Then I softly see field "Status" as "Created"
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I navigate to "Open  Items" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"

  @446126 @ValidateGPCloseoutWithPMProfilePhaselevelListviewpageandmodule @GRegression3 @P3_Grantee @PM_Grantee
  Scenario: Validate GP Closeout With PM Profile Phase level List view page and module
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
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
    And I navigate to "Closeout" tab
    And I wait for "2" seconds
    Then I see "Project Period Closeouts" inside "Closeouts" is displayed
    Then I softly see "Project Period Closeout - My Records" page block displayed
    Then I softly do not see "Budget Period Closeout - My Records" page block displayed
    Then I softly see default toggle as "Project Period Closeout - My Records" for table "---grantee_tableId:-:phaseCloseoutTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:phaseCloseoutTableId---"
    When I click on parallel lines menu bar with data target value "Project Period Closeout - My Records"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Project Period Closeout - Draft" inside flex table id "---grantee_tableId:-:phaseCloseoutTableId---"
    Then I softly see toggle option "Project Period Closeout - My Records" inside flex table id "---grantee_tableId:-:phaseCloseoutTableId---"
    Then I softly see toggle option "Project Period Closeout - Submitted" inside flex table id "---grantee_tableId:-:phaseCloseoutTableId---"
    Then I softly see toggle option "Project Period Closeout - Completed" inside flex table id "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Draft"
    When I perform quick search for "Created" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:phaseCloseoutTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Draft"
    When I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    And I save the total records from the flex table id "---grantee_tableId:-:phaseCloseoutTableId---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:phaseCloseoutTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    And I click toggle button to select "Project Period Closeout  - All"
    And I select value inside table "---grantee_tableId:-:phaseCloseoutTableId---" is "5"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    And I click toggle button to select "Project Period Closeout - Submitted"
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Completed"
    When I perform quick search for "Completed" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    Then I softly see value "Completed" for title "Status" inside table "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout  - All"
    When I perform quick search for "Completed" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    Then I softly see value "Completed" for title "Status" inside table "---grantee_tableId:-:phaseCloseoutTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:phaseCloseoutTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"

  @446139 @ValidateGPCloseoutwithPMProfileIfCloseoutisinOverridestatethenabletoseetheaccessofsection @PM_Grantee @GRegression5 @P2_Grantee
  Scenario: Validate GP Closeout with PM Profile If Closeout is in Override state then able to see the access of section
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I "Created" of type "Budget Period Change" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
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
    Then I softly see field "Status" as "Created"
    When I click on "Override" in the page details without processing
    Then I softly see confirmation box with body "The status of all open items will be changed to Forced Closed. Are you sure, you want to override and proceed with the closeout?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Overridden"
    When I navigate to "Open  Items" sub tab
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:AmendEGMSID}" inside table "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:closeoutApproverTableId---"
    When I navigate to "Files" sub tab
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

  @446146 @ValidateGPCloseoutwhileEXEProfileOndirectgrantmodalunabletoseeIsBudgetPeriodCloseoutRequestRequiredField @GRegression5 @EXE_Grantee @P2_Grantee
  Scenario: Validate GP Closeout - Verify while EXE Profile ,On direct grant modal unable to see Is Budget Period Closeout Request Required? Field
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    Then I softly see "Create Grant" opens in overLay window
    Then I softly cannot see field "Is Budget Period Closeout Request Required?" inside page block

  @490296 @ValidateGPCloseoutwithPOProfileIfCloseoutisinsubmittedforapprovalstatethenwithforwardeduserabletoapprovedandcompletethecloseout @GRegression5 @P2_Grantee @PO_Grantee
  Scenario: Validate GP Closeout with PO Profile If Closeout is in submitted for approval state then with forwarded user able to approved and complete the closeout
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
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
    Then I softly see field "Status" as "Created"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name     | Closeout |
      | David FO | Step 1   |
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Closeout has been validated successfully. Please proceed. |
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "Victor EXE" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Complete Closeout" in the page details
    When I enter values into fields
      | Value | Field                  |
      | 0     | FederalCloseoutDate__c |
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    Then I softly see field "Status" as "Completed"

  @459818 @ValidateCloseoutforNotesectionAddisReplacewithNewbutton @GRegression3 @P3_Grantee @PM_Grantee
  Scenario: Validate Closeout for Note section "Add" is Replace with New button
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I "Created" of type "Budget Period Change" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
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
    Then I softly see field "Status" as "Created"
    When I click on "Override" in the page details without processing
    Then I softly see confirmation box with body "The status of all open items will be changed to Forced Closed. Are you sure, you want to override and proceed with the closeout?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Overridden"
    When I navigate to "Open  Items" sub tab
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:AmendEGMSID}" inside table "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:closeoutApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly do not see top right button "Add" inside flex table "---grantee_tableId:-:closeoutNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    And I click on "Edit" in the page details
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly do not see top right button "Add" inside flex table "---grantee_tableId:-:closeoutNotesTableId---"

  @473897 @ValidateAmendmentReqPMusershouldnotseeamendmentrequestwithstateRejectedSubmittedtoGrantorAcceptedinPPCloseoutopenitems @P2_Grantee @PM_Grantee @GRegression5
  Scenario: Validate Amendment Req PM user should not see amendment request with state Rejected Submitted to Grantor Accepted in PP Closeout open items
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I wait for "2" seconds
    #Reject Amendment
    And I "Created" of type "Key Personnel Change" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "KEY_PERSONNEL_CHANGE"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Award Title" as "AwardTitle"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AmendEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AmendEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    #Accepted
    And I "Approved" of type "Scope of Work Change" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "SOW_AMENDMENT_NEW_AWARD_ID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Award Title" as "AwardTitle"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I save the field labeled "EGMS ID" as "AmendEGMSID2"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardId1"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "AwardTitle"
    #Submitted to Grantor
    And I "Approved" of type "Budget Redirection" amendment request for title "{SavedValue:AwardTitle}" with properties "BUDGET_REDIRECTION"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
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
    When I navigate to "Open  Items" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"

  @449019 @validatewithPMProfile,IfamendmentissubmittoGrantorstatethenunabletoseeamendmentrecordinpendingamendmentrequestswhileapprovevalidationmessageablesee.
  Scenario: Validate with PM Profile , If amendment is submit to Grantor state then unable to see amendment record  in pending amendment requests while approve validation message able see.
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Award" into field "GrantAwardName__c"
    And I enter value "Automation Test Description" into field "GrantAwardDescription__c"
    And I enter value "Street4" into field "Addressline1__c"
    And I enter value "Street5" into field "Addressline2__c"
    And I enter value "Testing City" into field "City__c"
    And I enter value "Testing County" into field "County__c"
    And I enter value "IL: Illinois" into field "State__c"
    And I enter value "321" into field "CongressionalDistrict__c"
    And I enter value "54321" into field "Zip4__c"
    And I enter value "Testing Country" into field "Country__c"
    And I enter value "1111" into field "ZipCode4Extension__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 1            |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "amendmentEGMSID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Override" in page detail
    When I navigate to "Open  Items" sub tab
    Then I softly see "Pending Amendment Requests" page block displayed
    Then I softly see "Pending Progress Reports" page block displayed
    Then I softly see "Pending Financial Reports" page block displayed
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:amendmentEGMSID}" inside table "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name       | Closeout |
      | Victor EXE | Step 1   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:amendmentEGMSID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "{SavedValue:amendmentEGMSID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    Then I softly see "Submit to Grantor" opens in overLay window
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    When I navigate to "Open  Items" sub tab
    Then I softly see "Pending Amendment Requests" page block displayed
    Then I softly see "Pending Progress Reports" page block displayed
    Then I softly see "Pending Financial Reports" page block displayed
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"

  @495053 @validatetheeffectsofcloseoutonfinancial,progressreport,grantaward,relatedapplication,Opportunity
  Scenario: Verify the effects of closeout on financial, progress report, grant award, related application, Opportunity
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:FinancialsReportTableId---"
    And I enter "Creation" values from "Financial_Report_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "financialEGMSID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I enter "Grantee_Creation" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Award" into field "GrantAwardName__c"
    And I enter value "Automation Test Description" into field "GrantAwardDescription__c"
    And I enter value "Street4" into field "Addressline1__c"
    And I enter value "Street5" into field "Addressline2__c"
    And I enter value "Testing City" into field "City__c"
    And I enter value "Testing County" into field "County__c"
    And I enter value "IL: Illinois" into field "State__c"
    And I enter value "321" into field "CongressionalDistrict__c"
    And I enter value "54321" into field "Zip4__c"
    And I enter value "Testing Country" into field "Country__c"
    And I enter value "1111" into field "ZipCode4Extension__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 1            |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "amendmentEGMSID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
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
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Override" in page detail
    When I navigate to "Open  Items" sub tab
    Then I softly see "Pending Amendment Requests" page block displayed
    Then I softly see "Pending Progress Reports" page block displayed
    Then I softly see "Pending Financial Reports" page block displayed
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:amendmentEGMSID}" inside table "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:PendingFinancialReport---"
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
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:amendmentEGMSID}" inside table "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:PendingFinancialReport---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Closeout has been validated successfully. Please proceed. |
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    Then I softly see "Submit to Grantor" opens in overLay window
    And I wait for "1" seconds
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

  @536823 @ValidateGranteedeleteactionisnotdisplayedtoPMuserCloseoutrequestownerwhencloseoutrequestissentbackfromapproval
  Scenario: Validate Grantee delete action is not displayed to PM user Closeout request owner when closeout request is sent back from approval
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
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
    Then I softly see field "Status" as "Created"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name     | Closeout |
      | Sarah PM | Step 1   |
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Closeout has been validated successfully. Please proceed. |
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I wait for "100" seconds
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"

  @536824 @ValidateGranteedeleteactionisnotdisplayedtoPMuserCloseoutrequestownerwhencloseoutrequestisRejectedfromapproval
  Scenario: Validate Grantee delete action is not displayed to PM user Closeout request owner when closeout request is Rejected from approval
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
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
    Then I softly see field "Status" as "Created"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name     | Closeout |
      | Sarah PM | Step 1   |
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Closeout has been validated successfully. Please proceed. |
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"

  @536825 @536826 @ValidateGranteedeleteactionisdisplayedtoPMuserCloseoutrequestownerwhencloseoutrequestisincreatedstate
  Scenario: Validate Grantee delete action is displayed to PM user Closeout request owner when closeout request is in created state
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
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
    Then I softly see field "Status" as "Created"
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly can see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    #536826
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I re-login to "Grantee" app as "GRANTEE ADMIN1" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"

  @495223 @Validatethetheadhoccloseout&functionality @GranteeP_Q4
  Scenario: Validate the the Adhoc closeout & functionality
    And I "Created" standalone subaward "Automation Runtime award" with properties "INDIRECT_COST_NO"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "amendmentEGMSID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Delete" icon for "Created" inside table with table id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---" without processing
    Then I softly see confirmation box with body "Are you sure, you want to permanently delete the project period closeout?" is displayed
    When I click modal button "OK"
    And I wait for "4" seconds
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
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:amendmentEGMSID}" inside table "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
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
    And I pause execution for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
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
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:amendmentEGMSID}" inside table "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Closeout has been validated successfully. Please proceed. |
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Forward | Send to Owner |
    When I select radio button "Forward" in the approval decision
    And I select user "David FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I wait for "100" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "Edit" :
      | Closeout | Name       |
      | Step 1   | Victor EXE |
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    Then I softly see "Submit to Grantor" opens in overLay window
    And I wait for "1" seconds
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

  @473896 @ValidatePMusershouldnotseefinancialreportwithstateApprovedandSubmittedtoGrantorinPPCloseoutopenitems @GranteeP_Q4 @P2_Grantee @PM_Grantee @Gregression2
  Scenario: Validate PM user should not see financial report with state Approved and Submitted to Grantor in PP Closeout open items
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I wait for "2" seconds
    And I "Approved" the "Financial Report" for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I "Submitted to Grantor" the "Financial Report" for title "{SavedValue:Automation Runtime award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---grantee_tableId:-:FinancialsReportTableId---"
    And I save the field labeled "EGMS ID" as "financialEGMSID1"
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:AwardEGMSID}"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:FinancialsReportTableId---"
    And I save the field labeled "EGMS ID" as "financialEGMSID2"
    Then I softly see field "Status" as "Approved"
    And I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:AwardEGMSID}"
    And I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
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
    When I navigate to "Open  Items" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingFinancialReport---"

  @473894 @ValidatePMusershouldnotseeScheduledProgressreportwithstateApprovedandSubmittedtoGrantorinPPCloseoutopenitems @GranteeP_Q4 @P2_Grantee @PM_Grantee @Gregression2
  Scenario: Validate PM user should not see Schedule Progress report with state Approved and Submitted to Grantor in PP Closeout open items
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I wait for "2" seconds
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Report Creation Date |
      | {SavedValue:EGMS ID1} | 0                    |
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Report Creation Date |
      | {SavedValue:EGMS ID2} | 0                    |
    And I wait for "400" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "progressEGMSID1" from flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Scheduled" for title "Report Type" against the value "{SavedValue:progressEGMSID1}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    And I save the value from row "2" for column name "EGMS ID" as "progressEGMSID2" from flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Scheduled" for title "Report Type" against the value "{SavedValue:progressEGMSID2}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:progressEGMSID1}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID1}" inside table
    And I save the field labeled "EGMS ID" as "progressEGMSID1"
    When I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                          | Field                 |
      | Automation Key Accomplishments | KeyAccomplishments__c |
      | Automation Obstacles           | Obstacles__c          |
      | Automation Plans               | Plans__c              |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | David FO | Step 1          |
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID1}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID1}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID1}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID1}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID1}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID1}" inside table
    Then I softly can see top right button "Mark as Submitted" in page detail
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I enter in modal "Grantee_Submit Details" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:progressEGMSID2}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID2}" inside table
    And I save the field labeled "EGMS ID" as "progressEGMSID2"
    When I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                          | Field                 |
      | Automation Key Accomplishments | KeyAccomplishments__c |
      | Automation Obstacles           | Obstacles__c          |
      | Automation Plans               | Plans__c              |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | David FO | Step 1          |
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID2}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID2}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID2}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID2}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID2}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID2}" inside table
    Then I softly see field "Status" as "Approved"
    And I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:AwardEGMSID}"
    And I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
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
    When I navigate to "Open  Items" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingProgressReprt---"