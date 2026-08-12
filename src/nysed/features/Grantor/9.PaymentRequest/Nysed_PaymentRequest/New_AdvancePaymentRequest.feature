@paymentRequestNysed @advancePaymentRequestFromDirectAward
Feature: Validate all scenarios in Payment Request from direct award with Hold Payment Yes

  @NYSED-7356 @NYSEDSprint-32 @US-NYSED-6293 @M05 @YugaC
    @NYSED-5099 @NYSEDSprint-29 @US-NYSED-4903 @M05
  Scenario Outline:Verifies that the Internal User can see that the Funding Account column is renamed to Funding Account EGMS ID and Payment Funding Account column is renamed to Payment Funding Account EGMS ID on the Advance Payment Request layout → Financials tab.
  |Verify that the FD user cannot see the new field ‘Line No,’ after the Fund Year column at the Document Details modal->Transactions Table, when the Contractual? flag is set to ‘No' on the related Grant.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-7356
    Then I see only the following headers in table with id "---paymentRequest:-:fundingAccountsAdvTableId---" :
      | Actions | Funding Account EGMS ID | Funding Account Message | Fund Year | Outstanding Encumbrance | Payment Split | Revised Payment Split | Withheld Amount |
    And I click on "View" icon for "Created" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---paymentRequest:-:TransactionsTableId---" :
      | Actions | Payment Funding Account EGMS ID | Funding Account Name | Fund Year | Blanket Voucher Cut% | Payment Split | Revised Payment Split | Withheld Amount |
    #NYSED-5099
    Then I softly do not see column header "Line No." inside table "---paymentRequest:-:TransactionsTableId---"

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-9118 @NYSED-Sprint-33 @US-NYSED-2896 @M06
    @NYSED-9131 @NYSED-Sprint-33 @US-NYSED-2895 @M06
  Scenario Outline: Verify that External user (All Profile) sees Column Sequence in Payment Requests Section of Related Log tab on Organization Profile
  |Verify that Internal user (All Profile) sees Column Sequence in Payment Requests Section of Related Log tab on Organization Profile|
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Home" tab
    And I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "2" seconds
    And I navigate to "Related Log" sub tab
    #NYSED-9118
    Then I see only the following headers in table with id "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" :
      | Actions | EGMS ID | Type | Subaward ID | Project ID | Reporting Period | Payment Request Amount | Status |
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    And I click toggle button to select "Subrecipients Organization - All"
    And I perform quick search for "{AUTOEnvData:SubrecipientOrg}" in "---home:-:subrecipientActiveAccountId---" panel
    And I click on "View" icon for "{AUTOEnvData:SubrecipientOrg}" inside flex table with id "---home:-:subrecipientActiveAccountId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Related Log" sub tab
    #NYSED-9131
    Then I see only the following headers in table with id "---paymentRequest:-:PaymentRequestsTableId---" :
      | Actions | EGMS ID | Type | Subaward ID | Project ID | Reporting Period | Payment Request Amount | Status |

    Examples:
      | ExternalUser | InternalUser |
      | GRANTEE_SC   | FD           |
#      | GRANTEE_LEA  | PO           |
#      | GRANTEE_VO   | PM           |

  @NYSED-9175 @US-NYSED-2982 @NYSED-Sprint-33 @M05
  Scenario Outline: Verify that the Internal user can see that on the Monitoring Phase -> Payments module -> Advances left menu, List filter columns are updated.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" :
      | Actions | EGMS ID | Subaward ID | Project ID | Institution ID | SED Code | Organization Name | Reporting Period | Payment Request Amount | Status |

    Examples:
      | UserType |
      | FD       |
#      | PO       |
#      | PM       |
#      | PO       |

  @NYSED-9178 @US-NYSED-2982 @NYSED-Sprint-33 @M05
  Scenario Outline:Verify that the FD profile users can see View, Edit, and Delete actions for the advanced requests in the Created status.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AdvReq_EGMSID"
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - Created"
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:AdvReq_EGMSID}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:AdvReq_EGMSID}" in flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:AdvReq_EGMSID}" in flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:AdvReq_EGMSID}" in flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---"
    And I click on "Edit" icon for "{SavedValue:AdvReq_EGMSID}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---"
    And I wait for "2" seconds
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - Created"
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:AdvReq_EGMSID}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    And I click on "Delete" icon for "{SavedValue:AdvReq_EGMSID}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---"
    And I wait for "2" seconds
    Then I softly see "No records found" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---"

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-9180 @US-NYSED-2982 @NYSED-Sprint-33 @M05
  Scenario Outline:Verify that the FD profile users can see View, Edit, and Delete actions for the advanced requests in the Created status.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AdvReq_EGMSID"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - Created"
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:AdvReq_EGMSID}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:AdvReq_EGMSID}" in flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AdvReq_EGMSID}" in flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:AdvReq_EGMSID}" in flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---"

    Examples:
      | InternalUser |
      | PM           |
