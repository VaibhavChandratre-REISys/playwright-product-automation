@paymentRequestNysed
Feature: Validate all scenarios in Payment Request from direct award

  @489029-DG @VerifythattheInternalUserdoesnotseetheLeverageAllowedcolumninthePaymentRequestBudgettableoftheReimbursementPaymentRequest @Sprint-00 @US-487276
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" column in the 'Payment Request Budget' table of the Reimbursement Payment Request.
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-<User>" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I get the "EGMS ID"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 20                            |
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I navigate to "Financials" sub tab
    Then I softly do not see "Other Leverage" in flex table header "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user |

  @490463-DG @VerifythatthesubrecipientusercanseeformsaspersequencenumbersaddedonGrantorPaymentRequestsFormspackageandsequencenumbercolumnAdvance @Sprint-00 @US-487276
  Scenario Outline: Verify that the subrecipient user can see forms as per sequence numbers added on 'Grantor Payment Requests Forms' package and sequence number column - Advance
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Grantor Payment Request Forms" in "---program:-:packagesTableId---" panel
    And I click on "View" icon for "Grantor Payment Request Forms" inside flex table with id "---program:-:packagesTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name                                     | Sequence Number | Is Mandatory? |
      | Request for Advance or Reimbursement - SF-270 | 7               | checked       |
    And I save the value from row "1" for column name "Sequence Number" as "SequenceNumber" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "1" for column name "Is Mandatory?" as "IsMandatory" from flex table "---program:-:packagesFormsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Forms and Files" sub tab
    Then I softly see value "{SavedValue:SequenceNumber}" for title "Sequence Number" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I softly see value "{SavedValue:IsMandatory}" for title "Mandatory" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"

    Examples:
      | UserType |
      | SPI1     |
#      | SPA      |

  @489435 @VerifythatthesubrecipientusercanseeformsaspersequencenumbersaddedonGrantorPaymentRequestsFormspackageandsequencenumbercolumnAdvance @Sprint-00 @US-487276
  Scenario Outline: Verify that the subrecipient user can see forms as per sequence numbers added on 'Grantor Payment Requests Forms' package and sequence number column - Advance
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Grantor Payment Request Forms" in "---program:-:packagesTableId---" panel
    And I click on "View" icon for "Grantor Payment Request Forms" inside flex table with id "---program:-:packagesTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name                                     | Sequence Number | Is Mandatory? |
      | Request for Advance or Reimbursement - SF-270 | 7               | checked       |
    And I save the value from row "1" for column name "Sequence Number" as "SequenceNumber" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "1" for column name "Is Mandatory?" as "IsMandatory" from flex table "---program:-:packagesFormsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-<User>" of type "Competitive"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I get the "EGMS ID"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 20                            |
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    And I click on "Submit to Grantor" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I see only the following headers in table with id "---paymentRequest:-:paymentRequestFormsTableId---" :
      | Actions | Sequence Number | Form Name | Report Type | Mandatory | Percentage | Last Modified By | Last Modified Date |
    Then I softly see value "{SavedValue:SequenceNumber}" for title "Sequence Number" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I softly see value "{SavedValue:IsMandatory}" for title "Mandatory" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user    |
#      | PO       | Automation PO  user    |
#      | ADMIN    | Automation ADMIN  user |

  @491140-DG @VerifythattheInternalUserdoesnotseetheLeverageAlloweddcolumninthePaymentRequestBudgettableoftheReimbursementPaymentRequest @Sprint-01 @US-487975
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" column in the 'Payment Request Budget' table of the Reimbursement Payment Request.
    And I activated standalone subaward "Automation Runtime award" with properties "default-<User>" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime award}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 10         | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    Then I softly do not see "Other Leverage" in flex table header "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |
#      | FD       | Automation FD user    |
#      | ADMIN    | Automation ADMIN user |

  @491141-DG @VerifythattheSubrecipientUserdoesnotseetheLeverageAllowedcolumninthePaymentRequestBudgettableoftheReimbursementPaymentRequest @Sprint-01 @US-487975
  Scenario Outline: Verify that the Subrecipient User does not see the "Leverage Allowed?" column in the 'Payment Request Budget' table of the Reimbursement Payment Request.
    And I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime award}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    Then I softly do not see "Other Leverage" in flex table header "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType |
      | SPI1     |
#      | SPA      |

  @491143-DG @VerifythattheInternalUserdoesnotseetheLeverageAllowedcolumninthePaymentRequestAdvancetableoftheAdvancesPaymentRequest @Sprint-01 @US-487975
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" column in the 'Payment Request Advance' table of the Advances Payment Request.
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-<User>" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I get the "EGMS ID"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 20                            |
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I navigate to "Financials" sub tab
    Then I softly do not see "Other Leverage" in flex table header "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO  user   |
#      | FO       | Automation FO  user   |
#      | ADMIN    | Automation ADMIN User |

  @491146-DG @VerifythattheSubrecipientUserdoesnotseetheLeverageAllowedcolumninthePaymentRequestAdvancetableoftheAdvancesPaymentRequest @Sprint-01 @US-487975
  Scenario Outline: Verify that the Subrecipient User does not see the "Leverage Allowed?" column in the 'Payment Request Advance' table of the Advances Payment Request.
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PayreqId"
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    Then I softly do not see "Other Leverage" in flex table header "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType |
      | SPI1     |
