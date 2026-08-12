@GranteeFinancialReport
Feature: Validate all scenarios for Financial Report

  @445207 @ValidateEXEuserFinancialreportOwnercanabletocreateAdhocFinancialReport&abletosubmitFinancialReporttoGrantor @GRegression1 @EXE_Grantee @P1_Grantee
  Scenario: Validate EXE user Financial report Owner can able to create Adhoc Financial Report & able to submit Financial Report to Grantor
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Victor EXE user"
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
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:FinancialsReportTableId---"
    And I enter "Creation" values from "Financial_Report_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "financialEGMSID"
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - My Records"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Edit" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "View" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Delete" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    And I click toggle button to select "Financial Reports - Draft"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Edit" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "View" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Delete" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    Then I softly see "Collapse" button for header
    Then I see the header is "Financial Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:financialEGMSID}"
    Then I softly see field "Status" as "Created"
    And I save the field labeled "Grant Award Number" as "GrantNumber"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantNumber}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see "Resize" button for page
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Report Overview" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "System Information" page block displayed
    And I save the field labeled "Award ID" as "AwardID"
    Then I softly see field "Award ID" inside page block
    Then I softly see link "{SavedValue:AwardID}" inside Page block
    Then I softly see field "Budget Period" inside page block
    Then I softly see field "Budget Period Number" inside page block
    Then I softly see field "Internal Organization" inside page block
    And I save the field labeled "Internal Organization" as "InternalOrganization"
    Then I softly see link "{SavedValue:InternalOrganization}" inside Page block
    Then I softly see field "Funding Organization" inside page block
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    Then I softly see field "Reporting Period Start Date" inside page block
    Then I softly see field "Reporting Period End Date" inside page block
    Then I softly see field "Report Due Date" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Submitted On" inside page block
    And I click on "Edit" in the page details
    Then I softly see fields "ReportingPeriodStartDate__c" is in edit mode
    Then I softly see fields "ReportingPeriodEndDate__c" is in edit mode
    Then I softly see fields "ReportDueDate__c" is in edit mode
    Then I softly see fields "IsFinalReport__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see "Project Role" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Is Key Contact" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see field "Created By" inside page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified By" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly see field "Last Modified Date" inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Sarah PM      | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly can see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I click on "Delete" icon for "Sarah PM" inside table with table id "---grantee_tableId:-:financialReportPeerReviewTableId---" without processing
    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed
    When I click modal button "OK"
    Then I softly do not see value "Sarah PM" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I click on "Send for Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see value "Submitted" for title "Status" against the value "Grantee PO" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Enter Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - Draft"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportApproverTableId---" by clicking "New" :
      | Name       | Financial Report |
      | Victor EXE | Step 1           |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportApproverTableId---" by clicking "New" :
      | Name     | Financial Report |
      | Sarah PM | Step 2           |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Financial Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
    And I click on back arrow
    Then I softly can see row level action button "View" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Federal Financial Report (SF-425)" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I enter "FederalFinancialReport_425" values from "Financial_Report_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I enter value "Automation for Execution" into field "Remark__c"
    And I click on "Cancel" in the page details
    And I wait for "2" seconds
    Then I softly see field "Remarks" as "Automation test"
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I click on "View" icon for "Federal Financial Report (SF-425)" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Recipient Information" page block displayed
    Then I softly see "Transactions" page block displayed
    Then I softly see "Indirect Expense" page block displayed
    Then I softly see "Remarks" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see "Authorized Certifying Official" page block displayed
    Then I softly see field "1. Federal Agency and Organizational Element to Which Report is Submitted" inside page block
    Then I softly see field "2. Federal Grant or Other Identifying Number Assigned by Federal Agency" inside page block
    Then I softly see field "3. Recipient Organization (Name and complete address including Zip code):" inside page block
    Then I softly see field "4a. UEI" inside page block
    Then I softly see field "4b. EIN:" inside page block
    Then I softly see field "5. Recipient Account Number or Identifying Number:" inside page block
    Then I softly see field "6. Report Type:" inside page block
    Then I softly see field "7. Basis of Accounting:" inside page block
    Then I softly see field "8. Project/Grant Period From: (Month, Day, Year):" inside page block
    Then I softly see field "8. Project/Grant Period From: (Month, Day, Year):" inside page block
    And I close the tab
    And I navigate to "Quickview" sub tab in split screen
    When I click on "Splitview" icon for "Federal Financial Report (SF-425)" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see top right button "Edit" in the split screen page details
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I see "Upload" button is disabled at modal under library
    And I select Classification as "Financial Report" at upload file modal
    When I upload file "AttachmentTesting.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Financial Report" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly see value "Financial Report" for title "Classification" inside table "---grantee_tableId:-:financialReportAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Description      |
      | Automation Notes |
    Then I softly see the following messages in the page details :
      | Required Fields Missing |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I click on "Delete" icon for "Notes Record" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Actions" in flex table header "CommunicationHistory"
    Then I softly see "Subject" in flex table header "CommunicationHistory"
    Then I softly see "From Address" in flex table header "CommunicationHistory"
    Then I softly see "To Address" in flex table header "CommunicationHistory"
    Then I softly see "CC Address" in flex table header "CommunicationHistory"
    Then I softly see "Attention To" in flex table header "CommunicationHistory"
    Then I softly see "Email Subject" in flex table header "CommunicationHistory"
    Then I softly see "Preview" in flex table header "CommunicationHistory"
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exeqagrantee@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - All"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "View" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportApproverTableId---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "View" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I "Approve" in the approval decision
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:financialEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:financialEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - All"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    Then I softly can see top right button "Mark as Submitted" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Name" in flex table header "---grantee_tableId:-:financialReportOwnerTableId---"
    Then I softly see "Responsibility" in flex table header "---grantee_tableId:-:financialReportOwnerTableId---"
    And I save the value from row "1" for column name "Name" as "ownerName" from flex table "---grantee_tableId:-:financialReportOwnerTableId---"
    Then I softly see link "{SavedValue:ownerName}" inside Page block
    And I click on hyperlink containing value "{SavedValue:ownerName}"
    Then I softly see the text containing "victor.exe@ggp.test8.qagrnteatm"
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "2" seconds
    And I click on "Mark as Submitted" in the page details
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Submitted to Grantor On is required. |
    And I enter in modal "Submit Details" values from "Financial_Report_Field_Values.xlsx"
    When I click modal button "Save"
    When I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Submitted By" as "SubmittedBy"
    Then I softly see field "Submitted By" as "{SavedValue:SubmittedBy}"
    And I save the field labeled "Submitted On" as "SubmittedOn"
    Then I softly see field "Submitted On" as "{SavedValue:SubmittedOn}"
    When I click on "Revise" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to revise the report? The report will require an approval again after being revised." is displayed
    And I click "OK" on modal confirmation box
    When I enter in modal value "Automation Feedback" into field "ReviseComments__c"
    And I enter in modal value "0" into field "RevisedDate__c"
    When I click modal button "Save"
    When I click modal button "Close"
    Then I softly see field "Status" as "Created"
    When I navigate to "History" sub tab
    Then I softly see "Grantor Feedback History" page block displayed
    Then I softly see field "Feedback from Grantor" as "Automation Feedback"
    And I save the field labeled "Feedback Received On Date" as "FeedbackReceivedOnDate"
    Then I softly see field "Feedback Received On Date" as "{SavedValue:FeedbackReceivedOnDate}"
    Then I softly can see top right button "Edit" in page detail
    Then I softly see "Resize" button for page
    Then I softly see "Collapse" button for page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Quickview" sub tab at view detail page
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"

  @484014 @ValidateReviewedthefinancialreportbyassignedReviewerwithallowrecordeditingYes @P2_Grantee @PM_Grantee @GRegression1
  Scenario: Validate Reviewed the financial report by assigned Reviewer with allow record editing Yes
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    And I "Created" the "Financial Report" for title "{SavedValue:Automation Runtime award}" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:FinancialReportsOnAwards---"
    And I save the field labeled "EGMS ID" as "financialEGMSID"
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I save the field labeled "Reporting Period End Date" as "ReportingPeriodEndDate"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see the following messages in the page details contains:
      | Responsibilities Tab - A person with the same role cannot be added again. |
    And I refresh the page
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | David FO      | Program Reviewer | Automation Description | 5        | No                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I wait for "2" seconds
    And I click on "notifications" button on header
    Then I softly see notification "Review Financial Report for Award #{SavedValue:AwardEGMSID} for Reporting Period {SavedValue:ReportingPeriodStartDate} - {SavedValue:ReportingPeriodEndDate}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:financialEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:financialEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I click "Associate" after selection of "David FO" in the table "---grantee_tableId:-:associateModalProgressTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly can see row level action button "Remove" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Fiscal Reviewer" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see value "Submitted" for title "Status" against the value "Fiscal Reviewer" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Enter Review" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I expand nested table containing column value "Fiscal Reviewer"
    Then I softly see value "Passed" for title "Rating" inside table "---grantee_tableId:-:peerReviewerFinancialChildTableId---"
    Then I softly see value "Automation Reviewer comments" for title "Review Comments" inside table "---grantee_tableId:-:peerReviewerFinancialChildTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:financialEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - Draft"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Reviewed" for title "New Value" inside field history table
    Then I softly see value "Submitted for Review" for title "Original Value" inside field history table

