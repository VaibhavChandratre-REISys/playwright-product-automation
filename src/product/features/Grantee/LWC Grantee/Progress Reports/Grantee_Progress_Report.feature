@GranteeProgressReport
Feature: Validate all scenarios for Grantee Progress Report

  @495998 @ValidateFromAppScheduleProgressReportAdminuserPRownercanabletoSubmitProgressReportwithsingleApprover @P2_Grantee @ADMIN_Grantee @GRegression2
  Scenario: Validate From App - Schedule Progress Report Admin user PR owner can able to Submit Progress Report with single Approver
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime award" and opportunity number "CAS-HHS0000660610" with properties "default-GRANTEE ADMIN Username"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime award}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime award}" with properties "default-GRANTEE ADMIN Username"
    And I updated award from application for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    And I re-login to "Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
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
    And I wait for "200" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "progressEGMSID" from flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Scheduled" for title "Report Type" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    And I save the field labeled "EGMS ID" as "progressEGMSID"
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
      | Name       | Progress Report |
      | Victor EXE | Step 1          |
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
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    Then I softly can see top right button "Mark as Submitted" in page detail
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Submitted to Grantor On is required. |
    And I enter in modal "Grantee_Submit Details" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Submitted By" as "SubmittedBy"
    Then I softly see field "Submitted By" as "{SavedValue:SubmittedBy}"
    And I save the field labeled "Submitted On" as "SubmittedOn"
    Then I softly see field "Submitted On" as "{SavedValue:SubmittedOn}"

  @455424 @ProgressReportVerifyEXEusershouldseefooternavigatorafteropentheProgressReport
  Scenario Outline: Progress Report_ Verify EXE user should see footer navigator after open the Progress Report
    Given I login to "Grantee" app as "<User>" user
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{grantee_testData:progressReportStaticData}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{grantee_testData:progressReportStaticData}" inside flex table with id "---grantee_tableId:-:ProgressReports---" without waiting for record
    Then I see the sub-header is "{grantee_testData:progressReportStaticData}" in the page details
    Then I softly see "Navigator" button display on footer
    And I click on bottom button "Navigator" in page detail
    Then I see "Pending Tasks" inside "My Tasks" is displayed
    Then I see "Completed Tasks" inside "My Tasks" is displayed
    Then I see "Schedules" inside "Monitoring" is displayed
    Then I see "Progress Reports" inside "Monitoring" is displayed
    Then I see "Financial Reports" inside "Monitoring" is displayed
    Then I see "Awards Special Conditions" inside "Monitoring" is displayed
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{grantee_testData:progressReportStaticData}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "{grantee_testData:progressReportStaticData}" for title "Award Title" inside table "---grantee_tableId:-:ProgressReports---"
    Then I see "Pending Tasks" inside "My Tasks" is displayed
    Then I see "Completed Tasks" inside "My Tasks" is displayed
    Then I see "Schedules" inside "Monitoring" is displayed
    Then I see "Progress Reports" inside "Monitoring" is displayed
    Then I see "Financial Reports" inside "Monitoring" is displayed
    Then I see "Awards Special Conditions" inside "Monitoring" is displayed
    Examples:
      | User        |
      | GRANTEE EXE |

  @455425 @ProgressReportVerifyEXEusershouldseefooternavigatorafteropentheProgressReport
  Scenario Outline: Progress Report_ Verify FO user should see footer navigator after open the Progress Report
    Given I login to "Grantee" app as "<User>" user
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{grantee_testData:progressReportStaticData}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{grantee_testData:progressReportStaticData}" inside flex table with id "---grantee_tableId:-:ProgressReports---" without waiting for record
    Then I see the sub-header is "{grantee_testData:progressReportStaticData}" in the page details
    Then I softly see "Navigator" button display on footer
    And I click on bottom button "Navigator" in page detail
    Then I see "Pending Tasks" inside "My Tasks" is displayed
    Then I see "Completed Tasks" inside "My Tasks" is displayed
    Then I see "Schedules" inside "Monitoring" is displayed
    Then I see "Progress Reports" inside "Monitoring" is displayed
    Then I see "Financial Reports" inside "Monitoring" is displayed
    Then I see "Awards Special Conditions" inside "Monitoring" is displayed
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{grantee_testData:progressReportStaticData}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "{grantee_testData:progressReportStaticData}" for title "Award Title" inside table "---grantee_tableId:-:ProgressReports---"
    Then I see "Pending Tasks" inside "My Tasks" is displayed
    Then I see "Completed Tasks" inside "My Tasks" is displayed
    Then I see "Schedules" inside "Monitoring" is displayed
    Then I see "Progress Reports" inside "Monitoring" is displayed
    Then I see "Financial Reports" inside "Monitoring" is displayed
    Then I see "Awards Special Conditions" inside "Monitoring" is displayed
    Examples:
      | User       |
      | GRANTEE FO |

  @455422 @ProgressReportVerifyEXEusershouldseefooternavigatorafteropentheProgressReport
  Scenario Outline: Progress Report_ Verify PM user should see footer navigator after open the Progress Report
    Given I login to "Grantee" app as "<User>" user
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{grantee_testData:progressReportStaticData}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{grantee_testData:progressReportStaticData}" inside flex table with id "---grantee_tableId:-:ProgressReports---" without waiting for record
    Then I see the sub-header is "{grantee_testData:progressReportStaticData}" in the page details
    Then I softly see "Navigator" button display on footer
    And I click on bottom button "Navigator" in page detail
    Then I see "Pending Tasks" inside "My Tasks" is displayed
    Then I see "Completed Tasks" inside "My Tasks" is displayed
    Then I see "Schedules" inside "Monitoring" is displayed
    Then I see "Progress Reports" inside "Monitoring" is displayed
    Then I see "Financial Reports" inside "Monitoring" is displayed
    Then I see "Awards Special Conditions" inside "Monitoring" is displayed
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{grantee_testData:progressReportStaticData}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "{grantee_testData:progressReportStaticData}" for title "Award Title" inside table "---grantee_tableId:-:ProgressReports---"
    Then I see "Pending Tasks" inside "My Tasks" is displayed
    Then I see "Completed Tasks" inside "My Tasks" is displayed
    Then I see "Schedules" inside "Monitoring" is displayed
    Then I see "Progress Reports" inside "Monitoring" is displayed
    Then I see "Financial Reports" inside "Monitoring" is displayed
    Then I see "Awards Special Conditions" inside "Monitoring" is displayed
    Examples:
      | User       |
      | GRANTEE PM |

  @444513 @ValidateEXEuserProgressreportOwnercanabltocreateAdhocProgressReportabletosubmitProgressReporttoGrantor @GRegression1 @GranteeTBE @P1_Grantee @EXE_Grantee
  Scenario: Validate EXE user (Progress report Owner)can able to create Adhoc Progress Report & able to submit Progress Report to Grantor
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Victor EXE user"
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
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - My Records"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:ProgressReports---"
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    And I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:ProgressReports---" panel
    And I save the value from row "1" for column name "EGMS ID" as "submittedEGMSID" from flex table "---grantee_tableId:-:ProgressReports---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:submittedEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:submittedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:submittedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:submittedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:ProgressReports---"
    And I click toggle button to select "Progress Reports - Approved"
    And I perform quick search for "Approved" in "---grantee_tableId:-:ProgressReports---" panel
    And I save the value from row "1" for column name "EGMS ID" as "approvedEGMSID" from flex table "---grantee_tableId:-:ProgressReports---"
    Then I softly see value "Approved" for title "Status" against the value "{SavedValue:approvedEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:approvedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:approvedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:approvedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:ProgressReports---"
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:ProgressReports---"
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    Then I softly see "Collapse" button for header
    Then I see the header is "Progress Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:progressEGMSID}"
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
    Then I softly can see "Performance" sub tab at view detail page
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
    Then I softly see field "Submitted By" inside page block
    Then I softly see field "Submitted On" inside page block
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I save the field labeled "Reporting Period End Date" as "ReportingPeriodEndDate"
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ReportingPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as "{SavedValue:ReportingPeriodEndDate}"
    Then I softly see field "Submitted By" as ""
    Then I softly see field "Submitted On" as ""
    And I save the field labeled "EGMS ID" as "progressEGMSID"
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
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Domain" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Measure" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Unit" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Orientation" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Target" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    And I click on "Edit" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see field inside table "masterkpi__r.name" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Title__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Domain__c" not in edit mode
    Then I softly see field inside table "Measure__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Unit__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Orientation__c" not in edit mode
    Then I softly see field inside table "Target__c" not in edit mode
    Then I softly see field inside table "PreviousActual__c" not in edit mode
    Then I softly see field inside table "PreviousDate__c" not in edit mode
    Then I softly see fields "Actual__c" is in edit mode
    Then I softly see fields "ActualDate__c" is in edit mode
    And I refresh the page
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    And I click on "Edit" in the page details
    Then I see textarea field "KeyAccomplishments__c" is editable
    Then I see textarea field "Obstacles__c" is editable
    Then I see textarea field "Plans__c" is editable
    When I enter values into fields
      | Value                          | Field                 |
      | Automation Key Accomplishments | KeyAccomplishments__c |
      | Automation Obstacles           | Obstacles__c          |
      | Automation Plans               | Plans__c              |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments" as "Automation Key Accomplishments" in "Performance Narrative" pageblock
    Then I softly see field "Obstacles" as "Automation Obstacles" in "Performance Narrative" pageblock
    Then I softly see field "Plans" as "Automation Plans" in "Performance Narrative" pageblock
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
    And I wait for "2" seconds
    Then I softly can see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I click on "Delete" icon for "Sarah PM" inside table with table id "---grantee_tableId:-:financialReportPeerReviewTableId---" without processing
    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed
    When I click modal button "OK"
    And I wait for "3" seconds
    Then I softly do not see value "Sarah PM" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I click on "Send for Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Grantee PO" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Enter Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
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
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Victor EXE | Step 1          |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 2          |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Progress Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I click on back arrow
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see that "Funding Organization" rendered in view mode only
    Then I softly see that "Federal Grant or Other Identifying Number" rendered in view mode only
    Then I softly see that "UEI Number" rendered in view mode only
    Then I softly see that "EIN" rendered in view mode only
    Then I softly see that "Internal Organization" rendered in view mode only
    Then I softly see that "Recipient Identifying Number or Account Number" rendered in view mode only
    Then I softly see that "Project/Grant Period" rendered in view mode only
    Then I softly see that "Reporting Period End Date:" rendered in view mode only
    Then I softly see that "Final Report?" rendered in view mode only
    And I enter "Grantee_PSR_form" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "Automation for Execution" into field "Form1Narrative__c"
    And I click on "Cancel" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments:" as "Automation Key Accomplishment" in "Key Accomplishments" pageblock
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Progress Report Overview" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "Key Accomplishments" page block displayed
    Then I softly see "Lessons Learned" page block displayed
    Then I softly see "Future Plans" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Federal Grant or Other Identifying Number" inside page block
    Then I softly see field "UEI Number" inside page block
    Then I softly see field "EIN" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Recipient Identifying Number or Account Number" inside page block
    Then I softly see field "Project/Grant Period" inside page block
    Then I softly see field "Reporting Period End Date:" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Performance Narrative" inside page block
    Then I softly see field "Key Accomplishments:" inside page block
    Then I softly see field "Lessons Learned:" inside page block
    Then I softly see field "Future Plans:" inside page block
    Then I softly see field "Acknowledgement:" inside page block
    Then I softly see field "Submitted By:" inside page block
    Then I softly see field "Submitted On:" inside page block
    And I close the tab
    And I navigate to "Quickview" sub tab in split screen
    When I click on "Splitview" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see top right button "Edit" in the split screen page details
    Then I softly can see top right button "Download as PDF" in the split screen page details
    And I click on hyperlink containing value "{SavedValue:AwardID}"
    Then I softly see field "Status" as "Activated"
    Then I softly see field "EGMS ID" as "{SavedValue:AwardID}"
    And I click on back arrow
    And I click on hyperlink containing value "{SavedValue:progressEGMSID}"
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I see "Upload" button is disabled at modal under library
    And I select Classification as "Progress Report" at upload file modal
    When I upload file "AttachmentTesting.pdf" into library
    And I wait for "2" seconds
    Then I do not see "Upload" button is disabled at modal under library
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I wait for "2" seconds
    And I select Classification as "Progress Report" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly see value "Progress Report" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    When I click on parallel lines menu bar with data target value "Progress Report Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I refresh the page
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
    And I wait for "3" seconds
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
    Then I softly see value "victor.exe.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    And I wait for "1" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Monitoring" tab
    And I wait for "1" seconds
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    And I navigate to "Performance" sub tab
    Then I softly cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly cannot see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:progressReportApprovers---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    Then I softly cannot see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    Then I softly can see top right button "Mark as Submitted" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Name" in flex table header "---grantee_tableId:-:financialReportOwnerTableId---"
    Then I softly see "Responsibility" in flex table header "---grantee_tableId:-:financialReportOwnerTableId---"
    And I save the value from row "1" for column name "Name" as "ownerName" from flex table "---grantee_tableId:-:financialReportOwnerTableId---"
    Then I softly see link "{SavedValue:ownerName}" inside Page block
    And I click on hyperlink containing value "{SavedValue:ownerName}"
    And I wait for "2" seconds
    Then I softly see the text containing "victor.exe@ggp.test8.ggmergeqa2"
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "3" seconds
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Submitted to Grantor On is required. |
    And I enter in modal "Grantee_Submit Details" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
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
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    And I wait for "3" seconds
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
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I navigate to "Chatter" sub tab in split screen
    And I post the message "Automation Test1 Execution" inside chatter
    Then I softly see post "Automation Test1 Execution" by user "Victor EXE"

  @487171 @ValidatethatAuditoruserdonotabletocreateAdhocProgressReportdonotseeanybuttononanysection @P4_Grantee @AUDITOR_Grantee @GRegression4
  Scenario: Validate that Auditor user do not able to create Adhoc Progress Report & do not see any button on any section
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE EXE" user
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
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I enter "Grantee_Creation" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    And I re-login to "Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I cannot see top right button "Submit For Approval" in page detail
    When I navigate to "Overview" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I navigate to "Performance" sub tab
    Then I softly do not see "Actions" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I softly do not see top right button "Send Email" inside flex table "CommunicationHistory"

  @487107 @ValidateEXEuserPRownercanabletoSubmitProgressReportforApprovalApprovedfromassigned4stepapprovercandoSendtoOwnerForwardApprovedactionsseeMarkasSubmittedbuttononceApprovedthePR&seevalidationsonmodal @GRegression1
  Scenario: Validate EXE user PR owner can able to Submit Progress Report for Approval & Approved from assigned 4 step approver & can do Send to Owner Forward Approved actions & see Mark as Submitted button once Approved the PR see validations on modal
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I wait for "2" seconds
    And I "Created" the "Progress Report" for title "{SavedValue:Automation Runtime Award}" with properties "NA_APPROVER_EXE_OWNER"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    When I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    When I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities - At least one approver is required.  |
      | Forms and Files Tab - Attach Progress Report document. |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | David FO | Step 1          |
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | David FO | Step 2          |
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same user for multiple steps for Progress Report |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Victor EXE | Step 1          |
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same step for multiple users for Progress Report. |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Victor EXE | Step 2          |
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 3          |
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name               | Progress Report |
      | Danielle FD Garcia | Step 4          |
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Send to Owner" in the approval decision
    And I wait for "140" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    And I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    When I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I wait for "2" seconds
    And I submit the approval in the approval decision without processing
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Please select appropriate action before submitting. |
    When I select radio button "Approve" in the approval decision
    And I submit the approval in the approval decision
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Comments are required. |
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "David FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 2" for title "Progress Report" against the value "Victor EXE" inside table "---grantee_tableId:-:progressReportApprovers---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly do not see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly do not see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly do not see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    And I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    When I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "2" seconds
    Then I softly can see top right button "Mark as Submitted" in page detail
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Submitted to Grantor On is required. |
    And I enter in modal "Grantee_Submit Details" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "1" seconds
    When I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Submitted By" as "SubmittedBy"
    Then I softly see field "Submitted By" as "{SavedValue:SubmittedBy}"
    And I save the field labeled "Submitted On" as "SubmittedOn"
    Then I softly see field "Submitted On" as "{SavedValue:SubmittedOn}"

  @484558 @ValidateFromAppEXEuserPRownercanabletoSubmitProgressReportforApprovalApprovedfromassigned4stepapprovercandoSendtoOwnerForwardApprovedactionsseeMarkasSubmittedbuttononceApprovedthePRseevalidationsonmodal @GRegression1 @GranteeTBE
  Scenario: Validate From App EXE user PR owner can able to Submit Progress Report for Approval & Approved from assigned 4 step approver & can do Send to Owner Forward Approved actions  see Mark as Submitted button once Approved the PR & see validations on modal
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
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I wait for "2" seconds
    And I "Created" the "Progress Report" for title "{SavedValue:Automation Runtime Opportunity}" with properties "NA_APPROVER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    When I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    When I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities - At least one approver is required.  |
      | Forms and Files Tab - Attach Progress Report document. |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | David FO | Step 1          |
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | David FO | Step 2          |
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same user for multiple steps for Progress Report |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Victor EXE | Step 1          |
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same step for multiple users for Progress Report. |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Victor EXE | Step 2          |
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 3          |
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name               | Progress Report |
      | Danielle FD Garcia | Step 4          |
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Send to Owner" in the approval decision
    And I wait for "120" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    And I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    When I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I wait for "2" seconds
    And I submit the approval in the approval decision without processing
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Please select appropriate action before submitting. |
    When I select radio button "Approve" in the approval decision
    And I submit the approval in the approval decision
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Comments are required. |
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "David FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 2" for title "Progress Report" against the value "Victor EXE" inside table "---grantee_tableId:-:progressReportApprovers---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly do not see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly do not see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly do not see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    And I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    When I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "2" seconds
    Then I softly can see top right button "Mark as Submitted" in page detail
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Submitted to Grantor On is required. |
    And I enter in modal "Grantee_Submit Details" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "1" seconds
    When I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Submitted By" as "SubmittedBy"
    Then I softly see field "Submitted By" as "{SavedValue:SubmittedBy}"
    And I save the field labeled "Submitted On" as "SubmittedOn"
    Then I softly see field "Submitted On" as "{SavedValue:SubmittedOn}"

  @484537 @ValidateFromAppEXEuserprogressreportrecordownercaneditthefieldsonAdhocprogressreportisinCreatedsubmittedforreviewreviewedstates @GRegression1 @EXE_Grantee @P1_Grantee
  Scenario: Validate From App EXE user progress report record owner can edit the fields on Adhoc progress report is in Created submitted for review reviewed states
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
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-Victor EXE user"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I wait for "2" seconds
    And I "Created" the "Progress Report" for title "{SavedValue:Automation Runtime Opportunity}" with properties "NA_APPROVER_EXE_OWNER"
    And I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    When I click on "Edit" in the page details
    Then I softly see fields "ReportingPeriodStartDate__c" is in edit mode
    Then I softly see fields "ReportingPeriodEndDate__c" is in edit mode
    Then I softly see fields "ReportDueDate__c" is in edit mode
    Then I softly see fields "IsFinalReport__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Remove" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:associateModalProgressTableId---"
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly can see row level action button "Remove" against "Sarah PM" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Sarah PM" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role |
      | Sarah PM | Checked        | Other        |
    Then I softly cannot see row level action button "Remove" against "Sarah PM" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Sarah PM" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I navigate to "Performance" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "KeyAccomplishments__c" is in edit mode
    Then I softly see fields "Obstacles__c" is in edit mode
    Then I softly see fields "Plans__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly can see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | David FO | Step 1          |
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    And I enter "Grantee_PSR_form" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I close the tab
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    When I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I click on "Delete" icon for "Notes Record" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "Grantee PO" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see fields "ReportingPeriodStartDate__c" is in edit mode
    Then I softly see fields "ReportingPeriodEndDate__c" is in edit mode
    Then I softly see fields "ReportDueDate__c" is in edit mode
    Then I softly see fields "IsFinalReport__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Remove" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I click "Associate" after selection of "David FO" in the table "---grantee_tableId:-:associateModalProgressTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly can see row level action button "Remove" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role |
      | David FO | Checked        | Other        |
    Then I softly cannot see row level action button "Remove" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I navigate to "Performance" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "KeyAccomplishments__c" is in edit mode
    Then I softly see fields "Obstacles__c" is in edit mode
    Then I softly see fields "Plans__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Sarah PM      | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Victor EXE | Step 2          |
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    And I enter value "Automation Test Execution" into field "PerformanceNarrative__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Performance Narrative" as "Automation Test Execution" in "Performance Narrative" pageblock
    And I close the tab
    And I wait for "2" seconds
    Then I softly see value "Progress Report" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Other" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    When I click on "Delete" icon for "Other" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I wait for "2" seconds
    Then I softly do not see value "Other" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    And I wait for "2" seconds
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    When I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see fields "ReportingPeriodStartDate__c" is in edit mode
    Then I softly see fields "ReportingPeriodEndDate__c" is in edit mode
    Then I softly see fields "ReportDueDate__c" is in edit mode
    Then I softly see fields "IsFinalReport__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Remove" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Remove" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I click "Associate" after selection of "Danielle FD Garcia" in the table "---grantee_tableId:-:associateModalProgressTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly can see row level action button "Remove" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---" by clicking "Edit" :
      | Name               | Is Key Contact | Project Role |
      | Danielle FD Garcia | Checked        | Other        |
    Then I softly cannot see row level action button "Remove" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I navigate to "Performance" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "KeyAccomplishments__c" is in edit mode
    Then I softly see fields "Obstacles__c" is in edit mode
    Then I softly see fields "Plans__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name               | Progress Report |
      | Danielle FD Garcia | Step 3          |
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    Then I softly can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    Then I softly can see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    And I enter value "Automation Test Data" into field "PerformanceNarrative__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Performance Narrative" as "Automation Test Data" in "Performance Narrative" pageblock
    And I close the tab
    And I wait for "2" seconds
    Then I softly see value "Progress Report" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Other" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    When I click on "Delete" icon for "Other" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Other" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly do not see value "Other" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"

  @484556 @ValidateFromAppEXEuserprogressreportrecordownercanseeAdhocPRcanbecreatedforactiveawardsseerequiredtoSavevalidationsondetailspagelayoutwhenRequiredfieldskeptblankothervalidationsonValidatebuttondeletePR @GRegression1 @P2_Grantee @PM_Grantee
  Scenario: Validate From App EXE user (progress report record owner)can see Ad hoc PR can be created only for active awards & see required to Save validations on details page layout when Required fields kept blank & other validations on Validate button& delete PR
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
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-Victor EXE user"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I enter in modal value "1" into field "ReportDueDate__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | The Reporting Due Date cannot be before the Reporting Period End Date |
    And I enter "Grantee_Creation" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Forms and Files Tab - Attach Progress Report document.        |
      | Performance Tab - Provide 'Reported Value As Of' for the KPI. |
      | Responsibilities - At least one approver is required.         |
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I save the field labeled "Reporting Period End Date" as "ReportingPeriodEndDate"
    And I save the field labeled "Report Due Date" as "ReportDueDate"
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    And I click on "Edit" in the page details
    And I clear the value from field "ReportingPeriodStartDate__c"
    And I clear the value from field "ReportingPeriodEndDate__c"
    And I clear the value from field "ReportDueDate__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Reporting Period Start Date is required in the Overview tab under the Report Overview section. |
      | To Save, Reporting Period End Date is required in the Overview tab under the Report Overview section.   |
      | To Save, Report Due Date is required in the Overview tab under the Report Overview section.             |
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - My Records"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    When I click on "Delete" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    And I wait for "1" seconds
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:grantProgressReportTableId---"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I navigate to "Management" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:ProgressReportTableId---"

  @484536 @ValidateFromAppPMusercanabletocreateScheduledtypeofProgressReportbyenteringReportCreationDateseeheaderstatus&StepProgressBartabslandingtabsbuttonsectionsunderalltabsofanyPRseetaskcreation @PM_Grantee @P2_Grantee @GRegression1
  Scenario: Validate From App PM user can able to create Scheduled type of Progress Report by entering Report Creation Date & see  header, status & Step Progress Bar,  tabs , landing tabs , button & sections under all tabs of any PR & see task creation
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime award" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime award}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
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
    And I wait for "220" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "progressEGMSID" from flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Scheduled" for title "Report Type" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - My Records"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:ProgressReports---"
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    And I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:ProgressReports---"
    And I click toggle button to select "Progress Reports - Approved"
    And I perform quick search for "Approved" in "---grantee_tableId:-:ProgressReports---" panel
    And I save the value from row "1" for column name "EGMS ID" as "approvedEGMSID" from flex table "---grantee_tableId:-:ProgressReports---"
    Then I softly see value "Approved" for title "Status" against the value "{SavedValue:approvedEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:approvedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:approvedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:approvedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:ProgressReports---"
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:ProgressReports---"
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    Then I softly see "Collapse" button for header
    Then I see the header is "Progress Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:progressEGMSID}"
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
    Then I softly can see "Performance" sub tab at view detail page
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
    Then I softly see field "Submitted By" inside page block
    Then I softly see field "Submitted On" inside page block
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I save the field labeled "Reporting Period End Date" as "ReportingPeriodEndDate"
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ReportingPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as "{SavedValue:ReportingPeriodEndDate}"
    Then I softly see field "Submitted By" as ""
    Then I softly see field "Submitted On" as ""
    And I save the field labeled "EGMS ID" as "progressEGMSID"
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
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Domain" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Measure" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Unit" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Orientation" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Target" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    And I click on "Edit" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see field inside table "masterkpi__r.name" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Title__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Domain__c" not in edit mode
    Then I softly see field inside table "Measure__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Unit__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Orientation__c" not in edit mode
    Then I softly see field inside table "Target__c" not in edit mode
    Then I softly see field inside table "PreviousActual__c" not in edit mode
    Then I softly see field inside table "PreviousDate__c" not in edit mode
    Then I softly see fields "Actual__c" is in edit mode
    Then I softly see fields "ActualDate__c" is in edit mode
    And I refresh the page
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    And I click on "Edit" in the page details
    Then I see textarea field "KeyAccomplishments__c" is editable
    Then I see textarea field "Obstacles__c" is editable
    Then I see textarea field "Plans__c" is editable
    When I enter values into fields
      | Value                          | Field                 |
      | Automation Key Accomplishments | KeyAccomplishments__c |
      | Automation Obstacles           | Obstacles__c          |
      | Automation Plans               | Plans__c              |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments" as "Automation Key Accomplishments" in "Performance Narrative" pageblock
    Then I softly see field "Obstacles" as "Automation Obstacles" in "Performance Narrative" pageblock
    Then I softly see field "Plans" as "Automation Plans" in "Performance Narrative" pageblock
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
    And I wait for "3" seconds
    Then I softly do not see value "Sarah PM" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I click on "Send for Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I pause execution for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Grantee PO" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Enter Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
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
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 1          |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Victor EXE | Step 2          |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | David FO | Step 3          |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name               | Progress Report |
      | Danielle FD Garcia | Step 4          |
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Progress Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I click on back arrow
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly see new tab is opened
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see that "Funding Organization" rendered in view mode only
    Then I softly see that "Federal Grant or Other Identifying Number" rendered in view mode only
    Then I softly see that "UEI Number" rendered in view mode only
    Then I softly see that "EIN" rendered in view mode only
    Then I softly see that "Internal Organization" rendered in view mode only
    Then I softly see that "Recipient Identifying Number or Account Number" rendered in view mode only
    Then I softly see that "Project/Grant Period" rendered in view mode only
    Then I softly see that "Reporting Period End Date:" rendered in view mode only
    Then I softly see that "Final Report?" rendered in view mode only
    And I enter "Grantee_PSR_form" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "Automation for Execution" into field "Form1Narrative__c"
    And I click on "Cancel" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments:" as "Automation Key Accomplishment" in "Key Accomplishments" pageblock
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I wait for "3" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Progress Report Overview" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "Key Accomplishments" page block displayed
    Then I softly see "Lessons Learned" page block displayed
    Then I softly see "Future Plans" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Federal Grant or Other Identifying Number" inside page block
    Then I softly see field "UEI Number" inside page block
    Then I softly see field "EIN" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Recipient Identifying Number or Account Number" inside page block
    Then I softly see field "Project/Grant Period" inside page block
    Then I softly see field "Reporting Period End Date:" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Performance Narrative" inside page block
    Then I softly see field "Key Accomplishments:" inside page block
    Then I softly see field "Lessons Learned:" inside page block
    Then I softly see field "Future Plans:" inside page block
    Then I softly see field "Acknowledgement:" inside page block
    Then I softly see field "Submitted By:" inside page block
    Then I softly see field "Submitted On:" inside page block
    And I close the tab
    And I navigate to "Quickview" sub tab in split screen
    When I click on "Splitview" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see top right button "Edit" in the split screen page details
    Then I softly can see top right button "Download as PDF" in the split screen page details
    And I click on hyperlink containing value "{SavedValue:AwardID}"
    Then I softly see field "Status" as "Activated"
    Then I softly see field "EGMS ID" as "{SavedValue:AwardID}"
    And I click on back arrow
    And I click on hyperlink containing value "{SavedValue:progressEGMSID}"
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "7" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I wait for "7" seconds
    And I select Classification as "Progress Report" at upload file modal
    When I upload file "AttachmentTesting.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Progress Report" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly see value "Progress Report" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    And I click on "Download" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---" without waiting for record
    And I wait for "2" seconds
    And I download the file
    And I wait for "4" seconds
    Then I softly verify that the file "Automation.pdf" is downloaded
    And I switch to parent tab
    When I click on "Delete" icon for "Automation.pdf" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I wait for "2" seconds
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    When I click on parallel lines menu bar with data target value "Progress Report Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
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
    And I wait for "3" seconds
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
    Then I softly see value "sarah.pm.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    And I navigate to "Performance" sub tab
    Then I softly cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly cannot see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:progressReportApprovers---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    Then I softly cannot see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    Then I softly can see top right button "Mark as Submitted" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Name" in flex table header "---grantee_tableId:-:financialReportOwnerTableId---"
    Then I softly see "Responsibility" in flex table header "---grantee_tableId:-:financialReportOwnerTableId---"
    And I save the value from row "1" for column name "Name" as "ownerName" from flex table "---grantee_tableId:-:financialReportOwnerTableId---"
    Then I softly see link "{SavedValue:ownerName}" inside Page block
    And I click on hyperlink containing value "{SavedValue:ownerName}"
    Then I softly see the text containing "victor.exe@ggp.test8.ggmergeqa2"
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "2" seconds
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Submitted to Grantor On is required. |
    And I enter in modal "Grantee_Submit Details" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "2" seconds
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
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I navigate to "Chatter" sub tab in split screen
    And I post the message "Automation Test1 Execution" inside chatter
    Then I softly see post "Automation Test1 Execution" by user "Sarah PM"

  @487168 @validatepouser(awardowner)canabletocreateadhocprogressreport&abletosubmitprogressreporttograntor @PO_Grantee @GRegression1 @P1_Grantee
  Scenario: validate  PO user (Award Owner)can able to create Adhoc Progress Report & able to submit Progress Report to Grantor
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
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - My Records"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:ProgressReports---"
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    And I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:ProgressReports---" panel
    And I save the value from row "1" for column name "EGMS ID" as "submittedEGMSID" from flex table "---grantee_tableId:-:ProgressReports---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:submittedEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:submittedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:submittedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:submittedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:ProgressReports---"
    And I click toggle button to select "Progress Reports - Approved"
    And I perform quick search for "Approved" in "---grantee_tableId:-:ProgressReports---" panel
    And I save the value from row "1" for column name "EGMS ID" as "approvedEGMSID" from flex table "---grantee_tableId:-:ProgressReports---"
    Then I softly see value "Approved" for title "Status" against the value "{SavedValue:approvedEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:approvedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:approvedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:approvedEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:ProgressReports---"
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:ProgressReports---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:ProgressReports---"
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    Then I softly see "Collapse" button for header
    Then I see the header is "Progress Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:progressEGMSID}"
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
    Then I softly can see "Performance" sub tab at view detail page
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
    Then I softly see field "Submitted By" inside page block
    Then I softly see field "Submitted On" inside page block
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I save the field labeled "Reporting Period End Date" as "ReportingPeriodEndDate"
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ReportingPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as "{SavedValue:ReportingPeriodEndDate}"
    Then I softly see field "Submitted By" as ""
    Then I softly see field "Submitted On" as ""
    And I save the field labeled "EGMS ID" as "progressEGMSID"
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
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Domain" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Measure" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Unit" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Orientation" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Target" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    And I click on "Edit" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see field inside table "masterkpi__r.name" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Title__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Domain__c" not in edit mode
    Then I softly see field inside table "Measure__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Unit__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Orientation__c" not in edit mode
    Then I softly see field inside table "Target__c" not in edit mode
    Then I softly see field inside table "PreviousActual__c" not in edit mode
    Then I softly see field inside table "PreviousDate__c" not in edit mode
    Then I softly see fields "Actual__c" is in edit mode
    Then I softly see fields "ActualDate__c" is in edit mode
    And I refresh the page
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    And I click on "Edit" in the page details
    Then I see textarea field "KeyAccomplishments__c" is editable
    Then I see textarea field "Obstacles__c" is editable
    Then I see textarea field "Plans__c" is editable
    When I enter values into fields
      | Value                          | Field                 |
      | Automation Key Accomplishments | KeyAccomplishments__c |
      | Automation Obstacles           | Obstacles__c          |
      | Automation Plans               | Plans__c              |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments" as "Automation Key Accomplishments" in "Performance Narrative" pageblock
    Then I softly see field "Obstacles" as "Automation Obstacles" in "Performance Narrative" pageblock
    Then I softly see field "Plans" as "Automation Plans" in "Performance Narrative" pageblock
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
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Sarah PM      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I wait for "2" seconds
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
    And I wait for "3" seconds
    Then I softly do not see value "Sarah PM" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I click on "Send for Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Grantee PO" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Enter Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Grantee PO | Step 1          |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 2          |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Progress Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I click on back arrow
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see that "Funding Organization" rendered in view mode only
    Then I softly see that "Federal Grant or Other Identifying Number" rendered in view mode only
    Then I softly see that "UEI Number" rendered in view mode only
    Then I softly see that "EIN" rendered in view mode only
    Then I softly see that "Internal Organization" rendered in view mode only
    Then I softly see that "Recipient Identifying Number or Account Number" rendered in view mode only
    Then I softly see that "Project/Grant Period" rendered in view mode only
    Then I softly see that "Reporting Period End Date:" rendered in view mode only
    Then I softly see that "Final Report?" rendered in view mode only
    And I enter "Grantee_PSR_form" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "Automation for Execution" into field "Form1Narrative__c"
    And I click on "Cancel" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments:" as "Automation Key Accomplishment" in "Key Accomplishments" pageblock
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Progress Report Overview" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "Key Accomplishments" page block displayed
    Then I softly see "Lessons Learned" page block displayed
    Then I softly see "Future Plans" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Federal Grant or Other Identifying Number" inside page block
    Then I softly see field "UEI Number" inside page block
    Then I softly see field "EIN" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Recipient Identifying Number or Account Number" inside page block
    Then I softly see field "Project/Grant Period" inside page block
    Then I softly see field "Reporting Period End Date:" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Performance Narrative" inside page block
    Then I softly see field "Key Accomplishments:" inside page block
    Then I softly see field "Lessons Learned:" inside page block
    Then I softly see field "Future Plans:" inside page block
    Then I softly see field "Acknowledgement:" inside page block
    Then I softly see field "Submitted By:" inside page block
    Then I softly see field "Submitted On:" inside page block
    And I close the tab
    And I navigate to "Quickview" sub tab in split screen
    When I click on "Splitview" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see top right button "Edit" in the split screen page details
    Then I softly can see top right button "Download as PDF" in the split screen page details
    And I click on hyperlink containing value "{SavedValue:AwardID}"
    Then I softly see field "Status" as "Activated"
    Then I softly see field "EGMS ID" as "{SavedValue:AwardID}"
    And I click on back arrow
    And I click on hyperlink containing value "{SavedValue:progressEGMSID}"
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I see "Upload" button is disabled at modal under library
    And I select Classification as "Progress Report" at upload file modal
    When I upload file "AttachmentTesting.pdf" into library
    And I wait for "2" seconds
    Then I do not see "Upload" button is disabled at modal under library
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I wait for "2" seconds
    And I select Classification as "Progress Report" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly see value "Progress Report" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    When I click on parallel lines menu bar with data target value "Progress Report Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I refresh the page
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
    And I wait for "3" seconds
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
    Then I softly see value "govgrantsuat@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    And I wait for "1" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Monitoring" tab
    And I wait for "1" seconds
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    And I navigate to "Performance" sub tab
    Then I softly cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly cannot see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:progressReportApprovers---"
    Then I softly cannot see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    Then I softly cannot see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    Then I softly can see top right button "Mark as Submitted" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Name" in flex table header "---grantee_tableId:-:financialReportOwnerTableId---"
    Then I softly see "Responsibility" in flex table header "---grantee_tableId:-:financialReportOwnerTableId---"
    And I save the value from row "1" for column name "Name" as "ownerName" from flex table "---grantee_tableId:-:financialReportOwnerTableId---"
    Then I softly see link "{SavedValue:ownerName}" inside Page block
    And I click on hyperlink containing value "{SavedValue:ownerName}"
    And I wait for "2" seconds
    Then I softly see the text containing "grantee.po@yopmail.com.ggmergeqa2"
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "3" seconds
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Submitted to Grantor On is required. |
    And I enter in modal "Grantee_Submit Details" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
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
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    And I wait for "3" seconds
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
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I navigate to "Chatter" sub tab in split screen
    And I post the message "Automation Test1 Execution" inside chatter
    Then I softly see post "Automation Test1 Execution" by user "Grantee PO"

  @444487 @ValidatePMusercanabletocreateScheduledtypeofProgressReportbyenteringReportCreationDate&seeheaderstatus&StepProgressBartabslandingtabsbutton&sectionsunderalltabsofanyProgressReport&seetaskcreation&email
  Scenario: Validate PM user can able to create Scheduled type of Progress Report by entering Report Creation Date & see header status & Step Progress Bar tabs landing tabs button & sections under all tabs of any Progress Report & see task creation & email
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
    And I wait for "180" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "progressEGMSID" from flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Scheduled" for title "Report Type" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    Then I softly see value "Complete Grantee Progress Report" for title "Task Type" inside table "---grantee_tableId:-:HomePendingTask---"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    Then I softly see "Collapse" button for header
    Then I see the header is "Progress Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:progressEGMSID}"
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
    Then I softly can see "Performance" sub tab at view detail page
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
    Then I softly see field "Submitted By" inside page block
    Then I softly see field "Submitted On" inside page block
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I save the field labeled "Reporting Period End Date" as "ReportingPeriodEndDate"
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ReportingPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as "{SavedValue:ReportingPeriodEndDate}"
    Then I softly see field "Submitted By" as ""
    Then I softly see field "Submitted On" as ""
    And I save the field labeled "EGMS ID" as "progressEGMSID"
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
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Domain" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Measure" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Unit" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Orientation" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Target" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    And I click on "Edit" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see field inside table "masterkpi__r.name" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Title__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Domain__c" not in edit mode
    Then I softly see field inside table "Measure__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Unit__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Orientation__c" not in edit mode
    Then I softly see field inside table "Target__c" not in edit mode
    Then I softly see field inside table "PreviousActual__c" not in edit mode
    Then I softly see field inside table "PreviousDate__c" not in edit mode
    Then I softly see fields "Actual__c" is in edit mode
    Then I softly see fields "ActualDate__c" is in edit mode
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    Then I see textarea field "KeyAccomplishments__c" is editable
    Then I see textarea field "Obstacles__c" is editable
    Then I see textarea field "Plans__c" is editable
    When I enter values into fields
      | Value                          | Field                 |
      | Automation Key Accomplishments | KeyAccomplishments__c |
      | Automation Obstacles           | Obstacles__c          |
      | Automation Plans               | Plans__c              |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments" as "Automation Key Accomplishments" in "Performance Narrative" pageblock
    Then I softly see field "Obstacles" as "Automation Obstacles" in "Performance Narrative" pageblock
    Then I softly see field "Plans" as "Automation Plans" in "Performance Narrative" pageblock
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Progress Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Progress Reports" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "View" against "Progress Reports" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Reports" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Reports" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Reports" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
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

  @487105 @validatepmuser(awardowner)canabletocreatescheduledprogressreport&abletosubmitprogressreporttograntor  @P1_Grantee @PM_Grantee @GRegression1 @sprint15
  Scenario: Validate PM user (Award Owner)can able to create Scheduled Progress Report & able to submit Progress Report to Grantor
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime award" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime award}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    And I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
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
    And I wait for "400" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "progressEGMSID" from flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Scheduled" for title "Report Type" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    And I save the field labeled "EGMS ID" as "progressEGMSID"
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
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Victor EXE | Step 2          |
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 3          |
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name               | Progress Report |
      | Danielle FD Garcia | Step 4          |
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
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    Then I softly can see top right button "Mark as Submitted" in page detail
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Submitted to Grantor On is required. |
    And I enter in modal "Grantee_Submit Details" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Submitted By" as "SubmittedBy"
    Then I softly see field "Submitted By" as "{SavedValue:SubmittedBy}"
    And I save the field labeled "Submitted On" as "SubmittedOn"
    Then I softly see field "Submitted On" as "{SavedValue:SubmittedOn}"

  @483999 @ValidateFromAppPOuserseevalidationonProgressReportlayout @P2_Grantee @PO_Grantee @Gregression2
  Scenario: Validate From App  PO user see validation on Progress Report layout
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
    And I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I enter in modal value "1" into field "ReportDueDate__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | The Reporting Due Date cannot be before the Reporting Period End Date |
    And I enter "Grantee_Creation" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Forms and Files Tab - Attach Progress Report document.        |
      | Performance Tab - Provide 'Reported Value As Of' for the KPI. |
      | Responsibilities - At least one approver is required.         |
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I save the field labeled "Reporting Period End Date" as "ReportingPeriodEndDate"
    And I save the field labeled "Report Due Date" as "ReportDueDate"
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    And I click on "Edit" in the page details
    And I clear the value from field "ReportingPeriodStartDate__c"
    And I clear the value from field "ReportingPeriodEndDate__c"
    And I clear the value from field "ReportDueDate__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Reporting Period Start Date is required in the Overview tab under the Report Overview section. |
      | To Save, Reporting Period End Date is required in the Overview tab under the Report Overview section.   |
      | To Save, Report Due Date is required in the Overview tab under the Report Overview section.             |
    And I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    When I click modal button "OK"
    And I save the field labeled "EGMS ID" as "progressEGMSID"
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
      | Name       | Progress Report |
      | Victor EXE | Step 1          |
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |

  @444488 @validateEXEuser(progressreportrecordowner)caneditthefieldsonAdhocprogressreportisinCreated,submittedforreview/reviewedstates
  Scenario:Validate EXE user (progress report record owner) can edit the fields on  Adhoc progress report is in Created, submitted for review/reviewed states
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    And I wait for "3" seconds
    And I "Created" the "Progress Report" for title "{SavedValue:Automation Runtime award}" with properties "NA_APPROVER_EXE_OWNER"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Delete" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    When I click on "Edit" in the page details
    Then I softly see fields "ReportingPeriodStartDate__c" is in edit mode
    Then I softly see fields "ReportingPeriodEndDate__c" is in edit mode
    Then I softly see fields "ReportDueDate__c" is in edit mode
    Then I softly see fields "IsFinalReport__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "1" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:associateModalProgressTableId---"
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly can see row level action button "Remove" against "Sarah PM" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Sarah PM" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role |
      | Sarah PM | Checked        | Other        |
    Then I softly cannot see row level action button "Remove" against "Sarah PM" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Sarah PM" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I navigate to "Performance" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "KeyAccomplishments__c" is in edit mode
    Then I softly see fields "Obstacles__c" is in edit mode
    Then I softly see fields "Plans__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly can see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | David FO | Step 1          |
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    And I enter "Grantee_PSR_form" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I close the tab
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    When I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I click on "Delete" icon for "Notes Record" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "Grantee PO" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see fields "ReportingPeriodStartDate__c" is in edit mode
    Then I softly see fields "ReportingPeriodEndDate__c" is in edit mode
    Then I softly see fields "ReportDueDate__c" is in edit mode
    Then I softly see fields "IsFinalReport__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I click "Associate" after selection of "David FO" in the table "---grantee_tableId:-:associateModalProgressTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly can see row level action button "Remove" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role |
      | David FO | Checked        | Other        |
    Then I softly cannot see row level action button "Remove" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I navigate to "Performance" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "KeyAccomplishments__c" is in edit mode
    Then I softly see fields "Obstacles__c" is in edit mode
    Then I softly see fields "Plans__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Sarah PM      | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Victor EXE | Step 2          |
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    And I enter value "Automation Test Execution" into field "PerformanceNarrative__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Performance Narrative" as "Automation Test Execution" in "Performance Narrative" pageblock
    And I close the tab
    And I wait for "2" seconds
    Then I softly see value "Progress Report" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Other" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    When I click on "Delete" icon for "Other" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I wait for "2" seconds
    Then I softly do not see value "Other" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    And I wait for "2" seconds
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    When I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see fields "ReportingPeriodStartDate__c" is in edit mode
    Then I softly see fields "ReportingPeriodEndDate__c" is in edit mode
    Then I softly see fields "ReportDueDate__c" is in edit mode
    Then I softly see fields "IsFinalReport__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Remove" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "David FO" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I click "Associate" after selection of "Danielle FD Garcia" in the table "---grantee_tableId:-:associateModalProgressTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly can see row level action button "Remove" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---" by clicking "Edit" :
      | Name               | Is Key Contact | Project Role |
      | Danielle FD Garcia | Checked        | Other        |
    Then I softly cannot see row level action button "Remove" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I navigate to "Performance" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "KeyAccomplishments__c" is in edit mode
    Then I softly see fields "Obstacles__c" is in edit mode
    Then I softly see fields "Plans__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name               | Progress Report |
      | Danielle FD Garcia | Step 3          |
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    Then I softly can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    Then I softly can see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    And I enter value "Automation Test Data" into field "PerformanceNarrative__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Performance Narrative" as "Automation Test Data" in "Performance Narrative" pageblock
    And I close the tab
    And I wait for "2" seconds
    Then I softly see value "Progress Report" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Other" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    When I click on "Delete" icon for "Other" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Other" inside flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly do not see value "Other" for title "Classification" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"

  @444524 @validateEXEuser(PRowner)canabletoSubmitProgressReportforapproval&Approvedfromassigned4stepapprover&candoSendtoOwner/Forward/Approvedactions&see'MarkasSubmitted'buttononceApprovedthePR&seevalidationsonmodal
  Scenario: Validate EXE user(PR owner) can able to Submit Progress Report for Approval & Approved from assigned 4 step approver & can do Send to Owner/ Forward/ Approved actions & see 'Mark as Submitted' button once Approved the PR & see validations on modal
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    And I wait for "3" seconds
    And I "Created" the "Progress Report" for title "{SavedValue:Automation Runtime award}" with properties "NA_APPROVER_EXE_OWNER"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    And I wait for "3" seconds
    When I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities - At least one approver is required.  |
      | Forms and Files Tab - Attach Progress Report document. |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | David FO | Step 1          |
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | David FO | Step 2          |
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same user for multiple steps for Progress Report |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Victor EXE | Step 1          |
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same step for multiple users for Progress Report. |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Victor EXE | Step 2          |
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 3          |
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name               | Progress Report |
      | Danielle FD Garcia | Step 4          |
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:progressReportApprovers---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Send to Owner" in the approval decision
    And I wait for "140" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    And I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    When I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I wait for "2" seconds
    And I submit the approval in the approval decision without processing
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Please select appropriate action before submitting. |
    When I select radio button "Approve" in the approval decision
    And I submit the approval in the approval decision
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Comments are required. |
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "David FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 2" for title "Progress Report" against the value "Victor EXE" inside table "---grantee_tableId:-:progressReportApprovers---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly do not see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly do not see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly do not see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    And I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    When I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "2" seconds
    Then I softly can see top right button "Mark as Submitted" in page detail
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Submitted to Grantor On is required. |
    And I enter in modal "Grantee_Submit Details" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "1" seconds
    When I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Submitted By" as "SubmittedBy"
    Then I softly see field "Submitted By" as "{SavedValue:SubmittedBy}"
    And I save the field labeled "Submitted On" as "SubmittedOn"
    Then I softly see field "Submitted On" as "{SavedValue:SubmittedOn}"

  @484561 @ValidateasEXEuser(progressreportrecordowner)canseefieldsonCreateProgressreportmodal&validationsonmodal
  Scenario: Validate as EXE user (progress report record owner) can see fields on Create Progress report modal & validations on modala
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Victor EXE user"
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
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I wait for "2" seconds
    And I enter in modal value "-3000" into field "ReportDueDate__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | The Reporting Due Date cannot be before the Reporting Period End Date |
    And I wait for "4" seconds
    And I clear the value from field "ReportingPeriodStartDate__c"
    And I enter in modal value "4000" into field "ReportingPeriodStartDate__c"
    And I enter in modal value "4000" into field "ReportDueDate__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | The Reporting Period Start Date cannot be after the Reporting Period End Date |
    And I wait for "3" seconds
    And I clear the value from field "ReportingPeriodStartDate__c"
    And I clear the value from field "ReportingPeriodEndDate__c"
    And I clear the value from field "ReportDueDate__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Reporting Period Start Date is required. |
      | To Save, Reporting Period End Date is required.   |
      | To Save, Report Due Date is required.             |

  @444491 @validatePMuser(progressreportrecordowner)canseevalidationsonwhilesubmitting2ndSceduledProgressReportforApproval,IfpreviouslyFinalreportisapprovedonSceduleProgressReport&UnmarkProgressReportduringRevisethenscedulescando
  Scenario: Validate PM user (progress report record owner) can see  validations on while submitting 2nd Sceduled Progress Report for Approval, If previously Final report is approved on Scedule Progress Report & Unmark Progress Report during Revise then scedules can do
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
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Report Creation Date |
      | {SavedValue:EGMS ID1} | 0                    |
    And I wait for "200" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "progressEGMSID" from flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Scheduled" for title "Report Type" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - My Records"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "Edit" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    Then I softly see "Collapse" button for header
    Then I see the header is "Progress Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:progressEGMSID}"
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
    Then I softly can see "Performance" sub tab at view detail page
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
    Then I softly see field "Submitted By" inside page block
    Then I softly see field "Submitted On" inside page block
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I save the field labeled "Reporting Period End Date" as "ReportingPeriodEndDate"
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ReportingPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as "{SavedValue:ReportingPeriodEndDate}"
    Then I softly see field "Submitted By" as ""
    Then I softly see field "Submitted On" as ""
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    And I click on "Edit" in the page details
    Then I softly see fields "ReportingPeriodStartDate__c" is in edit mode
    Then I softly see fields "ReportingPeriodEndDate__c" is in edit mode
    Then I softly see fields "ReportDueDate__c" is in edit mode
    Then I softly see fields "IsFinalReport__c" is in edit mode
    And I enter value "Checked" into field "IsFinalReport__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    And I click on "Edit" in the page details
    Then I see textarea field "KeyAccomplishments__c" is editable
    Then I see textarea field "Obstacles__c" is editable
    Then I see textarea field "Plans__c" is editable
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
      | Sarah PM | Step 1          |
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Progress Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "cross" symbol against the value "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "2" seconds
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly see new tab is opened
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I enter "Grantee_PSR_form" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "Automation for Execution" into field "Form1Narrative__c"
    And I click on "Cancel" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments:" as "Automation Key Accomplishment" in "Key Accomplishments" pageblock
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I wait for "3" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I wait for "7" seconds
    And I select Classification as "Progress Report" at upload file modal
    When I upload file "AttachmentTesting.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    And I refresh the page
    And I wait for "2" seconds
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
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I enter in modal "Grantee_Submit Details" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Submitted By" as "SubmittedBy"
    Then I softly see field "Submitted By" as "{SavedValue:SubmittedBy}"
    And I save the field labeled "Submitted On" as "SubmittedOn"
    And I save the field labeled "Submitted On" as "SubmittedOn"
    Then I softly see field "Submitted On" as "{SavedValue:SubmittedOn}"
    And I save the field labeled "Award ID" as "AwardID"
    And I click on hyperlink containing value "{SavedValue:AwardID}"
    And I navigate to "Management" sub tab
    And I expand nested table containing column value "Progress Report"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Report Creation Date |
      | {SavedValue:EGMS ID2} | 0                    |
    And I save the value from row "2" for column name "Report Due Date" as "Report Due Date2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I wait for "300" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly do not see value "Report Due Date2" for title "Report Due Date" inside table "---grantee_tableId:-:ProgressReportTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - My Records"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    When I click on "Revise" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to revise the report? The report will require an approval again after being revised." is displayed
    And I click "OK" on modal confirmation box
    When I enter in modal value "Automation Feedback" into field "ReviseComments__c"
    And I enter in modal value "0" into field "RevisedDate__c"
    When I click modal button "Save"
    When I click modal button "Close"
    Then I softly see field "Status" as "Created"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:AwardID}"
    And I navigate to "Management" sub tab
    And I wait for "200" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I save the value from row "2" for column name "EGMS ID" as "progressEGMSID2" from flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Scheduled" for title "Report Type" against the value "{SavedValue:progressEGMSID2}" inside table "---grantee_tableId:-:ProgressReportTableId---"

  @484545 @validatePMuser(Progressreportowner)canabletoRevisetheProgressReport
  Scenario: Valiate PM user (Progress report owner) can able to Revise the Progress Report
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
    Then I softly see "Collapse" button for header
    Then I see the header is "Progress Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:progressEGMSID}"
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
    Then I softly can see "Performance" sub tab at view detail page
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
    Then I softly see field "Submitted By" inside page block
    Then I softly see field "Submitted On" inside page block
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I save the field labeled "Reporting Period End Date" as "ReportingPeriodEndDate"
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ReportingPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as "{SavedValue:ReportingPeriodEndDate}"
    Then I softly see field "Submitted By" as ""
    Then I softly see field "Submitted On" as ""
    And I save the field labeled "EGMS ID" as "progressEGMSID"
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
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Domain" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Measure" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Unit" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Orientation" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Target" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    And I click on "Edit" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see field inside table "masterkpi__r.name" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Title__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Domain__c" not in edit mode
    Then I softly see field inside table "Measure__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Unit__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Orientation__c" not in edit mode
    Then I softly see field inside table "Target__c" not in edit mode
    Then I softly see field inside table "PreviousActual__c" not in edit mode
    Then I softly see field inside table "PreviousDate__c" not in edit mode
    Then I softly see fields "Actual__c" is in edit mode
    Then I softly see fields "ActualDate__c" is in edit mode
    And I refresh the page
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    And I click on "Edit" in the page details
    Then I see textarea field "KeyAccomplishments__c" is editable
    Then I see textarea field "Obstacles__c" is editable
    Then I see textarea field "Plans__c" is editable
    When I enter values into fields
      | Value                          | Field                 |
      | Automation Key Accomplishments | KeyAccomplishments__c |
      | Automation Obstacles           | Obstacles__c          |
      | Automation Plans               | Plans__c              |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments" as "Automation Key Accomplishments" in "Performance Narrative" pageblock
    Then I softly see field "Obstacles" as "Automation Obstacles" in "Performance Narrative" pageblock
    Then I softly see field "Plans" as "Automation Plans" in "Performance Narrative" pageblock
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Sarah PM   | Step 1          |
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Progress Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I click on back arrow
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see that "Funding Organization" rendered in view mode only
    Then I softly see that "Federal Grant or Other Identifying Number" rendered in view mode only
    Then I softly see that "UEI Number" rendered in view mode only
    Then I softly see that "EIN" rendered in view mode only
    Then I softly see that "Internal Organization" rendered in view mode only
    Then I softly see that "Recipient Identifying Number or Account Number" rendered in view mode only
    Then I softly see that "Project/Grant Period" rendered in view mode only
    Then I softly see that "Reporting Period End Date:" rendered in view mode only
    Then I softly see that "Final Report?" rendered in view mode only
    And I enter "Grantee_PSR_form" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "Automation for Execution" into field "Form1Narrative__c"
    And I click on "Cancel" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments:" as "Automation Key Accomplishment" in "Key Accomplishments" pageblock
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Progress Report Overview" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "Key Accomplishments" page block displayed
    Then I softly see "Lessons Learned" page block displayed
    Then I softly see "Future Plans" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Federal Grant or Other Identifying Number" inside page block
    Then I softly see field "UEI Number" inside page block
    Then I softly see field "EIN" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Recipient Identifying Number or Account Number" inside page block
    Then I softly see field "Project/Grant Period" inside page block
    Then I softly see field "Reporting Period End Date:" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Performance Narrative" inside page block
    Then I softly see field "Key Accomplishments:" inside page block
    Then I softly see field "Lessons Learned:" inside page block
    Then I softly see field "Future Plans:" inside page block
    Then I softly see field "Acknowledgement:" inside page block
    Then I softly see field "Submitted By:" inside page block
    Then I softly see field "Submitted On:" inside page block
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I see "Upload" button is disabled at modal under library
    And I select Classification as "Progress Report" at upload file modal
    When I upload file "AttachmentTesting.pdf" into library
    And I wait for "2" seconds
    Then I do not see "Upload" button is disabled at modal under library
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    And I wait for "1" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I enter in modal "Grantee_Submit Details" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
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
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"

  @499061 @validatethatPMuserseepropertasktype&subjectinallstateontasktable
  Scenario:Validate that PM user see proper task type & subject in all state on task table
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Victor EXE user"
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
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    And I enter "Grantee_PSR_form" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I wait for "2" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "Complete Grantee Progress Report" for title "Task Type" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "Grantee PO" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "Review Grantee Progress Report" for title "Task Type" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:PendingTask---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    And I wait for "2" seconds
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
    Then I softly see field "Key Accomplishments" as "Automation Key Accomplishments" in "Performance Narrative" pageblock
    Then I softly see field "Obstacles" as "Automation Obstacles" in "Performance Narrative" pageblock
    Then I softly see field "Plans" as "Automation Plans" in "Performance Narrative" pageblock
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Grantee PO | Step 1          |
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
    And I wait for "1" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Grantee Progress Report" for title "Task Type" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:PendingTask---"

  @547402 @validatead-hocprogressreportshouldbevisibletoallinternaluserPM/PO/FO/FD/admin/auditor/EXEwiththeirchildrecordsincreatedstateinviewonlymodethroughglobalsearch @GranteeFlexP1
  Scenario Outline: Valiate ad-hoc progress report should be visible to all internal user PM/PO/FO/FD/admin/auditor/EXE with their child records in created state in view only mode through global search
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I wait for "2" seconds
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I wait for "3" seconds
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
    And I wait for "3" seconds
    And I enter "Grantee_Creation" values from "ProgressReport_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    Then I softly see "Collapse" button for header
    Then I see the header is "Progress Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:progressEGMSID}"
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
    Then I softly can see "Performance" sub tab at view detail page
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
    Then I softly see field "Submitted By" inside page block
    Then I softly see field "Submitted On" inside page block
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I save the field labeled "Reporting Period End Date" as "ReportingPeriodEndDate"
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ReportingPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as "{SavedValue:ReportingPeriodEndDate}"
    Then I softly see field "Submitted By" as ""
    Then I softly see field "Submitted On" as ""
    And I save the field labeled "EGMS ID" as "progressEGMSID"
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
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Domain" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Measure" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Unit" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Orientation" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Target" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    And I click on "Edit" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see field inside table "masterkpi__r.name" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Title__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Domain__c" not in edit mode
    Then I softly see field inside table "Measure__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Unit__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Orientation__c" not in edit mode
    Then I softly see field inside table "Target__c" not in edit mode
    Then I softly see field inside table "PreviousActual__c" not in edit mode
    Then I softly see field inside table "PreviousDate__c" not in edit mode
    Then I softly see fields "Actual__c" is in edit mode
    Then I softly see fields "ActualDate__c" is in edit mode
    And I refresh the page
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    And I click on "Edit" in the page details
    Then I see textarea field "KeyAccomplishments__c" is editable
    Then I see textarea field "Obstacles__c" is editable
    Then I see textarea field "Plans__c" is editable
    When I enter values into fields
      | Value                          | Field                 |
      | Automation Key Accomplishments | KeyAccomplishments__c |
      | Automation Obstacles           | Obstacles__c          |
      | Automation Plans               | Plans__c              |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments" as "Automation Key Accomplishments" in "Performance Narrative" pageblock
    Then I softly see field "Obstacles" as "Automation Obstacles" in "Performance Narrative" pageblock
    Then I softly see field "Plans" as "Automation Plans" in "Performance Narrative" pageblock
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Sarah PM      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I wait for "1" seconds
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Grantee PO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "Sarah PM" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 1          |
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Progress Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    And I wait for "2" seconds
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I enter "Grantee_PSR_form" values from "ProgressReport_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Progress Report Overview" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "Key Accomplishments" page block displayed
    Then I softly see "Lessons Learned" page block displayed
    Then I softly see "Future Plans" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Federal Grant or Other Identifying Number" inside page block
    Then I softly see field "UEI Number" inside page block
    Then I softly see field "EIN" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Recipient Identifying Number or Account Number" inside page block
    Then I softly see field "Project/Grant Period" inside page block
    Then I softly see field "Reporting Period End Date:" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Performance Narrative" inside page block
    Then I softly see field "Key Accomplishments:" inside page block
    Then I softly see field "Lessons Learned:" inside page block
    Then I softly see field "Future Plans:" inside page block
    Then I softly see field "Acknowledgement:" inside page block
    Then I softly see field "Submitted By:" inside page block
    Then I softly see field "Submitted On:" inside page block
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I refresh the page
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progressEGMSID}"
    And I click on hyperlink for global search containing value "{SavedValue:progressEGMSID}"
    Then I softly see field "Status" as "Created"
    And I wait for "2" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    And I click on "View" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Delete" in page detail
    Then I cannot see top right button "Submit for Approval" in page detail
    When I navigate to "Overview" sub tab
    Then I see the header is "Progress Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:progressEGMSID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see "Resize" button for page
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Performance" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Report Overview" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Award ID" inside page block
    Then I softly see link "{SavedValue:AwardID}" inside Page block
    Then I softly see field "Budget Period" inside page block
    Then I softly see field "Budget Period Number" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see link "{SavedValue:InternalOrganization}" inside Page block
    Then I softly see field "Funding Organization" inside page block
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    Then I softly see field "Reporting Period Start Date" inside page block
    Then I softly see field "Reporting Period End Date" inside page block
    Then I softly see field "Report Due Date" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Submitted By" inside page block
    Then I softly see field "Submitted On" inside page block
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ReportingPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as "{SavedValue:ReportingPeriodEndDate}"
    Then I softly see field "Submitted By" as ""
    Then I softly see field "Submitted On" as ""
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
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Domain" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Measure" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Unit" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Orientation" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Target" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see field "Key Accomplishments" as "Automation Key Accomplishments" in "Performance Narrative" pageblock
    Then I softly see field "Obstacles" as "Automation Obstacles" in "Performance Narrative" pageblock
    Then I softly see field "Plans" as "Automation Plans" in "Performance Narrative" pageblock
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see value "Grantee PO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "Sarah PM" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Progress Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see value "Progress Report" for title "Form Name" inside table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see value "{SavedValue:LastModifiedBy}" for title "Last Modified By" inside table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    And I wait for "3" seconds
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Progress Report Overview" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "Key Accomplishments" page block displayed
    Then I softly see "Lessons Learned" page block displayed
    Then I softly see "Future Plans" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Federal Grant or Other Identifying Number" inside page block
    Then I softly see field "UEI Number" inside page block
    Then I softly see field "EIN" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Recipient Identifying Number or Account Number" inside page block
    Then I softly see field "Project/Grant Period" inside page block
    Then I softly see field "Reporting Period End Date:" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Performance Narrative" inside page block
    Then I softly see field "Key Accomplishments:" inside page block
    Then I softly see field "Lessons Learned:" inside page block
    Then I softly see field "Future Plans:" inside page block
    Then I softly see field "Acknowledgement:" inside page block
    Then I softly see field "Submitted By:" inside page block
    Then I softly see field "Submitted On:" inside page block
    And I close the tab
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Examples:
      | User            |
      | GRANTEE PO      |
      | GRANTEE EXE     |
      | GRANTEE FO      |
      | GRANTEE FD      |
      | GRANTEE ADMIN   |
      | GRANTEE AUDITOR |

  @547411 @validatad-hocprogressreportshouldsharewithcrossorgreviewertointernalusers(AlloweditYes) @GranteeFlexP1
  Scenario: Valiate ad-hoc progress report should share with cross org reviewer to internal users (Allow edit - Yes)
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
    Then I softly see "Collapse" button for header
    Then I see the header is "Progress Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:progressEGMSID}"
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
    Then I softly can see "Performance" sub tab at view detail page
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
    Then I softly see field "Submitted By" inside page block
    Then I softly see field "Submitted On" inside page block
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I save the field labeled "Reporting Period End Date" as "ReportingPeriodEndDate"
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ReportingPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as "{SavedValue:ReportingPeriodEndDate}"
    Then I softly see field "Submitted By" as ""
    Then I softly see field "Submitted On" as ""
    And I save the field labeled "EGMS ID" as "progressEGMSID"
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
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Domain" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Measure" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Unit" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Orientation" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Target" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    And I click on "Edit" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see field inside table "masterkpi__r.name" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Title__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Domain__c" not in edit mode
    Then I softly see field inside table "Measure__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Unit__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Orientation__c" not in edit mode
    Then I softly see field inside table "Target__c" not in edit mode
    Then I softly see field inside table "PreviousActual__c" not in edit mode
    Then I softly see field inside table "PreviousDate__c" not in edit mode
    Then I softly see fields "Actual__c" is in edit mode
    Then I softly see fields "ActualDate__c" is in edit mode
    And I refresh the page
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I see textarea field "KeyAccomplishments__c" is editable
    Then I see textarea field "Obstacles__c" is editable
    Then I see textarea field "Plans__c" is editable
    When I enter values into fields
      | Value                          | Field                 |
      | Automation Key Accomplishments | KeyAccomplishments__c |
      | Automation Obstacles           | Obstacles__c          |
      | Automation Plans               | Plans__c              |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments" as "Automation Key Accomplishments" in "Performance Narrative" pageblock
    Then I softly see field "Obstacles" as "Automation Obstacles" in "Performance Narrative" pageblock
    Then I softly see field "Plans" as "Automation Plans" in "Performance Narrative" pageblock
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
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
    Then I softly see value "Grantee PO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "Sarah PM" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 1          |
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Progress Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see that "Funding Organization" rendered in view mode only
    Then I softly see that "Federal Grant or Other Identifying Number" rendered in view mode only
    Then I softly see that "UEI Number" rendered in view mode only
    Then I softly see that "EIN" rendered in view mode only
    Then I softly see that "Internal Organization" rendered in view mode only
    Then I softly see that "Recipient Identifying Number or Account Number" rendered in view mode only
    Then I softly see that "Project/Grant Period" rendered in view mode only
    Then I softly see that "Reporting Period End Date:" rendered in view mode only
    Then I softly see that "Final Report?" rendered in view mode only
    And I enter "Grantee_PSR_form" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "Automation for Execution" into field "Form1Narrative__c"
    And I click on "Cancel" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments:" as "Automation Key Accomplishment" in "Key Accomplishments" pageblock
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Progress Report Overview" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "Key Accomplishments" page block displayed
    Then I softly see "Lessons Learned" page block displayed
    Then I softly see "Future Plans" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Federal Grant or Other Identifying Number" inside page block
    Then I softly see field "UEI Number" inside page block
    Then I softly see field "EIN" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Recipient Identifying Number or Account Number" inside page block
    Then I softly see field "Project/Grant Period" inside page block
    Then I softly see field "Reporting Period End Date:" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Performance Narrative" inside page block
    Then I softly see field "Key Accomplishments:" inside page block
    Then I softly see field "Lessons Learned:" inside page block
    Then I softly see field "Future Plans:" inside page block
    Then I softly see field "Acknowledgement:" inside page block
    Then I softly see field "Submitted By:" inside page block
    Then I softly see field "Submitted On:" inside page block
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I refresh the page
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name             | Role            | Description            | Due Date | Allow Record Editing |
      | {SavedValue:PM1 Username} | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see value "{SavedValue:PM1 Username}" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I click on "Send for Review" icon for "{SavedValue:PM1 Username}" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    When I get the "EGMS ID"
    When I re-login to "Grantee" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progressEGMSID}"
    And I click on hyperlink for global search containing value "{SavedValue:progressEGMSID}"
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "2" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - My Records"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    And I click on "View" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I can see top right button "Edit" in page detail
    When I navigate to "Overview" sub tab
    Then I see the header is "Progress Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:progressEGMSID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see "Resize" button for page
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Performance" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    And I navigate to "Overview" sub tab
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
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Domain" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Measure" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Unit" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Orientation" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Target" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    And I click on "Edit" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see field inside table "masterkpi__r.name" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Title__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Domain__c" not in edit mode
    Then I softly see field inside table "Measure__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Unit__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Orientation__c" not in edit mode
    Then I softly see field inside table "Target__c" not in edit mode
    Then I softly see field inside table "PreviousActual__c" not in edit mode
    Then I softly see field inside table "PreviousDate__c" not in edit mode
    Then I softly see fields "Actual__c" is in edit mode
    Then I softly see fields "ActualDate__c" is in edit mode
    And I refresh the page
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 11             | 2                    |
    Then I softly see value "11" for title "Reported Value" inside table "---grantee_tableId:-:KPIOnProgressReport---"
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I see textarea field "KeyAccomplishments__c" is editable
    Then I see textarea field "Obstacles__c" is editable
    Then I see textarea field "Plans__c" is editable
    When I enter values into fields
      | Value                          | Field                 |
      | Automation Key Accomplishments | KeyAccomplishments__c |
      | Automation Obstacles           | Obstacles__c          |
      | Automation Plans               | Plans__c              |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments" as "Automation Key Accomplishments" in "Performance Narrative" pageblock
    Then I softly see field "Obstacles" as "Automation Obstacles" in "Performance Narrative" pageblock
    Then I softly see field "Plans" as "Automation Plans" in "Performance Narrative" pageblock
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see value "Grantee PO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "Sarah PM" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "{SavedValue:PM1 Username}" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Progress Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see that "Funding Organization" rendered in view mode only
    Then I softly see that "Federal Grant or Other Identifying Number" rendered in view mode only
    Then I softly see that "UEI Number" rendered in view mode only
    Then I softly see that "EIN" rendered in view mode only
    Then I softly see that "Internal Organization" rendered in view mode only
    Then I softly see that "Recipient Identifying Number or Account Number" rendered in view mode only
    Then I softly see that "Project/Grant Period" rendered in view mode only
    Then I softly see that "Reporting Period End Date:" rendered in view mode only
    Then I softly see that "Final Report?" rendered in view mode only
    And I enter "Grantee_PSR_form" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "Automation for Execution" into field "Form1Narrative__c"
    And I click on "Cancel" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments:" as "Automation Key Accomplishment" in "Key Accomplishments" pageblock
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Progress Report Overview" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "Key Accomplishments" page block displayed
    Then I softly see "Lessons Learned" page block displayed
    Then I softly see "Future Plans" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Federal Grant or Other Identifying Number" inside page block
    Then I softly see field "UEI Number" inside page block
    Then I softly see field "EIN" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Recipient Identifying Number or Account Number" inside page block
    Then I softly see field "Project/Grant Period" inside page block
    Then I softly see field "Reporting Period End Date:" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Performance Narrative" inside page block
    Then I softly see field "Key Accomplishments:" inside page block
    Then I softly see field "Lessons Learned:" inside page block
    Then I softly see field "Future Plans:" inside page block
    Then I softly see field "Acknowledgement:" inside page block
    Then I softly see field "Submitted By:" inside page block
    Then I softly see field "Submitted On:" inside page block
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I refresh the page
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed

  @547476 @validateScheduledprogressreportshouldbevisibletoallinternaluserPM/PO/FO/FD/admin/auditor/EXEwiththeirchildrecordsincreatedstateinviewonlymodethroughglobalsearch @GranteeFlexP1
  Scenario Outline: Valiate Scheduled progress report should be visible to all internal user PM/PO/FO/FD/admin/auditor/EXE with their child records in created state in view only mode through global search
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I wait for "2" seconds
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I wait for "3" seconds
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
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Report Creation Date |
      | {SavedValue:EGMS ID1} | 0                    |
    And I wait for "200" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "progressEGMSID" from flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Scheduled" for title "Report Type" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    Then I softly see "Collapse" button for header
    Then I see the header is "Progress Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:progressEGMSID}"
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
    Then I softly can see "Performance" sub tab at view detail page
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
    Then I softly see field "Submitted By" inside page block
    Then I softly see field "Submitted On" inside page block
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I save the field labeled "Reporting Period End Date" as "ReportingPeriodEndDate"
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ReportingPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as "{SavedValue:ReportingPeriodEndDate}"
    Then I softly see field "Submitted By" as ""
    Then I softly see field "Submitted On" as ""
    And I save the field labeled "EGMS ID" as "progressEGMSID"
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
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Domain" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Measure" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Unit" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Orientation" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Target" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    And I click on "Edit" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see field inside table "masterkpi__r.name" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Title__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Domain__c" not in edit mode
    Then I softly see field inside table "Measure__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Unit__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Orientation__c" not in edit mode
    Then I softly see field inside table "Target__c" not in edit mode
    Then I softly see field inside table "PreviousActual__c" not in edit mode
    Then I softly see field inside table "PreviousDate__c" not in edit mode
    Then I softly see fields "Actual__c" is in edit mode
    Then I softly see fields "ActualDate__c" is in edit mode
    And I refresh the page
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I see textarea field "KeyAccomplishments__c" is editable
    Then I see textarea field "Obstacles__c" is editable
    Then I see textarea field "Plans__c" is editable
    When I enter values into fields
      | Value                          | Field                 |
      | Automation Key Accomplishments | KeyAccomplishments__c |
      | Automation Obstacles           | Obstacles__c          |
      | Automation Plans               | Plans__c              |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments" as "Automation Key Accomplishments" in "Performance Narrative" pageblock
    Then I softly see field "Obstacles" as "Automation Obstacles" in "Performance Narrative" pageblock
    Then I softly see field "Plans" as "Automation Plans" in "Performance Narrative" pageblock
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Sarah PM      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Grantee PO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "Sarah PM" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 1          |
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Progress Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see that "Funding Organization" rendered in view mode only
    Then I softly see that "Federal Grant or Other Identifying Number" rendered in view mode only
    Then I softly see that "UEI Number" rendered in view mode only
    Then I softly see that "EIN" rendered in view mode only
    Then I softly see that "Internal Organization" rendered in view mode only
    Then I softly see that "Recipient Identifying Number or Account Number" rendered in view mode only
    Then I softly see that "Project/Grant Period" rendered in view mode only
    Then I softly see that "Reporting Period End Date:" rendered in view mode only
    Then I softly see that "Final Report?" rendered in view mode only
    And I enter "Grantee_PSR_form" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "Automation for Execution" into field "Form1Narrative__c"
    And I click on "Cancel" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments:" as "Automation Key Accomplishment" in "Key Accomplishments" pageblock
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Progress Report Overview" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "Key Accomplishments" page block displayed
    Then I softly see "Lessons Learned" page block displayed
    Then I softly see "Future Plans" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Federal Grant or Other Identifying Number" inside page block
    Then I softly see field "UEI Number" inside page block
    Then I softly see field "EIN" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Recipient Identifying Number or Account Number" inside page block
    Then I softly see field "Project/Grant Period" inside page block
    Then I softly see field "Reporting Period End Date:" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Performance Narrative" inside page block
    Then I softly see field "Key Accomplishments:" inside page block
    Then I softly see field "Lessons Learned:" inside page block
    Then I softly see field "Future Plans:" inside page block
    Then I softly see field "Acknowledgement:" inside page block
    Then I softly see field "Submitted By:" inside page block
    Then I softly see field "Submitted On:" inside page block
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I refresh the page
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progressEGMSID}"
    And I click on hyperlink for global search containing value "{SavedValue:progressEGMSID}"
    Then I softly see field "Status" as "Created"
    And I wait for "2" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    And I click on "View" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Delete" in page detail
    Then I cannot see top right button "Submit for Approval" in page detail
    When I navigate to "Overview" sub tab
    Then I see the header is "Progress Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:progressEGMSID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see "Resize" button for page
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Performance" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Report Overview" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Award ID" inside page block
    Then I softly see link "{SavedValue:AwardID}" inside Page block
    Then I softly see field "Budget Period" inside page block
    Then I softly see field "Budget Period Number" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see link "{SavedValue:InternalOrganization}" inside Page block
    Then I softly see field "Funding Organization" inside page block
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    Then I softly see field "Reporting Period Start Date" inside page block
    Then I softly see field "Reporting Period End Date" inside page block
    Then I softly see field "Report Due Date" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Submitted By" inside page block
    Then I softly see field "Submitted On" inside page block
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ReportingPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as "{SavedValue:ReportingPeriodEndDate}"
    Then I softly see field "Submitted By" as ""
    Then I softly see field "Submitted On" as ""
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
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Domain" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Measure" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Unit" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Orientation" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Target" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see field "Key Accomplishments" as "Automation Key Accomplishments" in "Performance Narrative" pageblock
    Then I softly see field "Obstacles" as "Automation Obstacles" in "Performance Narrative" pageblock
    Then I softly see field "Plans" as "Automation Plans" in "Performance Narrative" pageblock
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see value "Grantee PO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "Sarah PM" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Progress Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see value "Progress Report" for title "Form Name" inside table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see value "{SavedValue:LastModifiedBy}" for title "Last Modified By" inside table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Progress Report Overview" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "Key Accomplishments" page block displayed
    Then I softly see "Lessons Learned" page block displayed
    Then I softly see "Future Plans" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Federal Grant or Other Identifying Number" inside page block
    Then I softly see field "UEI Number" inside page block
    Then I softly see field "EIN" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Recipient Identifying Number or Account Number" inside page block
    Then I softly see field "Project/Grant Period" inside page block
    Then I softly see field "Reporting Period End Date:" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Performance Narrative" inside page block
    Then I softly see field "Key Accomplishments:" inside page block
    Then I softly see field "Lessons Learned:" inside page block
    Then I softly see field "Future Plans:" inside page block
    Then I softly see field "Acknowledgement:" inside page block
    Then I softly see field "Submitted By:" inside page block
    Then I softly see field "Submitted On:" inside page block
    And I close the tab
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Examples:
      | User            |
      | GRANTEE PO      |
      | GRANTEE EXE     |
      | GRANTEE FO      |
      | GRANTEE FD      |
      | GRANTEE ADMIN   |
      | GRANTEE AUDITOR |

  @547493 @validatscheduledprogressreportshouldsharewithcrossorgreviewertointernalusers(AlloweditYes) @GranteeFlexP1
  Scenario: Valiate scheduled progress report should share with cross org reviewer to internal users (Allow edit - Yes)
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
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Report Creation Date |
      | {SavedValue:EGMS ID1} | 0                    |
    And I wait for "200" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "progressEGMSID" from flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Scheduled" for title "Report Type" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    Then I softly see "Collapse" button for header
    Then I see the header is "Progress Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:progressEGMSID}"
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
    Then I softly can see "Performance" sub tab at view detail page
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
    Then I softly see field "Submitted By" inside page block
    Then I softly see field "Submitted On" inside page block
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I save the field labeled "Reporting Period End Date" as "ReportingPeriodEndDate"
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ReportingPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as "{SavedValue:ReportingPeriodEndDate}"
    Then I softly see field "Submitted By" as ""
    Then I softly see field "Submitted On" as ""
    And I save the field labeled "EGMS ID" as "progressEGMSID"
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
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Domain" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Measure" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Unit" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Orientation" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Target" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    And I click on "Edit" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see field inside table "masterkpi__r.name" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Title__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Domain__c" not in edit mode
    Then I softly see field inside table "Measure__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Unit__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Orientation__c" not in edit mode
    Then I softly see field inside table "Target__c" not in edit mode
    Then I softly see field inside table "PreviousActual__c" not in edit mode
    Then I softly see field inside table "PreviousDate__c" not in edit mode
    Then I softly see fields "Actual__c" is in edit mode
    Then I softly see fields "ActualDate__c" is in edit mode
    And I refresh the page
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I see textarea field "KeyAccomplishments__c" is editable
    Then I see textarea field "Obstacles__c" is editable
    Then I see textarea field "Plans__c" is editable
    When I enter values into fields
      | Value                          | Field                 |
      | Automation Key Accomplishments | KeyAccomplishments__c |
      | Automation Obstacles           | Obstacles__c          |
      | Automation Plans               | Plans__c              |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments" as "Automation Key Accomplishments" in "Performance Narrative" pageblock
    Then I softly see field "Obstacles" as "Automation Obstacles" in "Performance Narrative" pageblock
    Then I softly see field "Plans" as "Automation Plans" in "Performance Narrative" pageblock
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Sarah PM      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Grantee PO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "Sarah PM" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 1          |
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Progress Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see that "Funding Organization" rendered in view mode only
    Then I softly see that "Federal Grant or Other Identifying Number" rendered in view mode only
    Then I softly see that "UEI Number" rendered in view mode only
    Then I softly see that "EIN" rendered in view mode only
    Then I softly see that "Internal Organization" rendered in view mode only
    Then I softly see that "Recipient Identifying Number or Account Number" rendered in view mode only
    Then I softly see that "Project/Grant Period" rendered in view mode only
    Then I softly see that "Reporting Period End Date:" rendered in view mode only
    Then I softly see that "Final Report?" rendered in view mode only
    And I enter "Grantee_PSR_form" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Progress Report Overview" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "Key Accomplishments" page block displayed
    Then I softly see "Lessons Learned" page block displayed
    Then I softly see "Future Plans" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Federal Grant or Other Identifying Number" inside page block
    Then I softly see field "UEI Number" inside page block
    Then I softly see field "EIN" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Recipient Identifying Number or Account Number" inside page block
    Then I softly see field "Project/Grant Period" inside page block
    Then I softly see field "Reporting Period End Date:" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Performance Narrative" inside page block
    Then I softly see field "Key Accomplishments:" inside page block
    Then I softly see field "Lessons Learned:" inside page block
    Then I softly see field "Future Plans:" inside page block
    Then I softly see field "Acknowledgement:" inside page block
    Then I softly see field "Submitted By:" inside page block
    Then I softly see field "Submitted On:" inside page block
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I refresh the page
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name             | Role            | Description            | Due Date | Allow Record Editing |
      | {SavedValue:PM1 Username} | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see value "{SavedValue:PM1 Username}" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I click on "Send for Review" icon for "{SavedValue:PM1 Username}" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    When I get the "EGMS ID"
    When I re-login to "Grantee" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progressEGMSID}"
    And I click on hyperlink for global search containing value "{SavedValue:progressEGMSID}"
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "2" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - My Records"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    Then I softly can see row level action button "View" against "{SavedValue:progressEGMSID}" in flex table with id "---grantee_tableId:-:ProgressReports---"
    And I click on "View" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I can see top right button "Edit" in page detail
    When I navigate to "Overview" sub tab
    Then I see the header is "Progress Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:progressEGMSID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see "Resize" button for page
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Performance" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    And I navigate to "Overview" sub tab
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
    When I navigate to "Performance" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:progressReportObjectivesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Domain" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Measure" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Unit" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Orientation" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Target" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Previous Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see "Reported Value As Of" in flex table header "---grantee_tableId:-:KPIOnProgressReport---"
    And I click on "Edit" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KPIOnProgressReport---"
    Then I softly see field inside table "masterkpi__r.name" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Title__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Domain__c" not in edit mode
    Then I softly see field inside table "Measure__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Unit__c" not in edit mode
    Then I softly see field inside table "MasterKPI__r.Orientation__c" not in edit mode
    Then I softly see field inside table "Target__c" not in edit mode
    Then I softly see field inside table "PreviousActual__c" not in edit mode
    Then I softly see field inside table "PreviousDate__c" not in edit mode
    Then I softly see fields "Actual__c" is in edit mode
    Then I softly see fields "ActualDate__c" is in edit mode
    And I refresh the page
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 11             | 2                    |
    Then I softly see value "11" for title "Reported Value" inside table "---grantee_tableId:-:KPIOnProgressReport---"
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I see textarea field "KeyAccomplishments__c" is editable
    Then I see textarea field "Obstacles__c" is editable
    Then I see textarea field "Plans__c" is editable
    When I enter values into fields
      | Value                          | Field                 |
      | Automation Key Accomplishments | KeyAccomplishments__c |
      | Automation Obstacles           | Obstacles__c          |
      | Automation Plans               | Plans__c              |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments" as "Automation Key Accomplishments" in "Performance Narrative" pageblock
    Then I softly see field "Obstacles" as "Automation Obstacles" in "Performance Narrative" pageblock
    Then I softly see field "Plans" as "Automation Plans" in "Performance Narrative" pageblock
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see value "Grantee PO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "Sarah PM" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "{SavedValue:PM1 Username}" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:progressReportApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Progress Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see that "Funding Organization" rendered in view mode only
    Then I softly see that "Federal Grant or Other Identifying Number" rendered in view mode only
    Then I softly see that "UEI Number" rendered in view mode only
    Then I softly see that "EIN" rendered in view mode only
    Then I softly see that "Internal Organization" rendered in view mode only
    Then I softly see that "Recipient Identifying Number or Account Number" rendered in view mode only
    Then I softly see that "Project/Grant Period" rendered in view mode only
    Then I softly see that "Reporting Period End Date:" rendered in view mode only
    Then I softly see that "Final Report?" rendered in view mode only
    And I enter "Grantee_PSR_form" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "Automation for Execution" into field "Form1Narrative__c"
    And I click on "Cancel" in the page details
    And I wait for "2" seconds
    Then I softly see field "Key Accomplishments:" as "Automation Key Accomplishment" in "Key Accomplishments" pageblock
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Progress Report Overview" page block displayed
    Then I softly see "Performance Narrative" page block displayed
    Then I softly see "Key Accomplishments" page block displayed
    Then I softly see "Lessons Learned" page block displayed
    Then I softly see "Future Plans" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Federal Grant or Other Identifying Number" inside page block
    Then I softly see field "UEI Number" inside page block
    Then I softly see field "EIN" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Recipient Identifying Number or Account Number" inside page block
    Then I softly see field "Project/Grant Period" inside page block
    Then I softly see field "Reporting Period End Date:" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Performance Narrative" inside page block
    Then I softly see field "Key Accomplishments:" inside page block
    Then I softly see field "Lessons Learned:" inside page block
    Then I softly see field "Future Plans:" inside page block
    Then I softly see field "Acknowledgement:" inside page block
    Then I softly see field "Submitted By:" inside page block
    Then I softly see field "Submitted On:" inside page block
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I refresh the page
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed