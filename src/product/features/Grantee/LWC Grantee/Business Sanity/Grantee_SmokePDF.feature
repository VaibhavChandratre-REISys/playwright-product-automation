@GranteeSmokeTestCases @GranteeTBE @GranteeSmokeTestCasesPDF
Feature: Grantee Smoke scenarios for PDF

  @449166 @VerifyPMuserasAROwnersameasAwardOwnercanabletocreateFundingChangeARonactiveAward&abletoAcceptit&abletocreatenewAward&seeimpactonAward&Grant @Grantee_Smoke1 @GRegression1
  Scenario Outline: Verify PM user as (AR Owner same as Award Owner) can able to create Funding Change AR on active Award & able to Accept it & able to create new Award & see impact on Award & Grant
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-<userName>"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I save the field labeled "Project Period" as "ProjectPeriod"
    And I save the field labeled "Required Match (%)" as "ReqiredChange"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see that "Award__c" rendered in view mode only
    Then I softly see that "FAINAmendmentNumber__c" rendered in view mode only
    Then I softly see that "GrantNumber__c" rendered in view mode only
    Then I see textarea field "Impact__c" is editable
    Then I see textarea field "PurposeRTA__c" is editable
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Please select Amendment Request Type is required. |
    Then I softly see the following messages in the page details contains:
      | To Save, Initiated By is required. |
    Then I softly see the following messages in the page details contains:
      | To Save, Justification is required. |
    And I enter "Grantee_FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FNCAMENDID"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:AwardEGMSID}"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see value "Record Id" for title "{SavedValue:FNCAMENDID}" inside table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:FNCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:FNCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:FNCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:FNCAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:FNCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:FNCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:FNCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "{SavedValue:FNCAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I softly see field "EGMS ID" as "{SavedValue:FNCAMENDID}"
    Then I softly see field "Status" as "Created"
    When I save the field labeled "Initiated By" as "InitiatedBy"
    Then I softly see field "Initiated By" as "{SavedValue:InitiatedBy}"
    Then I softly see field "Amendment Type" as "Funding Change"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:FNCAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click on "Edit" icon for "{SavedValue:FNCAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see "Funding Change" page block displayed
    Then I softly see "Focus Areas" page block displayed
    Then I softly see "Budget Change" page block displayed
    Then I softly see "General Condition" page block displayed
    Then I softly see "Special Conditions" page block displayed
    Then I softly see "System Information" page block displayed
    Then I see field "Grant EGMS ID" is not editable
    Then I see field "Grant Number" is not editable
    Then I see field "Grant Award Number" is not editable
    Then I see field "Award EGMS ID" is not editable
    Then I see textarea field "Impact__c" is editable
    Then I see textarea field "PurposeRTA__c" is editable
    Then I softly see field "Grant EGMS ID" as "{SavedValue:GrantEGMSID}"
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    Then I softly see field "Grant Number" as "{SavedValue:GrantNumber}"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantAwardNumber}"
    Then I softly see field "Award EGMS ID" as "{SavedValue:AwardEGMSID}"
    Then I softly see link "{SavedValue:AwardEGMSID}" inside Page block
    Then I see field "Project Period" is not editable
    Then I softly see field "Project Period" as "{SavedValue:ProjectPeriod}"
    Then I see field "Budget Period" is not editable
    Then I softly see field "Budget Period" as "{SavedValue:BudgetPeriod}"
    Then I softly see fields "RequestedChangeInBudget__c" is in edit mode
    Then I softly see field "Required Match(%)" as "{SavedValue:ReqiredChange}"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:selectAmendmentFocusAreaTableId---"
    Then I softly see "Tittle" in flex table header "---grantee_tableId:-:selectAmendmentFocusAreaTableId---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:selectAmendmentFocusAreaTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:selectAmendmentFocusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---grantee_tableId:-:selectAmendmentFocusAreaTableId---"
    And I click modal button "Close"
    And I click on "Save" in the page details
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date                         | End Date |
      | Automation Permanent Focus Area2 | {SavedValue:BudgetPeriodStartDate} | 0        |
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Focus Area End Date should be greater than Focus Area Start Date.
      | Overview Tab - At least one Focus Area's Start Date should match the Budget Period Start Date and one Focus Area's End Date should match the Proposed Budget Period End Date.
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date                         | End Date                         |
      | Automation Permanent Focus Area2 | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    And I click on "Remove" icon for "Automation Permanent Focus Area2" inside flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    And I wait for "2" seconds
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Title" inside table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    When I click on parallel lines menu bar with data target value "Focus Areas"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Budget Category" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Spent" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Remaining Budget" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Revised Award Budget" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Difference" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see value "$5,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see value "$500.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see value "$200.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see value "$5,700.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    When I click on "Original Budget Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    Then I softly see value "$5,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:amendmentAwardLineItemsTableId---"
    Then I softly see value "$500.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:amendmentAwardLineItemsTableId---"
    Then I softly see value "$200.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:amendmentAwardLineItemsTableId---"
    Then I softly see value "$5,700.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:amendmentAwardLineItemsTableId---"
    When I close "Original Budget Details" modal by clicking the top right x button
    And I wait for "2" seconds
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    And I wait for "3" seconds
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentLineItemsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentLineItemsTableId---"
    Then I softly see "Narrative" in flex table header "---grantee_tableId:-:amendmentLineItemsTableId---"
    Then I softly see "Prior Awarded Budget" in flex table header "---grantee_tableId:-:amendmentLineItemsTableId---"
    Then I softly see "Awarded Budget" in flex table header "---grantee_tableId:-:amendmentLineItemsTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:amendmentLineItemsTableId---"
    Then I softly see "Previous Leverage" in flex table header "---grantee_tableId:-:amendmentLineItemsTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:amendmentLineItemsTableId---"
    Then I softly see "Previous Project Cost" in flex table header "---grantee_tableId:-:amendmentLineItemsTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:amendmentLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title | Narrative     | Awarded Budget | Cash Match | Other Leverage |
      | Test  | The narrative | 5000           | 500        | 500            |
    Then I softly can see row level action button "Edit" against "Test" in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Test" in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title | Narrative     | Awarded Budget | Cash Match | Other Leverage |
      | Test  | The narrative | 4000           | 400        | 400            |
    And I click on "Delete" icon for "Test" inside flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---"
    And I wait for "2" seconds
    Then I do not see value "Test" for title "Title" inside table "---grantee_tableId:-:amendmentLineItemsTableId---"
    When I close "Amendment Line Items" modal by clicking the top right x button
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Effective until" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "{SavedValue:Title}" for title "Title" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "{SavedValue:ApprovedIndirectCostRate}" for title "Approved Indirect Cost Rate(%)" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Indirect Cost Rate Type" as "IndirectCostRateType" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "{SavedValue:IndirectCostRateType}" for title "Indirect Cost Rate Type" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly can see row level action button "Edit" against "New Indirect rate1" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "New Indirect rate1" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I click on "Edit" in the page details
    Then I softly see fields "GeneralConditionChanged__c" is in edit mode
    And I enter value "Checked" into field "GeneralConditionChanged__c"
    Then I softly see fields "AreTCspartofNGAAttachments__c" is in edit mode
    Then I softly see fields "FederalTCLink__c" is in edit mode
    And I enter value "Unchecked" into field "GeneralConditionChanged__c"
    Then I softly do not see fields "AreTCspartofNGAAttachments__c" is visible
    Then I softly do not see fields "FederalTCLink__c" is visible
    And I click on "Save" in the page details
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:Title}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms1" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on "Delete" icon for "Terms1" inside flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly do not see value "Terms1" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see link "Created By" inside Page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    Then I softly see link "Last Modified By" inside Page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see "Reviewer Name" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Role" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Allow Record Editing" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see value "David FO" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | Automation Description | 5        | No                   |
    Then I softly see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Fiscal Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Program Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Delete" icon for "Automation FD" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly see "Amendment Request" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 2            |
    Then I softly see link "Victor EXE" inside Page block
    And I click on hyperlink containing value "Victor EXE"
    Then I softly see the text containing "victor.exe@ggp.test8.ggmergeqa2"
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    Then I softly see "Amendment Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Amendment Files" flex table
    Then I can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on "Download" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I wait for "2" seconds
    And I download the file
    Then I see "Welcome to Smallpdf" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    And I click on "View" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see the image "Attachment.pdf" in page detail
    And I click on "Close" button for view files page
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I update title as "Automation.pdf" on upload file modal
    And I update title as "Attachment.pdf" on upload file modal
    And I select Classification as "Notice of Award" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "Notice of Award" has been added in "Amendment Files" flex table
    And I click on "Delete" icon for "Notice of Award" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" without waiting for record
    Then I softly do not see value "Notice of Award" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    When I click on parallel lines menu bar with data target value "Amendment Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "Edit" :
      | Created By | Title         | Description       |
      | <Approval> | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Recor1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "From Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "To Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "CC Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Email Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Preview" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    When I get the "EGMS ID"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I clear the value from field "PurposeRTA__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Justification is required in the Overview tab under the Details section. |
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    And I enter value "110" into field "ApprovedIndirectCostRate__c"
    When I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Maximum Indirect Cost Rate cannot be greater than 100% |
    And I click on "Edit" in the page details
    And I enter value "10" into field "ApprovedIndirectCostRate__c"
    When I click on "Save" in the page details
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title | Narrative     | Awarded Budget | Cash Match | Other Leverage |
      | Test  | The narrative | 2000           | 200        | 200            |
    When I close "Amendment Line Items" modal by clicking the top right x button
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - You have a requested a change of $2000.0, but the required change is $0.00.                |
      | Overview Tab - Please specify the Requested Change in Award Budget planned through this amendment request |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I wait for "1" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    Then I softly cannot see top right button "Edit" in page detail
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Pending Activation" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    And I click on "Delete" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to delete this subaward?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Submitted to Grantor" for title "New Value" inside field history table
    Then I softly see value "Accepted" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly do not see value "{SavedValue:AwardEGMSID2}" for title "Award EGMS ID" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:AwardEGMSID}" in flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FNCAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "{SavedValue:FNCAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    Then I softly cannot see top right button "Edit" in page detail
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Projections" sub tab
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    When I save the field labeled "Grant Amount" as "GrantAmount"
    Then I softly see field "Grant Amount" as "{SavedValue:GrantAmount}"
    When I save the field labeled "Total Awarded Budget" as "TotalAwardedBudget"
    Then I softly see field "Total Awarded Budget" as "{SavedValue:TotalAwardedBudget}"
    When I save the field labeled "Drawn to Date" as "DrawntoDate"
    Then I softly see field "Drawn to Date" as "{SavedValue:DrawntoDate}"
    When I save the field labeled "Spent to Date" as "SpenttoDate"
    Then I softly see field "Spent to Date" as "{SavedValue:SpenttoDate}"
    When I save the field labeled "Remaining Balance" as "RemainingBalance"
    Then I softly see field "Remaining Balance" as "{SavedValue:RemainingBalance}"
    When I save the field labeled "Total Match Expenditures to Date this Budget Period" as "TotalMatchExpenditurestoDatethisBudgetPeriod"
    Then I softly see field "Total Match Expenditures to Date this Budget Period" as "{SavedValue:TotalMatchExpenditurestoDatethisBudgetPeriod}"
    When I save the field labeled "Total Program Income Revenue this Budget Period" as "TotalProgramIncomeRevenuethisBudgetPeriod"
    Then I softly see field "Total Program Income Revenue this Budget Period" as "{SavedValue:TotalProgramIncomeRevenuethisBudgetPeriod}"
    When I save the field labeled "Total Leverage" as "TotalLeverage"
    Then I softly see field "Total Leverage" as "{SavedValue:TotalLeverage}"
    When I save the field labeled "Current Balance" as "CurrentBalance"
    Then I softly see field "Current Balance" as "{SavedValue:CurrentBalance}"
    When I save the field labeled "Grant Balance" as "GrantBalance"
    Then I softly see field "Grant Balance" as "{SavedValue:GrantBalance}"
    Then I softly see value "$7,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Carry-Forward" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$7,000.00" for title "Remaining Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Program Income Expenditures" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I see value "$0.00" for title "Original Program Income Earned" against the value "Automation Permanent Focus Area" inside table "---grantee_tableId:-:awardProgramRevenueTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Financials" sub tab
    When I save the field labeled "Total Anticipated Amount" as "TotalAnticipatedAmount"
    Then I softly see field "Total Anticipated Amount" as "{SavedValue:TotalAnticipatedAmount}"
    When I save the field labeled "Award Amount to Date" as "AwardAmounttoDate"
    Then I softly see field "Award Amount to Date" as "{SavedValue:AwardAmounttoDate}"
    When I save the field labeled "Spent to Date" as "SpenttoDate"
    Then I softly see field "Spent to Date" as "{SavedValue:SpenttoDate}"
    When I save the field labeled "Remaining Budget" as "RemainingBudget"
    Then I softly see field "Remaining Budget" as "{SavedValue:RemainingBudget}"
    When I save the field labeled "Budgeted Cash Match" as "BudgetedCashMatch"
    Then I softly see field "Budgeted Cash Match" as "{SavedValue:BudgetedCashMatch}"
    When I save the field labeled "Budgeted Match" as "BudgetedMatch"
    Then I softly see field "Budgeted Match" as "{SavedValue:BudgetedMatch}"
    When I save the field labeled "Remaining Match" as "RemainingMatch"
    Then I softly see field "Remaining Match" as "{SavedValue:RemainingMatch}"
    When I save the field labeled "Budgeted Leverage" as "BudgetedLeverage"
    Then I softly see field "Budgeted Leverage" as "{SavedValue:BudgetedLeverage}"
    When I save the field labeled "Total Anticipated Program Income" as "TotalAnticipatedProgramIncome"
    Then I softly see field "Total Anticipated Program Income" as "{SavedValue:TotalAnticipatedProgramIncome}"
    When I save the field labeled "Total Program Income Expenditure" as "TotalProgramIncomeExpenditure"
    Then I softly see field "Total Program Income Expenditure" as "{SavedValue:TotalProgramIncomeExpenditure}"
    When I save the field labeled "Total Project Cost" as "TotalProjectCost"
    Then I softly see field "Total Project Cost" as "{SavedValue:TotalProjectCost}"
    Given I expand nested table containing column value "BP01"
    Then I softly see value "$7,000.00" for title "Awarded Budget" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$700.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$400.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$8,100.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "{SavedValue:AwardEGMSID2}" for title "New Value" inside field history table
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Original Value" inside field history table

    Examples:
      | userName      | User       | Approval |
      | Sarah PM user | GRANTEE PM | Sarah PM |

  @445435 @ValidateNonFederalprogramPMusercancreateandActivateNonFederalprogram @Grantee_Smoke1
  Scenario: Validate Non-Federal program PM user can create and Activate Non Federal program
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    And I wait for "10" seconds
    And I perform quick search for "Maha Research and Technology Activity" in "---grantee_tableId:-:ExternalFederalPrograms---" panel
    When I click on "View" icon for "Maha Research and Technology Activity" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Then I see the header is "Federal Program" in the page details
    Then I see the sub-header is "Maha Research and Technology Activity" in the page details
    Then I softly see "Program Information" page block displayed
    Then I softly see "Eligibility Requirements" page block displayed
    Then I softly see "Application and Award Process" page block displayed
    Then I softly see "Assistance Consideration" page block displayed
    Then I softly see "Compliance Requirements" page block displayed
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "EGMS ID" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Source" as "SAM.gov"
    Then I softly see field "Assistance Listing #" inside page block
    Then I softly see field "Awarding Agency Code" inside page block
    Then I softly see field "Federal Agency" inside page block
    Then I softly see field "Authorization" inside page block
    Then I softly see field "Objectives" inside page block
    Then I softly see field "Types Of Assistance" inside page block
    Then I softly see field "Uses And Use Restrictions" inside page block
    Then I softly see field "Credentials/Documentation" inside page block
    Then I softly see field "Applicant Eligibility" inside page block
    Then I softly see field "Beneficiary Eligibility" inside page block
    Then I softly see field "Pre-application Coordination" inside page block
    Then I softly see field "Application Procedures" inside page block
    Then I softly see field "Award Procedure" inside page block
    Then I softly see field "Deadlines" inside page block
    Then I softly see field "Date Range of Approval/Disapproval" inside page block
    Then I softly see field "Appeals" inside page block
    Then I softly see field "Renewals" inside page block
    Then I softly see field "Criteria For Selecting Proposals" inside page block
    Then I softly see field "Formula And Matching Requirements" inside page block
    Then I softly see field "Length And Time Phasing Of Assistance" inside page block
    Then I softly see field "Reports" inside page block
    Then I softly see field "Audits" inside page block
    Then I softly see field "Records" inside page block
    Then I softly see field "Regulations, Guidelines, and Literature" inside page block
    Then I softly see field "Account Identification" inside page block
    Then I softly see field "Obligations" inside page block
    Then I softly see field "Range and Average of Financial Assistance" inside page block
    Then I softly see field "Program Accomplishments" inside page block
    Then I softly see field "Regional Or Local Office" inside page block
    Then I softly see field "Headquarters Office" inside page block
    Then I softly see field "Website Address" inside page block
    Then I softly see field "Created By" inside page block
    Then I softly see field "Last Modified By" inside page block
    Then I softly see field "Last Modified Date" inside page block
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Program Number" in flex table header "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Program Number" in flex table header "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:nonFederalProgramsTableId---"
    And I click toggle button to select "Non-Federal Programs - All"
    When I click on parallel lines menu bar with data target value "Non-Federal Programs - All"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Non-Federal Programs - All"
    And I wait for "8" seconds
    And I download the file
    Then I softly see "Non-Federal Programs - All" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I click on parallel lines menu bar with data target value "Non-Federal Programs - All"
    And I select "Refresh" from parallel lines dropdown of "Non-Federal Programs - All"
    Then I see table is refreshing
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Create Non Federal Program" opens in overLay window
    Then I softly see field on modal "Program Name" inside page block
    Then I softly see field on modal "Abbreviation" inside page block
    Then I softly see field on modal "Type" inside page block
    Then I softly see field on modal "NGO Organization" inside page block
    When I enter "Grantee_nonFed" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly see "Information" page block displayed
    Then I softly see "Eligibility Requirements" page block displayed
    Then I softly see "Application and Award Process" page block displayed
    Then I softly see "Assistance Consideration" page block displayed
    Then I softly see "Compliance Requirements" page block displayed
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Related Log" sub tab
    Then I softly see "Opportunities" page block displayed
    Then I softly see "Pre-Applications" page block displayed
    Then I softly see "Applications" page block displayed
    Then I softly see "Grants" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Program Files" page block displayed
    Then I softly see "Notes" page block displayed
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    When I enter "Grantee_nonFed_Edition" values from "Program_Field_Values.xlsx"
    And I generate the random digits and save as "digits"
    And I enter value "{SavedValue:digits}" into field "FederalProgramCFDA__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    And I pause execution for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" from computer
    When I click modal button "Close"
    And I pause execution for "3" seconds
    Then I softly see "Program Artifacts" has been added in "Program Files" flex table
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    And I click on "Edit" icon for "Program Artifacts" inside flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    And I select Classification as "Other Artifacts" at upload file modal
    When I click modal button "Save"
#    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Other Artifacts" for title "Classification" inside table "---grantee_tableId:-:nonFedAddFilesTableId---"
    And I click on "Delete" icon for "Other Artifacts" inside flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---" without waiting for record
    Then I softly do not see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:nonFedAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:nonFedNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:nonFedNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:nonFedNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:nonFedNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:nonFedNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:nonFedNotesTableId---" by clicking "Edit" :
      | Created By | Title                     | Description                  |
      | Sarah PM   | Notes Record for Sarah PM | Automation Notes Description |
    Then I softly see value "Notes Record for Sarah PM" for title "Title" inside table "---grantee_tableId:-:nonFedNotesTableId---"
    Then I softly see value "Automation Notes Description" for title "Description" inside table "---grantee_tableId:-:nonFedNotesTableId---"
    And I navigate to "Chatter" sub tab in split screen
    And I post the message "Automation Test" inside chatter
    Then I softly see post "Automation Test" by user "Sarah PM"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Active" for title "New Value" inside field history table
    And I softly see value "Created" for title "Original Value" inside field history table

  @443880 @ValidatePMusershouldabletoseevalidationmessagesforrequiredtosavefiledonKPI @Grantee_Smoke2
  Scenario Outline: Validate PM user should able to see validation messages for required to save filed on KPI
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:KPITable---"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Title is required.               |
      | To Save, Domain is required.              |
      | To Save, Measure is required.             |
      | To Save, Unit of Measurement is required. |
      | To Save, Indicator is required.           |
    And I enter "Grantee_Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I clear the value from field "Description__c"
    When I clear the value from field "Title__c"
    When I enter value "--None--" into field "Unit__c"
    When I enter value "--None--" into field "Orientation__c"
    When I enter value "--None--" into field "Domain__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Domain is required in the Overview tab under the Overview section.              |
      | To Save, Title is required in the Overview tab under the Overview section.               |
      | To Save, Measure is required in the Overview tab under the Overview section.             |
      | To Save, Unit of Measurement is required in the Overview tab under the Overview section. |
      | To Save, Indicator is required in the Overview tab under the Overview section.           |
    Examples:
      | userType   |
      | GRANTEE PM |

  @443850 @ValidatewithPMProfileIfindirectgrantkeepsettingYESthenInApprovedActivestateabletoseetheaccessofsection @Grantee_Smoke1
  Scenario: Validate with PM Profile in direct grant keep setting YES then In Approved Active state able to see the access of section
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I save the field labeled "Maintenance Of Effort Amount" as "MaintenanceOfEffortAmount"
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | Victor EXE | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Award Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 2 |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | David FO | Step 3 |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Grantee PO | Step 4 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
      | KPIs added successfully. |
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---" by clicking "Edit" :
      | Title                  | Target | Current Value | Current Value As Of |
      | Automation Runtime KPI | 10     | 10            | 0                   |
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I cannot see row level action button "Remove" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I navigate to "Projections" sub tab
    Then I cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I navigate to "Management" sub tab
    Then I can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I can see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I cannot see row level action button "View" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly can see "Amendments" sub tab at view detail page
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    Then I can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    Then I can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    Then I can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    Then I can see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    And I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentsTableId---"
    And I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "View" against "Interim Award Document" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Download" against "Interim Award Document" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Edit" against "Interim Award Document" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    And I delete the file in download folder
    Then I softly see value "Activated" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Approver Decision.pdf" as name
    Then I softly see snapshot with name containing "SubmitForApproval.pdf" as name
    Then I softly can see top right button "View NOGA" in page detail
    And I click on "View NOGA" in the page details
    And I download the file
    Then I softly see "{SavedValue:GrantEGMSID}" on page "1" of "govgrants" pdf file

  @443676 @495305 @ValidateNonfederalPOusershouldseeallfieldsandsectionfornonfederalcontacts @Grantee_Smoke3 @Grantee_Smoke2
  Scenario Outline: Validate Non federal PM user should see all fields and section for non federal contact's
    When I login to "Grantee" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Contacts" subheader on left panel
    Then I softly see "Federal Contacts" page block displayed
    Then I softly see "Non-Federal Contacts" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:nonFedContactTableId---" for table id "Next"
    Then I see table "---grantee_tableId:-:nonFedContactTableId---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:nonFedContactTableId---"
    When I click on parallel lines menu bar with data target value "Non-Federal Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Non-Federal Contacts"
    And I wait for "7" seconds
    And I download the file
    Then I softly see "Non-Federal Contacts" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Organization is required in the Contact Information section.   |
      | To Save, Project Role is required in the Contact Information section.   |
      | To Save, First Name is required in the Contact Information section.     |
      | To Save, Last Name is required in the Contact Information section.      |
      | To Save, Phone is required in the Contact Information section.          |
      | To Save, Email is required in the Contact Information section.          |
      | To Save, Address Line 1 is required in the Address Information section. |
      | To Save, State is required in the Address Information section.          |
      | To Save, City is required in the Address Information section.           |
      | To Save, Country is required in the Address Information section.        |
      | To Save, Zip Code is required in the Address Information section.       |
    And I wait for "2" seconds
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Test With Automation PM" into field "AccountId"
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Execution" into field "LastName"
    When I enter in modal value "8967093844" into field "Phone"
    When I enter in modal value "8967093440" into field "MobilePhone"
    And I enter in modal value "123" into field "Email"
    When I enter in modal value "Mail Street" into field "MailingStreet"
    When I enter in modal value "Howard Lane" into field "Address2__c"
    When I enter in modal value "AK: Alaska" into field "State__c"
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "USA" into field "MailingCountry"
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Email: invalid email address: 123 |
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I enter in modal value "123" into field "MailingPostalCode"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 5 Digit Zip Code |
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I enter in modal value "896" into field "Phone"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Phone Number. |
    When I enter in modal value "8967093844" into field "Phone"
    When I enter in modal value "896709" into field "MobilePhone"
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Mobile Phone Number. |
    When I enter in modal value "8967093440" into field "MobilePhone"
    When I enter in modal value "12@3" into field "MailingCity"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "County__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the County field. |
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "te#" into field "CongressionalDistrict__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Enter 3-digit numeric value for Congressional District field |
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "*123" into field "MailingCountry"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the Country field. |
    When I enter in modal value "USA" into field "MailingCountry"
    When I click modal button "Save"
    Then I see field "Title" as "{SavedValue:Automation Runtime}" on modal
    Then I see field "First Name" as "Automation" on modal
    Then I see field "Last Name" as "Execution" on modal
    Then I see field "Phone" as "(896) 709-3844" on modal
    Then I see field "Mobile Phone" as "(896) 709-3440" on modal
    Then I see field "Email" as "{SavedValue:uniqueEmailID}" on modal
    And I click on top right button "Edit" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    When I enter in modal value "Automation Runtime Test" into field "Title"
    When I enter in modal value "Automation1" into field "FirstName"
    When I enter in modal value "Execution1" into field "LastName"
    When I enter in modal value "8967093855" into field "Phone"
    When I enter in modal value "8967093455" into field "MobilePhone"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I save the field labeled "Title" as "Title" on modal
    Then I see field "Title" as "{SavedValue:Automation Runtime Test}" on modal
    Then I see field "First Name" as "Automation1" on modal
    Then I see field "Last Name" as "Execution1" on modal
    Then I see field "Phone" as "(896) 709-3855" on modal
    Then I see field "Mobile Phone" as "(896) 709-3455" on modal
    Then I see field "Email" as "{SavedValue:uniqueEmailID}" on modal
    And I click on hyperlink for modal containing value "Test With Automation PM"
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "Test With Automation PM" in the page details
    And I click on back arrow
    And I click modal button "Close"
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:nonFedContactTableId---" panel
    Then I softly see that "{SavedValue:Title}" has been added in flextable with Id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Examples:
      | User          |
      | GRANTEE PM    |

  @495304 @443672 @federalVerifyusershouldseeallfieldsandsectionforfederalcontact @Grantee_Smoke1 @Grantee_Smoke2
  Scenario Outline: federal_ Verify user should see all fields and section for federal contact's
    When I login to "Grantee" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Contacts" subheader on left panel
    Then I softly see "Federal Contacts" page block displayed
    Then I softly see "Non-Federal Contacts" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:fedContactTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:fedContactTableId---" for table id "Next"
    Then I see table "---grantee_tableId:-:fedContactTableId---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:fedContactTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:fedContactTableId---"
    When I click on parallel lines menu bar with data target value "Federal Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Federal Contacts"
    And I wait for "7" seconds
    And I download the file
    Then I softly see "Federal Contacts" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Project Role" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Project Role is required in the Contact Information section.   |
      | To Save, Organization is required in the Contact Information section.   |
      | To Save, First Name is required in the Contact Information section.     |
      | To Save, Last Name is required in the Contact Information section.      |
      | To Save, Phone is required in the Contact Information section.          |
      | To Save, Email is required in the Contact Information section.          |
      | To Save, Address Line 1 is required in the Address Information section. |
      | To Save, State is required in the Address Information section.          |
      | To Save, City is required in the Address Information section.           |
      | To Save, Country is required in the Address Information section.        |
      | To Save, Zip Code is required in the Address Information section.       |
    And I wait for "2" seconds
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Department of Education" into field "AccountId"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Execution" into field "LastName"
    When I enter in modal value "8967093844" into field "Phone"
    When I enter in modal value "8967093440" into field "MobilePhone"
    And I enter in modal value "123" into field "Email"
    When I enter in modal value "Mail Street" into field "MailingStreet"
    When I enter in modal value "Howard Lane" into field "Address2__c"
    When I enter in modal value "AK: Alaska" into field "State__c"
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "USA" into field "MailingCountry"
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Email: invalid email address: 123 |
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I enter in modal value "123" into field "MailingPostalCode"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 5 Digit Zip Code |
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I enter in modal value "896" into field "Phone"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Phone Number. |
    When I enter in modal value "8967093844" into field "Phone"
    When I enter in modal value "896709" into field "MobilePhone"
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Mobile Phone Number. |
    When I enter in modal value "8967093440" into field "MobilePhone"
    When I enter in modal value "123" into field "MailingCity"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "County__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the County field. |
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "tes" into field "CongressionalDistrict__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Enter 3-digit numeric value for Congressional District field |
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "123" into field "MailingCountry"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the Country field. |
    When I enter in modal value "USA" into field "MailingCountry"
    When I click modal button "Save"
    Then I see field "Title" as "{SavedValue:Automation Runtime}" on modal
    Then I see field "First Name" as "Automation" on modal
    Then I see field "Last Name" as "Execution" on modal
    Then I see field "Phone" as "(896) 709-3844" on modal
    Then I see field "Mobile Phone" as "(896) 709-3440" on modal
    Then I see field "Email" as "{SavedValue:uniqueEmailID}" on modal
    And I click on top right button "Edit" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    When I enter in modal value "Automation Runtime Test" into field "Title"
    When I enter in modal value "Automation1" into field "FirstName"
    When I enter in modal value "Execution1" into field "LastName"
    When I enter in modal value "8967093855" into field "Phone"
    When I enter in modal value "8967093455" into field "MobilePhone"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I save the field labeled "Title" as "Title" on modal
    Then I see field "Title" as "{SavedValue:Automation Runtime Test}" on modal
    Then I see field "First Name" as "Automation1" on modal
    Then I see field "Last Name" as "Execution1" on modal
    Then I see field "Phone" as "(896) 709-3855" on modal
    Then I see field "Mobile Phone" as "(896) 709-3455" on modal
    Then I see field "Email" as "{SavedValue:uniqueEmailID}" on modal
    And I click on hyperlink for modal containing value "Department of Education"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Department of Education" in the page details
    And I click on back arrow
    And I click modal button "Close"
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:fedContactTableId---" panel
    Then I softly see that "{SavedValue:Title}" has been added in flextable with Id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Examples:
      | User          |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE EXE   |
      | GRANTEE FO    |
      | GRANTEE FD    |
      | GRANTEE ADMIN |