#      | FO           |
#      | PO           |

  @NYSED-5096 @NYSED-5097 @NYSEDSprint-29 @US-NYSED-4903 @M05
  Scenario Outline:Verify that the FD user sees that at the Document Details modal->Transactions Table, a new field ‘Line No.’ is added after the Fund Year column, and the column is displayed only when the Contractual? flag is set to ‘Yes' on the related Grant.
  |Verify that the FD user sees that ‘Line No.’ is a required text field allowing only 3 digits as input on the Transactions Table.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "CONTRACTUAL_YES"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    #NYSED-5096
    Then I see only the following headers in table with id "---paymentRequest:-:TransactionsTableId---" :
      | Actions | Payment Funding Account EGMS ID | Funding Account Name | Fund Year | Line No. | Blanket Voucher Cut% | Payment Split | Revised Payment Split | Withheld Amount |
    #NYSED-5097
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Line No. | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} |          | 126           |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Line No. | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | AB2      | 126           |
    Then I softly see the following messages in the page details contains:
      | Line No. can consist only 3 digits. |
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Line No. | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 32       | 126           |
    Then I softly see the following messages in the page details contains:
      | Line No. can consist only 3 digits. |
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Line No. | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 1234     | 126           |
    Then I softly see value "123" for title "Line No." against the value "$126" inside table "---paymentRequest:-:DocumentHistoryTableId---"

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-4025 @NYSED-4026 @NYSED-4027 @NYSED-4028 @NYSED-4029 @NYSED-4031 @NYSEDSprint-28 @US-NYSED-3915 @M05
  Scenario Outline: Verify that the FD user can see that a new section, ‘Document History’ is added at Advance Payment Request->Financials Tab after Funding Account Information Section.
  |Verify that the FD user can see that a ‘New Document’ button is added at Document History section, and on clicking it, the ‘Document Details’ modal opens with the following details.|
  |Verify that the FD user can see that, a detail modal opens with the following details when select ‘Type’ and click on ‘Save’ button on the ‘Document Details’ modal.|
  |Verify that the FD user can see the Transactions Table with the following details when clicking on the New button on the ‘Document Details’ modal.|
  |Verify that the FD user can see the Document inline action buttons in the Document History section when the document is in the created state.|
  |Verify that the FD user can see the document details fields and the following details in the Document History section when the document is in the created state.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    #NYSED-4025 #NYSED-4031
    Then I softly see "Document History" page block displayed
    Then I see only the following headers in table with id "---paymentRequest:-:DocumentHistoryTableId---" :
      | Actions | EGMS ID | Document Number | Type | Status | Payment Split | Revised Payment Split | Withheld Amount | Release Date |
    #NYSED-4026
    Then I softly see top right button "New Document" inside flex table "---paymentRequest:-:DocumentHistoryTableId---"
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    And I wait for "2" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly see "Document Information" page block displayed
    Then I softly see field "Type" inside page block
    Then I see only the following options in dropdown field "Type__c" :
      | --None-- | Voucher | Refund |
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To save, Type is required. |
    And I click modal button "Close"
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    When I enter in modal value "Refund" into field "Type__c"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Refund Documents cannot be created for Advance Requests. |
    And I click modal button "Close"
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    #NYSED-4027
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see field on modal "EGMS ID" inside page block
    Then I softly see field on modal "Type" inside page block
    Then I softly see field on modal "Total Advance" inside page block
    Then I softly see field on modal "Status" inside page block
    Then I softly see field on modal "Document Number" inside page block
    Then I softly see field on modal "Release Date" inside page block
    Then I softly see top right button "New" inside flex table "---paymentRequest:-:TransactionsTableId---"
    #NYSED-4028
    Then I see only the following headers in table with id "---paymentRequest:-:TransactionsTableId---" :
      | Actions | Payment Funding Account EGMS ID | Funding Account Name | Fund Year | Blanket Voucher Cut% | Payment Split | Revised Payment Split | Withheld Amount |
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 10            |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:DocumentHistoryTableId---" :
      | Type    | Status  | Payment Split | Revised Payment Split | Withheld Amount | Release Date |
      | Voucher | Created | $10           | $9                    | $1              |              |
    #NYSED-4029
    Then I softly can see row level action button "View" against "Created" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly can see row level action button "Generate Document" against "Created" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    And I click on "Delete" icon for "Created" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---"

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-4030 @NYSEDSprint-28 @US-NYSED-3915 @M05
  Scenario Outline: Verify that the FD user can see the validation when trying to create a new document while one document is in the created state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 10            |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Cannot create a new document while another document is currently in progress. |

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-4904 @NYSEDSprint-28 @US-NYSED-3918 @M05
    @NYSED-5115 @NYSED-5117 @NYSEDSprint-29 @US-NYSED-3919 @M05
  Scenario Outline: Verify that the internal user can view the 'Generate Document' inline action for the 'Created Advance Payment Request' record in the Document History section.
  |Verify that the FD user see when Advance payment request is in ‘Entered’ state, and Financials tab->Document History section below Inline actions are present 1. View 2. Place on Hold 3. Add/Edit Release Payment|
  |Verify that the FD user sees that the status is updated to 'On Hold' and displays the correct inline actions when a user clicks on the 'Place on Hold' inline action button of the document in the Document History section.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "FS10F_DG_PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 126           |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see field "Status" as "Entered"
    #NYSED-4904 #NYSED-5115
    Then I softly can see row level action button "View" against "Voucher" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly can see row level action button "Place On Hold" against "Voucher" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly can see row level action button "Schedule Document Release" against "Voucher" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    #NYSED-5117
    And I click on "Place On Hold" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    And I wait for "2" seconds
    Then I softly see field "Status" as "On Hold"
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:DocumentHistoryTableId---" :
      | Type    | Status  |
      | Voucher | On Hold |
    Then I softly can see row level action button "View" against "Voucher" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly can see row level action button "Schedule Document Release" against "Voucher" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-5120 @NYSED-6545 @NYSEDSprint-29 @US-NYSED-3919 @M05
  Scenario Outline: Verify that the FD user sees that the Release Payment Details modal opens with correct fields and actions when the user clicks on the Add/Edit Release Payment button.
  |Verify that the FD user can change the Release Date by clicking on the ‘Add/Edit Release Payment' inline action of the document when the Advance payment request is in ‘Ready for Release' state.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "FS10F_DG_PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 126           |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see field "Status" as "Entered"
    #5120
    And I click on "Schedule Document Release" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    And I wait for "2" seconds
    Then I softly see "Release Payment Details" opens in overLay window
    Then I softly can see "Release Payment" sub tab at view detail page
    Then I softly see "Release Details" page block displayed
    Then I softly see field "EGMS ID" inside page block
    Then I softly see field "Release Date" inside page block
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To save, Release Date is required. |
    When I enter in modal value "-5" into field "ReleaseDate__c"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Release Date cannot be in the past. |
    When I enter in modal value "10" into field "ReleaseDate__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Ready for Release"
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:DocumentHistoryTableId---" :
      | Type    | Status            |
      | Voucher | Ready for Release |
    #NYSED-6545
    And I click on "Schedule Document Release" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    And I wait for "2" seconds
    When I enter in modal value "20" into field "ReleaseDate__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:DocumentHistoryTableId---" :
      | Type    | Status            | Release Date          |
      | Voucher | Ready for Release | {Date:M/d/yyyy::d+20} |

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-5912 @NYSEDSprint-31 @US-NYSED-4126 @M05
  Scenario Outline: Verify that FD user sees 'Reporting Month' and 'Reporting Year' fields are added and defaulted correctly on advance payment request -> Overview tab -> General Information section
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "FS10F_DG_PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 126           |
    And I click modal button "Close"
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see field "Reporting Month" inside page block
    Then I softly see field "Reporting Year" inside page block
    And I click on "Edit" in the page details
    Then I softly see fields "NYSED_ReportingMonth__c" is in edit mode
    Then I softly see fields "NYSED_ReportingYear__c" is in edit mode
    And I enter value "08" into field "NYSED_ReportingYear__c"
    And I enter value "2032" into field "NYSED_ReportingYear__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Reporting Month" as "08" in "General Information" pageblock
    Then I softly see field "Reporting Year" as "2032" in "General Information" pageblock
    Then I softly see field "Reporting Period" as "08/2032" in "General Information" pageblock

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-5913 @NYSEDSprint-31 @US-NYSED-4126 @M05
  Scenario Outline: Verify that FD user sees 'Edit' button is visible in 'Created', 'Entered', and 'Ready to Release' statuses on advance payment request -> Overview tab.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "FS10F_DG_PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 126           |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    Then I softly see fields "Title__c" is in edit mode
    Then I softly see fields "NYSED_MIRDate__c" is in edit mode
    And I enter value "08" into field "NYSED_ReportingYear__c"
    And I enter value "2032" into field "NYSED_ReportingYear__c"
    And I enter value "10" into field "NYSED_MIRDate__c"
    And I click on "Save" in the page details
    Then I softly see field "MIR Date" as "{Date:M/d/yyyy::d+10}" in "General Information" pageblock
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see field "Status" as "Entered"
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    Then I softly see field "Title__c" is not editable
    Then I softly see fields "NYSED_MIRDate__c" is in edit mode
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I click on "Schedule Document Release" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    And I wait for "2" seconds
    When I enter in modal value "10" into field "ReleaseDate__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Ready for Release"
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    Then I softly see field "Title__c" is not editable
    Then I softly see fields "NYSED_MIRDate__c" is in edit mode

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-5915 @NYSED-5916 @NYSED-5917 @NYSED-5918 @NYSEDSprint-31 @US-NYSED-4126 @M05
  Scenario Outline:Verify that the FD user sees the updated field name on the Advance Payment Request at the Financials tab -> Funding Account Information Section.
  |Verify that FD user sees 'Approval History' section is removed on advance payment request -> History tab.|
  |Verify that FD user sees a snapshot is taken when the advance payment request is updated in 'Entered' status|
  |Verify that the FD user sees a status bar on the advance payment request and shows modified statuses.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "FS10F_DG_PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 126           |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-5915
    Then I see only the following headers in table with id "---paymentRequest:-:fundingAccountsAdvTableId---" :
      | Actions | Funding Account EGMS ID | Funding Account Message | Fund Year | Outstanding Encumbrance | Payment Split | Revised Payment Split | Withheld Amount |
    #NYSED-5916
    And I navigate to "History" sub tab
    Then I softly cannot see "Approval History" sub tab at view detail page
    #NYSED-5917
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:SnapshotHistoryTableId---"
    #NYSED-5918
    Then I softly see Step Progress bar showing status
      | Created           |
      | Entered           |
      | Ready for Release |
    And I click on "Next Step" icon in the step progress bar
    And I click on "Next Step" icon in the step progress bar
    Then I softly see Step Progress bar showing status
      | Released  |
      | Processed |
    And I navigate to "Financials" sub tab
    And I wait for "3" seconds
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see field "Status" as "Entered"
    And I navigate to "History" sub tab
    And I wait for "2" seconds
    #NYSED-5917
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:SnapshotHistoryTableId---" :
      | Created By    |
      | Automation FD |

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-7377 @NYSEDSprint-31 @US-NYSED-4126 @M05
  Scenario Outline:Verify that the FD user sees a validation message if the total of the payment split amount for all funding accounts is not equal to the total advance amount, and the FD user clicks "generate document" when the advance request is in the ‘Created’ state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "FS10F_DG_PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 10            |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see the following messages in the page details contains:
      | The total of Document splits (10.0) must match the Total Advance (126) |

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-5914 @NYSEDSprint-31 @US-NYSED-4126 @M05
  Scenario Outline: Verify that FD user sees the ' Paid ' field in the advance payment request is updated correctly in the Advance summary section, and it is the rollup of the 'Revised Payment Split’ column from the Funding Account Information Section, and it is non-editable
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "FS10F_DG_PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 126           |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see field "Status" as "Entered"
    And I click on "Schedule Document Release" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    And I wait for "2" seconds
    When I enter in modal value "10" into field "ReleaseDate__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Ready for Release"
    And I click on "Release Voucher" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see that "RevisedSplit_NYSED__c" rendered in view mode only
    Then I softly see field "Paid" as "$126" in "expandedAdvance Summary" pageblock

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-7860 @NYSED-7861 @NYSED-Sprint-19 @US-NYSED-2730 @M05
  Scenario Outline: Verify that the FD user can see Child Organization field with following information on the Advance Payment Request layout -> Overview tab -> General Information section.: Award via FDM
  |Verify that the FD user can see Creating for field with following information on the Advance Payment Request layout -> Overview tab -> General Information section.: Award via FDM|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<Announcement Name>"
    And I created approved FDM on application "<Announcement Name>"
    Given I created award from approved FDM with announcement "<Announcement Name>"
    And I activate award from FDM having application name "<Announcement Name>"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "4" seconds
    And I switch to tab number "1"
    And I wait for "5" seconds
    When I navigate to "Overview" sub tab
    #NYSED-7860
    Then I softly see field "Child Organization" added after "Creating for"
    #NYSED-7861
    Then I softly see field "Creating for" as "On behalf of"
    Then I softly see field "Creating for" added after "Remittance address"
    Then I softly see field "Creating for" is not editable

    Examples:
      | Announcement Name                         | InternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | FD           |

  @NYSED-7863 @NYSED-7865 @NYSED-7867 @NYSED-7870 @NYSED-7872 @NYSED-7875 @NYSED-7877 @NYSED-7879 @NYSED-7880 @NYSED-7883 @NYSED-7885 @NYSED-7887
    @NYSED-7891 @NYSED-7892 @NYSED-Sprint-19 @US-NYSED-2730 @M05 @Bug-NYSED-8298
  Scenario Outline:Verify that the FD user can see following fields are added on the Advance Payment Request layout -> Overview tab -> General Information section.: Direct Grant
  |Verify that the FD user can see 'MIR Date' date field is added after the Reporting Period field on the Advance Payment Request layout -> Overview tab -> General Information section.: Direct Grant|
  |Verify that the FD user can see page-level Edit button when advance payment request is in 'Created' or 'Entered' state.: Direct Grant|
  |Verify that the Internal user can see all currency fields on Advance Payment Request layout are converted to accept whole numbers only.: Direct Grant|
  |Verify that the Internal user can see below fields on the Advance Payment Request layout -> Financials Tab->Advance summary section, in sequence.: Direct Grant|
  |Verify that the Internal user can see on the Advance Payment Request layout -> Financials tab -> Funding Account Information section -> new column 'Funding Account Message' is added after Funding Account column.: Direct Grant|
  |Verify that the Internal user can see on the Advance Payment Request layout -> Financials tab -> Funding Account Information section -> rename Encumbrance Balance to Outstanding Encumbrance Balance.: Direct Grant|
  |Verify that the Internal user can see on the Advance Payment Request layout -> Financials tab following sections are hidden.: Direct Grant|
  |Verify that the Internal user can see on the Advance Payment Request layout -> Financials Tab->Funding Account Information, below fields are hidden.: Direct Grant|
  |Verify that the Internal user can see on the Advance Payment Request layout -> Overview tab -> Payment Details section is hidden.: Direct Grant|
  |Verify that the Internal user can see Responsibilities, and Forms and files tabs are hidden at Advance Payment Request layout.: Direct Grant|
  |Verify that the Internal user can see that on the Advance Payment Request layout -> Messages tab ->'Related Messages' section below changes have been made.: Direct Grant|
  |Verify that the Internal user cannot see following fields as they are hidden on the Advance Payment Request layout -> Overview tab -> General Information section.: Direct Grant|
  |Verify that the Internal user cannot see following fields on the Advance Payment Request layout -> Overview tab -> General Information section.: Direct Grant|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    #NYSED-7883
    Then I softly do not see "Payment Details" page block displayed
    #NYSED-7863
    Then I softly see field "Not For Profit" is not editable
    Then I softly see field "Project ID" is not editable
    Then I softly see field "Reporting Period" is not editable
    #NYSED-7865
    Then I softly see field "MIR Date" inside "General Information" section
    Then I softly see fields "NYSED_MIRDate__c" is in edit mode
    #NYSED-7891
    Then I softly do not see field "Is Final Payment Request?" inside "General Information" section
    Then I softly do not see field "Payment period start date" inside "General Information" section
    Then I softly do not see field "Payment period End date" inside "General Information" section
    Then I softly do not see field "Due date" inside "General Information" section
    Then I softly do not see field "Submission date field" inside "General Information" section
    #NYSED-7892
    Then I softly do not see field "Creating For" inside "General Information" section
    Then I softly do not see field "Child Organization" inside "General Information" section
    And I click on "Save" in the page details
    #NYSED-7867
    Then I softly can see top right button "Edit" in page detail
    #NYSED-7885
    Then I softly cannot see "Responsibilities" sub tab at view detail page
    Then I softly cannot see "Forms and Files" sub tab at view detail page
    And I navigate to "Financials" sub tab
    And I wait for "2" seconds
    #NYSED-7879
    Then I softly do not see "Payment Request Advance" page block displayed
    Then I softly do not see "Program Income Tracking" page block displayed
    Then I softly do not see "Acknowledgement" page block displayed
    #NYSED-7870
    Then I softly see field "Total Advance" as "$0" in "Advance Summary" pageblock
    Then I softly see field "Paid" as "$0" in "Advance Summary" pageblock
    #NYSED-7872
    Then I softly see field "Current Obligation" inside "Advance Summary" section
    Then I softly see field "Total Advance" inside "Advance Summary" section
    #NYSED-7875 #NYSED-7877
    Then I see only the following headers in table with id "---paymentRequest:-:fundingAccountsAdvTableId---" :
      | Actions | Funding Account EGMS ID | Funding Account Message | Fund Year | Outstanding Encumbrance | Payment Split | Revised Payment Split | Withheld Amount |
    Then I softly cannot see row level action button "Edit" against "{SavedValue:NewFundingAccountAbleToPayYes}" in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---"
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:NewFundingAccountAbleToPayYes}" in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---"
    #NYSED-7880
    Then I softly do not see column header "Advance Balance" inside table "---paymentRequest:-:fundingAccountsAdvTableId---"
    Then I softly do not see column header "Advance Request Balance" inside table "---paymentRequest:-:fundingAccountsAdvTableId---"
    Then I softly do not see column header "Advance Requested This Action" inside table "---paymentRequest:-:fundingAccountsAdvTableId---"
    And I navigate to "Messages" sub tab
    And I wait for "3" seconds
    #NYSED-7887 #opebug-NYSED-8298
    Then I softly see "Related Messages" page block displayed
    Then I softly see field "Subrecipient Organization Message" inside "Related Messages" section
    Then I softly see field "Announcement Message" inside "Related Messages" section
    Then I softly see field "Subaward Message" inside "Related Messages" section
    Then I softly see that "Subrecipient Organization Message" rendered in view mode only
    Then I softly see that "Announcement Message" rendered in view mode only
    Then I softly see that "Subaward Message" rendered in view mode only

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-7894 @NYSED-7896 @NYSED-7898 @NYSED-7902 @NYSED-7906 @NYSED-7910 @NYSED-7916 @NYSED-Sprint-19 @US-NYSED-2592 @M05
  Scenario Outline: Verify that the FD user can see a page level action 'Release Initial Payment' button is added in the drop-down menu, when the award is in 'Activated' state.: Direct Grant
  |Verify that the FD user can see an Advance Payment Request is generated in Created state when clicked on 'Release Initial Payment' button.: Direct Grant|
  |Verify that the FD user can see inline action Edit is available on the Award layout -> Actuals tab -> Payment Requests section, when an Advance Payment Request is in Created state.: Direct Grant|
  |Verify that the FD user can see Total Advance field should reflect the amount as per the First Payment % from the announcement on the budgeted amount on the Advance Payment Request layout->Financials tab ->Advance Summary section.: Direct Grant|
  |Verify that the FD user cannot see a page level action 'Release Initial Payment' button once the advance request is created: Direct Grant|
  |Verify that the Grantee user cannot see the Advance Payment Request until it is processed.: Direct Grant|
  |Verify that the Internal user other than the FD user cannot see inline action Edit is available, only View is available on the Award layout -> Actuals tab -> Payment Requests section, when an Advance Payment Request is in Created state.: Direc...|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-7894
    Then I softly can see top right dropdown button "Release Initial Payment" in page detail
    When I click on "Release Initial Payment" in the page details
    When I navigate to "Actuals" sub tab
    #NYSED-7896
    Then I softly see value "Created" for title "Status" against the value "Advance" inside table "---paymentRequest:-:grantorPaymentRequestTableId---"
    #NYSED-7898
    Then I softly can see row level action button "Edit" against "Advance" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    Then I softly can see row level action button "View" against "Advance" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    Then I softly can see row level action button "Delete" against "Advance" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    And I switch to tab number "1"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see field "Status" as "Created"
    When I enter value "10" into field "NYSED_MIRDate__c"
    When I click on "Save" in the page details
    Then I softly see field "MIR Date" as "{Date:M/d/yyyy::d+10}"
    #NYSED-7902
    When I navigate to "Financials" sub tab
    Then I softly see field "Total Advance" as "$126"
    #NYSED-7906
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see top right dropdown button "Release Initial Payment" in page detail
    #NYSED-7910
    When I re-login to "Grants Portal" app as "<Grantee>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I wait for "2" seconds
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-7916
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Actuals" sub tab
    Then I softly can see row level action button "View" against "Advance" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    Then I softly cannot see row level action button "Edit" against "Advance" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    Then I softly cannot see row level action button "Delete" against "Advance" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    And I click on "View" icon for "Advance" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | InternalUser | Grantee    |
      | FD           | GRANTEE_SC |

  @NYSED-7904 @NYSED-Sprint-19 @US-NYSED-2592 @M05
  Scenario Outline:Verify that the FD user cannot see a page level action 'Release Initial Payment' button is added in the drop-down menu, when the award is in other than 'Activated' state.: Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-7904
    Then I softly cannot see top right dropdown button "Release Initial Payment" in page detail

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-7908 @NYSED-Sprint-19 @US-NYSED-2592 @M05
  Scenario Outline:Verify that the FD user cannot see a page level action 'Release Initial Payment' button, if 'Advance Payment Allowed?' is set to 'No' at related announcement when the award is in 'Activated' state.: Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see top right dropdown button "Release Initial Payment" in page detail

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-7914 @NYSED-Sprint-19 @US-NYSED-2592 @M05
  Scenario Outline: Verify that the Internal user other than the FD user cannot see a page level action 'Release Initial Payment' button is added in the drop-down menu, when the award is in 'Activated' state.: Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see top right dropdown button "Release Initial Payment" in page detail

    Examples:
      | InternalUser |
      | PM           |

  @NYSED-7900 @NYSED-Sprint-19 @US-NYSED-2592 @M05
  Scenario Outline: Verify that the FD user can see the validation when click on the 'Release Initial Payment' button for the award whose 'Not For Profit' is set to No for an organization.: Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT_NOT_FOR_PROFIT_NO"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "NOT_FOR_PROFIT_NO"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Release Initial Payment" in the page details
    Then I softly see the following messages in the page details contains:
      | Actuals Tab - Advance cannot be given to the 'For Profit' organization. |

    Examples:
      | InternalUser |
      | FD           |
