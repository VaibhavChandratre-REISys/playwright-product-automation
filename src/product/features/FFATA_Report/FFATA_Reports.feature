@FFATAReports
Feature: Validate all scenarios for FFATA Reports

  @546353 @546372 @547281 @547952 @546351 @547285 @546367 @547750 @546364 @546354 @546356 @546362 @ValidateInternalusersAdminPMPOEXEcanabletocreateFFATAReportCreationwithValidDatasuccessfully
  Scenario: Validate Internal users Admin PM PO EXE can able to create FFATA Report Creation with Valid Data successfully
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "FFATA Reporting" sub tab
    When I enter the following values into flex table with id "---home:-:executionCompensationTableId---" by clicking "New" :
      | Full Name      | Salary ($) |
      | Michael Carter | 10000      |
      | Emily Johnson  | 50000      |
      | Daniel Smith   | 70000      |
      | Jessica Brown  | 20000      |
      | Andrew Miller  | 40000      |
      | Sarah Davis    | 80000      |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I refresh the page
    And I re-login to "Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I wait for "2" seconds
    And I enter "GrantsFFATA" values from "Award_Field_Values.xlsx"
    And I enter in modal value "Automation Runtime FFATA Report" into field "ProjectTitle__c"
    And I click modal button "Continue"
    And I enter "Grant_Edition_FFATA" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_FFATA" values from "Award_Field_Values.xlsx"
    And I enter value "50000" into field "NewObligation__c"
    And I enter value "50000" into field "TotalCommitment__c"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fataSingleExternalFA}" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                   | Encumbrance |
      | {SavedValue:fataSingleExternalFA} | 50000       |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Construction    | 50000        |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    Then I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name         | Project Role             | Is Key Personnel |
      | Daniel Jacks | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I wait for "3" seconds
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I pause execution for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I see that "Subaward" is in "Activated" status
#    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant Issue Date" as "AwardIssueDate"
    And I navigate to "Grants" tab
    When I navigate to "FFATA Reports" content inside "Reports" subheader on left panel
    Then I softly see top right button "New" inside flex table "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see top right button "View Eligible Subawards" inside flex table "---subAwardStandAlone:-:ffataReportTableId---"
    And I click on top right button "View Eligible Subawards" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    And I switch to tab number "1"
    Then I see the header is "Report: Bulk request Details" in the page details
    Then I see the header is "FFATA Eligible Subawards Report" in the page details
    And I close the tab
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "FFATA Reports" content inside "Reports" subheader on left panel
    #546351
    Then I softly see "EGMS ID" in flex table header "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see "Report Name" in flex table header "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see "Type" in flex table header "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see "Report Status" in flex table header "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see "Created By" in flex table header "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see "Created Date" in flex table header "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see button "Advance Filter" inside flextable "---subAwardStandAlone:-:ffataReportTableId---"
    When I click on parallel lines menu bar with data target value "FFATA Reports"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    And I save the total records from the flex table id "---subAwardStandAlone:-:ffataReportTableId---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---subAwardStandAlone:-:ffataReportTableId---"
    And I click on page navigation arrow "---subAwardStandAlone:-:ffataReportTableId---" for table id "Next"
    When I click on button "resetIcon" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    And I wait for "1" seconds
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see "Create FFATA Report" opens in overLay window
    Then I softly see field on modal "Report Name" inside page block
    Then I softly see asterisk mark on "Report Name"
    Then I softly see field on modal "Report Type" inside page block
    Then I softly see field "Type__c" is not editable for modal
    Then I softly see field on modal "Award Activation From" inside page block
    Then I softly see asterisk mark on "Award Activation From"
    Then I softly see field on modal "Award Activation To" inside page block
    Then I softly see asterisk mark on "Award Activation To"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Report Name is required.           |
      | To Save, Award Activation From is required. |
      | To Save, Award Activation To is required.   |
    When I enter in modal value "Automation Runtime FFATA Report" into field "ReportName__c"
    When I enter in modal value "0" into field "AwardActivationFrom__c"
    When I enter in modal value "3650" into field "AwardActivationTo__c"
    Then I softly see "Save and Continue" modal button
    Then I softly see "Close" modal button
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #546364
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see field "Report Status" as "Created"
    And I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Export" in page detail
    Then I softly see field "EGMS ID" inside page block
    Then I softly see field "Report Status" inside page block
    Then I softly see field "Type" inside page block
    Then I softly see field "Report Status" as "Created"
    Then I softly see field "Award Activation From" inside page block
    Then I softly see field "Award Activation To" inside page block
    And I save the field labeled "EGMS ID" as "FFATAEGMSID"
    And I save the field labeled "Award Activation From" as "AwardActivationFrom"
    And I save the field labeled "Award Activation To" as "AwardActivationTo"
    Then I softly see field "EGMS ID" as "{SavedValue:FFATAEGMSID}"
    Then I softly see field "Report Status" as "Created"
    Then I softly see field "Type" as "FFATA Report"
    Then I softly see field "Report Status" as "Created"
    Then I softly see field "Award Activation From" as "{SavedValue:AwardActivationFrom}"
    Then I softly see field "Award Activation To" as "{SavedValue:AwardActivationTo}"
    Then I softly can see "FFATA Report" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly see "FFATA Report Information" page block displayed
    And I click on "Edit" in the page details
    Then I softly see fields "ReportName__c" is in edit mode
    When I enter value "Automation Runtime FFATA Report Updated" into field "ReportName__c"
    And I click on "Save" in the page details
    Then I softly see field "Report Name" as "{SavedValue:Automation Runtime FFATA Report Updated}"
    Then I softly see "Subawards - All" page block displayed
    #547952
    Then I softly see toggle option "Subawards - Not Submitted" inside flex table id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see toggle option "Subawards - Published" inside flex table id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see toggle option "Subawards - All" inside flex table id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see toggle option "Subawards - Failed" inside flex table id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see the text containing "“Only records with FFATA Report Status of Draft,"
    Then I softly see top right button "Associate" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see top right button "Submit to SAM.gov" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see top right button "Remove" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "Actions" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "FAIN" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "EGMS ID" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "Award Amount" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "Award Issue Date" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "FFATA Report Number" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "FFATA Report Version" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "FFATA Report Status" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "Processing Status" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "Last Modified Date" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "External Funding Sources" opens in overLay window
    Then I softly see "External Funding Sources" page block displayed
    Then I softly see button "Advance Filter" inside flextable "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    When I click on parallel lines menu bar with data target value "External Funding Sources"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "FAIN" in flex table header "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    Then I softly see "EGMS ID" in flex table header "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    Then I softly see "Title" in flex table header "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    Then I softly see "Created Date" in flex table header "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Please select at least one record to associate. |
    When I click "Associate" after selection of "FFATA Funding Source 13" in the table "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Subawards added successfully. |
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    And I click modal button "Close"
    And I wait for "1" seconds
    And I click toggle button to select "Subawards - Not Submitted"
    Then I softly see value "H173A230074" for title "FAIN" inside table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see value "$50,000.00" for title "Award Amount" inside table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see value "{SavedValue:AwardIssueDate}" for title "Award Issue Date" inside table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see field name "FFATAReportNumber__c" is blank in flex table with Id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see field name "FFATAReportVersion__c" is blank in flex table with Id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see value "Not Submitted" for title "FFATA Report Status" inside table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    #547750
    Then I softly see value "Ready for Submission" for title "Processing Status" inside table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    And I save the value from row "1" for column name "Last Modified Date" as "LastModifiedDate" from flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see value "{SavedValue:LastModifiedDate}" for title "Last Modified Date" inside table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    And I click on "Export" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    And I save the value from row "1" for column name "Title" as "csvFile" from flex table "---subAwardStandAlone:-:FFATAReportFilesTableId---"
    And I click on "Download" icon for "csv" inside flex table with id "---subAwardStandAlone:-:FFATAReportFilesTableId---"
    And I wait for "2" seconds
    And I switch to parent tab
    Then I see row "1" contains value "Ready for Submission" against the column name "Processing Status" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "H173A230074" against the column name "FAIN" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "9100" against the column name "Agency Code" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "{SavedValue:GrantEGMSID}" against the column name "Grant EGMS ID" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Not Submitted" against the column name "FFATA Report Status" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "50000.00" against the column name "Award Amount" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "{Date:yyyy-MM-dd}" against the column name "Award Issue Date" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "VANCOUVER" against the column name "City" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "WA" against the column name "State" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "986614918" against the column name "Zip+Extension" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "USA" against the column name "Country" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Yes" against the column name "Compensation Q1" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "No" against the column name "Compensation Q2" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Yes" against the column name "Compensation Q3" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Sarah Davis" against the column name "Employee 1 Full Name" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "80000.00" against the column name "Employee 1 Salary" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Daniel Smith" against the column name "Employee 2 Full Name" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "70000.00" against the column name "Employee 2 Salary" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Emily Johnson" against the column name "Employee 3 Full Name" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "50000.00" against the column name "Employee 3 Salary" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Andrew Miller" against the column name "Employee 4 Full Name" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "40000.00" against the column name "Employee 4 Salary" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Jessica Brown" against the column name "Employee 5 Full Name" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "20000.00" against the column name "Employee 5 Salary" in the Excel file "{SavedValue:csvFile}"
    And I click on top right button "Submit to SAM.gov" in flex table with id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Select at least one record. |
    When I check "{SavedValue:AwardEGMSID}" boxes in flex table with id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    When I click table top right button "Submit to SAM.gov" in flex table with id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see confirmation box with body "This action will submit subawards to SAM.gov and export a CSV report, classified as 'FFATA Submission Report' under the Files tab, for all associated eligible subawards. Are you sure you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Only the eligible records will proceed for Sam.gov submission. Refresh the page and check the status after some time. |
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "FFATA Report" sub tab
    And I wait for "2" seconds
    And I click toggle button to select "Subawards - All"
    Then I softly do not see field name "FFATAReportNumber__c" is blank in flex table with Id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly do not see field name "FFATAReportVersion__c" is blank in flex table with Id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    And I save the value from row "1" for column name "FFATA Report Number" as "FFATAReportNumber" from flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    And I save the value from row "1" for column name "FFATA Report Version" as "FFATAReportVersion" from flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see value "{SavedValue:FFATAReportNumber}" for title "FFATA Report Number" inside table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see value "{SavedValue:FFATAReportVersion}" for title "FFATA Report Version" inside table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see value "Published" for title "FFATA Report Status" inside table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see value "Processed" for title "Processing Status" inside table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    #546367
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see field "Report Status" as "Completed"
    Then I softly see "Failed Subawards" page block displayed
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:FFATAEligibleSubawardsFailedRecordsTableId---"
    Then I softly see "FAIN" in flex table header "---subAwardStandAlone:-:FFATAEligibleSubawardsFailedRecordsTableId---"
    Then I softly see "EGMS ID" in flex table header "---subAwardStandAlone:-:FFATAEligibleSubawardsFailedRecordsTableId---"
    Then I softly see "Processing Errors" in flex table header "---subAwardStandAlone:-:FFATAEligibleSubawardsFailedRecordsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---subAwardStandAlone:-:FFATAEligibleSubawardsFailedRecordsTableId---"
    And I navigate to "Files" sub tab
    Then I softly see "FFATA Report Files" page block displayed
    Then I softly see value "csv" for title "File Extension" inside table "---subAwardStandAlone:-:FFATAReportFilesTableId---"
    Then I softly see value "txt" for title "File Extension" inside table "---subAwardStandAlone:-:FFATAReportFilesTableId---"
    Then I softly can see row level action button "Download" against "csv" in flex table with id "---subAwardStandAlone:-:FFATAReportFilesTableId---"
    Then I softly can see row level action button "Delete" against "csv" in flex table with id "---subAwardStandAlone:-:FFATAReportFilesTableId---"
    Then I softly can see row level action button "Download" against "txt" in flex table with id "---subAwardStandAlone:-:FFATAReportFilesTableId---"
    Then I softly can see row level action button "Delete" against "txt" in flex table with id "---subAwardStandAlone:-:FFATAReportFilesTableId---"
    #546356
    When I click on "Export" in the page details without processing
    Then I softly see confirmation box with quotes in body "This action will export a CSV report, classified as "FFATA Submission Report" under the Files tab, for all associated eligible subawards. Are you sure you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    And I save the value from row "1" for column name "Title" as "csvFile" from flex table "---subAwardStandAlone:-:FFATAReportFilesTableId---"
    And I click on "Download" icon for "csv" inside flex table with id "---subAwardStandAlone:-:FFATAReportFilesTableId---"
    And I wait for "2" seconds
    And I switch to parent tab
    Then I see row "1" contains value "H173A230074" against the column name "FAIN" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "9100" against the column name "Agency Code" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "{SavedValue:GrantEGMSID}" against the column name "Grant EGMS ID" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Published" against the column name "FFATA Report Status" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "{SavedValue:FFATAReportNumber}" against the column name "Report Number" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "50000.00" against the column name "Award Amount" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "{Date:yyyy-MM-dd}" against the column name "Award Issue Date" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Processed" against the column name "Processing Status" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "VANCOUVER" against the column name "City" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "WA" against the column name "State" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "986614918" against the column name "Zip+Extension" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "USA" against the column name "Country" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Yes" against the column name "Compensation Q1" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "No" against the column name "Compensation Q2" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Yes" against the column name "Compensation Q3" in the Excel file "{SavedValue:csvFile}"
    #547285
    Then I see row "1" contains value "Sarah Davis" against the column name "Employee 1 Full Name" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "80000.00" against the column name "Employee 1 Salary" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Daniel Smith" against the column name "Employee 2 Full Name" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "70000.00" against the column name "Employee 2 Salary" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Emily Johnson" against the column name "Employee 3 Full Name" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "50000.00" against the column name "Employee 3 Salary" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Andrew Miller" against the column name "Employee 4 Full Name" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "40000.00" against the column name "Employee 4 Salary" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "Jessica Brown" against the column name "Employee 5 Full Name" in the Excel file "{SavedValue:csvFile}"
    Then I see row "1" contains value "20000.00" against the column name "Employee 5 Salary" in the Excel file "{SavedValue:csvFile}"
    When I click on "Delete" icon for "{SavedValue:csvFile}" inside flex table with id "---subAwardStandAlone:-:FFATAReportFilesTableId---"
    And I wait for "2" seconds
    Then I softly do not see value "{SavedValue:csvFile}" for title "Title" inside table "---subAwardStandAlone:-:FFATAReportFilesTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    Then I softly see "FFATA Compliance" page block displayed
    Then I softly see value "H173A230074" for title "FAIN" inside table "---subAwardStandAlone:-:FFATAComplianceSectionGrantLayoutTableId---"
    Then I softly see value "9100" for title "Agency Code" inside table "---subAwardStandAlone:-:FFATAComplianceSectionGrantLayoutTableId---"
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---subAwardStandAlone:-:FFATAComplianceSectionGrantLayoutTableId---"
    Then I softly see value "$50,000.00" for title "Award Amount" inside table "---subAwardStandAlone:-:FFATAComplianceSectionGrantLayoutTableId---"
    Then I softly see value "{SavedValue:AwardIssueDate}" for title "Award Issue Date" inside table "---subAwardStandAlone:-:FFATAComplianceSectionGrantLayoutTableId---"
    Then I softly see value "{SavedValue:FFATAReportNumber}" for title "FFATA Report Number" inside table "---subAwardStandAlone:-:FFATAComplianceSectionGrantLayoutTableId---"
    Then I softly see value "Published" for title "FFATA Report Status" inside table "---subAwardStandAlone:-:FFATAComplianceSectionGrantLayoutTableId---"
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "WASHINGTON CENTER FOR DEAF AND HARD OF HEARING YOUTH" in "ActiveAccount" panel
    And I click on "View" icon for "WASHINGTON CENTER FOR DEAF AND HARD OF HEARING YOUTH" inside table
    And I wait for "2" seconds
    Then I softly can see "FFATA Reporting" sub tab at view detail page
    When I navigate to "FFATA Reporting" sub tab
    Then I softly see "FFATA Compliance" page block displayed
    Then I softly see "Executive Compensation" page block displayed
    Then I softly see "Subaward Details for FFATA Compliance" page block displayed
    Then I softly see the text containing "For Subaward FFATA report submission, Question 1 must be answered as ‘Yes’, Question 2 as ‘No’, and a minimum of five employee records must be provided in the Executive Compensation section."
    When I hovering mouse on help text icon inside page block detail "FFATA Compliance"
    Then I softly see "Answer the following questions to determine your organization’s FFATA reporting requirements based on the most recent completed fiscal year." shown as help text
    Then I softly see field "1. In your organization’s most recently completed fiscal year, did you receive $25,000,000 or more in annual gross revenue from Federal procurement contracts (including subcontracts) and Federal awards (including subawards) that are subject to the Transparency Act, as defined at § 170.300?" as "Yes"
    Then I softly see field "2. In your organization’s most recently completed fiscal year, did you receive 80 percent or more of your annual gross revenue from Federal procurement contracts (including subcontracts) and Federal awards (including subawards) that are subject to the Transparency Act, as defined at § 170.300?" as "No"
    Then I softly see field "3. Does the public have access to information about the compensation of the executives in your organization (the legal entity to which your Unique Entity ID (SAM) belongs) through periodic reports filed under section 13(a) or 15(d) of the Securities Exchange Act of 1934 (15 U.S.C. 78m(a), 78o(d)) or section 6104 of the Internal Revenue Code of 1986?" as "Yes"
    When I hovering mouse on help text icon inside page block detail "Executive Compensation"
    Then I softly see "The five top-paid employes information would be sent as FFATA Reporting." shown as help text
    Then I softly see value "Michael Carter" for title "Full Name" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "$10,000.00" for title "Salary ($)" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "Emily Johnson" for title "Full Name" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "$50,000.00" for title "Salary ($)" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "Daniel Smith" for title "Full Name" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "$70,000.00" for title "Salary ($)" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "Sarah Davis" for title "Full Name" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "$80,000.00" for title "Salary ($)" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "Andrew Miller" for title "Full Name" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "$40,000.00" for title "Salary ($)" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "Jessica Brown" for title "Full Name" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "$20,000.00" for title "Salary ($)" inside table "---home:-:executionCompensationTableId---"
    Then I softly see "Subaward EGMS ID" in flex table header "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see "Subaward Title" in flex table header "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see "FFATA Report Due Date" in flex table header "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see "FFATA Report Status" in flex table header "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    When I click on parallel lines menu bar with data target value "Subaward Details for FFATA Compliance"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---" panel
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Subaward EGMS ID" inside table "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see value "{SavedValue:Automation Runtime FFATA Report}" for title "Subaward Title" inside table "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see value "Published" for title "FFATA Report Status" inside table "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    And I save the value from row "1" for column name "FFATA Report Due Date" as "FFATAReportDueDate" from flex table "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see value "{SavedValue:FFATAReportDueDate}" for title "FFATA Report Due Date" inside table "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
#    And I click on hyperlink containing value "{SavedValue:AwardEGMSID}"
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    Then I see the header is "Subaward" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:AwardEGMSID}"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I softly can see "FFATA Reporting" sub tab at view detail page
    When I navigate to "FFATA Reporting" sub tab
    Then I softly see "FFATA Compliance" page block displayed
    Then I softly see "Executive Compensation" page block displayed
    Then I softly see "Subaward Details for FFATA Compliance" page block displayed
    Then I softly see the text containing "For Subaward FFATA report submission, Question 1 must be answered as ‘Yes’, Question 2 as ‘No’, and a minimum of five employee records must be provided in the Executive Compensation section."
    When I hovering mouse on help text icon inside page block detail "FFATA Compliance"
    Then I softly see "Answer the following questions to determine your organization’s FFATA reporting requirements based on the most recent completed fiscal year." shown as help text
    Then I softly see field "1. In your organization’s most recently completed fiscal year, did you receive $25,000,000 or more in annual gross revenue from Federal procurement contracts (including subcontracts) and Federal awards (including subawards) that are subject to the Transparency Act, as defined at § 170.300?" as "Yes"
    Then I softly see field "2. In your organization’s most recently completed fiscal year, did you receive 80 percent or more of your annual gross revenue from Federal procurement contracts (including subcontracts) and Federal awards (including subawards) that are subject to the Transparency Act, as defined at § 170.300?" as "No"
    Then I softly see field "3. Does the public have access to information about the compensation of the executives in your organization (the legal entity to which your Unique Entity ID (SAM) belongs) through periodic reports filed under section 13(a) or 15(d) of the Securities Exchange Act of 1934 (15 U.S.C. 78m(a), 78o(d)) or section 6104 of the Internal Revenue Code of 1986?" as "Yes"
    When I hovering mouse on help text icon inside page block detail "Executive Compensation"
    Then I softly see "The five top-paid employes information would be sent as FFATA Reporting." shown as help text
    Then I softly see value "Michael Carter" for title "Full Name" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "$10,000.00" for title "Salary ($)" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "Emily Johnson" for title "Full Name" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "$50,000.00" for title "Salary ($)" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "Daniel Smith" for title "Full Name" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "$70,000.00" for title "Salary ($)" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "Sarah Davis" for title "Full Name" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "$80,000.00" for title "Salary ($)" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "Andrew Miller" for title "Full Name" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "$40,000.00" for title "Salary ($)" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "Jessica Brown" for title "Full Name" inside table "---home:-:executionCompensationTableId---"
    Then I softly see value "$20,000.00" for title "Salary ($)" inside table "---home:-:executionCompensationTableId---"
    Then I softly see "Subaward EGMS ID" in flex table header "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see "Subaward Title" in flex table header "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see "FFATA Report Due Date" in flex table header "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see "FFATA Report Status" in flex table header "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    When I click on parallel lines menu bar with data target value "Subaward Details for FFATA Compliance"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---" panel
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Subaward EGMS ID" inside table "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see value "{SavedValue:Automation Runtime FFATA Report}" for title "Subaward Title" inside table "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see value "Published" for title "FFATA Report Status" inside table "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    And I save the value from row "1" for column name "FFATA Report Due Date" as "FFATAReportDueDate" from flex table "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see value "{SavedValue:FFATAReportDueDate}" for title "FFATA Report Due Date" inside table "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    When I click on "Delete" icon for "Michael Carter" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Emily Johnson" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Daniel Smith" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Jessica Brown" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Andrew Miller" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Sarah Davis" inside flex table with id "---home:-:executionCompensationTableId---"
    Then I softly see "No Records Found" inside flex table with id "---home:-:executionCompensationTableId---"

  @546344 @ValidatethatPrimarySubrecipientSPIuserscanabletoseeFFATAReportingtabonaccountlayouthaveeditaccessonbelowparticularsectionsunderFFATAReportingtab
  Scenario: Validate that Primary Subrecipient SPI users can able to see FFATA Reporting tab on account layout & have edit accesson below particular sections under FFATA Reporting tab
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I softly can see "FFATA Reporting" sub tab at view detail page
    When I navigate to "FFATA Reporting" sub tab
    Then I softly see "FFATA Compliance" page block displayed
    Then I softly see "Executive Compensation" page block displayed
    Then I softly see "Subaward Details for FFATA Compliance" page block displayed
    Then I softly see the text containing "For Subaward FFATA report submission, Question 1 must be answered as ‘Yes’, Question 2 as ‘No’, and a minimum of five employee records must be provided in the Executive Compensation section."
    When I hovering mouse on help text icon inside page block detail "FFATA Compliance"
    Then I softly see "Answer the following questions to determine your organization’s FFATA reporting requirements based on the most recent completed fiscal year." shown as help text
    When I click on "Edit" in the page details
    Then I see only the following ordered options in dropdown field "FFATAquestion1__c" :
      | --None-- | No | Yes |
    Then I softly see value "Yes" selected as default for the dropdown field "FFATAquestion1__c"
    Then I see only the following ordered options in dropdown field "FFATAquestion2__c" :
      | --None-- | No | Yes |
    Then I softly see value "No" selected as default for the dropdown field "FFATAquestion2__c"
    Then I see only the following ordered options in dropdown field "FFATAquestion3__c" :
      | --None-- | Yes | No |
    Then I softly see value "Yes" selected as default for the dropdown field "FFATAquestion3__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I hovering mouse on help text icon inside page block detail "Executive Compensation"
    Then I softly see "The five top-paid employes information would be sent as FFATA Reporting." shown as help text
    Then I softly see "No Records Found" inside flex table with id "---home:-:executionCompensationTableId---"
    Then I softly can see top right button "New" in flex table with id "---home:-:executionCompensationTableId---"
    Then I softly see "Actions" in flex table header "---home:-:executionCompensationTableId---"
    Then I softly see "Full Name" in flex table header "---home:-:executionCompensationTableId---"
    Then I softly see "Salary ($)" in flex table header "---home:-:executionCompensationTableId---"
    And I click on top right button "New" in flex table with id "---home:-:executionCompensationTableId---"
    Then I softly see field "FullName__c" maximum length is "255" for input field
    And I click on top right button "Save" in flex table with id "---home:-:executionCompensationTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    When I click on parallel lines menu bar with data target value "Executive Compensation"
    And I select "Refresh" from parallel lines dropdown of "Executive Compensation"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---home:-:executionCompensationTableId---" by clicking "New" :
      | Full Name      | Salary ($) |
      | Michael Carter | -20        |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Salary cannot be negative. |
    When I click on parallel lines menu bar with data target value "Executive Compensation"
    And I select "Refresh" from parallel lines dropdown of "Executive Compensation"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---home:-:executionCompensationTableId---" by clicking "New" :
      | Full Name      | Salary ($) |
      | Michael Carter | 20000      |
    Then I softly can see row level action button "Edit" against "Michael Carter" in flex table with id "---home:-:executionCompensationTableId---"
    Then I softly can see row level action button "Delete" against "Michael Carter" in flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Michael Carter" inside table with table id "---home:-:executionCompensationTableId---" without processing
    Then I softly see confirmation box with body "Are you sure you want to delete this record?" is displayed
    When I click modal button "OK"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---home:-:executionCompensationTableId---"
    When I enter the following values into flex table with id "---home:-:executionCompensationTableId---" by clicking "New" :
      | Full Name      | Salary ($) |
      | Michael Carter | 10000      |
      | Emily Johnson  | 50000      |
      | Daniel Smith   | 70000      |
      | Jessica Brown  | 20000      |
      | Andrew Miller  | 40000      |
      | Sarah Brown    | 90000      |
      | Jessica Davis  | 60000      |
      | Sarah Davis    | 5000       |
      | Sarah Miller   | 55000      |
      | Daniel Davis   | 35000      |
      | Sarah Johnson  | 40000      |
    Then I softly see total records count "Total Records: 11" in flex table "---home:-:executionCompensationTableId---"
    And I click on page navigation arrow "---home:-:executionCompensationTableId---" for table id "Next"
    When I click on button "resetIcon" in flex table with id "---home:-:executionCompensationTableId---"
    And I wait for "1" seconds
    When I click on "Delete" icon for "Michael Carter" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Emily Johnson" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Daniel Smith" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Jessica Brown" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Andrew Miller" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Sarah Brown" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Jessica Davis" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Sarah Davis" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Sarah Miller" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Daniel Davis" inside flex table with id "---home:-:executionCompensationTableId---"
    When I click on "Delete" icon for "Sarah Johnson" inside flex table with id "---home:-:executionCompensationTableId---"
    Then I softly see "No Records Found" inside flex table with id "---home:-:executionCompensationTableId---"
    Then I softly see "Subaward Title" in flex table header "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see "FFATA Report Due Date" in flex table header "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see "FFATA Report Status" in flex table header "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    When I click on parallel lines menu bar with data target value "Subaward Details for FFATA Compliance"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    And I save the value from row "1" for column name "Subaward EGMS ID" as "AwardEGMSID" from flex table "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    And I click on hyperlink containing value "{SavedValue:AwardEGMSID}"
    Then I see the header is "Subaward" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:AwardEGMSID}"

  @546360 @ValidateInternalFOFDAuditoruserscanonlyhaveviewaccessforFFATAReportstableunderGrantphase&viewFFATAReportdetailpagelayout
  Scenario: Validate Internal FO FD Auditor users can only have view access for FFATA Reports table under Grant phase & view FFATA Report detail page layout
    When I login to "As a Grantor" app as "SARAH PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I wait for "2" seconds
    And I enter "GrantsFFATA" values from "Award_Field_Values.xlsx"
    And I enter in modal value "Automation Runtime FFATA Report" into field "ProjectTitle__c"
    And I click modal button "Continue"
    And I enter "Grant_Edition_FFATA" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_FFATA" values from "Award_Field_Values.xlsx"
    And I enter value "50000" into field "NewObligation__c"
    And I enter value "50000" into field "TotalCommitment__c"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fataSingleExternalFA}" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                   | Encumbrance |
      | {SavedValue:fataSingleExternalFA} | 50000       |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Construction    | 50000        |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    Then I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name         | Project Role             | Is Key Personnel |
      | Daniel Jacks | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I wait for "3" seconds
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I pause execution for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I see that "Subaward" is in "Activated" status
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant Issue Date" as "AwardIssueDate"
    And I navigate to "Grants" tab
    When I navigate to "FFATA Reports" content inside "Reports" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    When I enter in modal value "Automation Runtime FFATA Report" into field "ReportName__c"
    When I enter in modal value "0" into field "AwardActivationFrom__c"
    When I enter in modal value "3650" into field "AwardActivationTo__c"
    Then I softly see "Save and Continue" modal button
    Then I softly see "Close" modal button
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FFATAEGMSID"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    When I click "Associate" after selection of "FFATA Funding Source 13" in the table "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Subawards added successfully. |
    And I click modal button "Close"
    And I wait for "1" seconds
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "FFATA Reports" content inside "Reports" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---subAwardStandAlone:-:ffataReportTableId---"
    And I perform quick search for "{SavedValue:FFATAEGMSID}" in "---subAwardStandAlone:-:ffataReportTableId---" panel
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly cannot see row level action button "Delete" against "Created" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    When I click on "View" icon for "{SavedValue:FFATAEGMSID}" inside flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Export" in page detail
    Then I softly do not see top right button "Associate" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly do not see top right button "Submit to SAM.gov" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly do not see top right button "Remove" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "FFATA Reports" content inside "Reports" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---subAwardStandAlone:-:ffataReportTableId---"
    And I perform quick search for "{SavedValue:FFATAEGMSID}" in "---subAwardStandAlone:-:ffataReportTableId---" panel
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly cannot see row level action button "Delete" against "Created" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    When I click on "View" icon for "{SavedValue:FFATAEGMSID}" inside flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Export" in page detail
    Then I softly do not see top right button "Associate" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly do not see top right button "Submit to SAM.gov" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly do not see top right button "Remove" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "FFATA Reports" content inside "Reports" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---subAwardStandAlone:-:ffataReportTableId---"
    And I perform quick search for "{SavedValue:FFATAEGMSID}" in "---subAwardStandAlone:-:ffataReportTableId---" panel
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly cannot see row level action button "Delete" against "Created" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    When I click on "View" icon for "{SavedValue:FFATAEGMSID}" inside flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Export" in page detail
    Then I softly do not see top right button "Associate" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly do not see top right button "Submit to SAM.gov" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly do not see top right button "Remove" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"

  @546368 @546369 @ValidatethatemailsenttosubrecipientuserSPIINDwhensubawardiseligibleforFFATAsubmission
  Scenario: Validate that email sent to subrecipient user SPI IND when subaward is eligible for FFATA submission
    When I login to "As a Grantor" app as "SARAH PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I wait for "2" seconds
    And I enter "GrantsFFATA" values from "Award_Field_Values.xlsx"
    And I enter in modal value "Automation Runtime FFATA Report" into field "ProjectTitle__c"
    And I click modal button "Continue"
    And I enter "Grant_Edition_FFATA" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_FFATA" values from "Award_Field_Values.xlsx"
    And I enter value "40000" into field "NewObligation__c"
    And I enter value "40000" into field "TotalCommitment__c"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fataSingleExternalFA}" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                   | Encumbrance |
      | {SavedValue:fataSingleExternalFA} | 40000       |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Construction    | 40000        |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    Then I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name         | Project Role             | Is Key Personnel |
      | Daniel Jacks | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I wait for "3" seconds
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I pause execution for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I see that "Subaward" is in "Activated" status
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant Issue Date" as "AwardIssueDate"
    And I navigate to "Grants" tab
    When I navigate to "FFATA Reports" content inside "Reports" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    When I enter in modal value "Automation Runtime FFATA Report" into field "ReportName__c"
    When I enter in modal value "0" into field "AwardActivationFrom__c"
    When I enter in modal value "3650" into field "AwardActivationTo__c"
    Then I softly see "Save and Continue" modal button
    Then I softly see "Close" modal button
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FFATAEGMSID"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    When I click "Associate" after selection of "FFATA Funding Source 13" in the table "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Subawards added successfully. |
    And I click modal button "Close"
    And I wait for "1" seconds
    And I checkout to yopmail with mailid "danieljacks@yopmail.com"
    And I pause execution for "120" seconds
    Then I refresh the page
    Then I see the mail subject is as follows :
      """
      Sandbox: Notification: Subaward {SavedValue:AwardEGMSID} is applicable for FFATAReporting
      """
    Then I see the mail text is as follows :
      """
       Hello,



       This email to notify you that Subaward {SavedValue:AwardEGMSID} is applicable for FFATA Reporting.



       Log in to the EGMS to update the FFATA Compliance Section.

       Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.



       Thank you.
       The EGMS Team
      """
    #546369
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I navigate to "FFATA Reporting" sub tab
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---" panel
    And I save the value from row "1" for column name "FFATA Report Due Date" as "FFATAReportDueDate" from flex table "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly do not see field name "FFATAReportDueDate__c" is blank in flex table with Id "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"
    Then I softly see value "{SavedValue:FFATAReportDueDate}" for title "FFATA Report Due Date" inside table "---subAwardStandAlone:-:SrOrgSubawardDetailsFFATAComplianceTableId---"