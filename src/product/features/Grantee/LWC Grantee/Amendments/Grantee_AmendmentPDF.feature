@GranteeAmendment @GranteeAmendmentPDF
Feature: Validate all scenarios for Grantee Amendment Request for PDF

  @449406 @VerifyPMuserasAROwnersameasAwardOwnercanabletocreatebudgetRedirectionARonactiveAward&abletoAcceptit&abletocreatenewAward&seeimpactonAward&GrantFlowAR @GRegression1 @GranteeTBE
  Scenario: Verify PM user as (AR Owner same as Award Owner) can able to create budget Redirection AR on active Award & able to Accept it & able to create new Award & see impact on Award & Grant (Flow AR)
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "SECOND_FOCUS_WITH_BUDGET"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    And I refresh the page
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Then I softly can see "Actuals" sub tab at view detail page
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I wait for "4" seconds
    Then I see field on modal "Award__c" is not editable
    Then I see field on modal "FAINAmendmentNumber__c" is not editable
    Then I see field on modal "GrantNumber__c" is not editable
    Then I see textarea field "Impact__c" is editable
    Then I see textarea field "PurposeRTA__c" is editable
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Please select Amendment Request Type is required. |
      | To Save, Initiated By is required.                         |
      | To Save, Justification is required.                        |
    And I enter "Grantee_Budget_Redirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "BDRAMENDID"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I navigate to "Overview" sub tab
    And I wait for "3" seconds
    And I click on hyperlink for invisible fields containing value "{SavedValue:AwardEGMSID}"
    And I wait for "3" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see value "{SavedValue:BDRAMENDID}" for title "EGMS ID" inside table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:BDRAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "{SavedValue:BDRAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I softly see field "EGMS ID" as "{SavedValue:BDRAMENDID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Initiated By" as "Grantor"
    Then I softly see field "Amendment Type" as "Budget Redirection"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:BDRAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click on "Edit" icon for "{SavedValue:BDRAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I wait for "3" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Focus Areas" page block displayed
    Then I softly see "Budget Change" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "General Condition" page block displayed
    Then I softly see "Special Conditions" page block displayed
    Then I softly see "System Information" page block displayed
    Then I see field "Grant EGMS ID" is not editable
    Then I see field "Grant Number" is not editable
    Then I see field "Grant Award Number" is not editable
    Then I see field "Award EGMS ID" is not editable
    Then I see textarea field "Impact__c" is editable
    Then I see textarea field "PurposeRTA__c" is editable
    Then I softly see fields "ApprovedIndirectCostRate__c" is in edit mode
    Then I softly see field "Grant EGMS ID" as "{SavedValue:GrantEGMSID}"
    Then I softly see field "Grant Number" as "{SavedValue:GrantNumber}"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantAwardNumber}"
    Then I softly see field "Award EGMS ID" as "{SavedValue:AwardEGMSID}"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
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
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see fields "GeneralConditionChanged__c" is in edit mode
    And I enter value "Checked" into field "GeneralConditionChanged__c"
    Then I softly see fields "AreTCspartofNGAAttachments__c" is in edit mode
    Then I softly see fields "FederalTCLink__c" is in edit mode
    And I enter value "Unchecked" into field "GeneralConditionChanged__c"
    Then I softly do not see fields "AreTCspartofNGAAttachments__c" is visible
    Then I softly do not see fields "FederalTCLink__c" is visible
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see value "Terms1" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on "Delete" icon for "Terms1" inside flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly do not see value "Terms1" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
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
    Then I softly see link "Victor EXE" inside Page block
    And I click on hyperlink containing value "Victor EXE"
    Then I softly see the text containing "victor.exe@ggp.test8.ggmergeqa2"
    And I click on back arrow
    And I navigate to "Files" sub tab
    Then I softly see "Amendment Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Other" has been added in "Amendment Files" flex table
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
    And I select Classification as "Notice of Award" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" by clicking "Edit" :
      | Title          | Title          | Classification  |
      | Attachment.pdf | Automation.pdf | Notice of Award |
    And I refresh the page
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
      | Sarah PM   | Notes Record1 | Automation Notes1 |
    And I wait for "2" seconds
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
    And I wait for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Overview" sub tab
    Then I softly see value "$5,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Awarded Budget | Cash Match |
      | Construction | The narrative | 4500           | 450        |
    When I close "Amendment Line Items" modal by clicking the top right x button
    Then I softly see value "$4,500.00" for title "Revised Award Budget" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:AmendmentBudgetTableId---" for table id "Next"
    Then I softly see value "$5,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title     | Narrative     | Awarded Budget | Cash Match |
      | Site work | The narrative | 500            | 50         |
    When I close "Amendment Line Items" modal by clicking the top right x button
    Then I softly see value "$500.00" for title "Revised Award Budget" against the value "Site work" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Money cannot be moved across the Focus Areas during a Budget Redirection request.       |
      | Overview Tab - Original Awarded budget and Revised budget difference for each focus area must be zero. |
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---"
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title     | Narrative     | Awarded Budget | Cash Match |
      | Site work | The narrative | 500            | 50         |
    When I close "Amendment Line Items" modal by clicking the top right x button
    Then I softly see value "$500.00" for title "Revised Award Budget" against the value "Site work" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:AmendmentBudgetTableId---" for table id "Next"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Awarded Budget | Cash Match |
      | Construction | The narrative | 4500           | 450        |
    When I close "Amendment Line Items" modal by clicking the top right x button
    Then I softly see value "$4,500.00" for title "Revised Award Budget" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Money cannot be moved across the Focus Areas during a Budget Redirection request.       |
      | Overview Tab - Original Awarded budget and Revised budget difference for each focus area must be zero. |
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
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
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    And I select "Search: Amendment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:BDRAMENDID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:BDRAMENDID}" in global search with id "Amendment Requests"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:BDRAMENDID}" in global search with id "Amendment Requests"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:BDRAMENDID}" in global search with id "Amendment Requests"
    And I click on row level action button "Edit" against "{SavedValue:BDRAMENDID}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Accepted"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @485290 @VerifyPMuserasAROwnercanabletocreateFundingChangeARonactiveAward&NotAcceptARbyGrantor&notabletoseeAmendAwardbuttoninNotAcceptedstateofFCAR @P3_Grantee @ADMIN_Grantee @GRegression2
  Scenario Outline: Verify PM user as (AR Owner) can able to create Funding Change AR on active Award & Not Accept AR by Grantor & not able to see Amend Award button in Not Accepted state of FC AR
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-<userName>"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Draft"
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I save the field labeled "Project Period" as "ProjectPeriod"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Redirection Threshold (%)" as "ReqiredChange"
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
      | To Save, Initiated By is required.                         |
      | To Save, Justification is required.                        |
    And I enter "Grantee_FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FNCAMENDID"
    When I navigate to "Overview" sub tab
    And I wait for "3" seconds
    And I click on hyperlink for invisible fields containing value "{SavedValue:AwardEGMSID}"
    And I wait for "3" seconds
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
    And I wait for "3" seconds
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
    Then I softly see field "Initiated By" as "Grantor"
    Then I softly see field "Amendment Type" as "Funding Change"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:FNCAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click on "Edit" icon for "{SavedValue:FNCAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I wait for "2" seconds
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
    And I wait for "2" seconds
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
    Then I softly see value "$5,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see value "$500.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see value "$200.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see value "$5,700.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Original Budget Details" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
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
      | Test  | The narrative | 5000           | 500        | 500            |
    And I click on "Delete" icon for "Test" inside flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---"
    Then I softly do not see value "Test" for title "Title" inside table "---grantee_tableId:-:amendmentLineItemsTableId---"
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
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I click on "Edit" in the page details
    Then I softly see fields "GeneralConditionChanged__c" is in edit mode
    And I enter value "Checked" into field "GeneralConditionChanged__c"
    Then I softly see fields "AreTCspartofNGAAttachments__c" is in edit mode
    Then I softly see fields "FederalTCLink__c" is in edit mode
    And I enter value "Unchecked" into field "GeneralConditionChanged__c"
    Then I softly do not see fields "AreTCspartofNGAAttachments__c" is visible
    Then I softly do not see fields "FederalTCLink__c" is visible
    And I click on "Save" in the page details
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
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
      | Victor EXE | NA                |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 2            |
    Then I softly see link "Victor EXE" inside Page block
    And I click on hyperlink containing value "Victor EXE"
    And I wait for "2" seconds
    Then I softly see the text containing "victor.exe@ggp.test8.ggmergeqa2"
    And I click on back arrow
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
    And I click modal button "Close"
    And I refresh the page
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
    And I wait for "2" seconds
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
    And I wait for "3" seconds
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
      | 1500  | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title | Narrative     | Awarded Budget | Cash Match | Other Leverage |
      | Test  | The narrative | 3000           | 300        | 300            |
    When I close "Amendment Line Items" modal by clicking the top right x button
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title | Narrative     | Awarded Budget | Cash Match | Other Leverage |
      | Test  | The narrative | 2000           | 200        | 200            |
    When I close "Amendment Line Items" modal by clicking the top right x button
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
      | Value        | Field       |
      | Not Accepted | Decision__c |
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Additional Details is required. |
    When I enter values into fields
      | Value | Field       |
      | Test  | Comments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Not Accepted"
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Not Accepted" for title "New Value" inside field history table
    Then I softly see value "Submitted to Grantor" for title "Original Value" inside field history table
    Examples:
      | userName           | User           | Approval      |
      | Product Admin user | GRANTEE ADMIN1 | Product Admin |

  @449167 @VerifyPMuserasAROwnercanabletocreateFundingChangeARonactiveAward&NotAcceptARbyGrantor&notabletoseeAmendAwardbuttoninNotAcceptedstateofFCAR @P2_Grantee @EXE_Grantee @GRegression1
  Scenario Outline: Verify PM user as (AR Owner) can able to create Funding Change AR on active Award & Not Accept AR by Grantor & not able to see Amend Award button in Not Accepted state of FC AR
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-<userName>"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Draft"
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I save the field labeled "Project Period" as "ProjectPeriod"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Redirection Threshold (%)" as "ReqiredChange"
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
      | To Save, Initiated By is required.                         |
      | To Save, Justification is required.                        |
    And I enter "Grantee_FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FNCAMENDID"
    When I navigate to "Overview" sub tab
    And I wait for "3" seconds
    And I click on hyperlink for invisible fields containing value "{SavedValue:AwardEGMSID}"
    And I wait for "3" seconds
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
    And I wait for "3" seconds
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
    Then I softly see field "Initiated By" as "Grantor"
    Then I softly see field "Amendment Type" as "Funding Change"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:FNCAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click on "Edit" icon for "{SavedValue:FNCAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I wait for "2" seconds
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
    And I wait for "2" seconds
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
    Then I softly see value "$5,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see value "$500.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see value "$200.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see value "$5,700.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Original Budget Details" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
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
      | Test  | The narrative | 5000           | 500        | 500            |
    And I click on "Delete" icon for "Test" inside flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---"
    Then I softly do not see value "Test" for title "Title" inside table "---grantee_tableId:-:amendmentLineItemsTableId---"
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
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I click on "Edit" in the page details
    Then I softly see fields "GeneralConditionChanged__c" is in edit mode
    And I enter value "Checked" into field "GeneralConditionChanged__c"
    Then I softly see fields "AreTCspartofNGAAttachments__c" is in edit mode
    Then I softly see fields "FederalTCLink__c" is in edit mode
    And I enter value "Unchecked" into field "GeneralConditionChanged__c"
    Then I softly do not see fields "AreTCspartofNGAAttachments__c" is visible
    Then I softly do not see fields "FederalTCLink__c" is visible
    And I click on "Save" in the page details
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
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
      | Victor EXE | NA                |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 2            |
    Then I softly see link "Victor EXE" inside Page block
    And I click on hyperlink containing value "Victor EXE"
    And I wait for "2" seconds
    Then I softly see the text containing "victor.exe@ggp.test8.ggmergeqa2"
    And I click on back arrow
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
    And I click modal button "Close"
    And I refresh the page
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
    And I wait for "2" seconds
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
    And I wait for "3" seconds
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
      | 1500  | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title | Narrative     | Awarded Budget | Cash Match | Other Leverage |
      | Test  | The narrative | 3000           | 300        | 300            |
    When I close "Amendment Line Items" modal by clicking the top right x button
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title | Narrative     | Awarded Budget | Cash Match | Other Leverage |
      | Test  | The narrative | 2000           | 200        | 200            |
    When I close "Amendment Line Items" modal by clicking the top right x button
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
      | Value        | Field       |
      | Not Accepted | Decision__c |
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Additional Details is required. |
    When I enter values into fields
      | Value | Field       |
      | Test  | Comments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Not Accepted"
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Not Accepted" for title "New Value" inside field history table
    Then I softly see value "Submitted to Grantor" for title "Original Value" inside field history table
    Examples:
      | userName        | User        | Approval   |
      | Victor EXE user | GRANTEE EXE | Victor EXE |

  @464085 @VerifyPOuserasAROwnercanabletocreatBudgetPeriodChangeARonactiveAward&NotAcceptARbyGrantor&notabletoseeAmendAwardbuttoninNotAcceptedstateofBPCAR @GRegression4 @GranteeTBE
  Scenario Outline: Verify PO user as (AR Owner) can able to create Budget Period Change AR on active Award & Not Accept AR by Grantor & not able to see Amend Award button in Not Accepted state of BPC AR
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I refresh the page
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
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
    And I enter "Grantee_BPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_BPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BPCAMENDID"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "NewBudgetPeriodEndDate"
    And I click on hyperlink for invisible fields containing value "{SavedValue:AwardEGMSID}"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see value "Record Id" for title "{SavedValue:BPCAMENDID}" inside table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:BPCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:BPCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:BPCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:BPCAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:BPCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:BPCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:BPCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "{SavedValue:BPCAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I softly see field "EGMS ID" as "{SavedValue:BPCAMENDID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Initiated By" as "Grantor"
    Then I softly see field "Amendment Type" as "Budget Period Change"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:BPCAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click on "Edit" icon for "{SavedValue:BPCAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Budget Period Change" page block displayed
    Then I softly see "Focus Areas" page block displayed
    Then I softly see "Indirect Rates" page block displayed
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
    Then I see field "Budget Period" is not editable
    Then I softly see field "Budget Period" as "{SavedValue:BudgetPeriod}"
    Then I softly see fields "NewBudgetPeriodEndDate__c" is in edit mode
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | End Date                            |
      | Automation Permanent Focus Area | {SavedValue:NewBudgetPeriodEndDate} |
    When I click on parallel lines menu bar with data target value "Focus Areas"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Effective until" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see fields "GeneralConditionChanged__c" is in edit mode
    And I enter value "Checked" into field "GeneralConditionChanged__c"
    Then I softly see fields "AreTCspartofNGAAttachments__c" is in edit mode
    Then I softly see fields "FederalTCLink__c" is in edit mode
    And I enter value "Unchecked" into field "GeneralConditionChanged__c"
    Then I softly do not see fields "AreTCspartofNGAAttachments__c" is visible
    Then I softly do not see fields "FederalTCLink__c" is visible
    And I click on "Save" in the page details
    Then I softly see value "Terms" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
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
    And I click on back arrow
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
    When I click on parallel lines menu bar with data target value "Amendment Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "Edit" :
      | Title         | Title         | Description       |
      | Notes Record1 | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Recor2" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
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
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To        | Subject            | Body            |
      | <EmailTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<EmailFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<EmailTo>" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    When I click on "Subject" column header inside table with id "CommunicationHistory"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:amendmentMessageTableID---"
    When I click on parallel lines menu bar with data target value "Messages"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I wait for "2" seconds
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
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "2" seconds
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
    And I wait for "3" seconds
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
      | Value        | Field       |
      | Not Accepted | Decision__c |
      | Test         | Comments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Not Accepted"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button " Amend Award" in page detail
    And I navigate to "History" sub tab
    Then I softly do not see "Grantor Decision History" page block displayed
    Examples:
      | User       | EmailFrom                | EmailTo                   |
      | GRANTEE PO | govgrantsuat@yopmail.com | pm.automation@yopmail.com |

  @464085 @VerifyFOuserasAROwnercanabletocreatBudgetPeriodChangeARonactiveAward&NotAcceptARbyGrantor&notabletoseeAmendAwardbuttoninNotAcceptedstateofBPCAR @GRegression4 @GranteeTBE
  Scenario Outline: Verify FO user as (AR Owner) can able to create Budget Period Change AR on active Award & Not Accept AR by Grantor & not able to see Amend Award button in Not Accepted state of BPC AR
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I refresh the page
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
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
    And I enter "Grantee_BPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_BPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BPCAMENDID"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "NewBudgetPeriodEndDate"
    And I click on hyperlink for invisible fields containing value "{SavedValue:AwardEGMSID}"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see value "Record Id" for title "{SavedValue:BPCAMENDID}" inside table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:BPCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:BPCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:BPCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:BPCAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:BPCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:BPCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:BPCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "{SavedValue:BPCAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I softly see field "EGMS ID" as "{SavedValue:BPCAMENDID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Initiated By" as "Grantor"
    Then I softly see field "Amendment Type" as "Budget Period Change"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:BPCAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click on "Edit" icon for "{SavedValue:BPCAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Budget Period Change" page block displayed
    Then I softly see "Focus Areas" page block displayed
    Then I softly see "Indirect Rates" page block displayed
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
    Then I see field "Budget Period" is not editable
    Then I softly see field "Budget Period" as "{SavedValue:BudgetPeriod}"
    Then I softly see fields "NewBudgetPeriodEndDate__c" is in edit mode
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | End Date                            |
      | Automation Permanent Focus Area | {SavedValue:NewBudgetPeriodEndDate} |
    When I click on parallel lines menu bar with data target value "Focus Areas"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Effective until" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see fields "GeneralConditionChanged__c" is in edit mode
    And I enter value "Checked" into field "GeneralConditionChanged__c"
    Then I softly see fields "AreTCspartofNGAAttachments__c" is in edit mode
    Then I softly see fields "FederalTCLink__c" is in edit mode
    And I enter value "Unchecked" into field "GeneralConditionChanged__c"
    Then I softly do not see fields "AreTCspartofNGAAttachments__c" is visible
    Then I softly do not see fields "FederalTCLink__c" is visible
    And I click on "Save" in the page details
    Then I softly see value "Terms" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
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
    And I click on back arrow
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
    When I click on parallel lines menu bar with data target value "Amendment Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "Edit" :
      | Title         | Title         | Description       |
      | Notes Record1 | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Recor2" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
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
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To        | Subject            | Body            |
      | <EmailTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<EmailFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<EmailTo>" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    When I click on "Subject" column header inside table with id "CommunicationHistory"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:amendmentMessageTableID---"
    When I click on parallel lines menu bar with data target value "Messages"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I wait for "2" seconds
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
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "2" seconds
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
    And I wait for "3" seconds
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
      | Value        | Field       |
      | Not Accepted | Decision__c |
      | Test         | Comments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Not Accepted"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button " Amend Award" in page detail
    And I navigate to "History" sub tab
    Then I softly do not see "Grantor Decision History" page block displayed
    Examples:
      | User       | EmailFrom                | EmailTo                   |
      | GRANTEE FO | david.fo@yopmail.com     | pm.automation@yopmail.com |

  @485466  @VerifyPOuserasAROwnersameasAwardOwnercanabletocreateFundingChangeARonactiveAward&abletoAcceptit&abletocreatenewAward&seeimpactonAward&Grant @P2_Grantee @PM_Grantee @GRegression4
  Scenario Outline: Verify PO user as (AR Owner same as Award Owner) can able to create Funding Change AR on active Award & able to Accept it & able to create new Award & see impact on Award & Grant
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
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Redirection Threshold (%)" as "ReqiredChange"
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
      | To Save, Initiated By is required.                         |
      | To Save, Justification is required.                        |
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
    Then I softly see value "$5,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see value "$500.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see value "$200.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see value "$5,700.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Original Budget Details" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
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
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
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
    And I wait for "2" seconds
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
#    And I click on "Download" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
#    And I wait for "2" seconds
#    And I download the file
#    Then I see "Welcome to Smallpdf" on page "1" of "govgrants" pdf file
#    And I switch to parent tab
    And I click on "View" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see the image "Attachment.pdf" in page detail
    And I click on "Close" button for view files page
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I update title as "Automation.pdf" on upload file modal
    And I update title as "Attachment.pdf" on upload file modal
    And I select Classification as "Notice of Award" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
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
    And I wait for "2" seconds
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
      | userName        | User        | Approval   |
      | Grantee PO user | GRANTEE PO  | Grantee PO |

  @449143 @VerifyPMuserasAROwnersameasAwardOwnercanabletocreateFundingChangeARonactiveAward&abletoAcceptit&abletocreatenewAward&seeimpactonAward&Grant @P1_Grantee @EXE_Grantee @GRegression1
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
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Redirection Threshold (%)" as "ReqiredChange"
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
      | To Save, Initiated By is required.                         |
      | To Save, Justification is required.                        |
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
    Then I softly see value "$5,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see value "$500.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see value "$200.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see value "$5,700.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Original Budget Details" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
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
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
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
    And I wait for "2" seconds
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
#    And I click on "Download" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
#    And I wait for "2" seconds
#    And I download the file
#    Then I see "Welcome to Smallpdf" on page "1" of "govgrants" pdf file
#    And I switch to parent tab
    And I click on "View" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see the image "Attachment.pdf" in page detail
    And I click on "Close" button for view files page
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I update title as "Automation.pdf" on upload file modal
    And I update title as "Attachment.pdf" on upload file modal
    And I select Classification as "Notice of Award" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
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
    And I wait for "2" seconds
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
      | userName        | User        | Approval   |
      | Victor EXE user | GRANTEE EXE | Victor EXE |

  @471029 @VerifytheFlowofothertypeofAR @P1_Grantee @PM_Grantee @GRegression1
  Scenario:Verify the Flow of other type of AR
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
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
    And I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
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
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I navigate to "Projections" sub tab
    And I save the value from row "1" for column name "Focus Area Name" as "FocusAreaName" from flex table "---grantee_tableId:-:awardProgramIncomeTableId---"
    And I save the value from row "1" for column name "Projected Program Income ($)" as "ProjectedProgramIncome" from flex table "---grantee_tableId:-:awardProgramIncomeTableId---"
    And I save the value from row "1" for column name "Program Income Justification" as "ProgramIncomeJustification" from flex table "---grantee_tableId:-:awardProgramIncomeTableId---"
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective from" as "Effectivefrom" from flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective until" as "Effectiveuntil" from flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:awardIndirectRateTableId---"
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
      | To Save, Initiated By is required.                         |
      | To Save, Justification is required.                        |
    And I enter "Grantee_Other_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_Other_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "OTHAMENDID"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:AwardEGMSID}"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see value "Record Id" for title "{SavedValue:OTHAMENDID}" inside table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "{SavedValue:OTHAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I softly see field "EGMS ID" as "{SavedValue:OTHAMENDID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Initiated By" as "Grantor"
    Then I softly see field "Amendment Type" as "Other"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click on "Edit" icon for "{SavedValue:OTHAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I wait for "3" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Other Changes" page block displayed
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
    Then I softly see fields "GeneralConditionChanged__c" is in edit mode
    And I enter value "Checked" into field "GeneralConditionChanged__c"
    Then I softly see fields "AreTCspartofNGAAttachments__c" is in edit mode
    Then I softly see fields "FederalTCLink__c" is in edit mode
    And I enter value "Unchecked" into field "GeneralConditionChanged__c"
    Then I softly do not see fields "AreTCspartofNGAAttachments__c" is visible
    Then I softly do not see fields "FederalTCLink__c" is visible
    And I click on "Save" in the page details
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
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
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    Then I see "AttachmentTesting.pdf" has been added in "Amendment Files" flex table
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
    Then I softly see the image "AttachmentTesting.pdf" in page detail
    And I click on "Close" button for view files page
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Notice of Award" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I refresh the page
    Then I softly see "Notice of Award" has been added in "Amendment Files" flex table
    And I click on "Delete" icon for "Notice of Award" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" without waiting for record
    Then I softly do not see value "Notice of Award" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    When I click on parallel lines menu bar with data target value "Amendment Files"
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
      | David FO   | Notes Record1 | Automation Notes1 |
    And I wait for "2" seconds
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
    And I click on "Complete Review" in the page details
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
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
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
    And I save the field labeled "EGMS ID" as "AREGMSID"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    And I navigate to "Projections" sub tab
    When I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:BudgetPeriodStartDate}"
    When I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    Then I softly see field "Budget Period End Date" as "{SavedValue:BudgetPeriodEndDate}"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see value "$5,000.00" for title "Award  Budget" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$200.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$5,700.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "{SavedValue:TitleIndirectRate}" for title "Title" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see value "{SavedValue:Effectivefrom}" for title "Effective from" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see value "{SavedValue:Effectiveuntil}" for title "Effective until" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see value "{SavedValue:ApprovedIndirectCostRate}" for title "Approved Indirect Cost Rate(%)" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see value "{SavedValue:FocusAreaName}" for title "Focus Area Name" inside table "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see value "{SavedValue:ProjectedProgramIncome}" for title "Projected Program Income ($)" inside table "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see value "{SavedValue:ProgramIncomeJustification}" for title "Program Income Justification" inside table "---grantee_tableId:-:awardProgramIncomeTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Activated" for title "New Value" inside field history table
    Then I softly see value "Pending Activation" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "History" sub tab
    Then I softly see field "Source Change Request" as "{SavedValue:AREGMSID}"
    Then I softly see field "Request Type" as "Change Request"