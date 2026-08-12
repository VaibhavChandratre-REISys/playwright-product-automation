@amendmentRequestsNysed @BudgetPeriodChangeamendmentRequestsNysed
Feature: Validate all scenarios in the Budget Period Change Amendment Request.

  @NYSED-10466 @NYSED-10474 @NYSED-10476 @NYSED-10475 @NYSED-Sprint-36 @US-NYSED-10296 @M06
    @NYSED-11031 @NYSED-Sprint-29 @US-NYSED-10421 @M06
  Scenario Outline: Verify that PM/PO users see New, Edit, and Remove buttons on the Fund Management Approver section when the Amendment Request is in the Submitted to Grantor state|
  |Verify system behavior when no approvers are added in'Submitted to Grant Finance' in the 'Fund Management Approvers' section - Submit for Approval|
  |Verify that PM/PO users see the validation message 'You cannot specify the same user for multiple steps for Amendment Request' when the same user is added twice in the Fund Management Approvers section|
  |Verify that PM/PO users see the validation message 'You cannot specify the same user for multiple steps for Amendment Request' when the same user is added twice in the Fund Management Approvers section|
  |Verify that the Internal User can see that the fields below are removed from the Budget Period Change amendment.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter value "{Date:M/d/yyyy::d+160}" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BudgetPeriodChangeId"
    #NYSED-11031
    Then I softly cannot see field "Justification for Budget Period Change" inside page block
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:BudgetPeriodChangeId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:BudgetPeriodChangeId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:BudgetPeriodChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BudgetPeriodChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<GFStaffQueue>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BudgetPeriodChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BudgetPeriodChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    When I navigate to "Responsibilities" sub tab
    And I wait for "4" seconds
    #NYSED-10474
    Then I see only the following ordered page blocks :
      | Program Office Approvers  |
      | Fund Management Approvers |
      | Owner                     |
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities Tab - At least one approver is required. |
    And I refresh the page
    And I wait for "2" seconds
    #NYSED-10466 #NYSED-10476 #NYSED-10475
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    Then I softly can see row level action button "Edit" against "{SavedValue:PM Username}" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:PM Username}" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 2            |
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same user for multiple steps for Amendment Request. |
    And I refresh the page
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 1            |
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same step for multiple users for Amendment Request. |
    And I refresh the page
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 2            |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "{SavedValue:FD Username}" for title "Name" against the value "Step 2" inside table "---amendment:-:fundingChangeApproversTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Amendment Request | Name                      |
      | Step 2            | {SavedValue:EXE Username} |
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" against the value "Step 2" inside table "---amendment:-:fundingChangeApproversTableId---"
    And I click on "Remove" icon for "{SavedValue:EXE Username}" inside flex table with id "---amendment:-:fundingChangeApproversTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "{SavedValue:EXE Username}" for title "Name" inside table "---amendment:-:fundingChangeApproversTableId---"

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser | GFStaffQueue |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           | FO           |

  @NYSED-10470 @NYSED-Sprint-36 @US-NYSED-10296 @M06
  Scenario Outline: Verify system behavior when no approvers are added in'Submitted to Grant Finance' in the 'Fund Management Approvers' section - Mark As Approved
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter value "{Date:M/d/yyyy::d+160}" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BudgetPeriodChangeId"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:BudgetPeriodChangeId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:BudgetPeriodChangeId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:BudgetPeriodChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BudgetPeriodChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<GFStaffQueue>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BudgetPeriodChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BudgetPeriodChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    When I navigate to "Responsibilities" sub tab
    And I click on "Mark as Approved" in the page details
    #NYSED-10470
    Then I softly cannot see the following messages in the page details contains:
      | Responsibilities Tab - At least one approver is required. |
    Then I softly see field "Status" as "Approved"

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser | GFStaffQueue |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           | FO           |