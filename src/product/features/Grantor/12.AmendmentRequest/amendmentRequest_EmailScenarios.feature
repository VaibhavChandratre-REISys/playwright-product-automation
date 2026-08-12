@emailRegression @amendmentRequestEmailScenarios @amendmentRequests @grantor-regression @grantor-parallel-regression @parallel-regression @regression @amendExecution
Feature: Validate all Email scenarios in the Amendment Request

  #amendmentAllocationNew
  @274160 @Validatenewowneroftaskseesubmittedtaskisgeneratedforhimofamendments @Sprint-23-US-273843  @Allocation @skipDueToIndUser @wip
  Scenario: Validate new owner of task see submitted task is generated for him of amendments
    Given I activated standalone subaward "Automation Runtime Award" with properties "SECOND_BUD_CAT_SECOND_FOCUS_BUILD_UP_IND_ORG-Automation PO user" of type "Formula_By_Applicant"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Sub_BR_KPC_SOW_creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budRedKPCSOWId"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role |
      | {SavedValue:SPI3 Username} | Other        |
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Award Amount |
      | Construction | 450          |
    And I click modal button "Close"
    When I click on "Add Line Items" icon for "Indirect costs" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount |
      | Construction | The Narrative | 50           |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I wait for "3" seconds
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Award Amount |
      | Construction | 450          |
    And I click modal button "Close"
    And I wait for "3" seconds
    When I click on "Add Line Items" icon for "Indirect costs" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount |
      | Construction | The Narrative | 50           |
    And I click modal button "Close"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budRedKPCSOWId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:budRedKPCSOWId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:budRedKPCSOWId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budRedKPCSOWId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budRedKPCSOWId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budRedKPCSOWId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budRedKPCSOWId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budRedKPCSOWId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budRedKPCSOWId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    And I checkout to yopmail with mailid "automation.po1.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budRedKPCSOWId} Automation PO Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  #amendmentRequestsWBNew
  @531297 @validateCombinationofamendmentFlexsharingPMuser(amendmentowner)cansubmitamendmentforapproval
  Scenario: validate Combination of amendment Flexsharing - PM user (amendment owner) can submit amendment for approval
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Formula_By_Applicant_Focus_Area"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BPC_SOW_FC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "bpcFcScopeId"
    And I wait for "2" seconds
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | End Date                             | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:updatedBudgetPeriodDate} | 1000           |
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---progressreport:-:AmendmentAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---progressreport:-:AmendmentAttachmentTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentAddNotesTableId---" by clicking "New" :
      | Title            | Description      |
      | Automation Notes | Automation Notes |
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I see field "Status" as "Sent to Subrecipient"
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:bpcFcScopeId}"
    And I click on hyperlink containing value "{SavedValue:bpcFcScopeId}"
    Then I softly see field "Status" as "Sent to Subrecipient"
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:bpcFcScopeId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly see value "{SavedValue:bpcFcScopeId}" for title "EGMS ID" inside table "---amendment:-:recipientSideAmendmentRequestTableId---"
    When I click on "View" icon for "{SavedValue:bpcFcScopeId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:bpcFcScopeId}" for title "EGMS ID" inside table "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I navigate to "Overview" sub tab
    When I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Requests" sub tab
    Then I softly see value "{SavedValue:bpcFcScopeId}" for title "EGMS ID" inside table "---amendment:-:SubrecipientGrantAmendmentTableId---"
    When I click on "View" icon for "{SavedValue:bpcFcScopeId}" inside flex table with id "---amendment:-:SubrecipientGrantAmendmentTableId---"
    When I navigate to "Overview" sub tab
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    Then I softly see value "$1,000.00" for title "Revised Award Amount" inside table "---progressReport:-:budgetChangeTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:bpcFcScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 2            |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:bpcFcScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:PO Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:bpcFcScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    And I "Send to Owner" in the approval decision
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:bpcFcScopeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:bpcFcScopeId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:bpcFcScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:bpcFcScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Reject" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:bpcFcScopeId} has beenRejected
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Amendment Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:bpcFcScopeId}
      Amendment Request Type:
      Comments: Automation Testing
      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @534344 @534343 @534342 @534337 @534340 @534333 @534328 @validateSPIusercanSendamendmentrequesttoGrantor
  Scenario: Validate SPI user can Send BR amendment request to Grantor | PM user (amendment owner) can submit amendment for approval | Validate amendment owner can click Amend Subaward button
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see "Budget Change" page block displayed
    Then I softly see "System Information" page block displayed
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount |
      | Construction  | 900                  |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name  | Revised Award Amount |
      | Indirect costs | 100                  |
    Then I softly see value "$1,000.00" for title "Budgeted Amount" against the value "Grand Total" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    Then I see the following rows under the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Revised Award Amount |
      | $1,000.00            |
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:subrecipientProjectAreasTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    And I click on top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    When I enter the following values into flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---" by clicking "New" :
      | Title            | Description      |
      | Automation Notes | Automation Notes |
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:projectAreasTableId---"
    Then I softly see "Budget Change" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see value "$900.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see value "$100.00" for title "Revised Award Amount" against the value "Indirect costs" inside table "---amendment:-:grantorBudgetChangeTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 2            |
    And I wait for "2" seconds
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    When I navigate to "Responsibilities" sub tab
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:projectAreasTableId---"
    Then I softly see "Budget Change" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see value "$900.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see value "$100.00" for title "Revised Award Amount" against the value "Indirect costs" inside table "---amendment:-:grantorBudgetChangeTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Title" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Overview" sub tab
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:projectAreasTableId---"
    Then I softly see "Budget Change" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see value "$900.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see value "$100.00" for title "Revised Award Amount" against the value "Indirect costs" inside table "---amendment:-:grantorBudgetChangeTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Title" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Overview" sub tab
    And I "Approve" in the approval decision
    Then I see field "Status" as "Approved"
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:projectAreasTableId---"
    Then I softly see "Budget Change" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see value "$900.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see value "$100.00" for title "Revised Award Amount" against the value "Indirect costs" inside table "---amendment:-:grantorBudgetChangeTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Title" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:fundingChangeApproversTableId---"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    #534343
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I softly see value "{SavedValue:BUDGETREDIRECTIONID}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "5" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId1"
    #534344
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    #534342
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    Then I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:BUDGETREDIRECTIONID} hasbeen Approved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:BUDGETREDIRECTIONID} for the award # {SavedValue:AwardEGMSID} has been approved and a new award can be created.
      Amendment Details:
      Amendment Request Type: Budget Redirection
      Amendment ID: {SavedValue:BUDGETREDIRECTIONID}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}
      Log in to EGMS, and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @534341 @validateBudgetRedirectionARrequestwhenAmendementrequestisRejectedbyanystepapprover
  Scenario: Validate Budget Redirection AR request when Amendement request is Rejected by any step approver
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see "Budget Change" page block displayed
    Then I softly see "System Information" page block displayed
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount |
      | Construction  | 900                  |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name  | Revised Award Amount |
      | Indirect costs | 100                  |
    Then I softly see value "$1,000.00" for title "Budgeted Amount" against the value "Grand Total" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    Then I see the following rows under the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Revised Award Amount |
      | $1,000.00            |
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:subrecipientProjectAreasTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    And I click on top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    When I enter the following values into flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---" by clicking "New" :
      | Title            | Description      |
      | Automation Notes | Automation Notes |
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:projectAreasTableId---"
    Then I softly see "Budget Change" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see value "$900.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see value "$100.00" for title "Revised Award Amount" against the value "Indirect costs" inside table "---amendment:-:grantorBudgetChangeTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 2            |
    And I wait for "2" seconds
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    When I navigate to "Responsibilities" sub tab
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:projectAreasTableId---"
    Then I softly see "Budget Change" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see value "$900.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see value "$100.00" for title "Revised Award Amount" against the value "Indirect costs" inside table "---amendment:-:grantorBudgetChangeTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Title" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Overview" sub tab
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:projectAreasTableId---"
    Then I softly see "Budget Change" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see value "$900.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see value "$100.00" for title "Revised Award Amount" against the value "Indirect costs" inside table "---amendment:-:grantorBudgetChangeTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Title" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Overview" sub tab
    And I "Reject" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:projectAreasTableId---"
    Then I softly see "Budget Change" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see value "$900.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see value "$100.00" for title "Revised Award Amount" against the value "Indirect costs" inside table "---amendment:-:grantorBudgetChangeTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Title" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:fundingChangeApproversTableId---"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Rejected" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:BUDGETREDIRECTIONID}"
    And I click on hyperlink containing value "{SavedValue:BUDGETREDIRECTIONID}"
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly see value "{SavedValue:BUDGETREDIRECTIONID}" for title "EGMS ID" inside table "---amendment:-:recipientSideAmendmentRequestTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:BUDGETREDIRECTIONID}" for title "EGMS ID" inside table "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    When I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Requests" sub tab
    Then I softly see "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:SubrecipientGrantAmendmentTableId---"
    When I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:SubrecipientGrantAmendmentTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see "Budget Change" page block displayed
    Then I softly see "System Information" page block displayed
    Then I cannot see row level action button "Edit" against "Construction" in flex table with id "---amendment:-:budgetChangeTableId---"
    Then I softly see value "$1,000.00" for title "Budgeted Amount" against the value "Grand Total" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:subrecipientProjectAreasTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I can see row level action button "Edit" against "Automation Notes" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I can see row level action button "Delete" against "Automation Notes" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:BUDGETREDIRECTIONID} has beenRejected
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:BUDGETREDIRECTIONID}
      Amendment Request Type: Budget Redirection
      Comments: Automation Testing
      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @530833 @530834 @530835 @530831 @validatePMuser(amendmentowner)cansubmitamendmentforapproval
  Scenario: Validate PM user (amendment owner) can submit amendment for approval | Validate amendment owner can  Activate Subaward from terms and Condition amendment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    Given I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Then I softly see that "Subaward" is in "Activated" status
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Justification" into field "TncComments__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "TnCEGMSID"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I select value inside table "---amendment:-:AmendmentSpecialConditionTableId---" is "All"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 2            |
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    And I pause execution for "3" seconds
    And I click modal button "Close"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentAddNotesTableId---" by clicking "New" :
      | Title            | Description      |
      | Automation Notes | Automation Notes |
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    And I click on "Send to Subrecipient" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TnCEGMSID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly can see top right button "Acknowledge" in page detail
    Then I softly do not see top right button "Associate" inside flex table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I select value inside table "---amendment:-:RecipientTermsandConditionsTableId---" is "All"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    And I click on top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    When I enter the following values into flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---" by clicking "New" :
      | Title             | Description       |
      | Automation Notes1 | Automation Notes1 |
    Then I softly see value "Automation Notes1" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    And I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged"
    Then I softly see status in Progress-bar is "Acknowledged" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TnCEGMSID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Acknowledged"
    Then I softly see status in Progress-bar is "Acknowledged" and is "dark blue"
    And I navigate to "Overview" sub tab
    Then I softly do not see top right button "Associate" inside flex table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I select value inside table "---amendment:-:AmendmentSpecialConditionTableId---" is "All"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---amendment:-:approversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    And I navigate to "Overview" sub tab
    Then I softly do not see top right button "Associate" inside flex table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I select value inside table "---amendment:-:AmendmentSpecialConditionTableId---" is "All"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I cannot see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Title" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Overview" sub tab
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:TnCEGMSID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    And I navigate to "Overview" sub tab
    Then I softly do not see top right button "Associate" inside flex table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I select value inside table "---amendment:-:AmendmentSpecialConditionTableId---" is "All"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I cannot see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    When I navigate to "Overview" sub tab
    And I "Approve" in the approval decision
    Then I see field "Status" as "Approved"
    And I navigate to "Overview" sub tab
    Then I softly do not see top right button "Associate" inside flex table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I select value inside table "---amendment:-:AmendmentSpecialConditionTableId---" is "All"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I cannot see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    #530833
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I softly see value "{SavedValue:TnCEGMSID}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:TnCEGMSID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    Then I softly do not see top right button "Associate" inside flex table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I select value inside table "---amendment:-:AmendmentSpecialConditionTableId---" is "All"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I cannot see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I wait for "2" seconds
    #530834
    And I click on "Amend Subaward" in the page details
    And I pause execution for "5" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId1"
    #530835
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    Then I see the mail subject is as follows :
    """
    Sandbox: Notification: Amendment Request #{SavedValue:TnCEGMSID} hasbeen Approved
    """
    Then I see the mail text is as follows :
    """
    Hello,
    This email is to inform you that the amendment request #{SavedValue:TnCEGMSID} for the award # {SavedValue:AwardEGMSID} has been approved and a new award can be created.
    Amendment Details:
    Amendment Request Type: Terms and Conditions Change
    Amendment ID: {SavedValue:TnCEGMSID}
    Status: Approved
    Grant: {SavedValue:GrantEGMSID}
    Log in to EGMS, and click here to access the record.
    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
    Thank you.
    The EGMS Team
    """

  #amendmentRequestsWB
  @200533 @ValidateAmendmentRequestSubmittedGrantorNotifyemailshouldbegenerateforPMnewownerofamendmentrequest @sprint-5-US-196841  @reassignment
  Scenario: Validate Amendment Request Submitted Grantor Notify' email should be generate for PM new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 2            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:FundingID} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200540 @ValidateAmendmentRequestSentBackemailshouldbegenerateforPMnewownerofamendmentrequest @sprint-5-US-196841  @reassignment
  Scenario: Validate Amendment Request Sent Back' email should be generate for PM new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 4100  | RevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
