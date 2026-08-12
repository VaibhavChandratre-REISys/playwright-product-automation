@amendmentRequestsWBNew @amendmentRequests @grantor-regression @grantor-parallel-regression @regression @AmendmentWBRunForLWC
Feature: Amendment Request scenarios without background

  @531429 @validateusershouldabletoseethecreatedBPCamendmenttootherinternaluserfromsameorganization @GrantorFlexP1
  Scenario Outline: Validate user should able to see  the created BPC amendment to other internal user from same organization
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
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    When I click on hyperlink containing value "{SavedValue:budgetPChangeId}"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    When I click on hyperlink containing value "{SavedValue:budgetPChangeId}"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Examples:
      | NonOwner |
      | PO       |
      | EXE      |
      | FO       |
      | FD       |
      | ADMIN    |

  @531511 @validateusershouldabletoseethecreatedBPCamendmenttootherinternaluserfromsameorganization @GrantorFlexP1
  Scenario Outline: Validate user should able to see  the created BPC amendment to other internal user from same organization
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
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "<DiffUser>" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    Then I softly do not see value "{SavedValue:budgetPChangeId}" for title "EGMS ID" inside table "Amendment Requests"
    When I re-login to "Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see field "Subaward Id" as "{SavedValue:AwardEGMSID}"
    Then I softly see field "New Budget Period End Date" as "{SavedValue:updatedBudgetPeriodDate}"
    Then I softly see value "$1,000.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---amendment:-:projectAreasTableId---"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    Then I softly do not see value "{SavedValue:budgetPChangeId}" for title "EGMS ID" inside table "Amendment Requests"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Sent to Subrecipient"
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    Then I can see top right button "Save" in page detail
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Save" in page detail
    Then I softly see field "Subaward Id" as "{SavedValue:AwardEGMSID}"
    Then I softly see field "New Budget Period End Date" as "{SavedValue:updatedBudgetPeriodDate}"
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
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
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation PM1" for title "New Value" inside field history table
    Then I softly see value "Automation PM" for title "Original Value" inside field history table
    And I navigate to "Overview" sub tab
    Then I softly see field "Subaward Id" as "{SavedValue:AwardEGMSID}"
    Then I softly see field "New Budget Period End Date" as "{SavedValue:updatedBudgetPeriodDate}"
    Then I softly see value "$1,000.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---amendment:-:projectAreasTableId---"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Subaward Id" as "{SavedValue:AwardEGMSID}"
    Then I softly see field "New Budget Period End Date" as "{SavedValue:updatedBudgetPeriodDate}"
    Then I softly see value "$1,000.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---amendment:-:projectAreasTableId---"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Submit for Approval" in page detail
    Examples:
      | NonOwner | DiffUser    |
      | EXE      | GRANTEE EXE |

  @531389 @531279 @validatePMPOEXEFOFDAuditorAdminusercanViewCombinationofamendmentcreatedbyPMuserfromsameorganization @GrantorFlexP1
  Scenario: Validate PM, PO, EXE, FO, FD, Auditor, Admin user can View  Combination of amendment  created by PM user from same organization
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Formula_By_Applicant_Focus_Area"
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
    When I enter "BPC_SOW_FC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "bpcFcScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "dark blue"
   #531389
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:bpcFcScopeId}"
    And I click on row level action button "Edit" against "{SavedValue:bpcFcScopeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:bpcFcScopeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:bpcFcScopeId}"
    And I click on row level action button "Edit" against "{SavedValue:bpcFcScopeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:bpcFcScopeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:bpcFcScopeId}"
    And I click on row level action button "Edit" against "{SavedValue:bpcFcScopeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:bpcFcScopeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:bpcFcScopeId}"
    And I click on row level action button "Edit" against "{SavedValue:bpcFcScopeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:bpcFcScopeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:bpcFcScopeId}"
    And I click on row level action button "Edit" against "{SavedValue:bpcFcScopeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:bpcFcScopeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:bpcFcScopeId}"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:bpcFcScopeId}" in global search with id "Amendment Requests"
    When I click on hyperlink containing value "{SavedValue:bpcFcScopeId}"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:bpcFcScopeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"

  @530818 @530812 @validatePMPOEXEFOFDAuditorAdminusercanViewTermsandconditionsamendmentcreatedbyPMuserfromsameorganizatio @GrantorFlexP1
  Scenario: Validate PM, PO, EXE, FO, FD, Auditor, Admin user can View Terms and conditions amendment  created by PM user from same organization
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | NA                |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---progressreport:-:AmendmentAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---progressreport:-:AmendmentAttachmentTableId---"
    When I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:TnCEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:TnCEGMSID}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:TnCEGMSID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:TnCEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:TnCEGMSID}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:TnCEGMSID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:TnCEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:TnCEGMSID}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:TnCEGMSID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:TnCEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:TnCEGMSID}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:TnCEGMSID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:TnCEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:TnCEGMSID}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:TnCEGMSID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:TnCEGMSID}"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TnCEGMSID}" in global search with id "Amendment Requests"
    When I click on hyperlink containing value "{SavedValue:TnCEGMSID}"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:TnCEGMSID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"

  @531675 @validatePMPOEXEFOFDAuditorAdminusercanViewFundingChangeamendmentcreatedbyPMuserfromsameorganization @GrantorFlexP1
  Scenario Outline: Validate PM, PO, EXE, FO, FD, Auditor, Admin user can View Funding Change amendment created by PM user from same organization
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
      | {SavedValue:PM Username} | NA                |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:FundingID}"
    And I click on row level action button "Edit" against "{SavedValue:FundingID}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:FundingID}"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:FundingID}" in global search with id "Amendment Requests"
    When I click on hyperlink containing value "{SavedValue:FundingID}"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Examples:
      | NonOwner |
      | PO       |
      | EXE      |
      | FO       |
      | FD       |
      | ADMIN    |

  @532491 @validatePMPOEXEFOFDAuditorAdminusercanViewPeriodicRenewalamendmentcreatedbyPMuserfromsameorganization @GrantorFlexP1
  Scenario Outline: Validate PM, PO, EXE, FO, FD, Auditor, Admin user can View Periodic Renewal amendment created by PM user from same organization
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
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "PeriodicID"
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
      | Automation PM | NA                |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    When I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:PeriodicID}"
    And I click on row level action button "Edit" against "{SavedValue:PeriodicID}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:PeriodicID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:PeriodicID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:PeriodicID}"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:PeriodicID}" in global search with id "Amendment Requests"
    When I click on hyperlink containing value "{SavedValue:PeriodicID}"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:PeriodicID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:PeriodicID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Examples:
      | NonOwner |
      | PO       |
      | EXE      |
      | FO       |
      | FD       |
      | ADMIN    |

  @531287 @validatecombinationofamendmentFlexsharingrecordvisibilitytoSPISPAuser(relatedexternalusers)whenAmendmentrequestisSendtosubrecipient @GrantorFlexP1
  Scenario: Validate Combination of amendment Flexsharing record visibility to SPI,SPA user (related external users) when Amendment request is Send to subrecipient
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
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
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

  @531512 @validateusershouldabletoseethecreatedBPCamendmenttootherinternaluserfromsameorganization @GrantorFlexP1
  Scenario: Validate user should able to see  the created BPC amendment to other internal user from same organization
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientBPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "BPCId"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:BPCId}"
    And I wait for "2" seconds
    And I click on hyperlink containing value "{SavedValue:BPCId}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "2" seconds
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:BPCId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly see value "{SavedValue:BPCId}" for title "EGMS ID" inside table "---amendment:-:recipientSideAmendmentRequestTableId---"
    When I click on "View" icon for "{SavedValue:BPCId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:BPCId}" for title "EGMS ID" inside table "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    When I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Requests" sub tab
    Then I softly see value "{SavedValue:BPCId}" for title "EGMS ID" inside table "---amendment:-:SubrecipientGrantAmendmentTableId---"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:BPCId}"
    And I wait for "2" seconds
    Then I softly do not see value "{SavedValue:BPCId}" for title "EGMS ID" inside table "Amendment Requests"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I select "Amendment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:BPCId}"
    Then I softly can see row level action button "Edit" against "{SavedValue:BPCId}" in global search with id "Amendment Requests"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:BPCId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:BPCId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly see value "{SavedValue:BPCId}" for title "EGMS ID" inside table "---amendment:-:recipientSideAmendmentRequestTableId---"
    When I click on "View" icon for "{SavedValue:BPCId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:BPCId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 2            |
    And I pause execution for "3" seconds
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BPCId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BPCId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BPCId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BPCId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BPCId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "dark blue"

  @531380 @validatecombinationofamendmentFlexsharingSPI,SPAusersfromsameorganizationcanViewCombinationofamendmentcreatedbySPIuser @GrantorFlexP1
  Scenario: Validate Combination of amendment Flexsharing  SPI, SPA users from same organization can View  Combination of amendment  created by SPI user
    Given I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUD_CAT_BUILDUP_YES-Automation PO user" of type "Formula_By_Applicant"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
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
    And I wait for "2" seconds
    And I refresh the page
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Award Amount |
      | Construction | 450          |
    And I wait for "2" seconds
    When I close "Amendment Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Indirect costs" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount |
      | Construction | The Narrative | 50           |
    And I wait for "2" seconds
    When I close "Amendment Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I wait for "3" seconds
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Award Amount |
      | Construction | 450          |
    And I wait for "2" seconds
    When I close "Amendment Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    When I click on "Add Line Items" icon for "Indirect costs" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount |
      | Construction | The Narrative | 50           |
    And I wait for "2" seconds
    When I close "Amendment Line Items" modal by clicking the top right x button
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:budRedKPCSOWId}"
    And I click on hyperlink containing value "{SavedValue:budRedKPCSOWId}"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:budRedKPCSOWId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly see value "{SavedValue:budRedKPCSOWId}" for title "EGMS ID" inside table "---amendment:-:recipientSideAmendmentRequestTableId---"
    When I click on "View" icon for "{SavedValue:budRedKPCSOWId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:budRedKPCSOWId}" for title "EGMS ID" inside table "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    When I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Requests" sub tab
    Then I softly see value "{SavedValue:budRedKPCSOWId}" for title "EGMS ID" inside table "---amendment:-:SubrecipientGrantAmendmentTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:budRedKPCSOWId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly see value "{SavedValue:budRedKPCSOWId}" for title "EGMS ID" inside table "---amendment:-:recipientSideAmendmentRequestTableId---"
    When I click on "View" icon for "{SavedValue:budRedKPCSOWId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budRedKPCSOWId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budRedKPCSOWId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | NA                |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budRedKPCSOWId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budRedKPCSOWId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @532242 @validatetheaccessofkpcamendmentrequest @GrantorFlexP1
  Scenario: Validate the Access of KPC Amendment request
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
    When I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I see value "Automation SPI3" for title "Name" inside table "---amendment:-:InternalKeyPersonalTableId---"
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I see value "Automation SPI3" for title "Name" inside table "---amendment:-:InternalKeyPersonalTableId---"
    And I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "dark blue"

  @532358 @validateCarryForwardARInternaluserseetherecordissharedonlywhenCarryForwardamendmentisinSubmittograntorstate @GrantorFlexP1
  Scenario: Carry Forward AR - Validate that Internal user see the record is shared only when Carry Forward amendment is in Submit to grantor state
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "dynamicUser" user
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
    And I save the field labeled "EGMS ID" as "PeriodicID"
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
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I wait for "2" seconds
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
    Then I softly see value "$1,500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I expand nested table containing column value "BP01"
    Then I softly see value "$500.00" for title "Carry Forward" against the value "Construction" inside table "---amendment:-:InternalCarryForwardBudgetTableId---"
    Then I softly see value "$1,500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2500                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "5" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId1"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"

  @532265 @validateCarryForwardARExternaluser(Sameorg)seetherecordissharedincreatedstatewhenCarryForwardamendmentisincreatedstate @GrantorFlexP1
  Scenario: Carry Forward AR - Validate that External user (Same org)see the record is shared in created state when Carry Forward amendment is in created state
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "dynamicUser" user
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
    And I save the field labeled "EGMS ID" as "PeriodicID"
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
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I click on "Amend Subaward" in the page details
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
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:CFAmendmentId}"
    And I click on hyperlink containing value "{SavedValue:CFAmendmentId}"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:recipientSideAmendmentRequestTableId---"
    When I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I expand nested table containing column value "BP01"
    Then I softly see value "$500.00" for title "Carry Forward" against the value "Construction" inside table "---amendment:-:RecipientCarryForwardBudgetTableId---"
    Then I softly see value "$1,500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:budgetChangeTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    When I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    When I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Requests" sub tab
    Then I softly see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:SubrecipientGrantAmendmentTableId---"

  @531696 @validateamendmentownercanActivateSubawardfromFundingChangeAmendmentRequest @GrantorFlexP1
  Scenario: Validate amendment owner can Activate Subaward from Funding Change Amendment Request
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
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 3000                 | 150        | 150            |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
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
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    When I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"

  @528710 @531268 @validateusershouldabletoseethecreatedSOWamendmenttootherinternaluserfromsameorganization @GrantorFlexP1 @GrantorFlexP2
  Scenario: Validate user should able to see  the created SOW amendment to other internal user from same organization
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
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I get the "EGMS ID"
    When I click on top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    And I pause execution for "5" seconds
    And I enter values into fields
      | Value                                    | Field        |
      | Automation Permanent KPI for Regression2 | MasterKPI__c |
      | 10                                       | Target__c    |
    And I click modal button "Save"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---amendment:-:AmendmentAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    And I pause execution for "3" seconds
    And I click modal button "Close"
    Then I softly see "Attachment.pdf" has been added in "Amendment Files" flex table
    And I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    And I click on row level action button "Edit" against "{SavedValue:SOWAMENDMENTREQUEST}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SOWAMENDMENTREQUEST}" in global search with id "Amendment Requests"
    When I click on hyperlink containing value "{SavedValue:SOWAMENDMENTREQUEST}"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    And I click on row level action button "Edit" against "{SavedValue:SOWAMENDMENTREQUEST}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    And I click on row level action button "Edit" against "{SavedValue:SOWAMENDMENTREQUEST}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    And I click on row level action button "Edit" against "{SavedValue:SOWAMENDMENTREQUEST}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    And I click on row level action button "Edit" against "{SavedValue:SOWAMENDMENTREQUEST}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"

  @531269 @validateSRusershouldabletoseethecreatedSOWamendmenttootherinternaluserfromsameorganization @GrantorFlexP1
  Scenario:Validate user should able to see  the created SOW amendment to other internal user from same organization
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_SOW_creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    And I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:scopeWorkId}"
    And I click on hyperlink containing value "{SavedValue:scopeWorkId}"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:recipientSideAmendmentRequestTableId---"
    When I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    When I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Requests" sub tab
    Then I softly see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:SubrecipientGrantAmendmentTableId---"

  @531690 @validatePMuser(amendmentowner)cansendamendmentrequestbacktosubrecipient @GrantorFlexP1
  Scenario: Validate PM user (amendment owner) can send amendment request back to subrecipient
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
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 3000                 | 150        | 150            |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
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
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see value "$3,000.00" for title "Revised Award Amount " against the value "Construction" inside table "---amendment:-:budgetChangeTableId---"
    Then I softly see field "Revised Commitment" as "$3,000.00"

  @532495 @532497 @532498 @534334 @validatePeriodicRenewal-PMusercanabletoSendamendmentrequesttosubrecipient&seevisibilityonsection @GrantorFlexP1
  Scenario: Validate PM user can able to Send amendment request to subrecipient & see visibility on section
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "dynamicUser" user
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
    And I save the field labeled "EGMS ID" as "PeriodicID"
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
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    And I pause execution for "3" seconds
    And I click modal button "Close"
    Then I softly see "Attachment.pdf" has been added in "Amendment Files" flex table
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentAddNotesTableId---" by clicking "New" :
      | Title            | Description      |
      | Automation Notes | Automation Notes |
    And I click on "Send to Subrecipient" in the page details
    When I navigate to "Overview" sub tab
    Then I see value "Automation SPI3" for title "Name" inside table "---amendment:-:InternalKeyPersonalTableId---"
    Then I softly see value "Automation Permanent Objective" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:goalsAndObjectivesTableId---"
    Then I softly see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:AmendmentKPITableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:AmendmentKPITableId---"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:FundingChangeFocusAreaTableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:FundingChangeFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Revised Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---amendment:-:approversTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---amendment:-:amendmentOwnerTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    #532497 #532498
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I see value "Automation SPI3" for title "Name" inside table "---amendment:-:RecipientKeyPersonalTableId---"
    Then I softly see value "Automation Permanent Objective" for title "Title" inside table "---amendment:-:SubrecipientgoalsAndObjectivesTableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:SubrecipientgoalsAndObjectivesTableId---"
    Then I softly see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:recipientKeyOutComes---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:recipientKeyOutComes---"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    When I navigate to "Files" sub tab
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    And I click on top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    And I upload attachment without random number "Attachment1.pdf" of type "Terms and Conditions" from computer
    And I pause execution for "3" seconds
    And I click modal button "Close"
    Then I softly see "Attachment1.pdf" has been added in "Amendment Files" flex table
    Then I can see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit to Grantor" in page detail