#      | SPA      |

  @492830-DG @VerifythattheSubrecipientuserseeonlyEditactionbuttonattheReimbursementRequestpagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownCreatedReimbursementRequest @Sprint-01 @US-490341
  Scenario Outline: Verify that the Subrecipient user see only 'Edit' action button at the Reimbursement Request page layout and other record flow action buttons at page level action dropdown.- Created Reimbursement Request
    And I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<SubUser>" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:subrecipientPendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit to Grantor" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

    Examples:
      | SubUser |
      | SPI1    |
#      | SPA     |

  @492831-DG @493112-DG @VerifythattheInternalusercannotseeEditactionbuttonattheReimbursementRequestpagelayoutandcanseeotherrecordflowactionbuttonsatpagelevelactiondropdownSubmittedtoGrantorReimbursementRequest @Sprint-01 @US-490341
  Scenario Outline: Verify that the Internal user can not see 'Edit' action button at the Reimbursement Request page layout and can see other record flow action buttons at page level action dropdown.- Submitted to Grantor Reimbursement Request
    And I activated standalone subaward "Automation Runtime award" with properties "default-<User>" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:subrecipientPendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit to Grantor" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly cannot see top right dropdown button "Submit for Approval" in page detail
    Then I softly cannot see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:subrecipientPendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                      | Reimbursement |
      | {SavedValue:EXE Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly can see top right dropdown button "Mark As Paid" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I click modal button "Close"
    Then I see status in Progress-bar is "Paid" and is "dark blue"
    Then I softly cannot see top right dropdown button "Mark As Paid" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user |

  @493091-DG @VerifythattheSubrecipientuserseeonlyEditactionbuttonattheAdvanceRequestpagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownCreatedAdvanceRequest @Sprint-01 @US-490341
  Scenario Outline: Verify that the Subrecipient user see only 'Edit' action button at the Advance Request page layout and other record flow action buttons at page level action dropdown.- Created Advance Request
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<SubUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PayreqId"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit to Grantor" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

    Examples:
      | SubUser |
      | SPI1    |
#      | SPA     |

  @493098-DG @@493104-DG @VerifythattheInternalusercannotseeEditactionbuttonattheAdvanceRequestpagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownSubmittedtoGrantorAdvanceRequest @Sprint-01 @US-490341
  Scenario Outline: Verify that the Internal user can not see 'Edit' action button at the Advance Request page layout and other record flow action buttons at page level action dropdown.- Submitted to Grantor Advance Request
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-<User>" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly cannot see top right dropdown button "Submit for Approval" in page detail
    Then I softly cannot see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Advances" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    #@493104_1
    Then I softly can see top right dropdown button "Mark As Paid" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I click modal button "Close"
    Then I see status in Progress-bar is "Paid" and is "dark blue"
    Then I softly cannot see top right dropdown button "Mark As Paid" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO  user   |

  @493524 @Sprint-02 @US-491301
  Scenario Outline: Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: <Focus Area Name>" in the Payment Request Budget table of the Reimbursement req when the Direct Grant is created with the Focus Area Required? is marked as "Yes"
    And I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType |
      | SPI1     |
#      | SPA      |

  @493528 @Sprint-02 @US-491301
  Scenario Outline: Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: <Focus Area Name>" in the Payment Request Budget table of the Reimbursement req when the Direct Grant is created with the Focus Area Required? is marked as "Yes"
    And I activated standalone subaward "Automation Runtime award" with properties "default-<User>" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user|
#      | PO       | Automation PO user |

  @493474 @Sprint-02 @US-491301
  Scenario Outline: Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: Grant Name" in the Payment Request Budget table of the Reimbursement req when the Direct Grant is created with the Focus Area Required? is marked as "No"
    And I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Award}" inside rows of enhanced grid id "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType |
      | SPI1     |
#      | SPA      |

  @493475 @Sprint-02 @US-491301
  Scenario Outline: Verify that the Internal user sees the Focus area name in the format "Focus Area: Grant Name" in the Payment Request Budget table of the Reimbursement req when the Direct Grant is created with the Focus Area Required? is marked as "No"
    And I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-<User>" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Award}" inside rows of enhanced grid id "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user|
#      | PO       | Automation PO user |

  @493476 @Sprint-02 @US-491301
  Scenario Outline: Verify that the Subrecipient user see only 'Edit' action button at the Advance Request page layout and other record flow action buttons at page level action dropdown.- Created Advance Request
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<SubUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PayreqId"
    Then I softly see field "Status" as "Created"
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Award}" inside rows of enhanced grid id "---paymentRequest:-:budgetTableId---"

    Examples:
      | SubUser |
      | SPI1    |
#      | SPA     |

  @493493 @Sprint-02 @US-491301
  Scenario Outline: Verify that the Internal user can not see 'Edit' action button at the Advance Request page layout and other record flow action buttons at page level action dropdown.- Submitted to Grantor Advance Request
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-<User>" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PayreqId"
#    And I navigate to "Forms and Files" sub tab
#    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
#    And I upload attachment "Attachment.pdf" of type "Others" from computer
#    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Award}" inside rows of enhanced grid id "---paymentRequest:-:budgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user|
#      | PO       | Automation PO user |

  @NYSED-6477 @NYSED-6474 @NYSED-6473 @NYSED-6472 @NYSED-6469 @NYSED-6470 @NYSED-6383 @NYSED-6366 @US-NYSED-2983 @M05 @santosh @Bug-Ticket-NYSED-6516
  Scenario Outline: Verify that the ‘Reimbursement Request’ section button is only visible to submit and certify or create and edit profile users on the Subaward layout → Actuals tab → Payment Requests section. - Direct Grant/Award
  |Verify that the Grantee User can see Section button 'Send Email' is only visible to the user with 'Create and Edit' or 'Submit and Certify' role and not visible to other role on the Reimbursement Request → Messages tab → Messages section|
  |Verify that the Grantee User can see Inline Actions 'edit' & 'remove' is only visible to the user with 'Create and Edit' or 'Submit and Certify' role and not visible to other role on the Reimbursement Request→ Forms and Files tab→ Notes section|
  |Verify that the Grantee User can see Inline Actions 'edit' &'delete' is only visible to the user with 'Create and Edit' or 'Submit and Certify' role and not visible to other role on the Reimbursement Request→Forms and Files tab→Reimbursement Files section|
  |Verify that the Grantee User can see 'All Forms' Section is hidden on the Reimbursement Payment Request layout → Forms and Files tab|
  |Verify that the Grantee User (Submit and Certify or Create and Edit role User) can see Edit button Only on Reimbursement Payment Request Layout Page when it is in created state|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ADVANCEPAYMENTALLOWED_YES_FORMULA_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Direct Grant}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Direct Grant}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "{SavedValue:Automation Runtime Announcement Direct Grant}" into field "Title__c"
    When I enter value "FS-25" into field "NYSED_ReimbursementTemplate__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    #NYSED-6477
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I navigate to "Messages" sub tab
    #NYSED-6474
    Then I softly can see top right button "Send Email" in flex table with id "---paymentRequest:-:reimburseCollabMessages---"
    When I navigate to "Forms and Files" sub tab
    #NYSED-6472
    Then I softly can see top right button "New" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    #NYSED-6473
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes2 |
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I softly can see row level action button "Edit" against "Automation Notes2" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I softly can see row level action button "Delete" against "Automation Notes2" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Automation Notes2" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    #NYSED-6469
    Then I softly can see top right button "Add Files" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Invoice" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-6470
    And I softly can see row level action button "Edit" against "Invoice" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I softly can see row level action button "Delete" against "Invoice" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I click on "Delete" icon for "Invoice" inside flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---" without waiting for record
    #NYSED-6383
    Then I softly cannot see page block "All Forms"
    Then I see only the following ordered page blocks :
      | Supporting Documents Checklist |
      | Reimbursement Files            |
      | Notes                          |
    #NYSED-6366
    Then I softly can see top right button "Edit" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Direct Grant}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Direct Grant}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    #NYSED-6477
    Then I softly cannot see top right button "Submit to Grantor" in page detail
    When I navigate to "Messages" sub tab
    #NYSED-6474
    Then I softly can see top right button "Send Email" in flex table with id "---paymentRequest:-:reimburseCollabMessages---"
    When I navigate to "Forms and Files" sub tab
    #NYSED-6472
    Then I softly can see top right button "New" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    #NYSED-6473
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes2 |
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I softly can see row level action button "Edit" against "Automation Notes2" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I softly can see row level action button "Delete" against "Automation Notes2" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Automation Notes2" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    #NYSED-6469
    Then I softly can see top right button "Add Files" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Invoice" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-6470
    And I softly can see row level action button "Edit" against "Invoice" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I softly can see row level action button "Delete" against "Invoice" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    #NYSED-6383
    Then I softly cannot see page block "All Forms"
    Then I see only the following ordered page blocks :
      | Supporting Documents Checklist |
      | Reimbursement Files            |
      | Notes                          |
    #NYSED-6366
    Then I softly can see top right button "Edit" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Direct Grant}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Direct Grant}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    #NYSED-6477
    Then I softly cannot see top right button "Submit to Grantor" in page detail
    When I navigate to "Messages" sub tab
    #NYSED-6474 #Bug-NYSED-6516
    Then I softly cannot see top right button "Send Email" in flex table with id "---paymentRequest:-:reimburseCollabMessages---"
    When I navigate to "Forms and Files" sub tab
    #NYSED-6472
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    #NYSED-6473
    And I softly cannot see row level action button "Edit" against "Automation Notes1" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I softly cannot see row level action button "Delete" against "Automation Notes1" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    #NYSED-6469
    Then I softly cannot see top right button "Add Files" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I wait for "2" seconds
    #NYSED-6470
    And I softly cannot see row level action button "Edit" against "Invoice" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I softly cannot see row level action button "Delete" against "Invoice" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    #NYSED-6383
    Then I softly cannot see page block "All Forms"
    Then I see only the following ordered page blocks :
      | Supporting Documents Checklist |
      | Reimbursement Files            |
      | Notes                          |
    #NYSED-6366
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Direct Grant}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Direct Grant}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    #NYSED-6477
    Then I softly cannot see top right button "Submit to Grantor" in page detail
    When I navigate to "Messages" sub tab
    #NYSED-6474
    Then I softly cannot see top right button "Send Email" in flex table with id "---paymentRequest:-:reimburseCollabMessages---"
    When I navigate to "Forms and Files" sub tab
    #NYSED-6472
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    #NYSED-6473
    And I softly cannot see row level action button "Edit" against "Automation Notes1" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I softly cannot see row level action button "Delete" against "Automation Notes1" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    #NYSED-6469
    Then I softly cannot see top right button "Add Files" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    #NYSED-6470
    And I softly cannot see row level action button "Edit" against "Invoice" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I softly cannot see row level action button "Delete" against "Invoice" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    #NYSED-6383
    Then I softly cannot see page block "All Forms"
    Then I see only the following ordered page blocks :
      | Supporting Documents Checklist |
      | Reimbursement Files            |
      | Notes                          |
    #NYSED-6366
    Then I softly cannot see top right button "Edit" in page detail

    Examples:
      | UserType   |
      | GRANTEE_SC |

  @NYSED-6556 @NYSED-6552 @NYSED-6558 @NYSED-Sprint-31 @US-NYSED-3524 @M05
  Scenario Outline: Verify that the ‘Reimbursement Request’ section button is only visible to submit and certify or create and edit profile users on the Subaward layout → Actuals tab → Payment Requests section. - Direct Grant/Award
  |Verify that the GVerify that the Grantee User can see validation message as 'Cumulative Expenditures to Date cannot be negative.' when Negative value entered for Cumulative Expenditures to Date under Payment Request Budget Section|
  |Verify that Inline action Edit and Section Save buttons are visible to the ‘Submit and Certify or Create and Edit’ role users only on Reimbursement Payment Request Layout->Financials tab -> Payment Request Budget section|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ADVANCEPAYMENTALLOWED_YES_FORMULA_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Budget" sub tab
      #NYSED-6552
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code |
      | Action menu | Professional Staff Salaries | 15                   |
      | Action menu | Support Staff Salaries      | 16                   |
      | Action menu | Purchased Services          | 40                   |
      | Action menu | Supplies and Materials      | 45                   |
      | Action menu | Travel Expenses             | 46                   |
      | Action menu | Employee Benefits           | 80                   |
      | Action menu | Indirect Cost               | 90                   |
      | Action menu | BOCES Purchased Services    | 49                   |
      | Action menu | Minor Remodeling            | 30                   |
      | Action menu | Equipment                   | 20                   |
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "<GrantName>" into field "Title__c"
    When I enter value "FS-25" into field "NYSED_ReimbursementTemplate__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    When I navigate to "Financials" sub tab
    #NYSED-6552
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentRequestBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code |
      | Action menu | Professional Staff Salaries | 15                   |
      | Action menu | Support Staff Salaries      | 16                   |
      | Action menu | Purchased Services          | 40                   |
      | Action menu | Supplies and Materials      | 45                   |
      | Action menu | Travel Expenses             | 46                   |
      | Action menu | Employee Benefits           | 80                   |
      | Action menu | Indirect Cost               | 90                   |
      | Action menu | BOCES Purchased Services    | 49                   |
      | Action menu | Minor Remodeling            | 30                   |
      | Action menu | Equipment                   | 20                   |
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category             | Cumulative Expenditures to Date |
      | Professional Staff Salaries | -100                            |
    #NYSED-6556
    Then I softly see the following messages in the page details contains:
      | Cumulative Expenditures to Date cannot be negative. |
    And I refresh the page
    #NYSED-6558
    Then I softly can see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Support Staff Salaries" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Purchased Services" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Supplies and Materials" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Travel Expenses" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Employee Benefits" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Indirect Cost" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "BOCES Purchased Services" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Minor Remodeling" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Equipment" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    And I click on "Edit" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Then I softly can see top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category             | Cumulative Expenditures to Date |
      | Professional Staff Salaries | 1000                            |
    #NYSED-6558
    Then I softly see value "$1,000" for title "Cumulative Expenditures to Date" against the value "Professional Staff Salaries" inside table "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    #NYSED-6552
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentRequestBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code |
      | Action menu | Professional Staff Salaries | 15                   |
      | Action menu | Support Staff Salaries      | 16                   |
      | Action menu | Purchased Services          | 40                   |
      | Action menu | Supplies and Materials      | 45                   |
      | Action menu | Travel Expenses             | 46                   |
      | Action menu | Employee Benefits           | 80                   |
      | Action menu | Indirect Cost               | 90                   |
      | Action menu | BOCES Purchased Services    | 49                   |
      | Action menu | Minor Remodeling            | 30                   |
      | Action menu | Equipment                   | 20                   |
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category             | Cumulative Expenditures to Date |
      | Professional Staff Salaries | -100                            |
    #NYSED-6556
    Then I softly see the following messages in the page details contains:
      | Cumulative Expenditures to Date cannot be negative. |
    And I refresh the page
    #NYSED-6558
    Then I softly can see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Support Staff Salaries" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Purchased Services" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Supplies and Materials" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Travel Expenses" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Employee Benefits" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Indirect Cost" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "BOCES Purchased Services" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Minor Remodeling" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "Edit" against "Equipment" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    And I click on "Edit" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Then I softly can see top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category             | Cumulative Expenditures to Date |
      | Professional Staff Salaries | 1000                            |
    #NYSED-6558
    Then I softly see value "$1,000" for title "Cumulative Expenditures to Date" against the value "Professional Staff Salaries" inside table "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    #NYSED-6552
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentRequestBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code |
      | Action menu | Professional Staff Salaries | 15                   |
      | Action menu | Support Staff Salaries      | 16                   |
      | Action menu | Purchased Services          | 40                   |
      | Action menu | Supplies and Materials      | 45                   |
      | Action menu | Travel Expenses             | 46                   |
      | Action menu | Employee Benefits           | 80                   |
      | Action menu | Indirect Cost               | 90                   |
      | Action menu | BOCES Purchased Services    | 49                   |
      | Action menu | Minor Remodeling            | 30                   |
      | Action menu | Equipment                   | 20                   |
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    #NYSED-6552
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentRequestBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code |
      | Action menu | Professional Staff Salaries | 15                   |
      | Action menu | Support Staff Salaries      | 16                   |
      | Action menu | Purchased Services          | 40                   |
      | Action menu | Supplies and Materials      | 45                   |
      | Action menu | Travel Expenses             | 46                   |
      | Action menu | Employee Benefits           | 80                   |
      | Action menu | Indirect Cost               | 90                   |
      | Action menu | BOCES Purchased Services    | 49                   |
      | Action menu | Minor Remodeling            | 30                   |
      | Action menu | Equipment                   | 20                   |

    Examples:
      | UserType   | GrantName                                                 |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Direct Grant} |


  @NYSED-6520 @NYSED-Sprint-31 @US-NYSED-3524 @M05
  Scenario Outline: Verify that the Grantee User can see below columns are available on Reimbursement Payment Request Layout->Financials tab -> Payment Request Budget section
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ADVANCEPAYMENTALLOWED_YES_FORMULA_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    #NYSED-6520
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:paymentSummaryBudgetTableId---" :
      | Budget Category             | Budget Category Code | Award Amount | Cumulative Expenditures to Date | Balance | Cash Match | Non-Cash Match | Total Match |
      | Professional Staff Salaries | 15                   | $1,000       | $0                              | $1,000  | $0         | $0             | $0          |
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "<GrantName>" into field "Title__c"
    When I enter value "FS-25" into field "NYSED_ReimbursementTemplate__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    When I navigate to "Financials" sub tab
    #NYSED-6520
    Then I see only the following headers in table with id "---paymentRequest:-:paymentRequestBudgetTableId---" :
      | Actions | Budget Category | Budget Category Code | Awarded Budget | Subaward Expenditure Paid to Date | Subaward Balance | Cumulative Expenditures to Date | Net Expenditure Change | Cash Match | Non-Cash Match | Total Match |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentRequestBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Awarded Budget | Subaward Expenditure Paid to Date | Subaward Balance | Cumulative Expenditures to Date | Net Expenditure Change | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Professional Staff Salaries | 15                   | $1,000         | $0                                | $1,000           | $0                              | $0                     | $0         | $0             | $0          |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
   #NYSED-6520
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:paymentSummaryBudgetTableId---" :
      | Budget Category             | Budget Category Code | Award Amount | Cumulative Expenditures to Date | Balance | Cash Match | Non-Cash Match | Total Match |
      | Professional Staff Salaries | 15                   | $1,000       | $0                              | $1,000  | $0         | $0             | $0          |
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentRequestBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Awarded Budget | Subaward Expenditure Paid to Date | Subaward Balance | Cumulative Expenditures to Date | Net Expenditure Change | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Professional Staff Salaries | 15                   | $1,000         | $0                                | $1,000           | $0                              | $0                     | $0         | $0             | $0          |

    Examples:
      | UserType   | GrantName                                                 | ExternalUser |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_VO   |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_LEA   |

  @NYSED-5936 @NYSED-5937 @NYSED-5941 @NYSED-5938 @NYSED-5942 @NYSED-5939 @NYSED-Sprint-31 @US-NYSED-3526 @M05 @Bug-Ticket-7927 @Bug-Ticket-7924
    @NYSED-9149 @NYSED-Sprint-33 @US-NYSED-4915 @M05 @Bug-Ticket-NYSED-7924
  Scenario Outline: Verify that grant finance staff reviewer queue member sees 'Send Back to Subrecipient' and 'Submit for Approval' buttons when Reimbursement Payment Request is in 'Submitted to Grantor' state on Reimbursement Payment Request Layout
  |Verify that the grant finance staff reviewer queue member sees 'New' section button and edit inline action in the Approvers section on the Responsibilities tab of the Reimbursement Payment Request Layout.|
  |Verify that a non-queue member cannot see the page-level action buttons when the Reimbursement Payment Request is in 'Submitted to Grantor' status.|
  |Verify that the grant finance staff reviewer queue member sees the 'Mark as Approved' button when the Reimbursement Payment Request is in 'Submitted to Grantor' status on the Reimbursement Payment Request Layout.|
  |Verify that grant finance staff reviewer queue member cannot see the page-level action buttons when the Reimbursement Payment Request is not in 'Submitted to Grantor' status.|
  |Verify that the 'Mark as Processed' button is visible when the Reimbursement Payment Request is in the 'Approved' state, and the Reimbursed Amount is $0 on the Reimbursement Payment Request Layout|
  |Verify that the 'Mark as Processed' button is visible when the Reimbursement Payment Request is in the 'Approved' state, and the Reimbursed Amount is $0 on the Reimbursement Payment Request Layout|
  |Verify that, other than the FD user cannot sees the 'Mark as Processed' button when the Reimbursement Payment Request is in the 'Approved' state, and the Reimbursed Amount is $0 on the Reimbursement Payment Request Layout.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ADVANCEPAYMENTALLOWED_YES_FORMULA_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "<GrantName>" into field "Title__c"
    When I enter value "FS-25" into field "NYSED_ReimbursementTemplate__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I navigate to "Financials" sub tab
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalQueueMember>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-5936
    Then I softly can see top right dropdown button "Mark as Approved" in page detail
    Then I softly can see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-5936
    Then I softly can see top right dropdown button "Mark as Approved" in page detail
    Then I softly can see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---paymentRequest:-:payapproversTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-5941
    Then I softly cannot see top right dropdown button "Mark as Approved" in page detail
    Then I softly cannot see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right dropdown button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:payapproversTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-5941
    Then I softly cannot see top right dropdown button "Mark as Approved" in page detail
    Then I softly cannot see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right dropdown button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:payapproversTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-5941
    Then I softly cannot see top right dropdown button "Mark as Approved" in page detail
    Then I softly cannot see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right dropdown button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:payapproversTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    #NYSED-5937
    Then I softly can see top right button "New" in flex table with id "---paymentRequest:-:payapproversTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FD Username} | Step 2        |
    Then I softly can see row level action button "Edit" against "{SavedValue:FD Username}" in flex table with id "---paymentRequest:-:payapproversTableId---"
    And I click on "Mark as Approved" in the page details
    And I wait for "2" seconds
    #NYSED-5938
    Then I softly see field "Status" as "Approved"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    #NYSED-5942
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:payapproversTableId---"
    Then I softly cannot see top right dropdown button "Mark as Approved" in page detail
    Then I softly cannot see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right dropdown button "Submit for Approval" in page detail
    When I navigate to "Financials" sub tab
    #NYSED-5939
    Then I softly see field "Reimbursed Amount" as "$0"
    #NYSED-9149
    Then I softly cannot see top right dropdown button "Mark as Processed" in page detail
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9149
    Then I softly cannot see top right dropdown button "Mark as Processed" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9149
    Then I softly cannot see top right dropdown button "Mark as Processed" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9149
    Then I softly cannot see top right dropdown button "Mark as Processed" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    Then I softly can see top right dropdown button "Mark as Processed" in page detail
    When I click on "Mark as Processed" in the page details without processing
    Then I softly see confirmation box with body "This action will mark the payment request as ‘Processed’. Are you sure want to proceed?" is displayed
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Processed"

    Examples:
      | UserType   | GrantName                                                 | InternalQueueMember |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Direct Grant} | PM                  |

  @NYSED-5144 @NYSEDSprint-30 @US-NYSED-3403 @M05 @AbleToPay @Bug-Ticket-NYSED-8060
  Scenario Outline: Verify that the FD user sees a validation message when clicking the ‘New Document’ button in the Document History section while the Payment Request is in ‘Created’ status and a Contract Stop is applied.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "CONTRACTSTOP_PRESENT"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
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
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "4" seconds
    And I switch to tab number "1"
    And I navigate to "Financials" sub tab
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    #NYSED-5144
    Then I softly see the following messages in the page details contains:
      | New document cannot be created because Contract Stop is currently applied on Grant. |

    Examples:
      | GrantName                                                 |
      | {SavedValue:Automation Runtime Announcement Direct Grant} |

  @NYSED-5149 @NYSEDSprint-30 @US-NYSED-3403 @M05 @AbleToPay @Bug-Ticket-NYSED-8060
  Scenario Outline:Verify that the FD user sees a validation message when clicking the ‘Generate Document’ inline action in the Document History section while the Payment Request is in ‘Created’ status and a Project Stop is applied.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "PROJECTSTOP_PRESENT"
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
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "4" seconds
    And I switch to tab number "1"
    And I navigate to "Financials" sub tab
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    #NYSED-5149
    Then I softly see the following messages in the page details contains:
      | New document cannot be created because Project Stop is currently applied on Subaward. |

    Examples:
      | GrantName                                                 |
      | {SavedValue:Automation Runtime Announcement Direct Grant} |

  @NYSED-5152 @NYSED-5147 @NYSED-5150 @NYSED-5158 @NYSEDSprint-30 @US-NYSED-3403 @M05 @AbleToPay @ExecutionRemaningPR @DueToBugReportedByManualQA
  Scenario Outline:Verify that the FD user sees a validation message when clicking the ‘Generate Document’ inline action in the Document History section while the Payment Request is in ‘Created’ status and Multiple Stops are applied.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
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
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AWARD_EGMSID"
    When I click on "Release Initial Payment" in the page details
    And I wait for "4" seconds
    And I switch to tab number "1"
    And I navigate to "Financials" sub tab
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I save the field labeled "EGMS ID" as "PAYMENT_EGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "<GrantName>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I click on "Manage Holds" in the page details
    When I enter in modal value "60" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "50" into field "NYSED_ContractStop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PAYMENT_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    #NYSED-5152
    Then I softly see the following messages in the page details contains:
      | Document cannot be generated because Pay Stop is currently applied on Announcement layout. |
      | Document cannot be generated because Contract Stop is currently applied on Grant layout.   |
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I clear in modal the value from field "NYSED_ContractStop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "<GrantName>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I click on "Manage Holds" in the page details
    When I clear in modal the value from field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
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
    And I click on "Schedule Document Release" icon for "Entered" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter in modal value "50" into field "ReleaseDate__c"
    When I click modal button "Save"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Ready for Release"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "50" into field "NYSED_ContractStop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Manage Dates" in the page details
    When I enter in modal value "60" into field "NYSED_ProjectStop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PAYMENT_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I click on "Release Voucher" icon for "Ready for Release" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    #NYSED-5147 #NYSED-5150
    Then I softly see the following messages in the page details contains:
      | Voucher cannot be released because Contract Stop is currently applied on Grant layout.   |
      | Voucher cannot be released because Project Stop is currently applied on Subaward layout. |
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I clear in modal the value from field "NYSED_ContractStop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "<GrantName>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I click on "Manage Holds" in the page details
    When I clear in modal the value from field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PAYMENT_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I click on "Release Voucher" icon for "Ready for Release" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    #NYSED-5158
    Then I softly cannot see the following messages in the page details contains:
      | Voucher cannot be released because Contract Stop is currently applied on Grant layout.   |
      | Voucher cannot be released because Project Stop is currently applied on Subaward layout. |
    Then I softly see field "Status" as "Released"
    Then I softly see value "Released" for title "Status" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"

    Examples:
      | GrantName                                                 |
      | {SavedValue:Automation Runtime Announcement Direct Grant} |

  @NYSED-6518 @NYSED-Sprint-31 @US-NYSED-3524 @M05 @ExecutionPendingDueToAPITaskInProgress
  Scenario Outline: Verify that the Grantee User can see below fields are available on Reimbursement Payment Request Layout->Financials tab -> Payment Request Summary section
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "<GrantName>" into field "Title__c"
    When I enter value "FS-25" into field "NYSED_ReimbursementTemplate__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    When I navigate to "Financials" sub tab
    #NYSED-6518
    Then I softly see field "Current Obligation" inside page block
    Then I softly see field "Subaward Expenditure Paid to Date" inside page block
    Then I softly see field "Advance Balance" inside page block
    Then I softly see field "Reimbursement Balance" inside page block
    Then I softly see field "Cumulative Expenditures to Date" inside page block
    Then I softly see field "Net Expenditure Change" inside page block
    Then I softly see field "Advance Applied" inside page block
    Then I softly see field "Reimbursed Amount" inside page block
    Then I softly see field "Cash Match" inside page block
    Then I softly see field "Non-Cash Match" inside page block
    Then I softly see field "Total Match This Action" inside page block
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    #NYSED-6518
    Then I softly see field "Current Obligation" inside page block
    Then I softly see field "Subaward Expenditure Paid to Date" inside page block
    Then I softly see field "Advance Balance" inside page block
    Then I softly see field "Reimbursement Balance" inside page block
    Then I softly see field "Cumulative Expenditures to Date" inside page block
    Then I softly see field "Net Expenditure Change" inside page block
    Then I softly see field "Advance Applied" inside page block
    Then I softly see field "Reimbursed Amount" inside page block
    Then I softly see field "Cash Match" inside page block
    Then I softly see field "Non-Cash Match" inside page block
    Then I softly see field "Total Match This Action" inside page block

    Examples:
      | UserType   | GrantName                                                 | ExternalUser |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_VO   |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_LEA   |


  @NYSED-8094 @NYSED-8092 @NYSED-8095 @NYSED-Sprint-32 @US-NYSED-6247 @M05
  Scenario Outline:Verify that Internal FD user sees 'Line No.' column is displayed after Fund Year column only if voucher is related to a Contractual Grant on Document Details modal
  |Verify that Internal FD user cannot save voucher without entering 'Line No.' on Document Details modal for Contractual Grants|
  |Verify that Internal FD user sees validation message for the 'Line No.' field if it is more than 3 digits on Document Details modal for Contractual Grant|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "CONTRACTUAL_YES"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
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
    When I enter value "FS-25" into field "NYSED_ReimbursementTemplate__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I navigate to "Financials" sub tab
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category             | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 126                             | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Mark as Approved" in the page details
    Then I softly see field "Status" as "Approved"
    When I navigate to "Financials" sub tab
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    #NYSED-8094
    Then I see only the following headers in table with id "---paymentRequest:-:TransactionsTableId---" :
      | Actions | Payment Funding Account EGMS ID | Funding Account Name | Fund Year | Line No. | Blanket Voucher Cut% | Payment Split | Revised Payment Split | Withheld Amount |
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Line No. | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} |          | 126           |
    #NYSED-8092
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Line No. | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | AB2      | 126           |
    #NYSED-8095
    Then I softly see the following messages in the page details contains:
      | Line No. can consist only 3 digits. |
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Line No. | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 123      | 126           |
    Then I softly see value "123" for title "Line No." against the value "{SavedValue:fundingAccount}" inside table "---paymentRequest:-:DocumentHistoryTableId---"

    Examples:
      | GrantName                                                 |
      | {SavedValue:Automation Runtime Announcement Direct Grant} |

  @NYSED-8093 @NYSED-Sprint-32 @US-NYSED-6247 @M05
    @NYSED-7587 @NYSED-7599 @NYSED-7598 @NYSED-Sprint-31 @US-NYSED-6253 @M06
  Scenario Outline:Verify that Internal FD user does not see 'Line No.' field if the voucher is not related to a Contractual Grant on Document Details modal
  |Verify that the FD user can see that a ‘New Document’ button is added at Document History section is visible when reimbursement request is in approved state|
  |Verify that the FD user can see the validation when trying to create a new document while one document is in the created state.|
  |Verify that the FD user can see the Document inline action buttons in the Document History section when the document is in the created state.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
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
    When I enter value "FS-25" into field "NYSED_ReimbursementTemplate__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I navigate to "Financials" sub tab
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<GFStaffQue>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Mark as Approved" in the page details
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    #NYSED-7587
    Then I softly can see top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    #NYSED-8093 #NYSED-7598
    Then I see only the following headers in table with id "---paymentRequest:-:TransactionsTableId---" :
      | Actions | Payment Funding Account EGMS ID | Funding Account Name | Fund Year | Blanket Voucher Cut% | Payment Split | Revised Payment Split | Withheld Amount |
    Then I softly do not see "Line No." in flex table header "---paymentRequest:-:TransactionsTableId---"
    And I click modal button "Close"
    #NYSED-7599
    Then I softly see value "Created" for title "Status" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Cannot create a new document while another document is currently in progress. |
    And I refresh the page
    #NYSED-7598
    Then I softly can see row level action button "View" against "Voucher" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly can see row level action button "Delete" against "Voucher" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly can see row level action button "Generate Document" against "Voucher" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    And I click on "Delete" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---"

    Examples:
      | GrantName                                                 | GFStaffQue |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO         |

  @NYSED-8109 @NYSED-8104 @NYSED-8111 @NYSED-8110 @NYSED-8116 @NYSED-Sprint-32 @US-NYSED-6250 @M05 @Bug-Ticket-NYSED-8060
  Scenario Outline:Verify that Internal FD user sees Voucher Status changes to 'Void' and Payment Request status updates to 'Void' when 'Void' action is clicked on Voucher Layout
  |Verify that Internal FD user sees amounts in Award → Actuals Tab → Funding Account Information Section → Payment Split Field are reduced by amounts from Payment Request → Financials Tab|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
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
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Mark as Approved" in the page details
    Then I softly see field "Status" as "Approved"
    When I navigate to "Financials" sub tab
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
    And I click on "Release Voucher" icon for "Ready for Release" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Released"
    Then I softly see value "Released" for title "Status" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    #NYSED-8109 #NYSED-8104
    Then I softly can see row level action button "Void" against "Voucher" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see value "$126" for title "Payment Split" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see value "$112" for title "Revised Payment Split" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see value "$14" for title "Withheld Amount" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see value "$126" for title "Payment Split" inside table "---paymentRequest:-:fundingAccountTableId---"
    Then I softly see value "$112" for title "Revised Payment Split" inside table "---paymentRequest:-:fundingAccountTableId---"
    Then I softly see value "$14" for title "Withheld Amount" inside table "---paymentRequest:-:fundingAccountTableId---"
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:AutomationPermanentNewStateFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table
    And I navigate to "Related Log" sub tab
    #NYSED-8116
    Then I softly see value "$112" for title "Expenditure Paid to Date" against the value "{SavedValue:AWARD_EGMSID}" inside table "---fundingsource:-:RelatedSubawardsFATableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    Then I softly see value "$112" for title "Revised Payment Split" against the value "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table "---subAwardStandAlone:-:FundingAccountActualsTableId---"
    Then I softly see value "$126" for title "Payment Split" against the value "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table "---subAwardStandAlone:-:FundingAccountActualsTableId---"
    Then I softly see value "$14" for title "Withheld Amount" against the value "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table "---subAwardStandAlone:-:FundingAccountActualsTableId---"
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Void" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Void"
    Then I softly see value "Void" for title "Status" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see value "$126" for title "Payment Split" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see value "$112" for title "Revised Payment Split" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    Then I softly see value "$14" for title "Withheld Amount" against the value "Voucher" inside table "---paymentRequest:-:DocumentHistoryTableId---"
    #NYSED-8110
    Then I softly see value "$0" for title "Payment Split" inside table "---paymentRequest:-:fundingAccountTableId---"
    Then I softly see value "$0" for title "Revised Payment Split" inside table "---paymentRequest:-:fundingAccountTableId---"
    Then I softly see value "$0" for title "Withheld Amount" inside table "---paymentRequest:-:fundingAccountTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    #NYSED-8111
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
    #NYSED-8116
    Then I softly see value "$0" for title "Expenditure Paid to Date" against the value "{SavedValue:AWARD_EGMSID}" inside table "---fundingsource:-:RelatedSubawardsFATableId---"

    Examples:
      | GrantName                                                 |
      | {SavedValue:Automation Runtime Announcement Direct Grant} |

  @NYSED-5940 @NYSED-Sprint-33 @US-NYSED-4915 @M05
  Scenario Outline: Verify that the FD user cannot see the 'Mark as Processed' button when the Reimbursement Payment Request is in the 'Approved' state, and the Reimbursed Amount is not $0 on the Reimbursement Payment Request Layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ADVANCEPAYMENTALLOWED_YES_FORMULA_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "<GrantName>" into field "Title__c"
    When I enter value "FS-25" into field "NYSED_ReimbursementTemplate__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I navigate to "Financials" sub tab
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category             | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 126                             | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalQueueMember>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FD Username} | Step 2        |
    And I click on "Mark as Approved" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I navigate to "Financials" sub tab
    #NYSED-5940
    Then I softly see field "Reimbursed Amount" as "$126"
    Then I softly cannot see top right dropdown button "Mark as Processed" in page detail

    Examples:
      | UserType   | GrantName                                                 | InternalQueueMember |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Direct Grant} | FD                  |