"""
      Sandbox: Notification: Amendment Request #{SavedValue:FundingID} has been SentBack by an Approver
      """
    Then I see the mail text is as follows :

"""
     Hello,
     This email is to inform you that the amendment request #{SavedValue:FundingID} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.

     Amendment Details:
     Amendment Type:
     Amendment ID: {SavedValue:FundingID}
     Status: Created
     Grant: {SavedValue:GrantEGMSID}

     Log in to EGMS and click here to access the record.

     Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
     Thank you.
     The EGMS Team
      """

  @200658 @ValidateAmendmentRequestSubmittedGrantorNotifyemailshouldbegenerateforPMnewownerofamendmentrequest @sprint-5-US-196841  @reassignment
  Scenario: Validate Amendment Request Submitted Grantor Notify' email should be generate for PM new owner of amendment request
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role           |
      | {SavedValue:SPI3 Username} | Principal Investigator |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "120" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
"""
      Sandbox: Notification: Owner Reassignment Report
      """

  @200662 @ValidateAmendmentRequestSentBackemailshouldbegenerateforPMnewownerofamendmentrequest @sprint-5-US-196841  @reassignment
  Scenario: Validate Amendment Request Sent Back' email should be generate for PM new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role           |
      | {SavedValue:SPI3 Username} | Principal Investigator |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "120" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
"""
      Sandbox: Notification: Amendment Request #{SavedValue:PERIODICRENEWAL} has been SentBack by an Approver
      """

    Then I see the mail text is as follows :

"""
     Hello,
     This email is to inform you that the amendment request #{SavedValue:PERIODICRENEWAL} which has been created for the award # has been sent back by the approver.
     Amendment Details:
     Amendment Type:
     Amendment ID: {SavedValue:PERIODICRENEWAL}
     Status: Created
     Grant: {SavedValue:GrantEGMSID}
     GrantName: {SavedValue:GrantEGMSID}
     Log in to EGMS and click here to access the record.
     Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
     Thank you.
     The EGMS Team
      """

  @200791 @ValidateAmendmentRequestSubmittedGrantorNotifyemailshouldbegenerateforPMnewownerofamendmentrequest @sprint-5-US-196841  @reassignment
  Scenario: Validate Amendment Request Submitted Grantor Notify email should be generate for PM new owner of amendment request
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                    | Field          |
      | Automation Justification | TncComments__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