#532498
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I see value "Automation SPI3" for title "Name" inside table "---amendment:-:RecipientKeyPersonalTableId---"
    Then I softly see value "Automation Permanent Objective" for title "Title" inside table "---amendment:-:SubrecipientgoalsAndObjectivesTableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:SubrecipientgoalsAndObjectivesTableId---"
    Then I softly see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:recipientKeyOutComes---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:recipientKeyOutComes---"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    When I navigate to "Files" sub tab
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see "Attachment1.pdf" has been added in "Amendment Files" flex table
    Then I can see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    Then I cannot see top right button "Submit to Grantor" in page detail
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I refresh the page
    #534334
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see value "$1,000.00" for title "Revised Award Amount" against the value "Construction" inside table "---progressReport:-:budgetChangeTableId---"
    And I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see value "$1,000.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I see value "Automation SPI3" for title "Name" inside table "---amendment:-:InternalKeyPersonalTableId---"
    Then I softly see value "Automation Permanent Objective" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:goalsAndObjectivesTableId---"
    Then I softly see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:AmendmentKPITableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:AmendmentKPITableId---"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:FundingChangeFocusAreaTableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:FundingChangeFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Revised Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:AmendmentSpecialConditionTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---amendment:-:approversTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---amendment:-:amendmentOwnerTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment1.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"

  @531684 @531691 @validateNewuserscreated(forsameexternalorg)afterAmendmentrequestissenttosubrecipientareabletoView/Submitamendmentrequesttograntor @GrantorFlexP1
  Scenario: Validate New users created (for same external org) after Amendment request is sent to subrecipient  are able to View / Submit amendment request to grantor
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 1000                        | RequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "FundingChangeID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    And I pause execution for "3" seconds
    And I click modal button "Close"
    Then I softly see "Attachment.pdf" has been added in "Amendment Files" flex table
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentAddNotesTableId---" by clicking "New" :
      | Title            | Description      |
      | Automation Notes | Automation Notes |
    And I click on "Send to Subrecipient" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:FundingChangeFocusAreaTableId---"
    Then I softly do not see top right button "Associate" inside flex table "---amendment:-:FundingChangeFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Revised Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:amendmentFundingAccountsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---amendment:-:approversTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---amendment:-:amendmentOwnerTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I cannot see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 500                  | 100        | 0              |
    And I refresh the page
    When I navigate to "Files" sub tab
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    And I click on top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    And I upload attachment without random number "Attachment1.pdf" of type "Terms and Conditions" from computer
    And I pause execution for "3" seconds
    And I click modal button "Close"
    Then I softly see value "Attachment1.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit to Grantor" in page detail
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I refresh the page
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Attachment1.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    Then I cannot see top right button "Submit to Grantor" in page detail
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
  #531691
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see value "$1,000.00" for title "Revised Award Amount" inside table "---progressReport:-:budgetChangeTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Attachment1.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see value "$1,000.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:FundingChangeFocusAreaTableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:FundingChangeFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Revised Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly see top right button "Associate" inside flex table "---amendment:-:amendmentFundingAccountsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---amendment:-:approversTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---amendment:-:amendmentOwnerTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment1.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 3100  | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    When I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"

  @531280 @validateCombinationofamendmentFlexsharing-SPI,SPAusersfromrelatedorganizationcannotseeCombinationofamendmentwhenamendmentisinCreatedstate
  Scenario: Validate Combination of amendment Flexsharing - SPI, SPA users from related organization cannot see  Combination of amendment  when amendment is in Created state
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
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:bpcFcScopeId}"
    Then I softly see the text containing "No results"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:bpcFcScopeId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:bpcFcScopeId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly do not see value "{SavedValue:bpcFcScopeId}" for title "EGMS ID" inside table "---amendment:-:recipientSideAmendmentRequestTableId---"

  @531288 @531285 @validateCombinationofamendmentFlexsharing-PMusercanSendamendmentrequesttosubrecipient
  Scenario: Validate Combination of amendment Flexsharing - PM user can Send amendment request  to subrecipient | Validate details displayed to SPI , SPA users on  Combination of amendment
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
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
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
    When I get the "EGMS ID"
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
    #531288
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

  @531284 @validateCombinationofamendmentFlexsharing-PMusercaneditdatainCombinationofamendmentandotherinternalusersfromsameorganizationcanseetheupdateddata
  Scenario: Validate Combination of amendment Flexsharing - PM user can edit data in Combination of amendment and other internal users from same organization can see the updated data
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
    When I enter "BPC_SOW_FC_TNC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "bpcFcSowTncId"
    And I wait for "2" seconds
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I wait for "2" seconds
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
      | Automation Justification    | TncComments__c                |
    Then I softly see fields "AreTCspartofNGAAttachments__c" is in edit mode
    And I enter value "Checked" into field "AreTCspartofNGAAttachments__c"
    Then I softly see fields "FederalTCLink__c" is in edit mode
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | End Date                             | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:updatedBudgetPeriodDate} | 1000           |
    And I click on top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---amendment:-:objectivesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---amendment:-:AmendmentKPITableId---"
    And I wait for "2" seconds
    When I enter value "Automation Permanent KPI2" into field "MasterKPI__c"
    When I enter value "8" into field "Target__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:AmendmentKPITableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---amendment:-:AmendmentKPITableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 20     |
    Then I softly see top right button "Associate" inside flex table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I click on top right button "New" in flex table with id "---amendment:-:AmendmentSpecialConditionTableId---"
    And I enter in modal value "Automation Special Conditions" into field "Title__c"
    And I enter in modal value "Automation Special Conditions description" into field "Description__c"
    And I enter in modal value "1" into field "Sequence__c"
    And I enter in modal value "0" into field "EffectiveFrom__c"
    And I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "2" seconds
    When I perform quick search for "Automation Special Conditions" in "---amendment:-:AmendmentSpecialConditionTableId---" panel
    Then I softly see value "Automation Special Conditions" for title "Name" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I click on "Edit" icon for "Automation Special Conditions" inside flex table with id "---amendment:-:AmendmentSpecialConditionTableId---" without waiting for record
    And I enter in modal value "Automation Special Conditions1" into field "Title__c"
    And I enter in modal value "Automation Special Conditions description1" into field "Description__c"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "2" seconds
    When I perform quick search for "Automation Special Conditions1" in "---amendment:-:AmendmentSpecialConditionTableId---" panel
    Then I softly see value "Automation Special Conditions1" for title "Name" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 2            |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "{SavedValue:PO Username}" for title "Name" inside table "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---progressreport:-:AmendmentAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---progressreport:-:AmendmentAttachmentTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentAddNotesTableId---" by clicking "New" :
      | Title            | Description      |
      | Automation Notes | Automation Notes |
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    When I get the "EGMS ID"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:bpcFcSowTncId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:bpcFcSowTncId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:AmendmentKPITableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---amendment:-:AmendmentKPITableId---"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Special Conditions1" for title "Name" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "{SavedValue:PO Username}" for title "Name" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---progressreport:-:AmendmentAttachmentTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"

  @531386 @531290 @validateCombinationofamendmentFlexsharing-SPIusercanAcknowledgeamendmentrequest
  Scenario: Validate Combination of amendment Flexsharing - Verify SPI user can Acknowledge amendment request
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
    When I enter "BPC_SOW_FC_TNC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "bpcFcSowTncId"
    And I wait for "2" seconds
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I wait for "2" seconds
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
      | Automation Justification    | TncComments__c                |
    Then I softly see fields "AreTCspartofNGAAttachments__c" is in edit mode
    And I enter value "Checked" into field "AreTCspartofNGAAttachments__c"
    Then I softly see fields "FederalTCLink__c" is in edit mode
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | End Date                             | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:updatedBudgetPeriodDate} | 1000           |
    And I click on top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---amendment:-:objectivesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---amendment:-:AmendmentKPITableId---"
    And I wait for "2" seconds
    When I enter value "Automation Permanent KPI2" into field "MasterKPI__c"
    When I enter value "8" into field "Target__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:AmendmentKPITableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---amendment:-:AmendmentKPITableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 20     |
    Then I softly see top right button "Associate" inside flex table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I click on top right button "New" in flex table with id "---amendment:-:AmendmentSpecialConditionTableId---"
    And I enter in modal value "Automation Special Conditions" into field "Title__c"
    And I enter in modal value "Automation Special Conditions description" into field "Description__c"
    And I enter in modal value "1" into field "Sequence__c"
    And I enter in modal value "0" into field "EffectiveFrom__c"
    And I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "2" seconds
    When I perform quick search for "Automation Special Conditions" in "---amendment:-:AmendmentSpecialConditionTableId---" panel
    Then I softly see value "Automation Special Conditions" for title "Name" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I click on "Edit" icon for "Automation Special Conditions" inside flex table with id "---amendment:-:AmendmentSpecialConditionTableId---" without waiting for record
    And I enter in modal value "Automation Special Conditions1" into field "Title__c"
    And I enter in modal value "Automation Special Conditions description1" into field "Description__c"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "2" seconds
    When I perform quick search for "Automation Special Conditions1" in "---amendment:-:AmendmentSpecialConditionTableId---" panel
    Then I softly see value "Automation Special Conditions1" for title "Name" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    When I get the "EGMS ID"
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:bpcFcSowTncId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:bpcFcSowTncId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:bpcFcSowTncId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:RecipientKPITableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---amendment:-:RecipientKPITableId---"
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---amendment:-:SubrecipientgoalsAndObjectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---amendment:-:SubrecipientgoalsAndObjectivesTableId---"
    Then I softly see value "Automation Special Conditions1" for title "Name" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Attachment1.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit to Grantor" in page detail
    Then I softly cannot see top right button "Acknowledge" in page detail

  @531301 @531300 @validatevalidateCombinationofamendmentFlexsharing-amendmentownercanclickAmendSubawardbutton
  Scenario: Validate Combination of amendment Flexsharing - amendment owner can click Amend Subaward button | Validate amendment owner can Activate Subaward from  Combination of amendment
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
    When I enter "BPC_SOW_FC_TNC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "bpcFcSowTncId"
    And I wait for "2" seconds
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I wait for "2" seconds
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | Automation Justification    | TncComments__c                |
    Then I softly see fields "AreTCspartofNGAAttachments__c" is in edit mode
    And I enter value "Checked" into field "AreTCspartofNGAAttachments__c"
    Then I softly see fields "FederalTCLink__c" is in edit mode
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | End Date                             | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:updatedBudgetPeriodDate} | 1000           |
    And I click on top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---amendment:-:objectivesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---amendment:-:AmendmentKPITableId---"
    And I wait for "2" seconds
    When I enter value "Automation Permanent KPI2" into field "MasterKPI__c"
    When I enter value "8" into field "Target__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:AmendmentKPITableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---amendment:-:AmendmentKPITableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                   | Target |
      | Automation Permanent KPI2 | 20     |
    Then I softly see top right button "Associate" inside flex table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I click on top right button "New" in flex table with id "---amendment:-:AmendmentSpecialConditionTableId---"
    And I enter in modal value "Automation Special Conditions" into field "Title__c"
    And I enter in modal value "Automation Special Conditions description" into field "Description__c"
    And I enter in modal value "1" into field "Sequence__c"
    And I enter in modal value "0" into field "EffectiveFrom__c"
    And I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "2" seconds
    When I perform quick search for "Automation Special Conditions" in "---amendment:-:AmendmentSpecialConditionTableId---" panel
    Then I softly see value "Automation Special Conditions" for title "Name" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I click on "Edit" icon for "Automation Special Conditions" inside flex table with id "---amendment:-:AmendmentSpecialConditionTableId---" without waiting for record
    And I enter in modal value "Automation Special Conditions1" into field "Title__c"
    And I enter in modal value "Automation Special Conditions description1" into field "Description__c"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "2" seconds
    When I perform quick search for "Automation Special Conditions1" in "---amendment:-:AmendmentSpecialConditionTableId---" panel
    Then I softly see value "Automation Special Conditions1" for title "Name" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    When I get the "EGMS ID"
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:bpcFcSowTncId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:bpcFcSowTncId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:bpcFcSowTncId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:RecipientKPITableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---amendment:-:RecipientKPITableId---"
    Then I see value "Automation Permanent Objective" for title "Title" inside table "---amendment:-:SubrecipientgoalsAndObjectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---amendment:-:SubrecipientgoalsAndObjectivesTableId---"
    Then I softly see value "Automation Special Conditions1" for title "Name" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Attachment1.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
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
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    When I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"

  @534323 @534325 @validateINDusercannotseeBudgetredirectionARwhichiscreatedbySPIuser
  Scenario: Validate IND user from different organizations cannot see Budget Redirection AR which is created by SPI user | Validate SPA user can View Budget Redirection AR created by SPI user
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:BUDGETREDIRECTIONID}"
    Then I softly see the text containing "No results"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:BUDGETREDIRECTIONID}"
    And I click on hyperlink containing value "{SavedValue:BUDGETREDIRECTIONID}"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
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

  @534331 @534326 @validateSPIuser(Recordowner)actionsdisplayedforamendmentrequestrecordwhenAmendmentisinCreatedstate
  Scenario: Validate SPI user (Record owner) actions displayed for amendment request record when Amendment is in Created state | Validate details displayed to SPI , SPA users on Budget Redirection AR
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
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"
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
    Then I softly can see top right button "Delete" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly see value "{SavedValue:BUDGETREDIRECTIONID}" for title "EGMS ID" inside table "---amendment:-:recipientSideAmendmentRequestTableId---"
    When I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
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
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly cannot see top right button "Delete" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit to Grantor" in page detail

  @534339 @534338 @534329 @534330 @ValidaterecordvisibilitytoSPI,SPAuser(relatedexternalusers)whenAmendmentrequestisSendtosubrecipient
  Scenario:Validate record visibility to SPI,SPA user (related external users) when Amendment request is Send to subrecipient | Validate Notification, Task and email is generated to SPI,SPA user (related external users) when Amendment request is Send to subrecipient
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
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    And I wait for "2" seconds
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I wait for "2" seconds
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    And I click on "Send Back to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Under Revision"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:BUDGETREDIRECTIONID}"
    And I click on hyperlink containing value "{SavedValue:BUDGETREDIRECTIONID}"
    Then I softly see field "Status" as "Under Revision"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:BUDGETREDIRECTIONID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
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
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:BUDGETREDIRECTIONID}"
    And I click on hyperlink containing value "{SavedValue:BUDGETREDIRECTIONID}"
    Then I softly see field "Status" as "Under Revision"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:BUDGETREDIRECTIONID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
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
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:SubrecipientGrantAmendmentTableId---"
    #534339
    When I navigate to "Overview" sub tab
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
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"

  @534336 @ValidateTaskreassignmentfromPMuser(amendmentowner)toanotheruserwhenamendmentrequestisinSubmittoGrantorstate
  Scenario: Validate Task reassignment from PM user(amendment owner) to another user when amendment request is in  Submit to Grantor state
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
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:BUDGETREDIRECTIONID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BUDGETREDIRECTIONID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BUDGETREDIRECTIONID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
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
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail

  @528716 @528712 @528711 @validateusershouldabletoseetheSOWamendmentrequestaccesswithexternaluseronlyaftersendtosubrecipientbutton @GrantorFlexP2
  Scenario: Validate user should able to see the SOW amendment request access with external user only after send to subrecipient button | Validate SOW amendment request not accessible with external user before send to subrecipient button
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
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I get the "EGMS ID"
    When I click on top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    And I pause execution for "5" seconds
    And I enter values into fields
      | Value                                    | Field        |
      | Automation Permanent KPI for Regression2 | MasterKPI__c |
      | 10                                       | Target__c    |
    And I click modal button "Save"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 3            |
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    And I pause execution for "3" seconds
    And I click modal button "Close"
    Then I softly see "Attachment.pdf" has been added in "Amendment Files" flex table
    And I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    #528712
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    Then I softly see the text containing "No results"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly do not see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:recipientSideAmendmentRequestTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I softly do not see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I navigate to "Overview" sub tab
    When I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Requests" sub tab
    Then I softly do not see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:SubrecipientGrantAmendmentTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I softly see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    And I click on hyperlink containing value "{SavedValue:SOWAMENDMENTREQUEST}"
    Then I softly see field "Status" as "Sent to Subrecipient"
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:recipientSideAmendmentRequestTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    When I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Requests" sub tab
    Then I softly see "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:SubrecipientGrantAmendmentTableId---"
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:SubrecipientGrantAmendmentTableId---"
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Change in Scope – Subaward Description" page block displayed
    Then I softly see "Change in Scope – Place of Performance" page block displayed
    Then I softly see "Change in Scope – Goals and Objectives" page block displayed
    Then I softly see "Change in Scope – Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly do not see "Budget Summary" page block displayed
    Then I softly do not see "Budget Summary by Focus Area" page block displayed
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
   #528716
    When I re-login to "Grants Portal" app as "SPI4" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    Then I softly see the text containing "No results"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"

  @528720 @validateusershouldabletoseetheSOWamendmentrequestiseditablewithinternaluseraftersubmittedtograntor(withsameorg) @GrantorFlexP2
  Scenario: Validate user should able to see the SOW amendment request is editable with internal user after submitted to grantor (with same org)
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_SOW_creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---amendment:-:SubrecipientgoalsAndObjectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---amendment:-:objectivesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---amendment:-:SubrecipientgoalsAndObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---amendment:-:RecipientKPITableId---"
    And I enter values into fields
      | Value                     | Field        |
      | Automation Permanent KPI2 | MasterKPI__c |
      | 20                        | Target__c    |
    And I click modal button "Save"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:RecipientKPITableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---amendment:-:RecipientKPITableId---"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter "Subrecipient_SOW_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    And I enter values into fields
      | Value                                    | Field        |
      | Automation Permanent KPI for Regression2 | MasterKPI__c |
      | 10                                       | Target__c    |
    And I click modal button "Save"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:keyOutcomesTableId---"
    Then I see value "Automation Permanent KPI2" for title "Title" inside table "---amendment:-:keyOutcomesTableId---"
    Then I see value "Automation Permanent KPI for Regression2" for title "Title" inside table "---amendment:-:keyOutcomesTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    And I pause execution for "3" seconds
    And I click modal button "Close"
    Then I softly see "Attachment.pdf" has been added in "Amendment Files" flex table
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentAddNotesTableId---" by clicking "New" :
      | Title              | Description      |
      | fAutomation Notesf | Automation Notes |
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"

  @530817 @validatePMusercanassociatenewlycreatedtermsandconditionrecordsbyotherusersinAssociateTermsandconditionmodal @GrantorFlexP2
  Scenario: Validate PM user can associate newly created terms and condition records by other users in Associate Terms and condition modal
    Given I login to "Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:termsAndConditionsTableId---"
    And I enter "Creation" values from "TermsandConditions_Field_Values.xlsx"
    When I click modal button "Save"
    When I save the field labeled "EGMS ID" as "TNCID"
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
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
    And I click on top right button "Associate" in flex table with id "---amendment:-:AmendmentSpecialConditionTableId---"
    When I perform quick search for "{SavedValue:TNCID}" in "---amendment:-:TNCTableID---" panel
    And I wait for "3" seconds
    When I click "Associate" after selection of "{SavedValue:TNCID}" in the table "---amendment:-:TNCTableID---"
    And I click modal button "Close"
    Then I softly see value "{SavedValue:TNCID}" for title "Title" inside table "---amendment:-:AmendmentSpecialConditionTableId---"

  @530830 @530828 @530824 @530822 @530819 @validatePMusercanusercanSendamendmentrequesttosubrecipient @GrantorFlexP2
  Scenario: Validate PM user can associate newly created terms and condition records by other users in Associate Terms and condition modal | Validate SPI user can Acknowledge amendment request after send back to subrecipient
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
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TnCEGMSID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly cannot see top right button "Acknowledge" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Associate" inside flex table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I select value inside table "---amendment:-:RecipientTermsandConditionsTableId---" is "All"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    When I enter the following values into flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---" by clicking "New" :
      | Title             | Description       |
      | Automation Notes2 | Automation Notes1 |
    Then I softly see value "Automation Notes2" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I perform quick search inside global search "{SavedValue:TnCEGMSID}"
    And I wait for "2" seconds
    Then I softly see the text containing "No results"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "View" icon for "{SavedValue:TnCEGMSID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Acknowledge" in page detail
    When I navigate to "Files" sub tab
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    #530828
    And I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged"
    Then I softly see status in Progress-bar is "Acknowledged" and is "dark blue"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Acknowledge" in page detail
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    Then I softly do not see top right button "Associate" inside flex table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I select value inside table "---amendment:-:RecipientTermsandConditionsTableId---" is "All"
    Then I softly see value "Automation Permanent TNC" for title "Title" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    Then I softly see value "Automation Permanent TNC1" for title "Title" inside table "---amendment:-:RecipientTermsandConditionsTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I cannot see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
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
    Then I softly see value "Automation Notes2" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    #530830
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    And I click on "Send Back to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TnCEGMSID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TnCEGMSID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Acknowledge" in page detail
    When I navigate to "Files" sub tab
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I can see top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged"
    Then I softly see status in Progress-bar is "Acknowledged" and is "dark blue"

  @530943 @validateusershouldabletoseethecreatedSOWamendmentfromsameorganization(withnosetting)
  Scenario: Validate user should able to see the created SOW amendment from same organization (with no setting)
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "NO_OBJECTIVE" of type "Competitive"
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
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Change in Scope – Subaward Description" page block displayed
    Then I softly see "Change in Scope – Place of Performance" page block displayed
    Then I softly do not see "Change in Scope – Goals and Objectives" page block displayed
    Then I softly do not see "Change in Scope – Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Title" inside table "---amendment:-:approversTableId---"
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
    And I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    And I click on row level action button "Edit" against "{SavedValue:SOWAMENDMENTREQUEST}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Change in Scope – Subaward Description" page block displayed
    Then I softly see "Change in Scope – Place of Performance" page block displayed
    Then I softly do not see "Change in Scope – Goals and Objectives" page block displayed
    Then I softly do not see "Change in Scope – Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly do not see "Budget Summary" page block displayed
    Then I softly do not see "Budget Summary by Focus Area" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    And I click on row level action button "Edit" against "{SavedValue:SOWAMENDMENTREQUEST}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Change in Scope – Subaward Description" page block displayed
    Then I softly see "Change in Scope – Place of Performance" page block displayed
    Then I softly do not see "Change in Scope – Goals and Objectives" page block displayed
    Then I softly do not see "Change in Scope – Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly do not see "Budget Summary" page block displayed
    Then I softly do not see "Budget Summary by Focus Area" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    And I click on row level action button "Edit" against "{SavedValue:SOWAMENDMENTREQUEST}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Change in Scope – Subaward Description" page block displayed
    Then I softly see "Change in Scope – Place of Performance" page block displayed
    Then I softly do not see "Change in Scope – Goals and Objectives" page block displayed
    Then I softly do not see "Change in Scope – Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly do not see "Budget Summary" page block displayed
    Then I softly do not see "Budget Summary by Focus Area" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    And I click on row level action button "Edit" against "{SavedValue:SOWAMENDMENTREQUEST}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Change in Scope – Subaward Description" page block displayed
    Then I softly see "Change in Scope – Place of Performance" page block displayed
    Then I softly do not see "Change in Scope – Goals and Objectives" page block displayed
    Then I softly do not see "Change in Scope – Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly do not see "Budget Summary" page block displayed
    Then I softly do not see "Budget Summary by Focus Area" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    And I click on row level action button "Edit" against "{SavedValue:SOWAMENDMENTREQUEST}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Change in Scope – Subaward Description" page block displayed
    Then I softly see "Change in Scope – Place of Performance" page block displayed
    Then I softly do not see "Change in Scope – Goals and Objectives" page block displayed
    Then I softly do not see "Change in Scope – Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly do not see "Budget Summary" page block displayed
    Then I softly do not see "Budget Summary by Focus Area" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SOWAMENDMENTREQUEST}" in global search with id "Amendment Requests"
    When I click on hyperlink containing value "{SavedValue:SOWAMENDMENTREQUEST}"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Change in Scope – Subaward Description" page block displayed
    Then I softly see "Change in Scope – Place of Performance" page block displayed
    Then I softly do not see "Change in Scope – Goals and Objectives" page block displayed
    Then I softly do not see "Change in Scope – Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly do not see "Budget Summary" page block displayed
    Then I softly do not see "Budget Summary by Focus Area" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"

  @530945 @validateusershouldnotabletoview/editaccessofcreatedSOWARrecordwithdifferentinternalorganization  @GrantorFlexP2
  Scenario: Validate user should not able to view/edit access of  created SOW AR record with different internal  organization
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
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I get the "EGMS ID"
    When I re-login to "Grantor" app as "GRANTEE PO" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    Then I softly do not see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "Amendment Requests"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"

  @530741 @validateusershouldabletoseetheSOWaccesstonewuserafterownershipreassignment @GrantorFlexP2
  Scenario: Validate user should able to see the SOW access to new user after ownership reassignment
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
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:SOWAMENDMENTREQUEST}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Change in Scope – Subaward Description" page block displayed
    Then I softly see "Change in Scope – Place of Performance" page block displayed
    Then I softly see "Change in Scope – Goals and Objectives" page block displayed
    Then I softly see "Change in Scope – Key Performance Indicators (KPIs)" page block displayed
    When I click on top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    And I pause execution for "5" seconds
    And I enter values into fields
      | Value                                    | Field        |
      | Automation Permanent KPI for Regression2 | MasterKPI__c |
      | 10                                       | Target__c    |
    And I click modal button "Save"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---amendment:-:AmendmentAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    And I pause execution for "3" seconds
    And I click modal button "Close"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentAddNotesTableId---" by clicking "New" :
      | Title            | Description      |
      | Automation Notes | Automation Notes |
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation PM1" for title "New Value" inside field history table
    Then I softly see value "Automation PM" for title "Original Value" inside field history table
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:SOWAMENDMENTREQUEST}"
    And I click on row level action button "Edit" against "{SavedValue:SOWAMENDMENTREQUEST}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Change in Scope – Subaward Description" page block displayed
    Then I softly see "Change in Scope – Place of Performance" page block displayed
    Then I softly see "Change in Scope – Goals and Objectives" page block displayed
    Then I softly see "Change in Scope – Key Performance Indicators (KPIs)" page block displayed
    Then I softly do not see top right button "Associate" inside flex table "---amendment:-:keyOutcomesTableId---"
    Then I softly see "System Information" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"

  @530769 @530742 @validateusershouldabletoseetheSOWaccesstonewuseraftertaskreassignment
  Scenario: Validate user should able to see the SOW access to new user after task reassignment | Validate user should able to see correct doller value should be see  after new award is activated
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
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I get the "EGMS ID"
    When I click on top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---amendment:-:objectivesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly do not see value "Automation Permanent Strategic Plan" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    And I pause execution for "5" seconds
    And I enter values into fields
      | Value                                    | Field        |
      | Automation Permanent KPI for Regression2 | MasterKPI__c |
      | 10                                       | Target__c    |
    And I click modal button "Save"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:keyOutcomesTableId---"
    Then I see value "Automation Permanent KPI for Regression2" for title "Title" inside table "---amendment:-:keyOutcomesTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 2            |
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---amendment:-:AmendmentAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    And I pause execution for "3" seconds
    And I click modal button "Close"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentAddNotesTableId---" by clicking "New" :
      | Title            | Description      |
      | Automation Notes | Automation Notes |
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    And I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Change in Scope – Subaward Description" page block displayed
    Then I softly see "Change in Scope – Place of Performance" page block displayed
    Then I softly see "Change in Scope – Goals and Objectives" page block displayed
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---amendment:-:SubrecipientgoalsAndObjectivesTableId---"
    Then I softly see "Change in Scope – Key Performance Indicators (KPIs)" page block displayed
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:RecipientKPITableId---"
    Then I see value "Automation Permanent KPI for Regression2" for title "Title" inside table "---amendment:-:RecipientKPITableId---"
    Then I softly see "System Information" page block displayed
    Then I softly do not see "Budget Summary" page block displayed
    Then I softly do not see "Budget Summary by Focus Area" page block displayed
    When I navigate to "Files" sub tab
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:RecipientAttachmentTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:SubrecipientAmendmentNotesTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:SOWAMENDMENTREQUEST}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "40" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Change in Scope – Subaward Description" page block displayed
    Then I softly see "Change in Scope – Place of Performance" page block displayed
    Then I softly see "Change in Scope – Goals and Objectives" page block displayed
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    Then I softly see "Change in Scope – Key Performance Indicators (KPIs)" page block displayed
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:keyOutcomesTableId---"
    Then I see value "Automation Permanent KPI for Regression2" for title "Title" inside table "---amendment:-:keyOutcomesTableId---"
    Then I softly see "System Information" page block displayed
    Then I softly do not see "Budget Summary" page block displayed
    Then I softly do not see "Budget Summary by Focus Area" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BPCId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I navigate to "Overview" sub tab
    Then I softly see "Overview" page block displayed
    Then I softly see "Change in Scope – Subaward Description" page block displayed
    Then I softly see "Change in Scope – Place of Performance" page block displayed
    Then I softly see "Change in Scope – Goals and Objectives" page block displayed
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    Then I softly see "Change in Scope – Key Performance Indicators (KPIs)" page block displayed
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---amendment:-:keyOutcomesTableId---"
    Then I see value "Automation Permanent KPI for Regression2" for title "Title" inside table "---amendment:-:keyOutcomesTableId---"
    Then I softly see "System Information" page block displayed
    Then I softly do not see "Budget Summary" page block displayed
    Then I softly do not see "Budget Summary by Focus Area" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    Then I softly see value "{SavedValue:PO Username}" for title "Title" inside table "---amendment:-:approversTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---amendment:-:amendmentAddFilesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I softly see value "Automation Notes" for title "Title" inside table "---amendment:-:amendmentAddNotesTableId---"
    And I navigate to "Overview" sub tab
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I softly see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    #530769
    And I click on "Amend Subaward" in the page details
    And I pause execution for "5" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId1"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I navigate to "Performance" sub tab
    Then I see value "Automation Permanent Objective2" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I see value "Automation Permanent KPI" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    Then I see value "Automation Permanent KPI for Regression2" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
