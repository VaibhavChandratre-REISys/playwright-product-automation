@grantAndAward @grantor-regression @grantor-parallel-regression @regression @subawardStandalone @GrantsExecution
Feature: Validate all scenarios in the Stand Alone Award and Grant

  Background: Create Award
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"

  @530989 @validategrant/awardchildrecordsaresharewithcrossOrgreviewerwhilepeerreview(AllowEdit=Yes) @GrantorFlexP2
  Scenario: Validate grant/award child records are share with cross Org reviewer while peer review (Allow Edit=Yes)
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    Then I softly see field "EGMS ID" as "{SavedValue:GrantEGMSID}"
    And I refresh the page
    And I navigate to "Overview" sub tab
    When I enter value "Automation Runtime award" into field "GrantDescription__c"
    And I click on "Save" in the page details
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Automation  | Mandatory | Award      | Active |
    Then I see "Automation" inside flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    When I perform quick search for "{AUTOEnvData:ExternalProgram}" in "---subAwardStandAlone:-:federalListTableId---" panel
    When I click "Associate" after selection of "{AUTOEnvData:ExternalProgram}" in the table "---subAwardStandAlone:-:federalListTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:associatedContactsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I perform quick search for "Automation Permanent Focus Area2" in "---subAwardStandAlone:-:AssociateFocusArea---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---subAwardStandAlone:-:AssociateFocusArea---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    And I wait for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I click modal button "Close"
    And I refresh the page
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "SelectAwardGoals"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:kpiTableId---"
    And I wait for "2" seconds
    When I enter value "Automation Permanent KPI2" into field "MasterKPI__c"
    When I enter value "8" into field "Target__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 20     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Payment Request"
    And I save the total records from the flex table id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" as "totalRecordsPaymentSchedule"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ProgressReportQuartelyReporting" values from "Award_Field_Values.xlsx"
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I click modal button "Save"
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---subAwardStandAlone:-:progressReportScheduleTableId---" as "totalRecordsProgressSchedule"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    And I wait for "3" seconds
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I wait for "4" seconds
    Then I softly see the following messages in the page details contains:
      | Terms & Conditions associated with subaward successfully. |
    And I refresh the page
    And I save the total records from the flex table id "---subAwardStandAlone:-:termsndConditionsTableId---" as "totalRecordsTnC"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description                 | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Test Description | 7        | Yes                  |
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:awardApproversTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name          | Award  | Reimbursement |
      | Automation FO | Step 2 | Step 1        |
    And I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "8" seconds
    Then I softly see value "Sent for Review" for title "Status" against the value "Fiscal Reviewer" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    When I re-login to "Grantor" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly see value "Not Started" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside table
    And I wait for "2" seconds
    Then I can see top right button "Edit" in page detail
    Then  I can see top right button "Associate" in flex table with id "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    Then  I can see top right button "Associate" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:associatedContactsTableId---"
    And I navigate to "Budget" sub tab
    Then  I can see top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then  I can see top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I navigate to "Performance" sub tab
    Then  I can see top right button "Associate" in flex table with id "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then  I can see top right button "Associate" in flex table with id "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    And I navigate to "Terms" sub tab
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Then  I can see top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "Grantee PO" for title "Reviewer Name" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "Automation FO" for title "Name" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "GRANTEE PO" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    Then I can softly see modal button "Submit Review"
    Then I can softly see modal button "Edit"
    And I click on submit review
    Then I softly see value "Submitted" for title "Status" against the value "{SavedValue:FO Username}" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    And I refresh the page
    Then I cannot see top right button "Edit" in page detail

  @530990 @validategrant/awardchildrecordsaresharewithcrossOrgreviewerwhilepeerreview(AllowEdit=No) @GrantorFlexP2
  Scenario: Validate grant/award child records are share with cross Org reviewer while peer review (Allow Edit=No)
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    Then I softly see field "EGMS ID" as "{SavedValue:GrantEGMSID}"
    And I refresh the page
    And I navigate to "Overview" sub tab
    When I enter value "Automation Runtime award" into field "GrantDescription__c"
    And I click on "Save" in the page details
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Automation  | Mandatory | Award      | Active |
    Then I see "Automation" inside flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    When I perform quick search for "{AUTOEnvData:ExternalProgram}" in "---subAwardStandAlone:-:federalListTableId---" panel
    When I click "Associate" after selection of "{AUTOEnvData:ExternalProgram}" in the table "---subAwardStandAlone:-:federalListTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:associatedContactsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I perform quick search for "Automation Permanent Focus Area2" in "---subAwardStandAlone:-:AssociateFocusArea---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---subAwardStandAlone:-:AssociateFocusArea---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    And I wait for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I click modal button "Close"
    And I refresh the page
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "SelectAwardGoals"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:kpiTableId---"
    And I wait for "2" seconds
    When I enter value "Automation Permanent KPI2" into field "MasterKPI__c"
    When I enter value "8" into field "Target__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 20     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Payment Request"
    And I save the total records from the flex table id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" as "totalRecordsPaymentSchedule"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ProgressReportQuartelyReporting" values from "Award_Field_Values.xlsx"
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I click modal button "Save"
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---subAwardStandAlone:-:progressReportScheduleTableId---" as "totalRecordsProgressSchedule"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    And I wait for "3" seconds
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I wait for "4" seconds
    Then I softly see the following messages in the page details contains:
      | Terms & Conditions associated with subaward successfully. |
    And I refresh the page
    And I save the total records from the flex table id "---subAwardStandAlone:-:termsndConditionsTableId---" as "totalRecordsTnC"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description                 | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:awardApproversTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name          | Award  | Reimbursement |
      | Automation FO | Step 2 | Step 1        |
    And I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "8" seconds
    Then I softly see value "Sent for Review" for title "Status" against the value "Fiscal Reviewer" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    When I re-login to "Grantor" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly see value "Not Started" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside table
    And I wait for "2" seconds
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Associate" in flex table with id "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    Then I cannot see top right button "Associate" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:associatedContactsTableId---"
    And I navigate to "Budget" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I cannot see top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I navigate to "Performance" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I cannot see top right button "Associate" in flex table with id "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    And I navigate to "Terms" sub tab
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Then I cannot see top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "Grantee PO" for title "Reviewer Name" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "Automation FO" for title "Name" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "GRANTEE PO" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    Then I can softly see modal button "Submit Review"
    Then I can softly see modal button "Edit"
    And I click on submit review
    Then I softly see value "Submitted" for title "Status" against the value "{SavedValue:FO Username}" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    And I refresh the page
    Then I cannot see top right button "Edit" in page detail

  @530991 @validategrantoruserPMshouldseedataaddedbyS\RSPIuserongrant/awardrecordinsenttoS\Rstateofaward
  Scenario: Validate grantor user PM should see data added by S\R SPI user on grant/award record in sent to S\R state of award
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    Then I softly see field "EGMS ID" as "{SavedValue:GrantEGMSID}"
    And I refresh the page
    And I navigate to "Overview" sub tab
    When I enter value "Automation Runtime award" into field "GrantDescription__c"
    And I click on "Save" in the page details
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Automation  | Mandatory | Award      | Active |
    Then I see "Automation" inside flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    When I perform quick search for "{AUTOEnvData:ExternalProgram}" in "---subAwardStandAlone:-:federalListTableId---" panel
    When I click "Associate" after selection of "{AUTOEnvData:ExternalProgram}" in the table "---subAwardStandAlone:-:federalListTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:associatedContactsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I perform quick search for "Automation Permanent Focus Area2" in "---subAwardStandAlone:-:AssociateFocusArea---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---subAwardStandAlone:-:AssociateFocusArea---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    And I wait for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I click modal button "Close"
    And I refresh the page
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "SelectAwardGoals"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:kpiTableId---"
    And I wait for "2" seconds
    When I enter value "Automation Permanent KPI2" into field "MasterKPI__c"
    When I enter value "8" into field "Target__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 20     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Payment Request"
    And I save the total records from the flex table id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" as "totalRecordsPaymentSchedule"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ProgressReportQuartelyReporting" values from "Award_Field_Values.xlsx"
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I click modal button "Save"
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---subAwardStandAlone:-:progressReportScheduleTableId---" as "totalRecordsProgressSchedule"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    And I wait for "3" seconds
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I wait for "4" seconds
    Then I softly see the following messages in the page details contains:
      | Terms & Conditions associated with subaward successfully. |
    And I refresh the page
    And I save the total records from the flex table id "---subAwardStandAlone:-:termsndConditionsTableId---" as "totalRecordsTnC"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description                 | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:awardApproversTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name          | Award  | Reimbursement |
      | Automation FO | Step 2 | Step 1        |
    And I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:awardApproversTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name          | Award  | Reimbursement |
      | Automation FO | Step 2 | Step 1        |
    And I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area for flexsharing" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "Title" as "FocusAreaTitle"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I perform quick search for "{SavedValue:FocusAreaTitle}" in "---subAwardStandAlone:-:AssociateFocusArea---" panel
    When I click "Associate" after selection of "{SavedValue:FocusAreaTitle}" in the table "---subAwardStandAlone:-:AssociateFocusArea---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I see value "{SavedValue:FocusAreaTitle}" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                       | Start Date | End Date |
      | {SavedValue:FocusAreaTitle} | 0          | 3650     |
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    And I wait for "2" seconds
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:SubrecipientFederalProgramTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    And I navigate to "Budget" sub tab
    Then I see value "{SavedValue:FocusAreaTitle}" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I see value "Automation Permanent Focus Area" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 2000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardGoalsObjectives---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardGoalsObjectives---"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 20     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 30     |
    And I navigate to "Terms" sub tab
    And I expand nested table containing column value "Payment Request"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:SubrecipientPaymentSchedules---"
    And I expand nested table containing column value "Progress Report"
    And I expand nested table containing column value "Payment Request"
    And I save the total records from the flex table id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" as "totalRecordsPaymentSchedule"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:SubrecipientTermsandConditions---"
    And I navigate to "Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "View" has been added in "Supporting Documents Checklist" flex table
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:srAwardContentNotes---"
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:srAwardContentNotes---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:srAwardContentNotes---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---subAwardStandAlone:-:srAwardContentNotes---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    Then I can see top right button "Associate" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:associatedContactsTableId---"
    And I navigate to "Budget" sub tab
    Then I can see top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    Then I see value "Automation Permanent Focus Area" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I see value "{SavedValue:FocusAreaTitle}" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I can see top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I navigate to "Performance" sub tab
    Then I can see top right button "Associate" in flex table with id "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I can see top right button "Associate" in flex table with id "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    And I navigate to "Terms" sub tab
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Then I can see top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "Grantee PO" for title "Reviewer Name" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "Automation FO" for title "Name" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"

  @531017 @validategrantandawardshouldsharedwithnewuseronexistingS\RorginsenttoS\rstatewithtrierchildrecords(SPIandSPA)
  Scenario: Validate grant and award should shared with new user on existing S\R org in sent to S\R state with trier child records (SPI and SPA)
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    Then I softly see field "EGMS ID" as "{SavedValue:GrantEGMSID}"
    And I refresh the page
    And I navigate to "Overview" sub tab
    When I enter value "Automation Runtime award" into field "GrantDescription__c"
    And I click on "Save" in the page details
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Automation  | Mandatory | Award      | Active |
    Then I see "Automation" inside flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    When I perform quick search for "{AUTOEnvData:ExternalProgram}" in "---subAwardStandAlone:-:federalListTableId---" panel
    When I click "Associate" after selection of "{AUTOEnvData:ExternalProgram}" in the table "---subAwardStandAlone:-:federalListTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:associatedContactsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I perform quick search for "Automation Permanent Focus Area2" in "---subAwardStandAlone:-:AssociateFocusArea---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---subAwardStandAlone:-:AssociateFocusArea---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    And I wait for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I click modal button "Close"
    And I refresh the page
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "SelectAwardGoals"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:kpiTableId---"
    And I wait for "2" seconds
    When I enter value "Automation Permanent KPI2" into field "MasterKPI__c"
    When I enter value "8" into field "Target__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 20     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Payment Request"
    And I save the total records from the flex table id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" as "totalRecordsPaymentSchedule"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ProgressReportQuartelyReporting" values from "Award_Field_Values.xlsx"
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I click modal button "Save"
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---subAwardStandAlone:-:progressReportScheduleTableId---" as "totalRecordsProgressSchedule"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    And I wait for "3" seconds
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I wait for "4" seconds
    Then I softly see the following messages in the page details contains:
      | Terms & Conditions associated with subaward successfully. |
    And I refresh the page
    And I save the total records from the flex table id "---subAwardStandAlone:-:termsndConditionsTableId---" as "totalRecordsTnC"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description                 | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:awardApproversTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name          | Award  | Reimbursement |
      | Automation FO | Step 2 | Step 1        |
    And I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area for flexsharing" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "Title" as "FocusAreaTitle"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I perform quick search for "{SavedValue:FocusAreaTitle}" in "---subAwardStandAlone:-:AssociateFocusArea---" panel
    When I click "Associate" after selection of "{SavedValue:FocusAreaTitle}" in the table "---subAwardStandAlone:-:AssociateFocusArea---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I see value "{SavedValue:FocusAreaTitle}" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                       | Start Date | End Date |
      | {SavedValue:FocusAreaTitle} | 0          | 3650     |
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    And I wait for "2" seconds
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:SubrecipientFederalProgramTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    And I navigate to "Budget" sub tab
    Then I see value "{SavedValue:FocusAreaTitle}" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I see value "Automation Permanent Focus Area" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 2000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardGoalsObjectives---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardGoalsObjectives---"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 20     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 30     |
    And I navigate to "Terms" sub tab
    And I expand nested table containing column value "Payment Request"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:SubrecipientPaymentSchedules---"
    And I expand nested table containing column value "Progress Report"
    And I expand nested table containing column value "Payment Request"
    And I save the total records from the flex table id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" as "totalRecordsPaymentSchedule"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:SubrecipientPaymentSchedules---"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---progressreport:-:RecipientprogressReportScheduleTableId---"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:SubrecipientTermsandConditions---"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    #Create Secondary User
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I wait for "2" seconds
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I wait for "2" seconds
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "fieldEmail"
    When I click on "Save" in the page details
    When I close "Create Contact" modal by clicking the top right x button
    And I refresh the page
    And I save the value from row "1" for column name "Full Name" as "Automation Runtime Contact" from flex table "---home:-:userContactsTableId---"
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    And I click "Send" button in modal
    Then I softly see confirmation box with body "Email sent succesfully." is displayed
    When I click modal button "Ok"
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID1}"
    And I pause execution for "190" seconds
    Then I refresh the page
    And I navigate to yopmail portal for "{SavedValue:uniqueEmailID1}" with subject "Sandbox: Notification: Invitation to be a user of EGMS"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Confirmation Message |
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID1}"
    And I pause execution for "190" seconds
    And I refresh the page
    And I click on mail with subject "Sandbox: Welcome to Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    And I wait for "2" seconds
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:SubrecipientFederalProgramTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    And I navigate to "Budget" sub tab
    Then I see value "{SavedValue:FocusAreaTitle}" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I see value "Automation Permanent Focus Area" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 2000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardGoalsObjectives---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardGoalsObjectives---"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 20     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 30     |
    And I navigate to "Terms" sub tab
    And I expand nested table containing column value "Payment Request"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:SubrecipientPaymentSchedules---"
    And I expand nested table containing column value "Progress Report"
    And I expand nested table containing column value "Payment Request"
    And I save the total records from the flex table id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" as "totalRecordsPaymentSchedule"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:SubrecipientPaymentSchedules---"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---progressreport:-:RecipientprogressReportScheduleTableId---"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:SubrecipientTermsandConditions---"
    And I navigate to "Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "View" has been added in "Supporting Documents Checklist" flex table
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:srAwardContentNotes---"
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:srAwardContentNotes---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:srAwardContentNotes---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---subAwardStandAlone:-:srAwardContentNotes---"

  @531019 @validatetherelatedlogtabwithcorrectrecordcountforgrant/awardwherethefundingsource,KPI,objective,NGOprogram,internalOrg,S\ROrg,individualOrgareassociated.
  Scenario: Validate the related log tab with correct record count for grant/award where the funding source, KPI, objective, NGO program, internal Org, S\R Org, individual Org are associated.
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    Then I softly see field "EGMS ID" as "{SavedValue:GrantEGMSID}"
    And I refresh the page
    And I navigate to "Overview" sub tab
    When I enter value "Automation Runtime award" into field "GrantDescription__c"
    And I click on "Save" in the page details
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Automation  | Mandatory | Award      | Active |
    Then I see "Automation" inside flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    When I perform quick search for "{AUTOEnvData:ExternalProgram}" in "---subAwardStandAlone:-:federalListTableId---" panel
    When I click "Associate" after selection of "{AUTOEnvData:ExternalProgram}" in the table "---subAwardStandAlone:-:federalListTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:associatedContactsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I perform quick search for "Automation Permanent Focus Area2" in "---subAwardStandAlone:-:AssociateFocusArea---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---subAwardStandAlone:-:AssociateFocusArea---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    And I wait for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I click modal button "Close"
    And I refresh the page
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "SelectAwardGoals"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:kpiTableId---"
    And I wait for "2" seconds
    When I enter value "Automation Permanent KPI2" into field "MasterKPI__c"
    When I enter value "8" into field "Target__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 20     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Payment Request"
    And I save the total records from the flex table id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" as "totalRecordsPaymentSchedule"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ProgressReportQuartelyReporting" values from "Award_Field_Values.xlsx"
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I click modal button "Save"
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---subAwardStandAlone:-:progressReportScheduleTableId---" as "totalRecordsProgressSchedule"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    And I wait for "3" seconds
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I wait for "4" seconds
    Then I softly see the following messages in the page details contains:
      | Terms & Conditions associated with subaward successfully. |
    And I refresh the page
    And I save the total records from the flex table id "---subAwardStandAlone:-:termsndConditionsTableId---" as "totalRecordsTnC"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description                 | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:awardApproversTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name          | Award  | Reimbursement |
      | Automation FO | Step 2 | Step 1        |
    And I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area for flexsharing" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "Title" as "FocusAreaTitle"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I perform quick search for "{SavedValue:FocusAreaTitle}" in "---subAwardStandAlone:-:AssociateFocusArea---" panel
    When I click "Associate" after selection of "{SavedValue:FocusAreaTitle}" in the table "---subAwardStandAlone:-:AssociateFocusArea---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I see value "{SavedValue:FocusAreaTitle}" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                       | Start Date | End Date |
      | {SavedValue:FocusAreaTitle} | 0          | 3650     |
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    And I wait for "2" seconds
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Accept" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I wait for "2" seconds
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I get the "EGMS ID"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I wait for "2" seconds
    Then I softly see that "Subaward" is in "Activated" status
    When I navigate to "Budget" sub tab
    And I click on hyperlink containing value "---AUTOEnvData:-:fundingAccount---"
    And I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---closeout:-:CloseoutRelatedSubAwardsTableId---" panel
    Then I softly see value "$0.00" for title "Closeout Deobligation" inside table "---closeout:-:CloseoutRelatedSubAwardsTableId---"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I pause execution for "3" seconds
    And I click toggle button to select "Focus Areas - All"
    When I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    And I click on "View" icon for "Automation Permanent Focus Area" inside flex table with id "---focusarea:-:focusAreaTableId---"
    And I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---focusarea:-:ActiveGrantsTableIdFocusArea---" panel
    Then I see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---focusarea:-:ActiveGrantsTableIdFocusArea---"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I pause execution for "3" seconds
    And I click toggle button to select "Focus Areas - All"
    When I perform quick search for "Automation Permanent Focus Area2" in "---focusarea:-:focusAreaTableId---" panel
    And I click on "View" icon for "Automation Permanent Focus Area2" inside flex table with id "---focusarea:-:focusAreaTableId---"
    And I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---focusarea:-:ActiveGrantsTableIdFocusArea---" panel
    Then I see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---focusarea:-:ActiveGrantsTableIdFocusArea---"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I pause execution for "3" seconds
    And I click toggle button to select "Focus Areas - All"
    When I perform quick search for "{SavedValue:FocusAreaTitle}" in "---focusarea:-:focusAreaTableId---" panel
    And I click on "View" icon for "{SavedValue:FocusAreaTitle}" inside flex table with id "---focusarea:-:focusAreaTableId---"
    And I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---focusarea:-:ActiveGrantsTableIdFocusArea---" panel
    Then I see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---focusarea:-:ActiveGrantsTableIdFocusArea---"
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    When I perform quick search for "Automation Permanent KPI" in "---keyperformanceindicator:-:kpiTableId---" panel
    And I click on "View" icon for "Automation Permanent KPI" inside table
    And I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---focusarea:-:ActiveGrantsTableIdKPIs---" panel
    Then I see value "{SavedValue:AwardEGMSID}" for title "Subaward" inside table "---focusarea:-:ActiveGrantsTableIdKPIs---"
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    When I perform quick search for "Automation Permanent KPI2" in "---keyperformanceindicator:-:kpiTableId---" panel
    And I click on "View" icon for "Automation Permanent KPI2" inside table
    And I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---keyperformanceindicator:-:ActiveGrantsTableIdKPIs---" panel
    Then I see value "{SavedValue:AwardEGMSID}" for title "Subaward" inside table "---keyperformanceindicator:-:ActiveGrantsTableIdKPIs---"
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    When I perform quick search for "Automation Permanent Strategic Plan" in "---strategicplan:-:StrategicPlansTableId---" panel
    And I click on "View" icon for "Automation Permanent Strategic Plan" inside table
    And I navigate to "Related Log" sub tab
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---strategicplan:-:ActiveGrantsTableIdStrategicPlanTableId---"

  @531036 @validateawardrecorddatashouldsharewithforwardedapproverwhilesubmittedforapprovalstate
  Scenario: Validate  award record data should share with forwarded approver while submitted for approval state
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    Then I softly see field "EGMS ID" as "{SavedValue:GrantEGMSID}"
    And I refresh the page
    And I navigate to "Overview" sub tab
    When I enter value "Automation Runtime award" into field "GrantDescription__c"
    And I click on "Save" in the page details
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Automation  | Mandatory | Award      | Active |
    Then I see "Automation" inside flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    When I perform quick search for "{AUTOEnvData:ExternalProgram}" in "---subAwardStandAlone:-:federalListTableId---" panel
    When I click "Associate" after selection of "{AUTOEnvData:ExternalProgram}" in the table "---subAwardStandAlone:-:federalListTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:associatedContactsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I perform quick search for "Automation Permanent Focus Area2" in "---subAwardStandAlone:-:AssociateFocusArea---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---subAwardStandAlone:-:AssociateFocusArea---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    And I wait for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I click modal button "Close"
    And I refresh the page
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "SelectAwardGoals"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:kpiTableId---"
    And I wait for "2" seconds
    When I enter value "Automation Permanent KPI2" into field "MasterKPI__c"
    When I enter value "8" into field "Target__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 20     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Payment Request"
    And I save the total records from the flex table id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" as "totalRecordsPaymentSchedule"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ProgressReportQuartelyReporting" values from "Award_Field_Values.xlsx"
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I click modal button "Save"
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---subAwardStandAlone:-:progressReportScheduleTableId---" as "totalRecordsProgressSchedule"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    And I wait for "3" seconds
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I wait for "4" seconds
    Then I softly see the following messages in the page details contains:
      | Terms & Conditions associated with subaward successfully. |
    And I refresh the page
    And I save the total records from the flex table id "---subAwardStandAlone:-:termsndConditionsTableId---" as "totalRecordsTnC"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description                 | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:awardApproversTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name          | Award  | Reimbursement |
      | Automation FO | Step 2 | Step 1        |
    And I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area for flexsharing" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "Title" as "FocusAreaTitle"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I perform quick search for "{SavedValue:FocusAreaTitle}" in "---subAwardStandAlone:-:AssociateFocusArea---" panel
    When I click "Associate" after selection of "{SavedValue:FocusAreaTitle}" in the table "---subAwardStandAlone:-:AssociateFocusArea---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I see value "{SavedValue:FocusAreaTitle}" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                       | Start Date | End Date |
      | {SavedValue:FocusAreaTitle} | 0          | 3650     |
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    And I wait for "2" seconds
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Accept" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I wait for "2" seconds
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:associatedContactsTableId---"
    And I navigate to "Budget" sub tab
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I see value "{SavedValue:FocusAreaTitle}" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    When I navigate to "Performance" sub tab
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    And I navigate to "Terms" sub tab
    And I expand nested table containing column value "Payment Request"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    And I expand nested table containing column value "Progress Report"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I softly see value "Grantee PO" for title "Reviewer Name" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    And I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    And I softly see value "Automation FO" for title "Name" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    When I navigate to "Overview" sub tab
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Send back | Forward |
    And I "Reassign" to user "{SavedValue:EXE Username}" in the approval decision
    And I pause execution for "2" seconds
    And I refresh the page
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Send back | Forward |
    When I navigate to "Overview" sub tab
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:associatedContactsTableId---"
    And I navigate to "Budget" sub tab
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I see value "{SavedValue:FocusAreaTitle}" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    When I navigate to "Performance" sub tab
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    And I navigate to "Terms" sub tab
    And I expand nested table containing column value "Payment Request"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    And I expand nested table containing column value "Progress Report"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I softly see value "Grantee PO" for title "Reviewer Name" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    And I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    And I softly see value "Automation FO" for title "Name" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"

  @531037 @validatedatashouldsharewithmultipleSPIandSPAuserifOrgissameinsenttoS\Rstatebeforeapproval
  Scenario: Validate data should share with multiple SPI and SPA user if Org is same in sent to S\R state before approval
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    Then I softly see field "EGMS ID" as "{SavedValue:GrantEGMSID}"
    And I refresh the page
    And I navigate to "Overview" sub tab
    When I enter value "Automation Runtime award" into field "GrantDescription__c"
    And I click on "Save" in the page details
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Automation  | Mandatory | Award      | Active |
    Then I see "Automation" inside flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    When I perform quick search for "{AUTOEnvData:ExternalProgram}" in "---subAwardStandAlone:-:federalListTableId---" panel
    When I click "Associate" after selection of "{AUTOEnvData:ExternalProgram}" in the table "---subAwardStandAlone:-:federalListTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:subawardFederalProgramTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:associatedContactsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I perform quick search for "Automation Permanent Focus Area2" in "---subAwardStandAlone:-:AssociateFocusArea---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---subAwardStandAlone:-:AssociateFocusArea---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    And I wait for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I click modal button "Close"
    And I refresh the page
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "SelectAwardGoals"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:kpiTableId---"
    And I wait for "2" seconds
    When I enter value "Automation Permanent KPI2" into field "MasterKPI__c"
    When I enter value "8" into field "Target__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 20     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Payment Request"
    And I save the total records from the flex table id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" as "totalRecordsPaymentSchedule"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ProgressReportQuartelyReporting" values from "Award_Field_Values.xlsx"
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I click modal button "Save"
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---subAwardStandAlone:-:progressReportScheduleTableId---" as "totalRecordsProgressSchedule"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    And I wait for "3" seconds
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I wait for "4" seconds
    Then I softly see the following messages in the page details contains:
      | Terms & Conditions associated with subaward successfully. |
    And I refresh the page
    And I save the total records from the flex table id "---subAwardStandAlone:-:termsndConditionsTableId---" as "totalRecordsTnC"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description                 | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:awardApproversTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name          | Award  | Reimbursement |
      | Automation FO | Step 2 | Step 1        |
    And I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area for flexsharing" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "Title" as "FocusAreaTitle"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I perform quick search for "{SavedValue:FocusAreaTitle}" in "---subAwardStandAlone:-:AssociateFocusArea---" panel
    When I click "Associate" after selection of "{SavedValue:FocusAreaTitle}" in the table "---subAwardStandAlone:-:AssociateFocusArea---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I see value "{SavedValue:FocusAreaTitle}" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                       | Start Date | End Date |
      | {SavedValue:FocusAreaTitle} | 0          | 3650     |
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    And I wait for "2" seconds
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:SubrecipientFederalProgramTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    And I navigate to "Budget" sub tab
    Then I see value "{SavedValue:FocusAreaTitle}" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I see value "Automation Permanent Focus Area" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 2000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardGoalsObjectives---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardGoalsObjectives---"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 20     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 30     |
    And I navigate to "Terms" sub tab
    And I expand nested table containing column value "Payment Request"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:SubrecipientPaymentSchedules---"
    And I expand nested table containing column value "Progress Report"
    And I expand nested table containing column value "Payment Request"
    And I save the total records from the flex table id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" as "totalRecordsPaymentSchedule"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:SubrecipientPaymentSchedules---"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---progressreport:-:RecipientprogressReportScheduleTableId---"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:SubrecipientTermsandConditions---"
    And I navigate to "Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "View" has been added in "Supporting Documents Checklist" flex table
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:srAwardContentNotes---"
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:srAwardContentNotes---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:srAwardContentNotes---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---subAwardStandAlone:-:srAwardContentNotes---"
    And I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    And I wait for "2" seconds
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    Then I see value "{AUTOEnvData:ExternalProgram}" for title "Program Title" inside table "---subAwardStandAlone:-:SubrecipientFederalProgramTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    And I navigate to "Budget" sub tab
    Then I see value "{SavedValue:FocusAreaTitle}" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I see value "Automation Permanent Focus Area" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 2000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardGoalsObjectives---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardGoalsObjectives---"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 30     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subrecipientAwardKeyOutcomes---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 40     |
    And I navigate to "Terms" sub tab
    And I expand nested table containing column value "Payment Request"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:SubrecipientPaymentSchedules---"
    And I expand nested table containing column value "Progress Report"
    And I expand nested table containing column value "Payment Request"
    And I save the total records from the flex table id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" as "totalRecordsPaymentSchedule"
    Then I see total records count "{SavedValue:totalRecordsPaymentSchedule}" in flex table "---subAwardStandAlone:-:SubrecipientPaymentSchedules---"
    Then I softly see total records count "{SavedValue:totalRecordsProgressSchedule}" in flex table "---progressreport:-:RecipientprogressReportScheduleTableId---"
    Then I softly see total records count "{SavedValue:totalRecordsTnC}" in flex table "---subAwardStandAlone:-:SubrecipientTermsandConditions---"
    And I navigate to "Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "View" has been added in "Supporting Documents Checklist" flex table
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---subAwardStandAlone:-:subrecipientExternalAwardFiles---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:srAwardContentNotes---"
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:srAwardContentNotes---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---subAwardStandAlone:-:srAwardContentNotes---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:srAwardContentNotes---" by clicking "New" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes1 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---subAwardStandAlone:-:srAwardContentNotes---"