"""
      Sandbox: Notification: Owner Reassignment Report
      """

  @200857 @ValidateFundingVerifyAmendmentRequestRejectedemailshouldbegenerateforEXEnewownerofamendmentrequest @sprint-5-US-194231  @reassignment
  Scenario: Validate Funding change Amendment Request Rejected email should be generate for EXE new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 4100  | RevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:FundingID} has beenRejected
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Amendment Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:FundingID}
      Amendment Request Type: Funding Change
      Comments: Automation Testing
      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200893 @ValidatePeriodicrenewalAmendmentRequestRejectedemailshouldbegenerateforPMnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-194231  @reassignment
  Scenario: Validate Periodic renewal 'Amendment Request Rejected' email should be generate for PM new owner of amendment request after the Review Amendment Request ownership task reassign to him
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role           |
      | {SavedValue:SPI3 Username} | Principal Investigator |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:PERIODICRENEWAL} has beenRejected
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Amendment Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:PERIODICRENEWAL}
      Amendment Request Type: Periodic Renewal
      Comments: Automation Testing
      Log in to EGMS, and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200895 @ValidatePeriodicrenewalAmendmentRequestSentBackemailshouldbegenerateforEXEnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-194231  @reassignment
  Scenario: Validate Periodic renewal 'Amendment Request Sent Back' email should be generate for EXE new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation EXE user" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role           |
      | {SavedValue:SPI3 Username} | Principal Investigator |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:PERIODICRENEWAL} has been SentBack by an Approver
      """
    Then I see the mail text is as follows :
      """
      Hello,

      This email is to inform you that the amendment request #{SavedValue:PERIODICRENEWAL} which has been created for the award # has been sent back by the approver.

      Amendment Details:
      Amendment Type: Periodic Renewal
      Amendment ID: {SavedValue:PERIODICRENEWAL}
      Status: Created
      Grant: {SavedValue:GrantEGMSID}
      Log in to EGMS and click here to access the record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @200976 @ValidateT&CAmendmentRequestRejectemailshouldbegenerateforPOnewownerofamendmentrequest @sprint-5-US-194231  @reassignment
  Scenario: Validate T & C 'Amendment Request Reject' email should be generate for PO new owner of amendment request
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I login to "Grantor" app as "PO" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                    | Field          |
      | Automation Justification | TncComments__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Acknowledged Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:TermsCondId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "automation.po1.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:TermsCondId} has beenRejected
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:TermsCondId}
      Amendment Request Type: Terms and Conditions Change
      Comments: Automation Testing
      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200978 @ValidateT&CAmendmentRequestsentbackemailshouldbegenerateforEXEnewownerofamendmentrequest @sprint-5-US-194231  @reassignment
  Scenario: Validate T & C 'Amendment Request sent back' email should be generate for EXE new owner of amendment request
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                    | Field          |
      | Automation Justification | TncComments__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Acknowledged Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:TermsCondId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:TermsCondId} has been SentBack by an Approver
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:TermsCondId} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.
      Amendment Details:
      Amendment Type:
      Amendment ID: {SavedValue:TermsCondId}
      Status: Created
      Grant: {SavedValue:GrantEGMSID}
      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200277 @ValidateCarryForwardeAmendmentRequestSentBackemailshouldbegenerateforEXEnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-197424  @reassignment
  Scenario: Validate Carry Forward 'Amendment Request Sent Back' email should be generate for EXE new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    And I enter value "500" into field "RequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:CFAmendmentId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1500                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "5" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:CFAmendmentId} has been SentBack by an Approver
      """
    Then I see the mail text is as follows :
      """
      Hello,

      This email is to inform you that the amendment request #{SavedValue:CFAmendmentId} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.

      Amendment Details:
      Amendment Type: Carry Forward
      Amendment ID: {SavedValue:CFAmendmentId}
      Status: Created
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @200415 @ValidateBudgetRedirectionAmendmentRequestRejectedemailshouldbegenerateforPMnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-197424  @reassignment
  Scenario: Validate Budget Redirection 'Amendment Request Rejected' email should be generate for PM new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BudgetRedirectId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:BudgetRedirectId} hasbeen Rejected
      """
    Then I see the mail text is as follows :
      """
      Hello,

      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Award} has been Rejected.

      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:BudgetRedirectId}
      Amendment Request Type: Budget Redirection
      Comments: Automation Testing

      Log in to EGMS and click here to access the record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @200416 @ValidateBudgetRedirectionAmendmentRequestSentBackemailshouldbegenerateforEXEnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-197424  @reassignment
  Scenario: Validate Budget Redirection 'Amendment Request Sent Back' email should be generate for EXE new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him'
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BudgetRedirectId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:BudgetRedirectId} has been SentBack by an Approver
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:BudgetRedirectId} which has been created for the award # has been sent back by the approver.
      Amendment Details:
      Amendment Type:
      Amendment ID: {SavedValue:BudgetRedirectId}
      Status: Created
      Grant: {SavedValue:GrantEGMSID}
      GrantName: {SavedValue:GrantEGMSID}
      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200456 @ValidateKeypersonalchangeAmendmentRequestRejectedemailshouldbegenerateforPMnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-197424  @reassignment
  Scenario: Validate Key personal change Amendment Request Rejected email should be generate for PM new owner of amendment request after the 'Review Amendment Request ownership task reassign to him
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "kpcId"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role |
      | {SavedValue:SPI3 Username} | Other        |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:kpcId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:kpcId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:kpcId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:kpcId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:kpcId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    And I refresh the page
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:kpcId} hasbeen Rejected
      """
    Then I see the mail text is as follows :
     """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:kpcId}
      Amendment Request Type: Key Personnel Change
      Comments: Automation Testing
      Log in to EGMS, and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200457 @ValidateKeypersonalchangeAmendmentRequestSentBackemailshouldbegenerateforEXEnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-197424  @reassignment
  Scenario: Validate Key personal change 'Amendment Request Sent Back' email should be generate for EXE new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "kpcId"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role |
      | {SavedValue:SPI3 Username} | Other        |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:kpcId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:kpcId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:kpcId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:kpcId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:kpcId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:kpcId} hasbeen Sent Back by an Approver
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:kpcId} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.
      Amendment Details:
      Amendment Type: Key Personnel Change
      Amendment ID: {SavedValue:kpcId}
      Status: Created
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200458 @ValidateKeypersonalchangeAmendmentRequestApprovedemailshouldbegenerateforPMnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-197424  @reassignment
  Scenario: Validate Key personal change 'Amendment Request Approved' email should be generate for PM new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "kpcId"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role |
      | {SavedValue:SPI3 Username} | Other        |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:kpcId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:kpcId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:kpcId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:kpcId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:kpcId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
     """
      Sandbox: Notification: Amendment Request #{SavedValue:kpcId} hasbeen Approved
      """
    Then I see the mail text is as follows :
     """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:kpcId} for the award # {SavedValue:AwardEGMSID} has been approved and a new award can be created.
      Amendment Details:
      Amendment Request Type: Key Personnel Change
      Amendment ID: {SavedValue:kpcId}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}
      Log in to EGMS, and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200276 @ValidateCarryForwardAmendmentRequestRejectedemailshouldbegenerateforPMnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-197424  @reassignment
  Scenario: Validate Carry Forward 'Amendment Request Rejected' email should be generate for PM new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PM1 user" of type "Competitive"
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "7" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    And I enter value "500" into field "RequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:CFAmendmentId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1500                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    And I refresh the page
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
     """
      Sandbox: Notification: Amendment Request #{SavedValue:CFAmendmentId} hasbeen Rejected
      """
    Then I see the mail text is as follows :
     """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:CFAmendmentId}
      Amendment Request Type: Carry Forward
      Comments: Automation Testing
      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200280 @ValidateCarryForwardAmendmentReqestApprovedemailshouldbegenerateforPMnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-197424  @reassignment
  Scenario: Validate Carry Forward 'Amendment Request Approved' email should be generate for PM new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I login to "Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PO | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "7" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    And I enter value "500" into field "RequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:CFAmendmentId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1500                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I checkout to yopmail with mailid "automation.po1.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:CFAmendmentId} has beenApproved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:CFAmendmentId} for the award # {SavedValue:AwardEGMSID} has been approved and a new award can be created.
      Amendment Details:
      Amendment Request Type: Carry Forward
      Amendment ID: {SavedValue:CFAmendmentId}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}
      Log in to EGMS, and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200417 @ValidateBudgetRedirectionAmendmentRequestApprovedemailshouldbegenerateforPMnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-197424  @reassignment
  Scenario: Validate Budget Redirection_ Verify 'Amendment Request Approved' email should be generate for PM new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BudgetRedirectId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "200" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:BudgetRedirectId} hasbeen Approved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:BudgetRedirectId} for the award # {SavedValue:AwardEGMSID} has been approved and a new award can be created.
      Amendment Details:
      Amendment Request Type: Budget Redirection
      Amendment ID: {SavedValue:BudgetRedirectId}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}
      Log in to EGMS, and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200856 @ValidateFundingchangeAmendmentRequestSubmittedGrantorNotifyemailshouldbegenerateforPMnewownerofamendmentrequest @sprint-5-US-194231  @reassignment
  Scenario: Validate Funding change Amendment Request Submitted Grantor Notify email should be generate for PM new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation PM1 user" of type "Competitive"
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 2            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "220" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:FundingID} hasbeen submitted
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:FundingID} for the award #{SavedValue:AwardEGMSID} has been submitted by subrecipient. You are requested to review the amendment made for the award.

      Amendment Details:
         Amendment Type: Funding Change
         Amendment ID: {SavedValue:FundingID}
         Subrecipient Key POC: Automation SPI3
         Status: Submitted to Grantor
         Grant:  {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to perform the review.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @200858 @ValidateFundingchangeAmendmentRequestSentBackemailshouldbegenerateforPMnewownerofamendmentrequest @sprint-5-US-194231  @reassignment
  Scenario: Validate Funding change 'Amendment Request Sent Back' email should be generate for PM new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 4100  | RevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:FundingID} hasbeen Sent Back by an Approver
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:FundingID} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.
      Amendment Details:
      Amendment Type: Funding Change
      Amendment ID: {SavedValue:FundingID}
      Status: Created
      Grant: {SavedValue:GrantEGMSID}
      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200872 @ValidateFundingchangeAmendmentRequestApprovedemailshouldbegenerateforEXEnewownerofamendmentrequest @sprint-5-US-194231  @reassignment
  Scenario: Validate Funding change 'Amendment Request Approved' email should be generate for EXE new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 4100  | RevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:FundingID} hasbeen Approved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:FundingID} for the award # {SavedValue:AwardEGMSID} has been approved and a new award can be created.
      Amendment Details:
      Amendment Type: Funding Change
      Amendment ID: {SavedValue:FundingID}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200897 @ValidatePeriodicRenewalyAmendmentRequestApprovedemailshouldbegenerateforPMnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-194231  @reassignment
  Scenario: Validate Periodic Renewal 'Amendment Request Approved' email should be generate for PM new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role           |
      | {SavedValue:SPI3 Username} | Principal Investigator |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:PERIODICRENEWAL} hasbeen Approved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:PERIODICRENEWAL} for the award # {SavedValue:AwardEGMSID} has been approved and a new award can be created.
      Amendment Details:
      Amendment Type: Periodic Renewal
      Amendment ID: {SavedValue:PERIODICRENEWAL}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200975 @ValidateT&CAmendmentRequestApprovedemailshouldbegenerateforEXEnewownerofamendmentrequest @sprint-5-US-194231  @reassignment
  Scenario: Validate T & C 'Amendment Request Approved' email should be generate for EXE new owner of amendment request
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                    | Field          |
      | Automation Justification | TncComments__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Acknowledged Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:TermsCondId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:TermsCondId} hasbeen Approved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:TermsCondId} for the award # {SavedValue:AwardEGMSID} has been approved and a new award can be created.
      Amendment Details:
      Amendment Type:  Terms and Conditions Change
      Amendment ID: {SavedValue:TermsCondId}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200980 @ValidateT&Callsectionlevelandpagelevelbuttonwillbevisibletoamendmentowneronlynotawardowner @sprint-5-US-194231  @reassignment
  Scenario: Validate T & C all section level and page level button will be visible to amendment owner only not award owner
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                    | Field          |
      | Automation Justification | TncComments__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation EXE | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Acknowledged Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:TermsCondId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:TermsCondId} hasbeen Approved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:TermsCondId} for the award # {SavedValue:AwardEGMSID} has been approved and a new award can be created.
      Amendment Details:
      Amendment Type: Terms and Conditions Change
      Amendment ID: {SavedValue:TermsCondId}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @201088 @ValidateCarryforwardemailshouldbegeneratedfornewownerafterAmendmentRequestSubmittedGrantorNotifyownershipreassigntonewowner @sprint-5-US-198235  @reassignment
  Scenario: Validate Carry forward email should be generated for new owner after 'Amendment Request Submitted Grantor Notify' ownership reassign to new owner
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "7" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    And I enter value "500" into field "RequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:CFAmendmentId} hasbeen submitted
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:CFAmendmentId} for the award #{SavedValue:AwardEGMSID} has been submitted by the subrecipient. You are requested to review the amendment made for the award.
      Amendment Details:
      Amendment Type: Carry Forward
      Amendment ID: {SavedValue:CFAmendmentId}
      Subrecipient Key POC: Automation SPI3
      Status: Submitted to Grantor
      Grant:  {SavedValue:GrantEGMSID}
      Log in to EGMS and click here to perform the review.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @201755 @ValidateCarryForwardAmendmentRequestRejectedemailshouldbegenerateforPMnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-198235  @reassignment
  Scenario: Validate Carry Forward 'Amendment Request Rejected' email should be generate for PM new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation EXE | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "7" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    And I enter value "500" into field "RequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1500                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    And I refresh the page
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:CFAmendmentId} hasbeen Rejected
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:CFAmendmentId}
      Amendment Request Type: Carry Forward
      Comments: Automation Testing
      Log in to EGMS, and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200541 @ValidateFundingchangeAmendmentRequestApprovedemailshouldbegenerateforEXEnewownerofamendmentrequest @sprint-5-US-196841  @reassignment
  Scenario: Validate Funding change Amendment Request Approved email should be generate for EXE new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 3100  | RevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:FundingID} hasbeen Approved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:FundingID} for the award # {SavedValue:AwardEGMSID} has been approved and a new award can be created.
      Amendment Details:
      Amendment Type: Funding Change
      Amendment ID: {SavedValue:FundingID}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200535 @ValidateFundingchangeAmendmentRequestRejectedemailshouldbegenerateforEXEnewownerofamendmentrequest @sprint-5-US-196841  @reassignment
  Scenario: Validate Funding change 'Amendment Request Rejected' email should be generate for EXE new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 4100  | RevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    And I refresh the page
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:FundingID} hasbeen Rejected
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Amendment Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:FundingID}
      Amendment Request Type: Funding Change
      Comments: Automation Testing
      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200547 @ValidateFundingchangeyallsectionlevelandpagelevelbuttonwillbevisibletoamendmentownerbutnotvisibletoawardowner @sprint-5-US-196841  @reassignment
  Scenario: Validate Funding change all section level and page level button will be visible to amendment owner but not visible to award owner
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send to Subrecipient" in page detail
    Then I softly cannot see top right button "Delete" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    Then I softly can see top right button "Delete" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 4100  | RevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:FundingID} hasbeen Approved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:FundingID} for the award # {SavedValue:AwardEGMSID} has been approved and a new award can be created.
      Amendment Details:
      Amendment Type: Funding Change
      Amendment ID: {SavedValue:FundingID}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200661 @ValidatePeriodicrenewalAmendmentRequestRejectedemailshouldbegenerateforPMnewownerofamendmentrequest @sprint-5-US-196841  @reassignment
  Scenario: Validate Periodic renewal 'Amendment Request Rejected' email should be generate for PM new owner of amendment request
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    And I refresh the page
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:PERIODICRENEWAL} hasbeen Rejected
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:PERIODICRENEWAL}
      Amendment Request Type: Periodic Renewal
      Comments: Automation Testing
      Log in to EGMS, and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200684 @ValidatePeriodicrenewalAmendmentRequestApprovedemailshouldbegenerateforEXEnewownerofamendmentrequest @sprint-5-US-196841  @reassignment
  Scenario: Validate Periodic renewal 'Amendment Request Approved' email should be generate for EXE new owner of amendment request
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "5" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:PERIODICRENEWAL} hasbeen Approved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:PERIODICRENEWAL} for the award # {SavedValue:AwardEGMSID} has been approved and a new award can be created.
      Amendment Details:
      Amendment Type: Periodic Renewal
      Amendment ID: {SavedValue:PERIODICRENEWAL}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200795 @ValidateT&CAmendmentRequestApprovedemailshouldbegenerateforEXEnewownerofamendmentrequest @sprint-5-US-196841  @reassignment
  Scenario: Validate T & C 'Amendment Request Approved' email should be generate for EXE new owner of amendment request
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                    | Field          |
      | Automation Justification | TncComments__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "5" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:TermsCondId} hasbeen Approved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:TermsCondId} for the award # {SavedValue:AwardEGMSID} has been approved and a new award can be created.
      Amendment Details:
      Amendment Type: Terms and Conditions Change
      Amendment ID: {SavedValue:TermsCondId}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200106 @ValidateEmailshouldbetriggeredwhenownershipischangeofBPCARatS/Rside @sprint-12-US-226646  @reassignment
  Scenario: Validate Email should be triggered when ownership is change of BPC  AR  at S/R side
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PM1 user" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientBPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetPChangeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I logout
    And I pause execution for "2" seconds
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM1] to [Automation PM] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budgetPChangeId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM1] to [Automation PM] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budgetPChangeId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "govgrantsautomation.q2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation PM1] to [Automation PM] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budgetPChangeId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200515 @ValidateafterchangingthetaskownershipofcombinationSOW/BPCchangebyS/Rsidethenemailshouldtriggeredto&newOwner @sprint-12-US-226646  @reassignment
  Scenario: Validate after changing the task ownership of combination SOW/BPC  change by S/R side then email should triggered to old & new Owner
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PM1 user" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BPCSOW_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetSOWChangeId"
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:budgetSOWChangeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetSOWChangeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Overview" sub tab
    Then I can see top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I can see top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    Then I softly can see row level action button "Edit" against "Automation Permanent KPI" in flex table with id "---amendment:-:keyOutcomesTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "Automation SPI3" for title "Name" inside table "---amendment:-:amendmentOwnerTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    And I logout
    And I wait for "2" seconds
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM1] to [Automation PM] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budgetSOWChangeId} Automation PM1 Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200318 @ValidateBudgetRedirectionemailshouldbegeneratedfornewownerafterReviewamendmentrequesttaskownershipreassigntonewowner @sprint-12-US-226646  @reassignment
  Scenario: Validate Budget Redirection email should be generated for new owner after 'Review amendment request' task ownership reassign to new owner
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BudgetRedirectId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:BudgetRedirectId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I logout
    And I wait for "2" seconds
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:BudgetRedirectId} Automation PM Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200104 @ValidateEmailshouldbetriggeredwhenownershipischangeofBPCARatgrantorside @sprint-12-US-226646  @reassignment
  Scenario: Validate Email should be triggered when ownership is change of BPC AR at grantor side
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetPChangeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I logout
    And I pause execution for "2" seconds
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budgetPChangeId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budgetPChangeId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "govgrantsautomation.q2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budgetPChangeId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200302 @ValidateBudgetredirectionthatWhentheownershipofrecordischangedanemailisgeneratedtotheAdminuser @sprint-12-US-226646  @reassignment
  Scenario: Validate Budget redirection that When the ownership of a record is changed, an email is generated to the Admin user
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BudgetRedirectId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I logout
    And I pause execution for "2" seconds
    And I checkout to yopmail with mailid "govgrantsautomation.q2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:BudgetRedirectId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200304 @200305 @ValidateBudgetredirectionthatWhenownershipofrecordischangedemailisgeneratedtothepreviousowner @sprint-5-US-198235  @reassignment
  Scenario: Validate Budget redirection that When the ownership of a record is changed, an email is generated to the previous owner
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BudgetRedirectId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "input-1"
    And I select value "Automation PO1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I checkout to yopmail with mailid "automation.po.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:BudgetRedirectId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
      #200305
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "automation.po1.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:BudgetRedirectId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200493 @200494 @ValidateKeyPersonalchangethatWhentheownershipofrecordischangedemailisgeneratedtothepreviousowner @sprint-5-US-198235  @reassignment
  Scenario: Validate Key Personal change that When the ownership of a record is changed an email is generated to the previous owner
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "kpcId"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Current Contact | Project Role |
      | Automation SPI3 | Other        |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:kpcId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I checkout to yopmail with mailid "exe.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:kpcId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
      #200494
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:kpcId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200492 @ValidateKeypersoanlchangethatWhentheownershipofrecordischangedanemailisgeneratedtotheAdminuser @sprint-5-US-198235  @reassignment
  Scenario: Validate Key personal change that When the ownership of a record is changed, an email is generated to the Admin user
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "kpcId"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Current Contact | Project Role |
      | Automation SPI3 | Other        |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:kpcId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I checkout to yopmail with mailid "govgrantsautomation.q2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:kpcId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200181 @ValidateCarryforwardemailshouldbegeneratednewownerafterReviewamendmentrequesttaskownershipreassigntonewowner @sprint-5-US-197424  @reassignment
  Scenario: Validate Carry forward email should be generated for new owner after 'Review amendment request' task ownership reassign to new owner
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I login to "Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PO | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    And I enter value "500" into field "RequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:CFAmendmentId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "automation.po1.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:CFAmendmentId} Automation PO Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200443 @ValidateKeypersonalchangeemailshouldbegeneratedfornewownerafterReviewamendmentrequesttaskownershipreassigntonewowner @sprint-5-US-197424  @reassignment
  Scenario: Validate Key personal change email should be generated for new owner after 'Review amendment request' task ownership reassign to new owner
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "kpcId"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Current Contact | Project Role |
      | Automation SPI3 | Other        |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:kpcId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:kpcId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:kpcId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:kpcId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:kpcId} Automation EXE Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200516 @ValidateafterchangingthetaskownershipofSOW/BPCchangebygrantorsidethenemailshouldtriggeredtoold&newOwner @sprint-5-US-198153  @reassignment
  Scenario: Validate after changing the task ownership of SOW/BPC change by grantor side then email should triggered to old & new Owner
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" against the value "{SavedValue:budgetPC&ScopeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "100" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budgetPC&ScopeId} Automation PM Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I login to "Grantor" app as "PM1" user
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"

  @200103 @ValidateEmailshouldbetriggeredwhenownershipischangofSOWARatgrantorside @sprint-5-US-198419  @reassignment
  Scenario: Validate Email should be triggered when ownership is change of SOW AR  at grantor side
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:scopeWorkId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I checkout to yopmail with mailid "govgrantsautomation.q2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:scopeWorkId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:scopeWorkId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:scopeWorkId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200105 @ValidateEmailshouldbetriggeredwhenownershipischangeofSOWARatS/Rside @sprint-5-US-198419  @reassignment
  Scenario: Validate Email should be triggered when ownership is change of SOW AR at S/R side
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_SOW_creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    And I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:scopeWorkId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I checkout to yopmail with mailid "govgrantsautomation.q2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:scopeWorkId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:scopeWorkId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:scopeWorkId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @229672 @ValidateemailshouldbetriggeredofAmendmentRequestRejected&forTaskreassignmenttonewuser @sprint-13-US-231194  @reassignment
  Scenario: Validate email should be triggered of Amendment Request Rejected & for Task reassignment to new user
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I save the field containing "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:budgetPC&ScopeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Amendment Request #{SavedValue:budgetPC&ScopeId} has beenRejected
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Amendment Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:budgetPC&ScopeId}
      Amendment Request Type: Budget Period Change; Scope of Work Change
      Comments: Automation Testing
      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @229674 @ValidateemailshouldbetriggeredofAmendmentRequestsendback&forTaskreassignmenttonewuser @sprint-13-US-231194  @reassignment
  Scenario: Validate email should be triggered of Amendment Request send back & for Task reassignment to new user
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:budgetPC&ScopeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Amendment Request #{SavedValue:budgetPC&ScopeId} has been SentBack by an Approver
      """
    Then I see the mail text is as follows :
      """
     Hello,
     This email is to inform you that the amendment request #{SavedValue:budgetPC&ScopeId} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.
     Amendment Details:
     Amendment Type: Budget Period Change; Scope of Work Change
     Amendment ID: {SavedValue:budgetPC&ScopeId}
     Status: Created
     Grant: {SavedValue:GrantEGMSID}
     Log in to EGMS and click here to access the record.
     Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
     Thank you.
     The EGMS Team
      """

  @229677 @ValidateemailshouldbetriggeredofAmendmentRequestApproved&forTaskreassignmenttonewuser @sprint-13-US-231194  @reassignment
  Scenario: Validate email should be triggered of Amendment Request Approved & for Task reassignment to new user
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I save the field containing "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:budgetPC&ScopeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "5" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:budgetPC&ScopeId} has beenApproved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:budgetPC&ScopeId} for the award #   has been approved and a new award can be created.
      Amendment Details:
      Amendment Type:  Budget Period Change; Scope of Work Change
      Amendment ID: {SavedValue:budgetPC&ScopeId}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @232515 @ValidateemailshouldbetriggeredofAmendmentRequestRejected&forChangeownershiptonewusergrantorSide @sprint-13-US-231194  @reassignment
  Scenario: Validate email should be triggered of Amendment Request Rejected & for Change ownership to new user
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budgetPC&ScopeId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Amendment Request #{SavedValue:budgetPC&ScopeId} has beenRejected
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Amendment Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:budgetPC&ScopeId}
      Amendment Request Type: Budget Period Change; Scope of Work Change
      Comments: Automation Testing
      Log in to EGMS, and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @232517 @ValidateemailshouldbetriggeredofAmendmentRequestsendback&forchangeownershiptonewuserFromgrantorside @sprint-13-US-231194  @reassignment
  Scenario: Validate email should be triggered of Amendment Request send back & for change ownership to new user From grantor side
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budgetPC&ScopeId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Sandbox: Notification: Amendment Request #{SavedValue:budgetPC&ScopeId} hasbeen Sent Back by an Approver
     """
    Then I see the mail text is as follows :
      """
     Hello,
     This email is to inform you that the amendment request #{SavedValue:budgetPC&ScopeId} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.
     Amendment Details:
     Amendment Type: Budget Period Change; Scope of Work Change
     Amendment ID: {SavedValue:budgetPC&ScopeId}
     Status: Created
     Grant: {SavedValue:GrantEGMSID}
     Log in to EGMS and click here to access the record.
     Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
     Thank you.
     The EGMS Team
      """

  @232519 @ValidateemailshouldbetriggeredofAmendmentRequestApproved&forchangeownershiptonewuserfromgrantorside @sprint-13-US-231194  @reassignment
  Scenario: Validate email should be triggered of Amendment Request Approved & for change ownership to new user from grantor side
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budgetPC&ScopeId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:budgetPC&ScopeId} has beenApproved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:budgetPC&ScopeId} for the award #   has been approved and a new award can be created.
      Amendment Details:
      Amendment Type:  Budget Period Change; Scope of Work Change
      Amendment ID: {SavedValue:budgetPC&ScopeId}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @232520 @ValidateemailshouldbetriggeredofAmendmentRequestRejected&forChangeownershiptonewusers/rSide @sprint-13-US-231194  @reassignment
  Scenario: Validate email should be triggered of Amendment Request Rejected & for Change ownership to new user s/r Side
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BPCSOW_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetSOWChangeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetSOWChangeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budgetSOWChangeId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Amendment Request #{SavedValue:budgetSOWChangeId} has beenRejected
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:budgetSOWChangeId}
      Amendment Request Type: Budget Period Change; Scope of Work Change
      Comments: Automation Testing
      Log in to EGMS, and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @232521 @ValidateemailshouldbetriggeredofAmendmentRequestsendback&forChangeownershiptonewusers/rSide @sprint-13-US-231194  @reassignment
  Scenario: Validate email should be triggered of Amendment Request send back & for Change ownership to new user s/r Side
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BPCSOW_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "budgetSOWChangeId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetSOWChangeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budgetSOWChangeId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Amendment Request #{SavedValue:budgetSOWChangeId} has been SentBack by an Approver
      """
    Then I see the mail text is as follows :
      """
     Hello,
     This email is to inform you that the amendment request #{SavedValue:budgetSOWChangeId} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.
     Amendment Details:
     Amendment Type: Budget Period Change; Scope of Work Change
     Amendment ID: {SavedValue:budgetSOWChangeId}
     Status: Created
     Grant: {SavedValue:GrantEGMSID}
     Log in to EGMS and click here to access the record.
     Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
     Thank you.
     The EGMS Team
      """

  @232374 @ValidateemailshouldbetriggeredofAmendmentRequestsendback&forTaskreassignmenttonewuserFromS/rSide @sprint-13-US-231194  @reassignment
  Scenario: Validate email should be triggered of Amendment Request send back & for Task reassignment to new user From S/r Side
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    #Bug444060
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BPCSOW_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "budgetSOWChangeId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation EXE | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" against the value "{SavedValue:budgetSOWChangeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetSOWChangeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I checkout to yopmail with mailid "exe.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:budgetSOWChangeId} Approve Amendment Request Not Started Approve Amendment Request for Subaward #{SavedValue:Automation Runtime Award} for SAN DIEGO ELECTRICAL TRAINING TRUST Automation EXE {Date:yyyy/MM/dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Amendment Request #{SavedValue:budgetSOWChangeId} has been SentBack by an Approver
      """
    Then I see the mail text is as follows :
      """
     Hello,
     This email is to inform you that the amendment request #{SavedValue:budgetSOWChangeId} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.
     Amendment Details:
     Amendment Type: Budget Period Change; Scope of Work Change
     Amendment ID: {SavedValue:budgetSOWChangeId}
     Status: Created
     Grant: {SavedValue:GrantEGMSID}
     Log in to EGMS and click here to access the record.
     Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
     Thank you.
     The EGMS Team
      """

  @232389 @ValidateemailshouldbetriggeredofAmendmentRequestApproved&forTaskreassignmenttonewuserfroms/rside @sprint-13-US-231194  @reassignment
  Scenario: Validate email should be triggered of Amendment Request Approved & for Task reassignment to new user(from s/r side)
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BPCSOW_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetSOWChangeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation EXE | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" against the value "{SavedValue:budgetSOWChangeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetSOWChangeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Amendment Request #{SavedValue:budgetSOWChangeId} has beenApproved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:budgetSOWChangeId} for the award #{SavedValue:AwardEGMSID}   has been approved and a new award can be created.
      Amendment Details:
      Amendment Type:  Budget Period Change; Scope of Work Change
      Amendment ID: {SavedValue:budgetSOWChangeId}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @232522 @ValidateemailshouldbetriggeredofAmendmentRequestapproved&forChangeownershiptonewusers/rSide @sprint-13-US-231194  @reassignment
  Scenario: Validate email should be triggered of Amendment Request approved & for Change ownership to new user(s/r Side)
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BPCSOW_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "budgetSOWChangeId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PO1 | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetSOWChangeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:budgetSOWChangeId} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Amendment Request #{SavedValue:budgetSOWChangeId} has beenApproved
      """
    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:budgetSOWChangeId} for the award #{SavedValue:AwardEGMSID}   has been approved and a new award can be created.
      Amendment Details:
      Amendment Type:  Budget Period Change; Scope of Work Change
      Amendment ID: {SavedValue:budgetSOWChangeId}
      Status: Approved
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @TaskAmend @ValidateAmendmentRequestModuleusershouldabletoreassignthetasktonewuserofmorethan10records&1emailshouldbetriggeredforallrecords @sprint-11-US-217998  @reassignment
  Scenario: Validate Amendment Request Module user should able to reassign the task to new user of more than 10 records & 1 email should be triggered for all records
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL1"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL2"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL3"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL4"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL5"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL6"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL7"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL8"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL9"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL9}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL9}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role           |
      | {SavedValue:SPI3 Username} | Principal Investigator |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL10"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL10}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL10}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role           |
      | {SavedValue:SPI3 Username} | Principal Investigator |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL11"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL11}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL11}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role           |
      | {SavedValue:SPI3 Username} | Principal Investigator |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL12"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL12}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL12}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role           |
      | {SavedValue:SPI3 Username} | Principal Investigator |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL1}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL1}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL2}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL2}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL3}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL3}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL4}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL4}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL5}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL5}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL6}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL6}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL7}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL7}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL8}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL8}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL9}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL9}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL10}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL10}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL11}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL11}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:PERIODICRENEWAL12}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL12}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL1}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL1}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL2}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL2}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL3}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL3}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL4}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL4}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL5}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL5}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL6}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL6}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL7}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL7}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL8}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL8}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL9}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL9}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL10}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL10}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL11}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL11}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL12}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL12}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL1}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL1}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL1}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:approversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM1] to [Automation PM] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:PERIODICRENEWAL1} Automation ADMIN Amendment Request
      {SavedValue:PERIODICRENEWAL2} Automation ADMIN Amendment Request
      {SavedValue:PERIODICRENEWAL3} Automation ADMIN Amendment Request
      {SavedValue:PERIODICRENEWAL4} Automation ADMIN Amendment Request
      {SavedValue:PERIODICRENEWAL5} Automation ADMIN Amendment Request
      {SavedValue:PERIODICRENEWAL6} Automation ADMIN Amendment Request
      {SavedValue:PERIODICRENEWAL7} Automation ADMIN Amendment Request
      {SavedValue:PERIODICRENEWAL8} Automation ADMIN Amendment Request
      {SavedValue:PERIODICRENEWAL9} Automation ADMIN Amendment Request
      {SavedValue:PERIODICRENEWAL10} Automation ADMIN Amendment Request
      {SavedValue:PERIODICRENEWAL11} Automation ADMIN Amendment Request
      {SavedValue:PERIODICRENEWAL12} Automation ADMIN Amendment Request

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

    #amendmentRequestUndo

  @292867 @292869 @292871 @ValidatePmapprovercanclickonundobuttoninCarryFwdAmmendrequestAmmendrequestrecordwhenrecordisinApprovedstate @Sprint-3-US-288693  @Undo
  Scenario: Validate Pm approver can click on undo button in Carry Fwd Ammend request Ammend request record when record is in Approved state
    And I activated standalone subaward "Automation Runtime award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Formula_By_Applicant_Focus_Area"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Then I softly see that "Subaward" is in "Activated" status
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "PeriodicEditionFocusYes" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                |
      | 4000  | RevisedCommitment__c |
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "7" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Carry Forward Amount |
      | Automation Permanent Focus Area | 200                  |
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Carry Forward Amount |
      | Automation Permanent Focus Area2 | 500                  |
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 200           |
#    And I expand nested table containing column value "BP01"
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    When I click on button "resetIcon" in flex table with id "---progressReport:-:budgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1200                 | 120        | 0              |
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I pause execution for "3" seconds
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2700                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 4            |
    And I wait for "3" seconds
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    #292871
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---" panel
    Then I softly see value "Cancelled" for title "Status" against the value "{SavedValue:CFAmendmentId}" inside table "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---" panel
    Then I softly see value "Completed" for title "Status" against the value "{SavedValue:CFAmendmentId}" inside table "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---" panel
    Then I softly see value "Completed" for title "Status" against the value "{SavedValue:CFAmendmentId}" inside table "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---" panel
    Then I softly see value "Completed" for title "Status" against the value "{SavedValue:CFAmendmentId}" inside table "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---"
    #292869
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "220" seconds
    Then I refresh the page
    And I click on mail with subject "Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}"
    And I see the mail subject is as follows :
      """
     Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:CFAmendmentId}  for the award #{SavedValue:ActivatedSubAwardId}.

    Amendment Details:
	Amendment Type: Carry Forward
	Amendment ID: {SavedValue:CFAmendmentId}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "automation.po.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I click on mail with subject "Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}"
    And I see the mail subject is as follows :
      """
     Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:CFAmendmentId}  for the award #{SavedValue:ActivatedSubAwardId}.

    Amendment Details:
	Amendment Type: Carry Forward
	Amendment ID: {SavedValue:CFAmendmentId}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "exe.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I click on mail with subject "Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}"
    And I see the mail subject is as follows :
      """
     Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:CFAmendmentId}  for the award #{SavedValue:ActivatedSubAwardId}.

    Amendment Details:
	Amendment Type: Carry Forward
	Amendment ID: {SavedValue:CFAmendmentId}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "fo.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I click on mail with subject "Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}"
    And I see the mail subject is as follows :
      """
     Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:CFAmendmentId}  for the award #{SavedValue:ActivatedSubAwardId}.

    Amendment Details:
	Amendment Type: Carry Forward
	Amendment ID: {SavedValue:CFAmendmentId}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @292872 @ValidatethatwhenPMuserReasignTaskofsubmitforapprovalischangedtonewusethennewownerwillseeundobuttonafterapprovingtheCarryFwdAmmendrequestAmmendrequest @Sprint-3-US-288693  @Undo
  Scenario: Validate that when PM user Reasign Task of submit for approval is changed to new user,then new owner will see undo button after approving the Carry Fwd Ammend request Ammend request
    And I activated standalone subaward "Automation Runtime award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Formula_By_Applicant_Focus_Area"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Then I softly see that "Subaward" is in "Activated" status
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "PeriodicEditionFocusYes" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                |
      | 4000  | RevisedCommitment__c |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Carry Forward Amount |
      | Automation Permanent Focus Area | 200                  |
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Carry Forward Amount |
      | Automation Permanent Focus Area2 | 500                  |
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 200           |
    And I expand nested table containing column value "BP01"
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    When I click on button "resetIcon" in flex table with id "---progressReport:-:budgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1200                 | 120        | 0              |
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2700                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 4            |
    And I wait for "9" seconds
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 4" for title "Amendment Request" against the value "Automation PM1" inside table "---amendment:-:approversTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Submitted for Approval" for title "New Value" inside field history table
    Then I softly see value "Approved" for title "Original Value" inside field history table
    And I click on back arrow
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "220" seconds
    Then I refresh the page
    And I click on mail with subject "Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}"
    And I see the mail subject is as follows :
      """
     Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM1  has initiated Undo Action for amendment request #{SavedValue:CFAmendmentId}  for the award #{SavedValue:ActivatedSubAwardId}.

    Amendment Details:
	Amendment Type: Carry Forward
	Amendment ID: {SavedValue:CFAmendmentId}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @292873 @292874 @ValidatethatwhenPMUserReasignTasksubmitforapprovaltonewusethenoldownerwillnotseeundobuttonafterapprovaloftheCarryFwdAmmendrequestAmmendrequest @Sprint-3-US-288693  @Undo
  Scenario: Validate that when PM User Reasign Task submit for approval  to new user,then old owner will not see undo button after approval of  the Carry Fwd Ammend request Ammend request
    And I activated standalone subaward "Automation Runtime award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Formula_By_Applicant_Focus_Area"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Then I softly see that "Subaward" is in "Activated" status
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "PeriodicEditionFocusYes" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                |
      | 4000  | RevisedCommitment__c |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Carry Forward Amount |
      | Automation Permanent Focus Area | 200                  |
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Carry Forward Amount |
      | Automation Permanent Focus Area2 | 500                  |
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 200           |
    And I expand nested table containing column value "BP01"
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    When I click on button "resetIcon" in flex table with id "---progressReport:-:budgetChangeTableId---"
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1200                 | 120        | 0              |
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2700                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 4            |
    And I wait for "9" seconds
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---home:-:internalHomePendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---home:-:internalHomePendingTaskTableId---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 4" for title "Amendment Request" against the value "Automation PM1" inside table "---amendment:-:approversTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Submitted for Approval" for title "New Value" inside field history table
    Then I softly see value "Approved" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Undo" in page detail
    #292874
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:EXE1 Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I cannot see top right button "Undo" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Amendment Request" against the value "Automation PO" inside table "---amendment:-:approversTableId---"
    Then I softly see value "Step 2" for title "Amendment Request" against the value "Automation EXE" inside table "---amendment:-:approversTableId---"
    Then I softly see value "Step 3" for title "Amendment Request" against the value "Automation FO" inside table "---amendment:-:approversTableId---"
    Then I softly see value "Step 4" for title "Amendment Request" against the value "Automation PM1" inside table "---amendment:-:approversTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    And I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "220" seconds
    Then I refresh the page
    And I click on mail with subject "Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}"
    And I see the mail subject is as follows :
      """
     Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation EXE1  has initiated Undo Action for amendment request #{SavedValue:CFAmendmentId}  for the award #{SavedValue:AwardEGMSID}.

    Amendment Details:
	Amendment Type: Carry Forward
	Amendment ID: {SavedValue:CFAmendmentId}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @292680 @292672 @292681 @292682 @292685 @297810 @VerifywhenlaststepapproverclicksundothenstatusofcompletedtasksofPreviousstepapproversisnotcancelledincompletedtasklist @Sprint-2-US-285149  @Undo
  Scenario: Verify when last step approver clicks undo, then status of completed tasks of Previous step approvers is not cancelled in completed task list
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-Automation PM user" of type "Directed"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientBPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Undo" in page detail
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 4            |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    #292672
    Then I cannot see top right button "Amend Subaward" in page detail
    And I click on "Undo" in the page details without processing
    #292685
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    #292810
    And I navigate to "History" sub tab
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see snapshot with name containing "Amendment - Undo Approval.pdf" as name
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:homeCompletedTaskTableId---" panel
    Then I softly see value "Completed" for title "Status" against the value "{SavedValue:budgetPChangeId}" inside table "---amendment:-:homeCompletedTaskTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:homeCompletedTaskTableId---" panel
    Then I softly see value "Completed" for title "Status" against the value "{SavedValue:budgetPChangeId}" inside table "---amendment:-:homeCompletedTaskTableId---"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:homeCompletedTaskTableId---" panel
    Then I softly see value "Completed" for title "Status" against the value "{SavedValue:budgetPChangeId}" inside table "---amendment:-:homeCompletedTaskTableId---"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:homeCompletedTaskTableId---" panel
    #292681
    Then I softly see value "Cancelled" for title "Status" against the value "{SavedValue:budgetPChangeId}" inside table "---amendment:-:homeCompletedTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:homePendingTasksTableId---" panel
    #292682
    Then I softly see "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:homePendingTasksTableId---"
    #292684
    And I checkout to yopmail with mailid "automation.po.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:budgetPChangeId}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation FD  has initiated Undo Action for amendment request #{SavedValue:budgetPChangeId}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Budget Redirection
    Amendment ID: {SavedValue:budgetPChangeId}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "exe.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:budgetPChangeId}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation FD  has initiated Undo Action for amendment request #{SavedValue:budgetPChangeId}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Budget Redirection
    Amendment ID: {SavedValue:budgetPChangeId}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "fo.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:budgetPChangeId}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation FD  has initiated Undo Action for amendment request #{SavedValue:budgetPChangeId}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Budget Redirection
    Amendment ID: {SavedValue:budgetPChangeId}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    Then I refresh the page
    And I checkout to yopmail with mailid "automation.fd.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:budgetPChangeId}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:budgetPChangeId}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Budget Redirection
    Amendment ID: {SavedValue:budgetPChangeId}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @287069 @287071 @287072 @VerifythatWhenLastApproverClicksonUndoButtonAConfirmationBoxWillOpenWithOptionYesAndNo @sprint-1-US-285148  @Undo
  Scenario:Verify that When Last Approver Clicks on Undo Button ,A Confirmation Box Will Open With Option Yes And No
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Formula_By_Applicant_Focus_Area"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | New Obligation |
      | Automation Permanent Focus Area | 2000           |
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 4            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 3000                 | 150        | 150            |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 3000  | RevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
     #287069
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    Then I softly see button "OK" on confirmation pop-up
    Then I softly see button "Cancel" on confirmation pop-up
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    #287072
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    Then I cannot see top right button "Edit" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Current Obligation" rendered in view mode only
    Then I softly see that "Spent" rendered in view mode only
    Then I softly see that "Budgeted Amount" rendered in view mode only
    Then I softly see that "Current Commitment" rendered in view mode only
    Then I softly see that "Revised Commitment" rendered in view mode only
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:projectAreasTableId---"
    Given I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:PO Username}" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EXE Username}" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:FO Username}" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:PM Username}" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
      #287071
    And I checkout to yopmail with mailid "exe.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:FundingID}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:FundingID}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type:  Funding Change
    Amendment ID: {SavedValue:FundingID}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "fo.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:FundingID}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:FundingID}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Funding Change
    Amendment ID: {SavedValue:FundingID}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "automation.po.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:FundingID}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:FundingID}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Funding Change
    Amendment ID: {SavedValue:FundingID}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    Then I refresh the page
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:FundingID}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:FundingID}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Funding Change
    Amendment ID: {SavedValue:FundingID}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @290495 @290497 @Verifyafterapprovaltaskisreassignedbylastapproverandamendmentisapprovedbythereassigneduserthenundobuttonshouldbevisibleonlytotheusertowhomtheapprovaltaskisreassigned @Sprint-2-US-289816  @Undo
  Scenario: Verify after approval task is reassigned by last approver and amendment is approved by the reassigned user then undo button should be visible only to the user to whom the approval task is reassigned
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMIS_YES_FOCUS_AREA_NO_BUILDUP_YES-Automation PM user" of type "Directed"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_SOW_creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I get the "EGMS ID"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 4            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FD1"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:SOWAMENDMENTREQUEST}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I re-login to "Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I can see top right button "Undo" in page detail
    #290497
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---" panel
    Then I softly see value "Completed" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---" panel
    #290497
    Then I softly see value "Cancelled" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---"
    And I checkout to yopmail with mailid "automation.po.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation FD1  has initiated Undo Action for amendment request #{SavedValue:SOWAMENDMENTREQUEST}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type:  Scope of Work Change
    Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "exe.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation FD1  has initiated Undo Action for amendment request #{SavedValue:SOWAMENDMENTREQUEST}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type:  Scope of Work Change
    Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "fo.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation FD1  has initiated Undo Action for amendment request #{SavedValue:SOWAMENDMENTREQUEST}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Scope of Work Change
    Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation FD1  has initiated Undo Action for amendment request #{SavedValue:SOWAMENDMENTREQUEST}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Scope of Work Change
    Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "automation.fd1.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation FD1  has initiated Undo Action for amendment request #{SavedValue:SOWAMENDMENTREQUEST}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Scope of Work Change
    Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @292649 @VerifythatwhenPmuserclickonUndobuttonandclickonYesbuttoninConfirmationWindowsystemwillsendnotificationemailtoKPCAmmendrequestowner&otherapproversforthesameKPCAmmendrequest @sprint-3-US-288690  @Undo
  Scenario: Verify that when Pm user click on Undo button and click on Yes button in Confirmation Window system will send notification email to  KPC Ammend request owner & other approvers for the same  KPC Ammend request
    And I activated standalone subaward "Automation Runtime award" with properties "Automation PM user" of type "Formula_By_Applicant_Focus_Area"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Undo" in page detail
    And I save the field labeled "EGMS ID" as "KPCID"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Current Contact | Project Role |
      | Automation SPI3 | Other        |
    And I pause execution for "3" seconds
    Then I softly see value "Other" for title "Project Role" inside table "---amendment:-:RecipientKeyPersonalTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:KPCID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:KPCID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 4            |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:KPCID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:KPCID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:KPCID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:KPCID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:KPCID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:KPCID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:KPCID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:KPCID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    And I checkout to yopmail with mailid "automation.po.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:KPCID}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:KPCID}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type:  Key Personnel Change
    Amendment ID: {SavedValue:KPCID}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "exe.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:KPCID}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:KPCID}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type:  Key Personnel Change
    Amendment ID: {SavedValue:KPCID}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "fo.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:KPCID}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:KPCID}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Key Personnel Change
    Amendment ID: {SavedValue:KPCID}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:KPCID}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:KPCID}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Key Personnel Change
    Amendment ID: {SavedValue:KPCID}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @289042 @VerifywhenlaststepapproverclickundothenemailisgeneratedtoAmendmentowner&allstepapproversontheamendmentrequest @Sprint-5-US-297244  @Undo
  Scenario: Verify when last step approver click undo, then email is generated to Amendment owner & all step approvers on the amendment request
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMIS_YES_FOCUS_AREA_NO_BUILDUP_YES-Automation PM user" of type "Directed"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_SOW_creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 4            |
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    And I checkout to yopmail with mailid "automation.po.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the amendment request #{SavedValue:SOWAMENDMENTREQUEST} has been created for the award #{SavedValue:AwardEGMSID}. You are assigned with the task to review and approve the amendment made for the award.

    Amendment Details:
    Amendment Type: Scope of Work Change
    Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Please follow all State Government protocols and standards for reviewing the Amendment Request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "exe.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the amendment request #{SavedValue:SOWAMENDMENTREQUEST} has been created for the award #{SavedValue:AwardEGMSID}. You are assigned with the task to review and approve the amendment made for the award.

    Amendment Details:
    Amendment Type: Scope of Work Change
    Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Please follow all State Government protocols and standards for reviewing the Amendment Request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "fo.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the amendment request #{SavedValue:SOWAMENDMENTREQUEST} has been created for the award #{SavedValue:AwardEGMSID}. You are assigned with the task to review and approve the amendment made for the award.

    Amendment Details:
    Amendment Type: Scope of Work Change
    Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Please follow all State Government protocols and standards for reviewing the Amendment Request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "automation.fd.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the amendment request #{SavedValue:SOWAMENDMENTREQUEST} has been created for the award #{SavedValue:AwardEGMSID}. You are assigned with the task to review and approve the amendment made for the award.

    Amendment Details:
    Amendment Type: Scope of Work Change
    Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Please follow all State Government protocols and standards for reviewing the Amendment Request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the amendment request #{SavedValue:SOWAMENDMENTREQUEST} has been created for the award #{SavedValue:AwardEGMSID}. You are assigned with the task to review and approve the amendment made for the award.

    Amendment Details:
    Amendment Type: Scope of Work Change
    Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Please follow all State Government protocols and standards for reviewing the Amendment Request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @292388 @292389 @342738 @342740 @342744 @342792 @VerifywhenPmapproverclickonundobuttoninBudredAmmendrequestrecordSystemwillshowconfirmationboxwithaquestionandoptionsforselection @sprint-3-US-288689  @Undo
  Scenario: Verify when Pm approver  click on undo button in Bud red Ammend request record System will show confirmation box with a question and options for selection.
    And I activated standalone subaward "Automation Runtime award" with properties "Automation PM user" of type "Formula_By_Applicant_Focus_Area"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "Justification__c"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #342738
    Then I cannot see top right button "Undo" in page detail
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    #342740
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
    #342740
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    #342740
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I cannot see top right button "Undo" in page detail
    When I navigate to "Responsibilities" sub tab
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Amendment Request | Name                     |
      | Step 4            | {SavedValue:PM Username} |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    When I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    #342744
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    #342744
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #342744
    Then I cannot see top right button "Undo" in page detail
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #342744
    Then I cannot see top right button "Undo" in page detail
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #342744
    Then I cannot see top right button "Undo" in page detail
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #342744
    Then I cannot see top right button "Undo" in page detail
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #292388
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "Cancel" on modal confirmation box
    Then I softly see field "Status" as "Approved"
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I logout
    And I wait for "2" seconds
    #292389
    And I checkout to yopmail with mailid "exe.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:BUDGETREDIRECTIONID}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:BUDGETREDIRECTIONID}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Budget Redirection
    Amendment ID: {SavedValue:BUDGETREDIRECTIONID}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "fo.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:BUDGETREDIRECTIONID}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:BUDGETREDIRECTIONID}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Budget Redirection
    Amendment ID: {SavedValue:BUDGETREDIRECTIONID}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "automation.po.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:BUDGETREDIRECTIONID}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:BUDGETREDIRECTIONID}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Budget Redirection
    Amendment ID: {SavedValue:BUDGETREDIRECTIONID}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    Then I refresh the page
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:BUDGETREDIRECTIONID}
      """
    Then I see the mail text is as follows :
     """
    Hello,
    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:BUDGETREDIRECTIONID}  for the award #{SavedValue:AwardEGMSID}.
    Amendment Details:
    Amendment Type: Budget Redirection
    Amendment ID: {SavedValue:BUDGETREDIRECTIONID}
    Key POC: Automation SPI3
    Status: Submitted for Approval
    Grant: {SavedValue:GrantEGMSID}
    Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    Then I refresh the page
    And I am on "INTERNAL" portal
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    #342792
    Then I softly see value "{SavedValue:BUDGETREDIRECTIONID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"

  @287043 @287049 @287051 @287052 @287044 @287045 @ValidatethatafterPmApproverlastClicksonUndoButtonCompletedApprovalTaskWillgetCancelledforlastApprover @Sprint-1-US-285144  @Undo
  Scenario: Validate that after Pm Approver last Clicks on Undo Button Completed Approval Task Will get Cancelled for last Approver
    And I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Formula_By_Applicant_Focus_Area"
    Given I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "PeriodicEditionFocusYes" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                |
      | 4000  | RevisedCommitment__c |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 4            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    #287045
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    Then I can see top right button "Amend Subaward" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    #287049
    Then I softly see button "OK" on confirmation pop-up
    Then I softly see button "Cancel" on confirmation pop-up
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    #287052
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---subAwardStandAlone:-:completeTaskTableId---" panel
    Then I softly see value "Cancelled" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---subAwardStandAlone:-:completeTaskTableId---"
    #287044
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---subAwardStandAlone:-:completeTaskTableId---" panel
    Then I softly see value "Completed" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---subAwardStandAlone:-:completeTaskTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---subAwardStandAlone:-:completeTaskTableId---" panel
    Then I softly see value "Completed" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---subAwardStandAlone:-:completeTaskTableId---"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---subAwardStandAlone:-:completeTaskTableId---" panel
    Then I softly see value "Completed" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---subAwardStandAlone:-:completeTaskTableId---"
    #287051
    And I checkout to yopmail with mailid "exe.automation.qa2@yopmail.com"
    And I pause execution for "100" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:SOWAMENDMENTREQUEST}  for the award #{SavedValue:AwardEGMSID}.

    Amendment Details:
	Amendment Type: Periodic Renewal
	Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "fo.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:SOWAMENDMENTREQUEST}  for the award #{SavedValue:AwardEGMSID}.

    Amendment Details:
	Amendment Type: Periodic Renewal
	Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "automation.po.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:SOWAMENDMENTREQUEST}  for the award #{SavedValue:AwardEGMSID}.

    Amendment Details:
	Amendment Type: Periodic Renewal
	Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    Then I refresh the page
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:SOWAMENDMENTREQUEST}  for the award #{SavedValue:AwardEGMSID}.

    Amendment Details:
	Amendment Type: Periodic Renewal
	Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @299878 @ValidatethatAemailWilltriggertoallapproversIncludingForwardedoneandOwnerOfArafterclickonyesButton @Sprint-1-US-285144  @Undo
  Scenario: Validate that A email Will trigger to all approvers Including Forwarded one and Owner Of Ar after click on yes Button
    And I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Formula_By_Applicant_Focus_Area"
    Given I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "PeriodicEditionFocusYes" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                |
      | 4000  | RevisedCommitment__c |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 4            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:FD Username}" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see the following messages in the page details contains:
      | Comments are required. |
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:FD Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    And I checkout to yopmail with mailid "exe.automation.qa2@yopmail.com"
    And I pause execution for "100" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:SOWAMENDMENTREQUEST}  for the award #{SavedValue:AwardEGMSID}.

    Amendment Details:
	Amendment Type: Periodic Renewal
	Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "fo.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:SOWAMENDMENTREQUEST}  for the award #{SavedValue:AwardEGMSID}.

    Amendment Details:
	Amendment Type: Periodic Renewal
	Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "automation.po.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:SOWAMENDMENTREQUEST}  for the award #{SavedValue:AwardEGMSID}.

    Amendment Details:
	Amendment Type: Periodic Renewal
	Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    #To Do:-Email is not generating for forwarded approval once bug resolve Bug Id:- 368885 after that will Uncomment below steps
    And I checkout to yopmail with mailid "automation.fd.qa2@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation FD  has initiated Undo Action for amendment request #{SavedValue:SOWAMENDMENTREQUEST}  for the award #{SavedValue:AwardEGMSID}.

    Amendment Details:
	Amendment Type: Periodic Renewal
	Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @329625 @ValidatePRthatapprovaltaskandemailisgeneratedtolaststepapproveronclickofundobuttonbyLastApprover @Sprint-13-US-331643  @Undo
  Scenario: Validate PR that approval task and email is generated to last step approver on click of undo button by Last Approver of desk review
    And I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Formula_By_Applicant_Focus_Area"
    Given I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "PeriodicEditionFocusYes" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                |
      | 4000  | RevisedCommitment__c |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 4            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---subAwardStandAlone:-:completeTaskTableId---" panel
    Then I softly see value "Completed" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---subAwardStandAlone:-:completeTaskTableId---"
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---subAwardStandAlone:-:completeTaskTableId---" without waiting for record
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---subAwardStandAlone:-:completeTaskTableId---" panel
    Then I softly see value "Completed" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---subAwardStandAlone:-:completeTaskTableId---"
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---subAwardStandAlone:-:completeTaskTableId---" without waiting for record
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---subAwardStandAlone:-:completeTaskTableId---" panel
    Then I softly see value "Completed" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---subAwardStandAlone:-:completeTaskTableId---"
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---subAwardStandAlone:-:completeTaskTableId---" without waiting for record
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "200" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on AmendmentRequest #{SavedValue:SOWAMENDMENTREQUEST}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:SOWAMENDMENTREQUEST}  for the award #{SavedValue:AwardEGMSID}.

    Amendment Details:
	Amendment Type: Periodic Renewal
	Amendment ID: {SavedValue:SOWAMENDMENTREQUEST}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @329631 @ValidateKPCthatapprovaltaskandemailisgeneratedtolaststepapproveronclickofundobuttonbyLastApprover @Sprint-13-US-331643  @Undo
  Scenario: Validate KPC that approval task and email is generated to last step approver on click of undo button by Last Approver of desk review
    And I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Formula_By_Applicant_Focus_Area"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "kpcId"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Current Contact | Project Role |
      | Automation SPI3 | Other        |
    And I pause execution for "3" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 4            |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:kpcId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "100" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:kpcId}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:kpcId}  for the award #{SavedValue:AwardEGMSID}.

    Amendment Details:
	Amendment Type: Key Personnel Change
	Amendment ID: {SavedValue:kpcId}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:Automation Runtime Award
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @329639 @ValidateBudredthatapprovaltaskandemailisgeneratedtolaststepapproveronclickofundobuttonbyLastApprover @Sprint-13-US-331643  @Undo
  Scenario: Validate Bud red-Verify that approval task and email is generated to last step approver on click of undo button by Last Approver
    And I activated standalone subaward "Automation Runtime Award" with properties "IS_BUILDUP_FUNCTIONALITY_YES" of type "Formula_By_Applicant_Focus_Area"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Award Amount |
      | Construction | 900          |
    When I close "Amendment Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Indirect costs" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount |
      | Construction | The Narrative | 100          |
    When I close "Amendment Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 4            |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:BUDGETREDIRECTIONID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "100" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:BUDGETREDIRECTIONID}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:BUDGETREDIRECTIONID}  for the award #{SavedValue:AwardEGMSID}.

    Amendment Details:
	Amendment Type: Budget Redirection
	Amendment ID: {SavedValue:BUDGETREDIRECTIONID}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @329638 @ValidateCFthatapprovaltaskandemailisgeneratedtolaststepapproveronclickofundobuttonbyLastApproverofAmendment @Sprint-13-US-331643  @Undo
  Scenario: Validate CF that approval task and email is generated to last step approver on click of undo button by Last Approver of Amendment
    And I activated standalone subaward "Automation Runtime award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Formula_By_Applicant_Focus_Area"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Then I softly see that "Subaward" is in "Activated" status
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "PeriodicEditionFocusYes" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                |
      | 4000  | RevisedCommitment__c |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Carry Forward Amount |
      | Automation Permanent Focus Area | 200                  |
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Carry Forward Amount |
      | Automation Permanent Focus Area2 | 500                  |
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "RecAmendmentRequestCarryForwardBudget" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 200           |
    And I click on page navigation arrow "RecAmendmentRequestCarryForwardBudget" for table id "Next"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "RecAmendmentRequestCarryForwardBudget" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
#    When I click on button "resetIcon" in flex table with id "---progressReport:-:budgetChangeTableId---"
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Previous"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1200                 | 120        | 0              |
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2700                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 4            |
    And I wait for "9" seconds
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "150" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:CFAmendmentId}  for the award #{SavedValue:AwardEGMSID}.

    Amendment Details:
	Amendment Type: Carry Forward
	Amendment ID: {SavedValue:CFAmendmentId}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @329507 @ValidateFCthatapprovaltaskandemailisgeneratedtolaststepapproveronclickofundobuttonbyLastApprover @Sprint-13-US-331643  @Undo
  Scenario: Validate FC that approval task and email is generated to last step approver on click of undo button by Last Approver
    And I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Formula_By_Applicant_Focus_Area"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | New Obligation |
      | Automation Permanent Focus Area | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | New Obligation |
      | Automation Permanent Focus Area2 | 1000           |
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 4            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1500                 | 100        | 100            |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1500                 | 100        | 100            |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 3000  | RevisedCommitment__c |
    And I wait for "3" seconds
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "150" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:FundingID}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM  has initiated Undo Action for amendment request #{SavedValue:FundingID}  for the award #{SavedValue:AwardEGMSID}.

    Amendment Details:
	Amendment Type: Funding Change
	Amendment ID: {SavedValue:FundingID}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
