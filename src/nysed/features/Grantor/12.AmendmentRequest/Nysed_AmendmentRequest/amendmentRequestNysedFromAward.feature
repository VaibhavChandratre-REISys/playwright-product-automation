@amendmentRequestsNysed
Feature: Validate all scenarios in the Amendment Request from Direct Grant

  @491249-DG @VerifythattheInternalUserdoesnotseetheLeverageAllowedcolumnintheAmendmentBudgetCategoriestable @Sprint-01 @US-487975
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" column in the Amendment 'Budget Categories' table.
    Given I activated standalone subaward "Automation Runtime FDM Announcement" with properties "default-<User>" of type "Competitive"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendID"
    And I wait for "2" seconds
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I wait for "2" seconds
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:AmendID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:AmendID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Given I navigate to "Overview" sub tab
    Then I softly do not see "Other Leverage" in flex table header "---amendment:-:grantorBudgetChangeTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |
#      | ADMIN    | Automation ADMIN user |

  @491251-DG @VerifythattheSubrecipientUserdoesnotseetheLeverageAllowedcolumnintheAmendmentBudgetCategoriestable @Sprint-01 @US-487975
  Scenario Outline: Verify that the Subrecipient User does not see the "Leverage Allowed?" column in the Amendment 'Budget Categories' table.
    Given I activated standalone subaward "Automation Runtime FDM Announcement" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I wait for "2" seconds
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AmendID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    When I click on "View" icon for "{SavedValue:AmendID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    Given I navigate to "Overview" sub tab
    Then I softly do not see "Other Leverage" in flex table header "---amendment:-:budgetChangeTableId---"

    Examples:
      | UserType |
      | SPI1     |
#      | SPA      |

  @493114-DG @493115-DG @493130-DG @@493132-DG @493133-DG @VerifythattheInternaluserseeonlyEditactionbuttonattheAmendmentRequestpagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownCreatedAmendmentInitiatedbyInternalUser @Sprint-01 @US-390341
  Scenario Outline: Verify that the Internal user see only 'Edit' action button at the Amendment Request page layout and other record flow action buttons at page level action dropdown.- Created Amendment, Initiated by Internal User
    Given I activated standalone subaward "Automation Runtime FDM Announcement" with properties "default-<User>" of type "Competitive"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "AllAmendment_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "AllAmendment_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Delete" in page detail
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I save the field labeled "EGMS ID" as "AmendID"
    And I get the "EGMS ID"
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value                                | Field                      |
      | 2000                                 | RevisedCommitment__c       |
      | 1000                                 | RequestedChangeInBudget__c |
      | {SavedValue:updatedBudgetPeriodDate} | NewBudgetPeriodEndDate__c  |
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    Given I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | <Approver> | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    Then I softly cannot see top right dropdown button "Delete" in page detail
    Then I softly cannot see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    #@493115
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Acknowledge" in page detail
    Then I softly can see top right dropdown button "Submit to Grantor" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Equipment       | 1000                 | 100        | 0              |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
    #@493130
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I softly cannot see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I "Approve" in the approval decision
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Approved"
    #@493132
    Then I can see top right button "Undo" in page detail
    Then I softly can see top right dropdown button "Amend Subaward" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Amend Subaward" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I pause execution for "5" seconds
    Then I softly can see top right dropdown button "Activate" in page detail
    Then I softly can see top right dropdown button "Delete" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Activated" and is "dark blue"
    #@493133
    Then I softly can see top right dropdown button "View NOGA" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | UserType | User               | Approver      |
      | PM       | Automation PM user | Automation PM |
#      | EXE      | Automation EXE user   | Automation EXE|
#      | PO       | Automation PO user    | Automation PO |

  @493256-DG @493241-DG @493262-DG @493285-DG @VerifythattheInternaluserseeonlyEditactionbuttonattheAmendmentRequestpagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownSubmittedtoGrantorAmendmentInitiatedbyExternalUser  @Sprint-01 @US-390341
  Scenario Outline: Verify that the Internal user see only 'Edit' action button at the Amendment Request page layout and other record flow action buttons at page level action dropdown.- Submitted to Grantor Amendment, Initiated by External User
    And I activated standalone subaward "Automation Runtime Award" with properties "default-<User>" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    #@493241
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Delete" in page detail
    Then I softly can see top right dropdown button "Submit to Grantor" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | <Approver> | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I "Approve" in the approval decision
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Approved"
    #@493262
    Then I can see top right button "Undo" in page detail
    Then I softly can see top right dropdown button "Amend Subaward" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Amend Subaward" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I pause execution for "3" seconds
    Then I softly can see top right dropdown button "Activate" in page detail
    Then I softly can see top right dropdown button "Delete" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Activated" and is "dark blue"
    #@493285
    Then I softly can see top right dropdown button "View NOGA" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | UserType | User               | Approver      |
      | PM       | Automation PM user | Automation PM |
#      | EXE      | Automation EXE user   | Automation EXE|
#      | PO       | Automation PO user    | Automation PO |

  @493500 @Sprint-02 @US-491301
  Scenario Outline: Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: Announcement Name" in the Budget Categories table of the Amendment Request req when the Announcements is created with the Focus Area Required? is marked as "No"
    Given I activated standalone subaward "Automation Runtime Announcement" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---amendment:-:budgetChangeTableId---"

    Examples:
      | UserType |
      | SPI1     |
#      | SPA      |

  @493533 @Sprint-02 @US-491301
  Scenario Outline: Verify that the Internal user sees the Focus area name in the format "Focus Area: <Focus Area Name>" in the Budget Categories table of the Amendment Request req when the Announcements is created with the Focus Area Required? is marked as "Yes"
    Given I activated standalone subaward "Automation Runtime Announcement" with properties "default-<User>" of type "Competitive"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    When I navigate to "Overview" sub tab
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---amendment:-:grantorBudgetChangeTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |

  @493532 @Sprint-02 @US-491301
  Scenario Outline: Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: Announcement Name" in the Budget Categories table of the Amendment Request req when the Announcements is created with the Focus Area Required? is marked as "No"
    Given I activated standalone subaward "Automation Runtime Announcement" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---amendment:-:budgetChangeTableId---"

    Examples:
      | UserType |
      | SPI1     |
      | SPA      |

  @493502 @Sprint-02 @US-491301
  Scenario Outline: Verify that the Internal user sees the Focus area name in the format "Focus Area: <Focus Area Name>" in the Budget Categories table of the Amendment Request req when the Announcements is created with the Focus Area Required? is marked as "Yes"
    Given I activated standalone subaward "Automation Runtime Announcement" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-<User>" of type "Competitive"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    When I navigate to "Overview" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---amendment:-:grantorBudgetChangeTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |