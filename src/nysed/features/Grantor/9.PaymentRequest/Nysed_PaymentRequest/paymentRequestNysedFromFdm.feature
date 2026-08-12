@paymentRequestNysed
Feature: Validate all scenarios in Payment Request from fdm

  @489027 @VerifythattheInternalUserdoesnotseetheLeverageAllowedcolumninthePaymentRequestBudgettableoftheReimbursementPaymentRequest @Sprint-00 @US-487276
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" column in the 'Payment Request Budget' table of the Reimbursement Payment Request.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "<User>"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:subrecipientPendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
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
    Then I softly do not see "Other Leverage" in flex table header "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user |

  @490464 @489438 @489436 @489437 @VerifythatthesubrecipientusercanseeformsaspersequencenumbersaddedonGrantorPaymentRequestsFormspackageandsequencenumbercolumnReimbursement @Sprint-00 @US-487276 @Sprint-01 @US-487292
  Scenario Outline: Verify that the subrecipient user can see forms as per sequence numbers added on 'Grantor Payment Requests Forms' package and sequence number column - Reimbursement
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Grantor Payment Request Forms" in "---program:-:packagesTableId---" panel
    And I click on "View" icon for "Grantor Payment Request Forms" inside flex table with id "---program:-:packagesTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name                                     | Sequence Number | Is Mandatory? |
      | Request for Advance or Reimbursement - SF-270 | 5               | checked       |
    And I save the value from row "1" for column name "Sequence Number" as "SequenceNumber" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "1" for column name "Is Mandatory?" as "IsMandatory" from flex table "---program:-:packagesFormsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "<User>"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    When I re-login to "Grants Portal" app as "<SubUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:subrecipientPendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "PayreqId"
    #489438
    And I navigate to "Forms and Files" sub tab
    Then I softly see value "{SavedValue:SequenceNumber}" for title "Sequence Number" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    #489436
    Then I see only the following headers in table with id "---paymentRequest:-:paymentRequestFormsTableId---" :
      | Actions | Sequence Number | Form Name | Report Type | Mandatory | Percentage | Last Modified By | Last Modified Date |
    Then I softly see value "{SavedValue:IsMandatory}" for title "Mandatory" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    #490464
    Then I see only the following headers in table with id "---paymentRequest:-:paymentRequestFormsTableId---" :
      | Actions | Sequence Number | Form Name | Report Type | Mandatory | Percentage | Last Modified By | Last Modified Date |
    Then I softly see value "{SavedValue:SequenceNumber}" for title "Sequence Number" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I softly see value "{SavedValue:IsMandatory}" for title "Mandatory" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Grantor Payment Request Forms" in "---program:-:packagesTableId---" panel
    And I click on "View" icon for "Grantor Payment Request Forms" inside flex table with id "---program:-:packagesTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name                                     | Sequence Number | Is Mandatory? |
      | Request for Advance or Reimbursement - SF-270 | 6               | checked       |
    And I save the value from row "1" for column name "Sequence Number" as "SequenceNumber" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "1" for column name "Is Mandatory?" as "IsMandatory" from flex table "---program:-:packagesFormsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<SubUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    #489437
    Then I softly see value "{SavedValue:SequenceNumber}" for title "Sequence Number" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I see only the following headers in table with id "---paymentRequest:-:paymentRequestFormsTableId---" :
      | Actions | Sequence Number | Form Name | Report Type | Mandatory | Percentage | Last Modified By | Last Modified Date |
    Then I softly see value "{SavedValue:IsMandatory}" for title "Mandatory" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"

    Examples:
      | UserType | User               | SubUser |
      | PM       | Automation PM user | SPI1    |
#      | EXE      | Automation EXE user | SPA     |

  @491143 @VerifythattheInternalUserdoesnotseetheLeverageAllowedcolumninthePaymentRequestAdvancetableoftheAdvancesPaymentRequest @Sprint-01 @US-487975
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" column in the 'Payment Request Advance' table of the Advances Payment Request.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "<User>"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
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
#      | FD       | Automation ADMIN User |

  @491146 @VerifythattheInternalUserdoesnotseetheLeverageAllowedcolumninthePaymentRequestAdvancetableoftheAdvancesPaymentRequest @Sprint-01 @US-487975
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" column in the 'Payment Request Advance' table of the Advances Payment Request.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "<User>"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
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
    Then I softly do not see "Other Leverage" in flex table header "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType |
      | SPI1     |
#      | SPA      |

  @492830 @VerifythattheSubrecipientuserseeonlyEditactionbuttonattheReimbursementRequestpagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownCreatedReimbursementRequest @Sprint-01 @US-490341
  Scenario Outline: Verify that the Subrecipient user see only 'Edit' action button at the Reimbursement Request page layout and other record flow action buttons at page level action dropdown.- Created Reimbursement Request
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
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

  @492831 @493112 @VerifythattheInternalusercannotseeEditactionbuttonattheReimbursementRequestpagelayoutandcanseeotherrecordflowactionbuttonsatpagelevelactiondropdownSubmittedtoGrantorReimbursementRequest @Sprint-01 @US-490341
  Scenario Outline: Verify that the Internal user can not see 'Edit' action button at the Reimbursement Request page layout and can see other record flow action buttons at page level action dropdown.- Submitted to Grantor Reimbursement Request
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "<User>"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "GRANTEE_SC" user
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

  @493091 @VerifythattheSubrecipientuserseeonlyEditactionbuttonattheAdvanceRequestpagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownCreatedAdvanceRequest @Sprint-01 @US-490341
  Scenario Outline: Verify that the Subrecipient user see only 'Edit' action button at the Advance Request page layout and other record flow action buttons at page level action dropdown.- Created Advance Request
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<SubUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
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

  @493098 @493104 @VerifythattheInternalusercannotseeEditactionbuttonattheAdvanceRequestpagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownSubmittedtoGrantorAdvanceRequest @Sprint-01 @US-490341
  Scenario Outline: Verify that the Internal user can not see 'Edit' action button at the Advance Request page layout and other record flow action buttons at page level action dropdown.- Submitted to Grantor Advance Request
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "<User>"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
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
    #@493104
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

  @491455 @VerifythattheSubrecipientuserseestheFocusareanameintheformatFocusAreaAnnouncementNameinthePaymentRequestBudgettableoftheReimbursementreqwhentheAnnouncementsiscreatedwiththeFocusAreaRequiredismarkedasNo @Sprint-01 @US-487306
  Scenario Outline: Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: Announcement Name" in the Payment Request Budget table of the Reimbursement req when the Announcements is created with the Focus Area Required? is marked as "No"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FIRST_BUDGET_CATEGORY_NO_FOCUS_AREA"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
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
    Then I softly see field "Status" as "Created"
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType |
      | SPI1     |
#      | SPA      |

  @492563 @VerifythattheSubrecipientuserseestheFocusareanameintheformatFocusAreaFocusAreaNameinthePaymentRequestBudgettableoftheReimbursementreqwhentheAnnouncementsiscreatedwiththeFocusAreaRequiredismarkedasYes @Sprint-01 @US-487306
  Scenario Outline: Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: <Focus Area Name>" in the Payment Request Budget table of the Reimbursement req when the Announcements is created with the Focus Area Required? is marked as "Yes"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
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
    Then I softly see field "Status" as "Created"
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType |
      | SPI1     |
#      | SPA      |

  @491456 @VerifythattheSubrecipientuserseestheFocusareanameintheformatFocusAreaAnnouncementNameinthePaymentRequestBudgettableoftheReimbursementreqwhentheAnnouncementsiscreatedwiththeFocusAreaRequiredismarkedasNo @Sprint-01 @US-487306
  Scenario Outline: Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: Announcement Name" in the Payment Request Budget table of the Reimbursement req when the Announcements is created with the Focus Area Required? is marked as "No"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_FOCUS_AREA_NO-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FIRST_BUDGET_CATEGORY_NO_FOCUS_AREA"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "<User>"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:subrecipientPendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO  user   |

  @492564 @VerifythattheInternaluserseestheFocusareanameintheformatFocusAreaFocusAreaNameinthePaymentRequestBudgettableoftheReimbursementreqwhentheAnnouncementsiscreatedwiththeFocusAreaRequiredismarkedasYes @Sprint-01 @US-487306
  Scenario Outline: Verify that the Internal user sees the Focus area name in the format "Focus Area: <Focus Area Name>" in the Payment Request Budget table of the Reimbursement req when the Announcements is created with the Focus Area Required? is marked as "Yes"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_FOCUS_AREA-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "<User>"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:subrecipientPendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO  user   |

  @491457 @VerifythattheSubrecipientuserseestheFocusareanameintheformatFocusAreaAnnouncementNameinthePaymentRequestAdvancetableoftheAdvancereqwhentheAnnouncementsiscreatedwiththeFocusAreaRequireismarkedasNo @Sprint-01 @US-487306
  Scenario Outline: Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: Announcement Name" in the Payment Request Advance table of the Advance req when the Announcements is created with the Focus Area Required? is marked as "No"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---paymentRequest:-:budgetTableId---"

    Examples:
      | UserType |
      | SPI1     |
#      | SPA      |

  @491458 @VerifythattheInternaluserseestheFocusareanameintheformatFocusAreaAnnouncementNameinthePaymentRequestAdvancetableoftheAdvancereqwhentheAnnouncementsiscreatedwiththeFocusAreaRequiredismarkedasNo @Sprint-01 @US-490341
  Scenario Outline: Verify that the Internal user sees the Focus area name in the format "Focus Area: Announcement Name" in the Payment Request Advance table of the Advance req when the Announcements is created with the Focus Area Required? is marked as "No"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "<User>"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
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
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---paymentRequest:-:budgetTableId---"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Advances" content inside "Payments" subheader on left panel
    When I click toggle button to select "Advances - All"
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:subrecipientPaymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:subrecipientPaymentrequestAdvancesTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---paymentRequest:-:budgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO  user   |

  @489434 @489433 @VerifythattheSubrecipientusercanseeformssequencingisupdatedifwechangesequencingafteradvancerequestcreationAdvanceRequest @Sprint-01 @US-487292
  Scenario Outline: Verify that the Subrecipient user can see forms sequencing is updated, if we change sequencing after advance request creation - Advance Request
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Grantor Payment Request Forms" in "---program:-:packagesTableId---" panel
    And I click on "View" icon for "Grantor Payment Request Forms" inside flex table with id "---program:-:packagesTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name                                     | Sequence Number | Is Mandatory? |
      | Request for Advance or Reimbursement - SF-270 | 5               | checked       |
    And I save the value from row "1" for column name "Sequence Number" as "SequenceNumber" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "1" for column name "Is Mandatory?" as "IsMandatory" from flex table "---program:-:packagesFormsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    When I re-login to "Grants Portal" app as "<SubUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
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
    And I navigate to "Forms and Files" sub tab
    #@489433
    Then I softly see value "{SavedValue:SequenceNumber}" for title "Sequence Number" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I see only the following headers in table with id "---paymentRequest:-:paymentRequestFormsTableId---" :
      | Actions | Sequence Number | Form Name | Report Type | Mandatory | Percentage | Last Modified By | Last Modified Date |
    Then I softly see value "{SavedValue:IsMandatory}" for title "Mandatory" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Grantor Payment Request Forms" in "---program:-:packagesTableId---" panel
    And I click on "View" icon for "Grantor Payment Request Forms" inside flex table with id "---program:-:packagesTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name                                     | Sequence Number | Is Mandatory? |
      | Request for Advance or Reimbursement - SF-270 | 6               | checked       |
    And I save the value from row "1" for column name "Sequence Number" as "SequenceNumber1" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "1" for column name "Is Mandatory?" as "IsMandatory1" from flex table "---program:-:packagesFormsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<SubUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Advances" content inside "Payments" subheader on left panel
    When I click toggle button to select "Advances - All"
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:subrecipientPaymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:subrecipientPaymentrequestAdvancesTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    #489434
    Then I softly see value "{SavedValue:SequenceNumber1}" for title "Sequence Number" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I see only the following headers in table with id "---paymentRequest:-:paymentRequestFormsTableId---" :
      | Actions | Sequence Number | Form Name | Report Type | Mandatory | Percentage | Last Modified By | Last Modified Date |
    Then I softly see value "{SavedValue:IsMandatory1}" for title "Mandatory" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"

    Examples:
      | SubUser |
      | SPI1    |
#      | SPA     |

  @499286 @VerifythattheInternalUserdoesnotseetheLeverageAllowedcolumninthePaymentRequestBudgettableoftheReimbursementPaymentRequest @Sprint-00 @US-487276
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" column in the 'Payment Request Budget' table of the Reimbursement Payment Request.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "<User>"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:subrecipientPendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
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
    Then I softly do not see "Other Leverage" in flex table header "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user |

  @503364 @503366 @Sprint-05 @US-499231
  Scenario Outline: Verify that the Grantee User should not see detail budget on reimbursement request - Created state
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<SubUser>" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:subrecipientPendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Edit" icon for "Administrative and legal expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see field "Spent This Action" is not editable
    Then I softly see field "Advance Applied This Action" is not editable
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I click on "Edit" icon for "Architectural and engineering fees" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see field "Spent This Action" is not editable
    Then I softly see field "Advance Applied This Action" is not editable
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I click on "Edit" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see fields "RequestedExpense__c" is in edit mode
    Then I softly see fields "AdvanceApplied__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I click on "Edit" icon for "Contingencies" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see fields "RequestedExpense__c" is in edit mode
    Then I softly see fields "AdvanceApplied__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I click on "Edit" icon for "Equipment" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see fields "RequestedExpense__c" is in edit mode
    Then I softly see fields "AdvanceApplied__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I click on "Edit" icon for "Indirect costs" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see fields "RequestedExpense__c" is in edit mode
    Then I softly see fields "AdvanceApplied__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I click on "Edit" icon for "Miscellaneous" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see fields "RequestedExpense__c" is in edit mode
    Then I softly see fields "AdvanceApplied__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I click on "Edit" icon for "Project inspection fees" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see fields "RequestedExpense__c" is in edit mode
    Then I softly see fields "AdvanceApplied__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 10                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FO Username} | Step 1        |
    And I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "<SubUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:subrecipientPendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    #503366
    And I navigate to "Financials" sub tab
    When I click on "Edit" icon for "Administrative and legal expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see field "Spent This Action" is not editable
    Then I softly see field "Advance Applied This Action" is not editable
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I click on "Edit" icon for "Architectural and engineering fees" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see field "Spent This Action" is not editable
    Then I softly see field "Advance Applied This Action" is not editable
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I click on "Edit" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see fields "RequestedExpense__c" is in edit mode
    Then I softly see fields "AdvanceApplied__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I click on "Edit" icon for "Contingencies" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see fields "RequestedExpense__c" is in edit mode
    Then I softly see fields "AdvanceApplied__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I click on "Edit" icon for "Equipment" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see fields "RequestedExpense__c" is in edit mode
    Then I softly see fields "AdvanceApplied__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I click on "Edit" icon for "Indirect costs" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see fields "RequestedExpense__c" is in edit mode
    Then I softly see fields "AdvanceApplied__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I click on "Edit" icon for "Miscellaneous" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see fields "RequestedExpense__c" is in edit mode
    Then I softly see fields "AdvanceApplied__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I click on "Edit" icon for "Project inspection fees" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Add Line Items" opens in overLay window
    Then I softly see fields "RequestedExpense__c" is in edit mode
    Then I softly see fields "AdvanceApplied__c" is in edit mode

    Examples:
      | SubUser |
      | SPI1    |
#      | SPA     |


  @NYSED-6351 @NYSEDSprint-30 @US-NYSED-2983 @M05 @santosh
  Scenario Outline:Verify that the Grantee User can see below fields are available on Reimbursement Payment Request Layout->Overview tab -> General Information section
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Grant}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "<Announcement Name>" into field "Title__c"
    When I enter value "FS-25" into field "NYSED_ReimbursementTemplate__c"
    #NYSED-6351
    Then I see only the following ordered options in dropdown field "NYSED_ReimbursementTemplate__c" :
      | --None-- | FS-25 | FS-10F |
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    #NYSED-6351
    Then I softly see field "Title" inside page block
    Then I see only the following ordered options in dropdown field "NYSED_ReportingYear__c" :
      | --None-- | 1990 | 1991 | 1992 | 1993 | 1994 | 1995 | 1996 | 1997 | 1998 | 1999 | 2000 | 2001 | 2002 | 2003 | 2004 | 2005 | 2006 | 2007 | 2008 | 2009 | 2010 | 2011 | 2012 | 2013 | 2014 | 2015 | 2016 | 2017 | 2018 | 2019 | 2020 | 2021 | 2022 | 2023 | 2024 | 2025 | 2026 | 2027 | 2028 | 2029 | 2030 | 2031 | 2032 | 2033 | 2034 | 2035 | 2036 | 2037 | 2038 | 2039 | 2040 | 2041 | 2042 | 2043 | 2044 | 2045 | 2046 | 2047 | 2048 | 2049 | 2050 | 2051 | 2052 | 2053 | 2054 | 2055 | 2056 | 2057 | 2058 | 2059 | 2060 | 2061 | 2062 | 2063 | 2064 | 2065 | 2066 | 2067 | 2068 | 2069 | 2070 | 2071 | 2072 | 2073 | 2074 | 2075 |
    Then I see only the following ordered options in dropdown field "NYSED_ReportingMonth__c" :
      | --None-- | 01 | 02 | 03 | 04 | 05 | 06 | 07 | 08 | 09 | 10 | 11 | 12 |
    When I enter value "01" into field "NYSED_ReportingMonth__c"
    When I enter value "1990" into field "NYSED_ReportingMonth__c"
    Then I softly see that "MIR Date" rendered in view mode only
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    #NYSED-6351
    Then I softly see field "Reporting Month" as "01"
    Then I softly see field "Reporting Year" as "1990"
    Then I softly see field "Subrecipient Organization" inside page block
    Then I softly see field "Type" inside page block
    Then I softly see field "Reimbursement Template" inside page block
    Then I softly see field "Reimbursement Template" added after "Type"
    Then I softly see field "Reimbursement Template" as "FS-10F"
    Then I softly see field "SED Code" inside page block
    Then I softly see field "SED Code" added after "Reimbursement Template"
    And I click on hyperlink containing value "{SavedValue:SubrecipientOrg}"
    And I wait for "4" seconds
    And I save the field labeled "SED Code" as "SEDCode"
    And I navigate to "Grants" tab
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "Fund Year" as "FundYear"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I save the field labeled "Project ID" as "ProjectID"
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-6351
    Then I softly see field "SED Code" as "{SavedValue:SEDCode}"
    Then I softly see field "Remittance address" inside page block
    Then I softly see field "Creating for" inside page block
    Then I softly see field "Creating for" as "Self"
    Then I softly see field "Creating for" as "Self"
    Then I softly see field "Creating for" inside page block
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Not For Profit" inside page block
    Then I softly see field "Fund Year" added after "Not For Profit"
    Then I softly see field "Project ID" added after "Fund Year"
    Then I softly see field "Fund Year" as "{SavedValue:FundYear}"
    Then I softly see field "Project ID" as "{SavedValue:ProjectID}"
    Then I softly see field "Reporting Month" added after "Project ID"
    Then I softly see field "Reporting Year" added after "Reporting Month"
    Then I softly see field "Reporting Period" added after "Reporting Year"
    Then I softly see field "MIR Date" added after "Reporting Period"
    Then I softly see field "Submission Date" added after "MIR Date"
    Then I softly see field "Login Date" added after "Submission Date"
    Then I softly see field "Approval Date" added after "Login Date"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Reporting Month" as "01"
    Then I softly see field "Reporting Year" as "1990"
    Then I softly see field "Subrecipient Organization" inside page block
    Then I softly see field "Type" inside page block
    Then I softly see field "Reimbursement Template" inside page block
    Then I softly see field "Reimbursement Template" added after "Type"
    Then I softly see field "Reimbursement Template" as "FS-10F"
    Then I softly see field "SED Code" inside page block
    Then I softly see field "SED Code" added after "Reimbursement Template"
    Then I softly see field "SED Code" as "{SavedValue:SEDCode}"
    Then I softly see field "Remittance address" inside page block
    Then I softly see field "Creating for" inside page block
    Then I softly see field "Creating for" as "Self"
    Then I softly see field "Creating for" as "Self"
    Then I softly see field "Creating for" inside page block
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Not For Profit" inside page block
    Then I softly see field "Fund Year" added after "Not For Profit"
    Then I softly see field "Project ID" added after "Fund Year"
    Then I softly see field "Fund Year" as "{SavedValue:FundYear}"
    Then I softly see field "Project ID" as "{SavedValue:ProjectID}"
    Then I softly see field "Reporting Month" added after "Project ID"
    Then I softly see field "Reporting Year" added after "Reporting Month"
    Then I softly see field "Reporting Period" added after "Reporting Year"
    Then I softly see field "MIR Date" added after "Reporting Period"
    Then I softly see field "Submission Date" added after "MIR Date"
    Then I softly see field "Login Date" added after "Submission Date"
    Then I softly see field "Approval Date" added after "Login Date"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Reporting Month" as "01"
    Then I softly see field "Reporting Year" as "1990"
    Then I softly see field "Subrecipient Organization" inside page block
    Then I softly see field "Type" inside page block
    Then I softly see field "Reimbursement Template" inside page block
    Then I softly see field "Reimbursement Template" added after "Type"
    Then I softly see field "Reimbursement Template" as "FS-10F"
    Then I softly see field "SED Code" inside page block
    Then I softly see field "SED Code" added after "Reimbursement Template"
    Then I softly see field "SED Code" as "{SavedValue:SEDCode}"
    Then I softly see field "Remittance address" inside page block
    Then I softly see field "Creating for" inside page block
    Then I softly see field "Creating for" as "Self"
    Then I softly see field "Creating for" as "Self"
    Then I softly see field "Creating for" inside page block
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Not For Profit" inside page block
    Then I softly see field "Fund Year" added after "Not For Profit"
    Then I softly see field "Project ID" added after "Fund Year"
    Then I softly see field "Fund Year" as "{SavedValue:FundYear}"
    Then I softly see field "Project ID" as "{SavedValue:ProjectID}"
    Then I softly see field "Reporting Month" added after "Project ID"
    Then I softly see field "Reporting Year" added after "Reporting Month"
    Then I softly see field "Reporting Period" added after "Reporting Year"
    Then I softly see field "MIR Date" added after "Reporting Period"
    Then I softly see field "Submission Date" added after "MIR Date"
    Then I softly see field "Login Date" added after "Submission Date"
    Then I softly see field "Approval Date" added after "Login Date"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Reporting Month" as "01"
    Then I softly see field "Reporting Year" as "1990"
    Then I softly see field "Subrecipient Organization" inside page block
    Then I softly see field "Type" inside page block
    Then I softly see field "Reimbursement Template" inside page block
    Then I softly see field "Reimbursement Template" added after "Type"
    Then I softly see field "Reimbursement Template" as "FS-10F"
    Then I softly see field "SED Code" inside page block
    Then I softly see field "SED Code" added after "Reimbursement Template"
    Then I softly see field "SED Code" as "{SavedValue:SEDCode}"
    Then I softly see field "Remittance address" inside page block
    Then I softly see field "Creating for" inside page block
    Then I softly see field "Creating for" as "Self"
    Then I softly see field "Creating for" as "Self"
    Then I softly see field "Creating for" inside page block
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Not For Profit" inside page block
    Then I softly see field "Fund Year" added after "Not For Profit"
    Then I softly see field "Project ID" added after "Fund Year"
    Then I softly see field "Fund Year" as "{SavedValue:FundYear}"
    Then I softly see field "Project ID" as "{SavedValue:ProjectID}"
    Then I softly see field "Reporting Month" added after "Project ID"
    Then I softly see field "Reporting Year" added after "Reporting Month"
    Then I softly see field "Reporting Period" added after "Reporting Year"
    Then I softly see field "MIR Date" added after "Reporting Period"
    Then I softly see field "Submission Date" added after "MIR Date"
    Then I softly see field "Login Date" added after "Submission Date"
    Then I softly see field "Approval Date" added after "Login Date"

    Examples:
      | UserType   | Announcement Name                         |
      | GRANTEE_SC | {SavedValue:Automation Runtime FDM Grant} |

  @NYSED-6379 @NYSED-6381 @NYSED-6380 @NYSEDSprint-30 @US-NYSED-2983 @M05 @santosh
  Scenario Outline:Verify that the Grantee User can see 'Payment Details' Section is hidden on Reimbursement Payment Request Layout->Overview tab and 'Program Income Tracking' Section is hidden on Reimbursement Payment Request Layout->Financials tab
  |Verify that the Grantee User can see 'Acknowledgement' Section is editable to only Submit and Certify Role User and not editable for any other role user|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Grant}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
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
    And I wait for "4" seconds
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    #NYSED-6379
    Then I softly cannot see page block "Payment Details"
    Then I see only the following ordered page blocks :
      | General Information |
      | System Information  |
    When I navigate to "Financials" sub tab
    Then I softly cannot see page block "Program Income Tracking"
    Then I see only the following ordered page blocks :
      | Burn Rate               |
      | Payment Request Summary |
      | Payment Request Budget  |
      | Acknowledgement         |
    When I navigate to "Financials" sub tab
    #NYSED-6380
    Then I softly see the text containing "I certify that the cost outlined in this payment request is permissible per the terms defined in the Grant Award Notice. Furthermore, I affirm that the information contained herein is to the best of my knowledge and belief, accurate and complete. "
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    #NYSED-6381
    Then I softly see fields "TermsAgreement__c" is in edit mode
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    #NYSED-6381
    Then I softly see that "Acknowledgement" rendered in view mode only
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    #NYSED-6381
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    #NYSED-6381
    Then I softly cannot see top right button "Edit" in page detail

    Examples:
      | UserType   | Announcement Name                         |
      | GRANTEE_SC | {SavedValue:Automation Runtime FDM Grant} |

  @NYSED-6400 @NYSEDSprint-30 @US-NYSED-2983 @M05 @santosh
  Scenario Outline:Verify that Grantee User can see Inline action ‘Attach’ is only visible to the user with 'Create and Edit' or 'Submit and Certify' role under 'Supporting Document Checklist' Section of 'Forms and Files' Tab of Reimbursement Payment Request
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Grant}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
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
    And I wait for "4" seconds
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    When I navigate to "Forms and Files" sub tab
    #NYSED-6400
    Then I softly can see row level action button "Attach" against "Reimbursement Request" in flex table with id "---paymentRequest:-:checklistTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    #NYSED-6400
    Then I softly can see row level action button "Attach" against "Reimbursement Request" in flex table with id "---paymentRequest:-:checklistTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    #NYSED-6400
    Then I softly cannot see row level action button "Attach" against "Reimbursement Request" in flex table with id "---paymentRequest:-:checklistTableId---"
    Then I softly can see row level action button "No Actions Available" against "Reimbursement Request" in flex table with id "---paymentRequest:-:checklistTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    #NYSED-6400
    Then I softly cannot see row level action button "Attach" against "Reimbursement Request" in flex table with id "---paymentRequest:-:checklistTableId---"
    Then I softly can see row level action button "No Actions Available" against "Reimbursement Request" in flex table with id "---paymentRequest:-:checklistTableId---"

    Examples:
      | UserType   | Announcement Name                         |
      | GRANTEE_SC | {SavedValue:Automation Runtime FDM Grant} |

  @NYSED-6493 @NYSED-Sprint-30 @US-NYSED-2983 @M05 @Bug-Ticket-NYSED-7800
  Scenario Outline:Verify that the Grantee User can see 'Creating for' and 'Child Organization' field is available on Reimbursement Request Layout->Overview tab -> General Info section only when 'Creating for' is selected 'On behalf of' on App in case of standard Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ADVANCEPAYMENTALLOWED_YES_FORMULA_BA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Grant}"
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
    #NYSED-6493
    Then I softly see "Creating for" inside page block detail
    Then I softly see "Child Organization" inside page block detail
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    #NYSED-6493
    Then I softly see "Creating for" inside page block detail
    Then I softly see "Child Organization" inside page block detail

    Examples:
      | UserType   | GrantName                                 | ExternalUser |
      | GRANTEE_SC | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_CE   |
#      | GRANTEE_SC | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_VO   |
#      | GRANTEE_SC | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_LEA   |

  @NYSED-9159 @NYSED-Sprint-33 @US-NYSED-5798
  Scenario Outline:Verify that Internal Profile User see 'New' button is not available when Budget Type is selected as 'Lump Sum' on Related Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "LUMPSUM_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    #NYSED-9159
    Then I softly can see top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    #NYSED-9159
    Then I softly can see top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    #NYSED-9159
    Then I softly can see top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    #NYSED-9159
    Then I softly can see top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"

    Examples:
      | GrantName                                 | InternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | FD           |

  @NYSED-9158 @NYSED-Sprint-33 @US-NYSED-5798
  Scenario Outline:Verify that Internal Profile User see "Scope of Work Change" Type is Hidden on Create Amendment Request Modal
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    #NYSED-9159
    Then I softly do not see multipicklist field "InternalAmendmentType__c" contains value "Scope of Work Change" under list

    Examples:
      | GrantName                                 | InternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | FD           |
      | {SavedValue:Automation Runtime FDM Grant} | FO           |
      | {SavedValue:Automation Runtime FDM Grant} | PM           |
      | {SavedValue:Automation Runtime FDM Grant} | PO           |