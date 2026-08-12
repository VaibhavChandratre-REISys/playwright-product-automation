@paymentRequestNysed @advancePaymentRequestFromDirectAward
Feature: Validate all scenarios in Payment Request from direct award with Hold Payment Yes

  @NYSED-5137 @US-NYSED-3403 @M05 @santosh @AbleToPay @ExecutionRemaningPR @DueToBugReportedByManualQA
  Scenario Outline: Verify that the FD user sees a validation message when clicking the ‘New Document’ button in the Document History section while the Payment Request is in ‘Created’ status and an Organization Stop is applied.
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
    When I enter in modal value "Yes" into field "Hold_Payments__c"
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
    And I navigate to "Financials" sub tab
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    #NYSED-5137
    Then I softly see the following messages in the page details contains:
      | New document cannot be created because Hold Payments is currently applied on Subrecipient. |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    When I click on "Manage Dates" in the page details
    And I enter value "150" into field "NYSED_ProjectStop__c"
    And I click modal button "Save"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    #NYSED-5151
    Then I softly see the following messages in the page details contains:
      | New document cannot be created because Hold Payments is currently applied on Subrecipient Organization. |
      | New document cannot be created because Project Stop is currently applied on Subaward.                   |

    Examples:
      | Announcement Name                                         | Coordinator | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | FD           |

  @NYSED-5151 @US-NYSED-3403 @M05 @santosh @AbleToPay
  Scenario Outline:Verify that the FD user sees a validation message when clicking the ‘New Document’ button in the Document History section while the Payment Request is in ‘Created’ status and multiple stops are applied.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "PROJECTSTOP_PRESENT"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "Yes" into field "Hold_Payments__c"
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
    And I navigate to "Financials" sub tab
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    #NYSED-5151
    Then I softly see the following messages in the page details contains:
      | New document cannot be created because Hold Payments is currently applied on Subrecipient Organization. |
      | New document cannot be created because Project Stop is currently applied on Subaward.                   |

    Examples:
      | Announcement Name                                         | Coordinator | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | FD           |

  @NYSED-8167 @NYSED-8166 @NYSED-8159 @NYSED-8150 @NYSED-8112 @NYSED-8165 @NYSED-8163 @NYSED-Sprint-32 @US-NYSED-6250 @M05 @Bug-Ticket-8014
    @NYSED-8057 @NYSED-7592 @NYSED-Sprint-31 @US-NYSED-6253 @M06
  Scenario Outline:Verify that Internal FD user sees Expenditure Paid to Date Amount on 'Related Subawards' Section of 'Funding Accounts' is reduced by amount previously added from Award → Actuals Tab -> Funding Account Information → Revised Payment Split Field for Advance
  |Verify that Internal FD user sees amounts in Award → Actuals Tab → Funding Account Information Section → Revised Payment Split Field are reduced by amounts from Payment Request → Financials Tab for Advance Request|
  |Verify that Internal FD user sees Voucher Status changes to 'Void' and Advance Request status updates to 'Void' when 'Void' action is clicked on Voucher Layout for Advance Request|
  |Verify that Internal FD user sees 'Void' inline action available in Document History Section when voucher is in 'Released' state on Voucher Layout for Advance Request|
  |Verify that Internal FD user sees amounts in Award → Actuals Tab → Funding Account Information Section → Revised Payment Split Field are reduced by amounts from Payment Request → Financials Tab|
  |Verify that the FD user can see that a ‘New Document’ button is added at Document History section is visible when advance request is in Created/Void/Processed state|
  |Verify that the FD user can see that a ‘New Document’ button is added at Document History section is visible when reimbursement request is in void state|
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
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "4" seconds
    And I switch to tab number "1"
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    #NYSED-8057
    Then I softly can see top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I save the field labeled "EGMS ID" as "PAYMENT_EGMSID"
    And I navigate to "Financials" sub tab
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 126           |
    And I click modal button "Close"
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    And I click on "Schedule Document Release" icon for "Entered" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter in modal value "50" into field "ReleaseDate__c"
    When I click modal button "Save"
    And I wait for "5" seconds
    And I click on "Release Voucher" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    #NYSED-8163
    Then I softly see value "Released" for title "Status" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see value "$126" for title "Payment Split" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see value "$112" for title "Revised Payment Split" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see value "$14" for title "Withheld Amount" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see value "$126" for title "Payment Split" inside table "---paymentRequest:-:fundingAccountsAdvTableId---"
    Then I softly see value "$112" for title "Revised Payment Split" inside table "---paymentRequest:-:fundingAccountsAdvTableId---"
    Then I softly see value "$14" for title "Withheld Amount" inside table "---paymentRequest:-:fundingAccountsAdvTableId---"
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:AutomationPermanentNewStateFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table
    And I navigate to "Related Log" sub tab
    #NYSED-8167
    Then I softly see value "$112" for title "Expenditure Paid to Date" against the value "{SavedValue:AWARD_EGMSID}" inside table "---fundingsource:-:RelatedSubawardsFATableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    #NYSED-8167 #NYSED-8165
    Then I softly see value "$112" for title "Revised Payment Split" against the value "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table "---subAwardStandAlone:-:FundingAccountActualsTableId---"
    #NYSED-8166 #NYSED-8112 #NYSED-8165
    Then I softly see value "$112" for title "Revised Payment Split" against the value "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table "---subAwardStandAlone:-:FundingAccountActualsTableId---"
    Then I softly see value "$126" for title "Payment Split" against the value "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table "---subAwardStandAlone:-:FundingAccountActualsTableId---"
    Then I softly see value "$14" for title "Withheld Amount" against the value "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table "---subAwardStandAlone:-:FundingAccountActualsTableId---"
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    Then I softly can see row level action button "Void" against "Voucher" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    And I click on "Void" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-8159 #NYSED-8150
    Then I softly see field "Status" as "Void"
    Then I softly see value "Void" for title "Status" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    #NYSED-8163
    Then I softly see value "$126" for title "Payment Split" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see value "$112" for title "Revised Payment Split" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see value "$14" for title "Withheld Amount" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see value "$0" for title "Payment Split" inside table "---paymentRequest:-:fundingAccountsAdvTableId---"
    Then I softly see value "$0" for title "Revised Payment Split" inside table "---paymentRequest:-:fundingAccountsAdvTableId---"
    Then I softly see value "$0" for title "Withheld Amount" inside table "---paymentRequest:-:fundingAccountsAdvTableId---"
    #NYSED-8057 #NYSED-7592
    Then I softly can see top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    #NYSED-8167 #NYSED-8166 #NYSED-8112 #NYSED-8165
    Then I softly see value "$0" for title "Revised Payment Split" against the value "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table "---subAwardStandAlone:-:FundingAccountActualsTableId---"
    Then I softly see value "$0" for title "Revised Payment Split" against the value "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table "---subAwardStandAlone:-:FundingAccountActualsTableId---"
    Then I softly see value "$0" for title "Payment Split" against the value "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table "---subAwardStandAlone:-:FundingAccountActualsTableId---"
    Then I softly see value "$0" for title "Withheld Amount" against the value "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table "---subAwardStandAlone:-:FundingAccountActualsTableId---"
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:AutomationPermanentNewStateFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table
    And I navigate to "Related Log" sub tab
    #NYSED-8167 #NYSED-8166
    Then I softly see value "$0" for title "Expenditure Paid to Date" against the value "{SavedValue:AWARD_EGMSID}" inside table "---fundingsource:-:RelatedSubawardsFATableId---"

    Examples:
      | Announcement Name                                         | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD           |

  @NYSED-8818 @NYSED-Sprint-32 @US-NYSED-6966 @M05
  Scenario Outline: Verify that the Grantee user cannot see the ‘Advances - My Records' list filter from Monitoring phase → Advances left navigation module.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    #NYSED-8818
    Then I softly do not see toggle option "Advances - My Records" inside flex table id "---paymentRequest:-:subrecipientPaymentrequestAdvancesTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @NYSED-9144 @NYSED-9135 @NYSED-Sprint-33 @US-NYSED-6968 @M05
  Scenario Outline:Verify that the apart from the FD user cannot sees 'Delete' inline action for advance payment request in 'Created' status on Subaward layout → Actuals tab → Payment Requests section
  |Verify that the FD user sees the Release Initial Payment action button after deleting the created advance payment request when conditions are met.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "<InternalUser>" user
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
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "PAYMENT_EGMSID"
    And I save the field labeled "Subaward" as "AwardID"
    When I click on hyperlink containing value "{SavedValue:AwardID}"
    When I navigate to "Actuals" sub tab
    #NYSED-9144 #NYSED-9135
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:PAYMENT_EGMSID}" inside table "---paymentRequest:-:grantorPaymentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:PAYMENT_EGMSID}" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Actuals" sub tab
    #NYSED-9144
    Then I softly cannot see row level action button "Delete" against "{SavedValue:PAYMENT_EGMSID}" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Actuals" sub tab
    #NYSED-9144
    Then I softly cannot see row level action button "Delete" against "{SavedValue:PAYMENT_EGMSID}" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Actuals" sub tab
    #NYSED-9144
    Then I softly cannot see row level action button "Delete" against "{SavedValue:PAYMENT_EGMSID}" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Actuals" sub tab
    #NYSED-9144
    Then I softly cannot see row level action button "Delete" against "{SavedValue:PAYMENT_EGMSID}" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Actuals" sub tab
    Then I softly cannot see top right button "Release Initial Payment" in page detail
    And I click on "Delete" icon for "{SavedValue:PAYMENT_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9135
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-9147 @NYSED-Sprint-33 @US-NYSED-6968 @M05
  Scenario Outline:Verify that the only FD user sees 'Delete' inline action and can delete advance payment request in 'Created' status on Subaward layout → Actuals tab → Payment Requests section
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "<InternalUser>" user
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
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "PAYMENT_EGMSID"
    And I save the field labeled "Subaward" as "AwardID"
    When I click on hyperlink containing value "{SavedValue:AwardID}"
    When I navigate to "Actuals" sub tab
    #NYSED-9147
    Then I softly cannot see top right button "Release Initial Payment" in page detail
    And I click on "Delete" icon for "{SavedValue:PAYMENT_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9135
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    And I refresh the page
    And I wait for "4" seconds
    #NYSED-9147
    Then I softly can see top right button "Release Initial Payment" in page detail
    When I click on "Release Initial Payment" in the page details
    And I wait for "4" seconds
    And I switch to tab number "2"
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "PAYMENT_EGMSID1"
    And I save the field labeled "Subaward" as "AwardID"
    When I click on hyperlink containing value "{SavedValue:AwardID}"
    When I navigate to "Actuals" sub tab
    #NYSED-9147
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:PAYMENT_EGMSID1}" inside table "---paymentRequest:-:grantorPaymentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:PAYMENT_EGMSID1}" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-9148 @NYSED-Sprint-33 @US-NYSED-6968 @M05
    @NYSED-9202 @NYSED-Sprint-33 @US-NYSED-8648 @M05
  Scenario Outline:Verify that the FD user cannot see the 'Delete' inline action for the advance payment request, other than 'Created' status on Subaward layout → Actuals tab → Payment Requests section
  |Verify that Internal Profile User see 'Reporting Month' and 'Reporting Year' field is marked as required to save on Advance Payment Request layout when in Created status|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
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
    Then I softly see asterisk mark on "Reporting Month"
    Then I softly see asterisk mark on "Reporting Year"
    When I click on "Edit" in the page details
    And I enter value "--None--" into field "NYSED_ReportingMonth__c"
    And I enter value "--None--" into field "NYSED_ReportingYear__c"
    When I click on "Save" in the page details
    #NYSED-9202
    Then I softly see the following messages in the page details contains:
      | To Save, Reporting Month is required in the Overview tab under the General Information section. |
    Then I softly see the following messages in the page details contains:
      | To Save, Reporting Year is required in the Overview tab under the General Information section. |
    And I enter value "01" into field "NYSED_ReportingMonth__c"
    And I enter value "1990" into field "NYSED_ReportingYear__c"
    When I click on "Save" in the page details
    Then I softly see field "Reporting Month" as "01"
    Then I softly see field "Reporting Year" as "1990"
    And I navigate to "Financials" sub tab
    And I wait for "4" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I save the field labeled "EGMS ID" as "PAYMENT_EGMSID"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    When I navigate to "Actuals" sub tab
    #NYSED-9148
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:PAYMENT_EGMSID}" inside table "---paymentRequest:-:grantorPaymentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:PAYMENT_EGMSID}" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    And I click on "View" icon for "{SavedValue:PAYMENT_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 126           |
    And I click modal button "Close"
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Entered"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    When I navigate to "Actuals" sub tab
    #NYSED-9148
    Then I softly see value "Entered" for title "Status" against the value "{SavedValue:PAYMENT_EGMSID}" inside table "---paymentRequest:-:grantorPaymentRequestTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:PAYMENT_EGMSID}" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    And I click on "View" icon for "{SavedValue:PAYMENT_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I click on "Schedule Document Release" icon for "Entered" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter in modal value "50" into field "ReleaseDate__c"
    When I click modal button "Save"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Ready for Release"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    When I navigate to "Actuals" sub tab
    #NYSED-9148
    Then I softly see value "Ready for Release" for title "Status" against the value "{SavedValue:PAYMENT_EGMSID}" inside table "---paymentRequest:-:grantorPaymentRequestTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:PAYMENT_EGMSID}" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    And I click on "View" icon for "{SavedValue:PAYMENT_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I click on "Release Voucher" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Released"
    Then I softly see value "Released" for title "Status" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    When I navigate to "Actuals" sub tab
    #NYSED-9148
    Then I softly see value "Released" for title "Status" against the value "{SavedValue:PAYMENT_EGMSID}" inside table "---paymentRequest:-:grantorPaymentRequestTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:PAYMENT_EGMSID}" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"

    Examples:
      | Announcement Name                         | InternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | FD           |

  @NYSED-9160 @NYSED-9353 @NYSED-9356 @NYSED-9357 @NYSED-Sprint-33 @US-NYSED-5798 @M05
  Scenario Outline:Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any advance payment request exist other than in ‘Processed’ status on the same subaward
  |Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any advance payment request exist in ‘Entered’ status on the same subaward|
  |Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any advance payment request exist in ‘Ready for Release’ status on the same subaward|
  |Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any advance payment request exist in ‘Released’ status on the same subaward|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
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
    When I click on "Edit" in the page details
    And I enter value "01" into field "NYSED_ReportingMonth__c"
    And I enter value "1990" into field "NYSED_ReportingYear__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PAYMENT_EGMSID"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9160
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Advance Payment Request {SavedValue:PAYMENT_EGMSID} is in progress. |
    And I click modal button "Close"
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PAYMENT_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I wait for "4" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 126           |
    And I click modal button "Close"
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Entered"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9353
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Advance Payment Request {SavedValue:PAYMENT_EGMSID} is in progress. |
    And I click modal button "Close"
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PAYMENT_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I click on "Schedule Document Release" icon for "Entered" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter in modal value "50" into field "ReleaseDate__c"
    When I click modal button "Save"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Ready for Release"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9356
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Advance Payment Request {SavedValue:PAYMENT_EGMSID} is in progress. |
    And I click modal button "Close"
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PAYMENT_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I click on "Release Voucher" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Released"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9357
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Advance Payment Request {SavedValue:PAYMENT_EGMSID} is in progress. |

    Examples:
      | Announcement Name                         | InternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | FD           |

  @NYSED-9355 @NYSED-Sprint-33 @US-NYSED-5798 @M05
  Scenario Outline:Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any advance payment request exist in ‘On Hold’ status on the same subaward
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
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
    When I click on "Edit" in the page details
    And I enter value "01" into field "NYSED_ReportingMonth__c"
    And I enter value "1990" into field "NYSED_ReportingYear__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PAYMENT_EGMSID"
    And I navigate to "Financials" sub tab
    And I wait for "4" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 126           |
    And I click modal button "Close"
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Entered"
    And I click on "Place On Hold" icon for "Entered" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "On Hold"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9355
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Advance Payment Request {SavedValue:PAYMENT_EGMSID} is in progress. |

    Examples:
      | Announcement Name                         | InternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | FD           |

  @NYSED-9730 @NYSED-9732 @NYSED-Sprint-34 @US-NYSED-NYSED-3528 @M06 @ExecutionRDueToNeedsToUpdateSomeTestCaseByManualQA
  Scenario Outline:Verify that Internal User (GF Staff Queue Member) see below validation message on click on Submit for Approval or Mark as Approved button of Submitted to Grantor State Reimbursement Request when Advance Request is in Ready for Release State
  |Verify that Internal User (GF Staff Queue Member) see below validation message on click on Submit for Approval or Mark as Approved button of Submitted to Grantor State Reimbursement Request when Advance Request is in Released State|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
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
    When I click on "Edit" in the page details
    And I enter value "01" into field "NYSED_ReportingMonth__c"
    And I enter value "1990" into field "NYSED_ReportingYear__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PAYMENT_EGMSID"
    And I navigate to "Financials" sub tab
    And I wait for "4" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 126           |
    And I click modal button "Close"
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Entered"
    And I click on "Schedule Document Release" icon for "Entered" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter in modal value "50" into field "ReleaseDate__c"
    When I click modal button "Save"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Ready for Release"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "<Announcement Name>" into field "Title__c"
    When I enter value "FS-25" into field "NYSED_ReimbursementTemplate__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I navigate to "Financials" sub tab
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category             | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 126                             | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    #NYSED-9730
    Then I softly see the following messages in the page details contains:
      | An Advance Payment Request {SavedValue:PAYMENT_EGMSID} is currently in progress. Reimbursement Payment Requests cannot be approved until the Advance Payment Request is processed. |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Mark as Approved" in the page details
    #NYSED-9730
    Then I softly see the following messages in the page details contains:
      | An Advance Payment Request {SavedValue:PAYMENT_EGMSID} is currently in progress. Reimbursement Payment Requests cannot be approved until the Advance Payment Request is processed. |
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PAYMENT_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Release Voucher" icon for "Ready for Release" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Released"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    #NYSED-9732
    Then I softly see the following messages in the page details contains:
      | An Advance Payment Request {SavedValue:PAYMENT_EGMSID} is currently in progress. Reimbursement Payment Requests cannot be approved until the Advance Payment Request is processed. |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Mark as Approved" in the page details
    #NYSED-9732
    Then I softly see the following messages in the page details contains:
      | An Advance Payment Request {SavedValue:PAYMENT_EGMSID} is currently in progress. Reimbursement Payment Requests cannot be approved until the Advance Payment Request is processed. |

    Examples:
      | Announcement Name                         | InternalUser | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | FD           | GRANTEE_SC   |

  @NYSED-9731 @NYSED-Sprint-34 @US-NYSED-3528 @M06 @ExecutionRDueToNeedsToUpdateSomeTestCaseByManualQA
  Scenario Outline:Verify that Internal User (GF Staff Queue Member) see below validation message on click on Submit for Approval or Mark as Approved button of Submitted to Grantor State Reimbursement Request when Advance Request is in On Hold State
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DETAILBUDGETONAPPLICATION_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
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
    When I click on "Edit" in the page details
    And I enter value "01" into field "NYSED_ReportingMonth__c"
    And I enter value "1990" into field "NYSED_ReportingYear__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PAYMENT_EGMSID"
    And I navigate to "Financials" sub tab
    And I wait for "4" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 126           |
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Entered"
    And I click on "Place On Hold" icon for "Entered" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "On Hold"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-9731
    Then I softly see the following messages in the page details contains:
      | An Advance Payment Request {SavedValue:PAYMENT_EGMSID} is already in progress. You cannot initiate a Reimbursement Payment Request until the Advance Payment Request is processed. |

    Examples:
      | Announcement Name                         | InternalUser | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | FD           | GRANTEE_SC   |

  @NYSED-10230 @NYSED-Sprint-35 @US-NYSED-9490 @M05
    @NYSED-10226 @NYSED-Sprint-35 @US-NYSED-9232 @M05 @Bug-Ticket-NYSED-10278
  Scenario Outline:Verify that the Internal User can see that on the Subrecipient Organization layout → Related Log tab → Payment Requests section, a new column Reimbursement Template is added after Type column.
  |Verify that the Grantee User can see that on the Subrecipient Organization layout → Related Log tab → Payment Requests section, a new column Reimbursement Template is added after Type column.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<Announcement Name>"
    And I created approved FDM on application "<Announcement Name>"
    Given I created award from approved FDM with announcement "<Announcement Name>"
    And I activate award from FDM having application name "<Announcement Name>"
    Given I login to "As a Grantor" app as "<ReloginUser>" user
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
    When I click on "Edit" in the page details
    And I enter value "01" into field "NYSED_ReportingMonth__c"
    And I enter value "1990" into field "NYSED_ReportingYear__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PAYMENT_EGMSID"
    When I re-login to "As a Grantor" app as "<ReloginUser>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    Then I softly see "Subrecipients Organization - All" page block displayed
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    And I navigate to "Related Log" sub tab
    #NYSED-10230
    Then I see only the following headers in table with id "---paymentRequest:-:PaymentRequestsTableId---" :
      | Actions | EGMS ID | Type | Reimbursement Template | Subaward ID | Project ID | Reporting Period | Payment Request Amount | Status |
    And I perform quick search for "{SavedValue:PAYMENT_EGMSID}" in "---paymentRequest:-:PaymentRequestsTableId---" panel
    Then I softly see value "" for title "Reimbursement Template" inside table "---paymentRequest:-:PaymentRequestsTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    And I navigate to "Related Log" sub tab
    #NYSED-10226
    Then I see only the following headers in table with id "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" :
      | Actions | EGMS ID | Type | Reimbursement Template | Subaward ID | Project ID | Reporting Period | Payment Request Amount | Status |
    And I perform quick search for "{SavedValue:PAYMENT_EGMSID}" in "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" panel
    Then I softly see value "" for title "Reimbursement Template" inside table "---paymentRequest:-:SubreceipentPaymentRequestsTableId---"
    When I re-login to "Grants Portal" app as "<OtherExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    And I navigate to "Related Log" sub tab
    #NYSED-10226
    Then I see only the following headers in table with id "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" :
      | Actions | EGMS ID | Type | Reimbursement Template | Subaward ID | Project ID | Reporting Period | Payment Request Amount | Status |
    And I perform quick search for "{SavedValue:PAYMENT_EGMSID}" in "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" panel
    Then I softly see value "" for title "Reimbursement Template" inside table "---paymentRequest:-:SubreceipentPaymentRequestsTableId---"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "Delete" icon for "{SavedValue:PAYMENT_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "<Announcement Name>" into field "Title__c"
    When I enter value "FS-10F" into field "NYSED_ReimbursementTemplate__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I navigate to "Financials" sub tab
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementFS10FID"
    When I re-login to "As a Grantor" app as "<ReloginUser>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    Then I softly see "Subrecipients Organization - All" page block displayed
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    And I navigate to "Related Log" sub tab
    #NYSED-10230
    And I perform quick search for "{SavedValue:ReimbursementFS10FID}" in "---paymentRequest:-:PaymentRequestsTableId---" panel
    Then I softly see value "FS-10F" for title "Reimbursement Template" inside table "---paymentRequest:-:PaymentRequestsTableId---"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<OtherExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    And I navigate to "Related Log" sub tab
    #NYSED-10226
    Then I see only the following headers in table with id "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" :
      | Actions | EGMS ID | Type | Reimbursement Template | Subaward ID | Project ID | Reporting Period | Payment Request Amount | Status |
    And I perform quick search for "{SavedValue:ReimbursementFS10FID}" in "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" panel
    Then I softly see value "FS-10F" for title "Reimbursement Template" inside table "---paymentRequest:-:SubreceipentPaymentRequestsTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    And I navigate to "Related Log" sub tab
    #NYSED-10226
    Then I see only the following headers in table with id "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" :
      | Actions | EGMS ID | Type | Reimbursement Template | Subaward ID | Project ID | Reporting Period | Payment Request Amount | Status |
    And I perform quick search for "{SavedValue:ReimbursementFS10FID}" in "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" panel
    Then I softly see value "FS-10F" for title "Reimbursement Template" inside table "---paymentRequest:-:SubreceipentPaymentRequestsTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "Delete" icon for "{SavedValue:ReimbursementFS10FID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "<Announcement Name>" into field "Title__c"
    When I enter value "FS-25" into field "NYSED_ReimbursementTemplate__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I navigate to "Financials" sub tab
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementFS25ID"
    When I re-login to "As a Grantor" app as "<ReloginUser>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    Then I softly see "Subrecipients Organization - All" page block displayed
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    And I navigate to "Related Log" sub tab
    #NYSED-10230
    And I perform quick search for "{SavedValue:ReimbursementFS25ID}" in "---paymentRequest:-:PaymentRequestsTableId---" panel
    Then I softly see value "FS-25" for title "Reimbursement Template" inside table "---paymentRequest:-:PaymentRequestsTableId---"
    When I re-login to "Grants Portal" app as "<OtherExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    And I navigate to "Related Log" sub tab
    #NYSED-10226
    Then I see only the following headers in table with id "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" :
      | Actions | EGMS ID | Type | Reimbursement Template | Subaward ID | Project ID | Reporting Period | Payment Request Amount | Status |
    And I perform quick search for "{SavedValue:ReimbursementFS25ID}" in "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" panel
    Then I softly see value "FS-25" for title "Reimbursement Template" inside table "---paymentRequest:-:SubreceipentPaymentRequestsTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    And I navigate to "Related Log" sub tab
    #NYSED-10226
    Then I see only the following headers in table with id "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" :
      | Actions | EGMS ID | Type | Reimbursement Template | Subaward ID | Project ID | Reporting Period | Payment Request Amount | Status |
    And I perform quick search for "{SavedValue:ReimbursementFS25ID}" in "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" panel
    Then I softly see value "FS-25" for title "Reimbursement Template" inside table "---paymentRequest:-:SubreceipentPaymentRequestsTableId---"

    Examples:
      | Announcement Name                         | InternalUser | ReloginUser | ExternalUser | OtherExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | FD           | ADMIN       | GRANTEE_SC   | GRANTEE_CE        |
#      | {SavedValue:Automation Runtime FDM Grant} | FD           | ADMIN       | GRANTEE_SC   | GRANTEE_VO        |
#      | {SavedValue:Automation Runtime FDM Grant} | FD           | ADMIN       | GRANTEE_SC   | GRANTEE_LEA       |

  @NYSED-7580 @NYSED-7581 @NYSED-7595 @NYSED-7596 @NYSED-7597 @NYSED-Sprint-31 @US-NYSED-6253 @M06
  Scenario Outline:Verify that the FD user can see that inline edit icon is removed from Financials tab->Subaward Funding Account Information section
  |Verify that the Internal user can see that a new section, ‘Document History’ is added at Reimbursement Payment Request->Financials Tab after Payment Request Budget Section.|
  |Verify that the FD user can see that on clicking of 'New Document' button, the ‘Document Details’ modal opens with the following details.|
  |Verify that the FD user can see the Transactions Table with the following details when clicking on the New button on the ‘Document Details’ modal.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_SUPPLIESANDMATERIALS_BUDGETCATEGORY"
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
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "<GrantName>" into field "Title__c"
    When I enter value "FS-10F" into field "NYSED_ReimbursementTemplate__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I navigate to "Financials" sub tab
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Purchase Order Date | Purchase Order # | Description of Item/Service | Provider/Vendor | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Check or Journal Entry (No ACH) | Additional Cost | Expenditure | Cash Match | Non-Cash Match |
      | 1                   | 12345            | Name of Staff               | Provider        | 12       | 100       | Calculation                                              | Check                           | 100             | 126         | 100        | 100            |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<GFStaffQue>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    #NYSED-7580
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:NewFundingAccountAbleToPayYes}" in flex table with id "---paymentRequest:-:fundingAccountTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:NewFundingAccountAbleToPayYes}" in flex table with id "---paymentRequest:-:fundingAccountTableId---"
    And I click on "Mark as Approved" in the page details
    Then I softly see field "Status" as "Approved"
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:NewFundingAccountAbleToPayYes}" in flex table with id "---paymentRequest:-:fundingAccountTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:NewFundingAccountAbleToPayYes}" in flex table with id "---paymentRequest:-:fundingAccountTableId---"
    #NYSED-7581
    Then I see only the following ordered page blocks :
      | Burn Rate                            |
      | Payment Request Summary              |
      | Subaward Funding Account Information |
      | Payment Request Budget               |
      | Document History                     |
      | Acknowledgement                      |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:DocumentHistoryTableId---" :
      | Actions | EGMS ID | Type | Status | Payment Split | Revised Payment Split | Withheld Amount | Release Date |
    And I hovering mouse on page block help text icon inside table "---paymentRequest:-:DocumentHistoryTableId---" for column "Revised Payment Split"
    Then I softly see "The final amount allocated after applying any blanket voucher cuts." shown as help text
    And I hovering mouse on page block help text icon inside table "---paymentRequest:-:DocumentHistoryTableId---" for column "Withheld Amount"
    Then I softly see "The portion of the original amount that is withheld due to blanket voucher cuts." shown as help text
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:AutomationPermanentNewStateFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table
    And I wait for "2" seconds
    And I save the field labeled "Fund Year" as "FundYear"
    And I save the field labeled "Blanket Voucher Cut (%)" as "BlanketVoucherCut"
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    And I wait for "2" seconds
    #NYSED-7595
    Then I softly see "Document Details" opens in overLay window
    Then I softly see "Document Information" page block displayed
    Then I softly see field "Type" inside page block
    Then I see only the following ordered options in dropdown field "Type__c" :
      | --None-- | Voucher | Refund |
    Then I softly see asterisk mark on "Type"
    And I refresh the page
    And I wait for "2" seconds
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    And I wait for "2" seconds
    And I click modal button "Save"
    Then I softly see the following messages in the page details :
      | To save, Type is required. |
    And I refresh the page
    Then I softly see "Burn Rate" page block displayed
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without processing
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    #NYSED-7596
    Then I softly see "Document Details" opens in overLay window
    Then I softly see field "Type" inside page block
    Then I softly see field "Document Number" inside page block
    Then I softly see field "Release Date" inside page block
    Then I softly see field "Type" as "Voucher"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Reimbursed Amount" as "$126"
    Then I softly can see top right button "New" in flex table with id "---paymentRequest:-:TransactionsTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 126           |
    #NYSED-7597
    Then I softly can see row level action button "Edit" against "{SavedValue:NewFundingAccountAbleToPayYes}" in flex table with id "---paymentRequest:-:TransactionsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:NewFundingAccountAbleToPayYes}" in flex table with id "---paymentRequest:-:TransactionsTableId---"
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:TransactionsTableId---" :
      | Actions     | Payment Funding Account EGMS ID            | Funding Account Name                                   | Fund Year             | Blanket Voucher Cut%           | Payment Split | Revised Payment Split | Withheld Amount |
      | Action menu | {SavedValue:NewFundingAccountAbleToPayYes} | {SavedValue:AutomationPermanentNewStateFundingAccount} | {SavedValue:FundYear} | {SavedValue:BlanketVoucherCut} | $126          | $112                  | $14             |
    And I hovering mouse on page block help text icon inside table "---paymentRequest:-:TransactionsTableId---" for column "Revised Payment Split"
    Then I softly see "The final amount allocated after applying any blanket voucher cuts." shown as help text
    And I hovering mouse on page block help text icon inside table "---paymentRequest:-:TransactionsTableId---" for column "Withheld Amount"
    Then I softly see "The portion of the original amount that is withheld due to blanket voucher cuts." shown as help text

    Examples:
      | GrantName                                                 | GFStaffQue |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO         |