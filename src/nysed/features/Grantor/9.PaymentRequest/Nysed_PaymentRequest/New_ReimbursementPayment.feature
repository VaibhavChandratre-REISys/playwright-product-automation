@paymentRequestNysed @ReimbursementPaymentRequestFromStandardGrant
Feature: Validate all scenarios in  Reimbursement Payment Request from Standard Grant

  @NYSED-8379 @NYSED-8380 @NYSED-8384 @NYSED-Sprint-32 @US-NYSED-3004 @M07
  Scenario Outline:Verify that Grantee User can see the 'View/Add Line Item Details'. inline action on the Reimbursement Payment Request layout -> Financials tab -> Payment Request Budget section -> Budget Categories table for 'Travel Expenses' category
  |Verify that the Grantee User can create/update/delete details under the budget category - 'Travel Expenses' when the Reimbursement Payment Request is in the Created state.|
  |Verify that Grantee Users, apart from Submit and Certify & Create and Edit roles, cannot create/update/delete details under the budget category - 'Travel Expenses'.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT_MATCH_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-8379
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I see only the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
    #NYSED-8380
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    Then I softly see "Saved Successfully!" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "Edit" :
      | Position of Traveler | Name of Traveler | Destination     | Purpose     | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH)     | Expenditure |
      | Position Title       | Tester           | New Destination | New Purpose | Bus                             | New Calculation     | New Check or Journal Entry (No ACH) | 200         |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination     | Purpose     | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH)     | Expenditure |
      | Action menu | 8 MAY 2026      | Position Title       | Tester           | New Destination | New Purpose | Bus                             | New Calculation     | New Check or Journal Entry (No ACH) | $200        |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    #NYSED-8384
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-8384
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8382 @NYSED-Sprint-32 @US-NYSED-3004 @M07
  Scenario Outline: Verify that the Grantee User can create/update/delete details under the budget category - 'Travel Expenses' when the Reimbursement Payment Request is in the Send Back to Subrecipient state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT_MATCH_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination  | Purpose  | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 10 MAY 2026     | Position Title1      | Automation test1 | Destination1 | Purpose1 | Air                             | Calculation1        | Check or Journal Entry (No ACH) | 100         |
    And I click modal button "Close"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I click on "Send Back to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I see only the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    Then I softly see "Saved Successfully!" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "Edit" :
      | Position of Traveler | Name of Traveler | Destination     | Purpose     | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH)     | Expenditure |
      | Position Title       | Tester           | New Destination | New Purpose | Bus                             | New Calculation     | New Check or Journal Entry (No ACH) | 200         |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination     | Purpose     | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH)     | Expenditure |
      | Action menu | 8 MAY 2026      | Position Title       | Tester           | New Destination | New Purpose | Bus                             | New Calculation     | New Check or Journal Entry (No ACH) | $200        |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |

  @NYSED-8386 @NYSED-8389 @NYSED-8390 @NYSED-8391 @NYSED-8392 @NYSED-8394 @NYSED-8396 @NYSED-8399 @NYSED-Sprint-32 @US-NYSED-3004 @M07
  Scenario Outline: Verify that the Grantee user sees Travel Expenses, Budget Categories modal, having a 'Dates of Travel' column (Editable, Blank for new row, short text with 255 Character and Required)
  |Verify that the Grantee user sees Travel Expenses, Budget Categories modal, having a 'Position of Traveler' column (Editable, Blank for new row, short text with 255 Character and Required)|
  |Verify that the Grantee user sees Travel Expenses, Budget Categories modal, having a 'Name of Traveler' column (Editable, Blank for new row, short text with 255 Character and Required)|
  |Verify that the Grantee user sees Travel Expenses, Budget Categories modal, having a 'Destination' column (Editable, Blank for new row, short text with 255 Character and Required)|
  |Verify that the Grantee user sees Travel Expenses, Budget Categories modal, having a 'Purpose' column (Editable, Blank for new row, short text with 255 Character and Required)|
  |Verify that the Grantee user sees Travel Expenses, Budget Categories modal, having a 'Type (Air, Bus, Train, Mileage)' column (Editable, Blank for new row, short text with 255 Character and Required)|
  |Verify that the Grantee user sees Travel Expenses, Budget Categories modal, having a 'Calculation of Cost' column (Editable, Blank for new row, short text with 255 Character and Required)|
  |Verify that the Grantee user sees Travel Expenses, Budget Categories modal, having a 'Check or Journal Entry (No ACH)' column (Editable, Blank for new row, Short text 255 Character and Required)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT_MATCH_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I wait for "2" seconds
    #NYSED-8386
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      |                 | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel             | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | ---AUTOEnvData:-:Char256--- | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    Then I softly see "Saved Successfully!" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Dates of Travel" against the value "Position Title" inside table "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "Edit" :
      | Position of Traveler | Dates of Travel |
      | Position Title       | 20 MAY 2026     |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | Action menu | 20 MAY 2026     | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-8389
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      |                      | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler        | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | ---AUTOEnvData:-:Char256--- | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    Then I softly see "Saved Successfully!" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Position of Traveler" against the value "Automation test" inside table "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "Edit" :
      | Dates of Travel | Position of Traveler |
      | 8 MAY 2026      | New Position Title   |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | Action menu | 8 MAY 2026      | New Position Title   | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        |
    And I click on "Delete" icon for "New Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
 #NYSED-8390
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       |                  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler            | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | ---AUTOEnvData:-:Char256--- | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    Then I softly see "Saved Successfully!" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Name of Traveler" against the value "Position Title" inside table "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "Edit" :
      | Dates of Travel | Name of Traveler    |
      | 8 MAY 2026      | New Automation test |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler    | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | Action menu | 8 MAY 2026      | Position Title       | New Automation test | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-8391
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  |             | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination                 | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  | ---AUTOEnvData:-:Char256--- | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    Then I softly see "Saved Successfully!" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Destination" against the value "Position Title" inside table "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "Edit" :
      | Dates of Travel | Destination     |
      | 8 MAY 2026      | New Destination |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination     | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | New Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-8392
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination |         | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose                     | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | ---AUTOEnvData:-:Char256--- | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    Then I softly see "Saved Successfully!" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Purpose" against the value "Position Title" inside table "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "Edit" :
      | Dates of Travel | Purpose     |
      | 8 MAY 2026      | New Purpose |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose     | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | New Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
#NYSED-8394
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose |                                 | Calculation         | Check or Journal Entry (No ACH) | 100         |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | ---AUTOEnvData:-:Char256---     | Calculation         | Check or Journal Entry (No ACH) | 100         |
    Then I softly see "Saved Successfully!" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Type (Air, Bus, Train, Mileage)" against the value "Position Title" inside table "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "Edit" :
      | Dates of Travel | Type (Air, Bus, Train, Mileage) |
      | 8 MAY 2026      | Bus                             |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Bus                             | Calculation         | Check or Journal Entry (No ACH) | $100        |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
  #NYSED-8396
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             |                     | Check or Journal Entry (No ACH) | 100         |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost         | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | ---AUTOEnvData:-:Char256--- | Check or Journal Entry (No ACH) | 100         |
    Then I softly see "Saved Successfully!" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Calculation of Cost" against the value "Position Title" inside table "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "Edit" :
      | Dates of Travel | Calculation of Cost |
      | 8 MAY 2026      | New Calculation     |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | New Calculation     | Check or Journal Entry (No ACH) | $100        |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
#NYSED-8399
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         |                                 | 100         |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | ---AUTOEnvData:-:Char256---     | 100         |
    Then I softly see "Saved Successfully!" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Check or Journal Entry (No ACH)" against the value "Position Title" inside table "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "Edit" :
      | Dates of Travel | Check or Journal Entry (No ACH) |
      | 8 MAY 2026      | New Check or Journal Entry      |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | New Check or Journal Entry      | $100        |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8402 @NYSED-8403 @NYSED-Sprint-32 @US-NYSED-3004 @M07
  Scenario Outline: Verify that the Grantee user sees Travel Expenses, Budget Categories modal, having a 'Expenditure' column (Editable, Required, Currency Field without decimals, cannot be negative cannot be 0 and Blank for new row)
  |Verify that the Grantee user sees Travel Expenses, Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns (Editable, Optional, Currency Field without decimal places, negative not allowed, and $0 for new row)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I wait for "2" seconds
    #NYSED-8386
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) |             | 10         | 10             |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | @ee#mm      | 10         | 10             |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | -100        | 10         | 10             |
    Then I softly see the following messages in the page details contains:
      | Expenditure cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 10.20       | 10         | 10             |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $1,020      | $10        | $10            | $20         |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "Edit" :
      | Dates of Travel | Expenditure |
      | 8 MAY 2026      | 30          |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $30         | $10        | $10            | $20         |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-8403-Cash Match
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        | $0         | $0             | $0          |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         | @ee#mm     | 10             |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         | -10        | 10             |
    Then I softly see the following messages in the page details contains:
      | Cash Match cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         | 10.20      | 10             |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        | $1,020     | $10            | $1,030      |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "Edit" :
      | Dates of Travel | Cash Match |
      | 8 MAY 2026      | 30         |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        | $30        | $10            | $40         |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-8403-Non-Cash Match
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        | $0         | $0             | $0          |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         | 10         | @ee#mm         |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         | 10         | -10            |
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         | 10         | 10.20          |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        | $10        | $1,020         | $1,030      |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "Edit" :
      | Dates of Travel | Non-Cash Match |
      | 8 MAY 2026      | 30             |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        | $10        | $30            | $40         |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8404 @NYSED-Sprint-32 @US-NYSED-3004 @M07
  Scenario Outline: Verify that the Grantee User can add/update/delete details under budget category 'Travel Expenses', then the following roll-up sum takes place.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         | 20         | 20             |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | 9 MAY 2026      | Position Title1      | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         | 40         | 40             |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        | $20        | $20            | $40         |
      | Action menu | 9 MAY 2026      | Position Title1      | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        | $40        | $40            | $80         |
      |             |                 |                      |                  |             |         |                                 |                     |                                 | $200        | $60        | $60            | $120        |
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "Edit" :
      | Dates of Travel | Cash Match | Non-Cash Match |
      | 8 MAY 2026      | 30         | 30             |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 9 MAY 2026      | Position Title1      | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        | $40        | $40            | $80         |
      | Action menu | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        | $30        | $30            | $60         |
      |             |                 |                      |                  |             |         |                                 |                     |                                 | $200        | $70        | $70            | $140        |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions     | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 9 MAY 2026      | Position Title1      | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | $100        | $40        | $40            | $80         |
      |             |                 |                      |                  |             |         |                                 |                     |                                 | $100        | $40        | $40            | $80         |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentRequestBudgetTableId---" :
      | Actions     | Budget Category                              | Budget Category Code | Awarded Budget | Subaward Expenditure Paid to Date | Subaward Balance | Cumulative Expenditures to Date | Net Expenditure Change | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Travel Expenses                              | 46                   | $0             | $0                                | $0               | $100                            | $100                   | $40        | $40            | $80         |
      |             | Focus Area : Automation Permanent Focus Area |                      | $1,000         | $0                                | $1,000           | $100                            | $100                   | $40        | $40            | $80         |
      |             | Total                                        |                      | $1,000         | $0                                | $1,000           | $100                            | $100                   | $40        | $40            | $80         |
      |             | Grand Total                                  |                      | $1,000         | $0                                | $1,000           | $100                            | $100                   | $40        | $40            | $80         |
    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8409 @NYSED-Sprint-32 @US-NYSED-3004 @M07
  Scenario Outline: Verify that users (Internal and Grantee) cannot see Cash Match and Non-Cash Match columns if Subrecipient Match is set as No on the announcement: 'Travel Expenses'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT_MATCH_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" :
      | Actions | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PM           |

  @NYSED-8407 @NYSED-8408 @NYSED-Sprint-32 @US-NYSED-3004 @M07
  Scenario Outline: Verify that the Grantee User cannot create/update/delete details under the budget category - 'Travel Expenses' when the Reimbursement Payment Request is not in the Created OR Send back to Subrecipient state.
  |Verify that the Internal User can see the 'View/Add Line Item Details' inline action and cannot add/update/delete the added budget under the budget category 'Travel Expenses'.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---" by clicking "New" :
      | Dates of Travel | Position of Traveler | Name of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | 8 MAY 2026      | Position Title       | Automation test  | Destination | Purpose | Air                             | Calculation         | Check or Journal Entry (No ACH) | 100         | 20         | 20             |
    And I click modal button "Close"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    #NYSED-8407
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    #NYSED-8408
    And I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---paymentRequest:-:PRTravelExpensesLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |

  @NYSED-8410 @NYSED-Sprint-32 @US-NYSED-3004 @M07
    @NYSED-8239 @NYSED-Sprint-32 @US-NYSED-3002 @M07
  Scenario Outline: Verify that users (Internal and Grantee) cannot see the 'View/Add Line Item Details'. inline action on the Reimbursement Payment Request layout -> Budget Categories table, if the 'Reimbursement Template' is selected as FS-25
  |Verify that users (Internal and Grantee) cannot see the 'View/Add Line Item Details'.  inline action on the Reimbursement Payment Request layout -> Budget Categories table, if the 'Reimbursement Template' is selected as FS-25|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category             | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 126                             | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    #NYSED-8410
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    #NYSED-8239
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | FO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |

  @NYSED-8417 @NYSED-8418 @NYSED-8419 @NYSED-8420 @NYSED-Sprint-32 @US-NYSED-3007 @M07
  Scenario Outline:Verify that Grantee User can see the 'View/Add Line Item Details'. inline action on the Reimbursement Payment Request layout -> Financials tab -> Payment Request Budget section -> Budget Categories table for BOCES Purchased Services Category
  |Verify that the Grantee User can create/update/delete details under the budget category - 'BOCES Purchased Services' when the Reimbursement Payment Request is in the Created state.|
  |Verify that the Grantee User can create/update/delete details under the budget category - 'BOCES Purchased Services' when the Reimbursement Payment Request is in the Send Back to Subrecipient state.|
  |Verify that Grantee Users, apart from Submit and Certify & Create and Edit roles, cannot create/update/delete details under the budget category - 'BOCES Purchased Services'|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-8417
    Then I softly see the text containing "Budget Category : BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Then I see only the following headers in table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" :
      | Actions | Encumbrance Date | Description of Item/Service | Name of BOCES | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
    #NYSED-8418 #NYSED-8419
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES   | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Position Title              | Automation test | 200                 | Purpose                         | 100         | 100        | 100            |
    Then I softly see "Saved Successfully!" inside flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES   | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | 5/8/2026         | Position Title              | Automation test | 200                 | Purpose                         | $100        | $100       | $100           | $200        |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Encumbrance Date | Name of BOCES | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | Position Title              | May 8, 2026      | Tester        | 100                 | Purpose                         | 200         | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | 5/8/2026         | Position Title              | Tester        | 100                 | Purpose                         | $200        | $100       | $100           | $200        |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    #NYSED-8420
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES   | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Position Title              | Automation test | 200                 | Purpose                         | 100         | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-8420
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8421 @NYSED-8422 @NYSED-8447 @NYSED-8448 @NYSED-8449 @NYSED-8450 @NYSED-Sprint-32 @US-NYSED-3007 @M07
  Scenario Outline:Verify that the Grantee user sees BOCES Purchased Services, Budget Categories modal, having a 'Encumbrance Date' column (Editable, Blank for new row, Date Field and Required)
  |Verify that the Grantee user sees BOCES Purchased Services, Budget Categories modal, having a 'Description of Item/Service' column (Editable, Blank for new row, Short text 255 Character and Required)|
  |Verify that the Grantee user sees BOCES Purchased Services, Budget Categories modal, having a 'Name of BOCES' column (Editable, Blank for new row, Short text 255 Character and Required)|
  |Verify that the Grantee user sees BOCES Purchased Services, Budget Categories modal, having a 'Calculation of Cost' column (Editable, Blank for new row, Short text 255 Character and Required)|
  |Verify that the Grantee user sees BOCES Purchased Services, Budget Categories modal, having a 'Check or Journal Entry (No ACH)' column (Editable, Blank for new row, Short text 255 Character and Required)|
  |Verify that the Grantee user sees BOCES Purchased Services, Budget Categories modal, having a 'Expenditure' column (Editable, Required, Currency Field without decimals, cannot be negative cannot be 0 and Blank for new row)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-8421
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES   | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      |                  | Position Title              | Automation test | 200                 | Purpose                         | 100         | $100       | $100           | $200        |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    #NYSED-8422
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES   | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | May 8, 2026      |                             | Automation test | 200                 | Purpose                         | 100         | $100       | $100           | $200        |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES   | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | May 8, 2026      | ---AUTOEnvData:-:Char256--- | Automation test | 200                 | Purpose                         | 100         | $100       | $100           | $200        |
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Description of Item/Service" inside table "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    #NYSED-8447
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | May 8, 2026      | ---AUTOEnvData:-:Char256--- |               | 200                 | Purpose                         | 100         | $100       | $100           | $200        |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES               | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | May 8, 2026      | Position Title              | ---AUTOEnvData:-:Char256--- | 200                 | Purpose                         | 100         | $100       | $100           | $200        |
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Name of BOCES" inside table "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    #NYSED-8448
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | May 8, 2026      | ---AUTOEnvData:-:Char256--- | Tester        |                     | Purpose                         | 100         | $100       | $100           | $200        |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES | Calculation of Cost         | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | May 8, 2026      | Position Title              | Tester        | ---AUTOEnvData:-:Char256--- | Purpose                         | 100         | $100       | $100           | $200        |
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Calculation of Cost" inside table "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    #NYSED-8449
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | May 8, 2026      | ---AUTOEnvData:-:Char256--- | Tester        | Calculation of Cost |                                 | 100         | $100       | $100           | $200        |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | May 8, 2026      | Position Title              | Tester        | Calculation of Cost | ---AUTOEnvData:-:Char256---     | 100         | $100       | $100           | $200        |
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Calculation of Cost" inside table "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    #NYSED-8450
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | May 8, 2026      | ---AUTOEnvData:-:Char256--- | Tester        | Calculation of Cost | Purpose                         |             | $100       | $100           | $200        |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | May 8, 2026      | Position Title              | Tester        | Calculation of Cost | Purpose                         | -123        | $100       | $100           | $200        |
    Then I softly see the following messages in the page details contains:
      | Expenditure cannot be negative. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | May 8, 2026      | Position Title              | Tester        | Calculation of Cost | Purpose                         | 88.998      | $100       | $100           | $200        |
    Then I softly see value "$88,998" for title "Expenditure" inside table "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8451 @NYSED-Sprint-32 @US-NYSED-3007 @M07
  Scenario Outline: Verify that the Grantee user sees BOCES Purchased Services, Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns (Editable, Optional, Currency Field without decimal places, negative not allowed, and $0 for new row)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Position Title              | Tester        | Calculation of Cost | Purpose                         | 300         | -172       | -100           |
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
      | Cash Match cannot be negative.     |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Position Title              | Tester        | Calculation of Cost | Purpose                         | 300         | 88.998     | 88.998         |
    Then I softly see value "$88,998" for title "Cash Match" inside table "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Then I softly see value "$88,998" for title "Non-Cash Match" inside table "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8456 @NYSED-Sprint-32 @US-NYSED-3007 @M07
  Scenario Outline: Verify that users (Internal and Grantee) cannot see the 'View/Add Line Item Details'. inline action on the Reimbursement Payment Request layout -> Budget Categories table, if the 'Reimbursement Template' is selected as FS-25
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    Then I softly cannot see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category             | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 126                             | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | FO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |

  @NYSED-8455 @NYSED-Sprint-32 @US-NYSED-3004 @M07
  Scenario Outline: Verify that users (Internal and Grantee) cannot see Cash Match and Non-Cash Match columns if Subrecipient Match is set as No on the announcement: 'BOCES Purchased Services'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT_MATCH_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" :
      | Actions | Encumbrance Date | Description of Item/Service | Name of BOCES | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" :
      | Actions | Encumbrance Date | Description of Item/Service | Name of BOCES | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PM           |

  @NYSED-8453 @NYSED-8454 @NYSED-Sprint-32 @US-NYSED-3007 @M07
  Scenario Outline: Verify that the Grantee User cannot create/update/delete details under the budget category - 'BOCES Purchased Services' when the Reimbursement Payment Request is not in the Created OR Send back to Subrecipient state.
  |Verify that the Internal User can see the 'View/Add Line Item Details' inline action and cannot add/update/delete the added budget under the budget category 'BOCES Purchased Services'.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES   | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Position Title              | Automation test | 200                 | Purpose                         | 100         | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8453
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8454
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |

  @NYSED-8452 @NYSED-Sprint-32 @US-NYSED-3007 @M07
  Scenario Outline: Verify that the Grantee User can add/update/delete details under budget category 'BOCES Purchased Services', then the following roll-up sum takes place.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES   | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Position Title              | Automation test | 200                 | Purpose                         | 100         | 100        | 100            |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Name of BOCES    | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 9, 2026      | Position Title1             | Automation test1 | 200                 | Purpose                         | 200         | 50         | 50             |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Name of BOCES    | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Position Title              | Automation test  | 200                 | Purpose                         | $100        | $100       | $100           | $200        |
      | Action menu | 5/9/2026         | Position Title1             | Automation test1 | 200                 | Purpose                         | $200        | $50        | $50            | $100        |
      |             |                  |                             |                  |                     |                                 | $300        | $150       | $150           | $300        |
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Cash Match | Non-Cash Match |
      | Position Title              | 30         | 30             |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Name of BOCES    | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/9/2026         | Position Title1             | Automation test1 | 200                 | Purpose                         | $200        | $50        | $50            | $100        |
      | Action menu | 5/8/2026         | Position Title              | Automation test  | 200                 | Purpose                         | $100        | $30        | $30            | $60         |
      |             |                  |                             |                  |                     |                                 | $300        | $80        | $80            | $160        |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRBOCESPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Name of BOCES    | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/9/2026         | Position Title1             | Automation test1 | 200                 | Purpose                         | $200        | $50        | $50            | $100        |
      |             |                  |                             |                  |                     |                                 | $200        | $50        | $50            | $100        |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentRequestBudgetTableId---" :
      | Actions     | Budget Category                              | Budget Category Code | Awarded Budget | Subaward Expenditure Paid to Date | Subaward Balance | Cumulative Expenditures to Date | Net Expenditure Change | Cash Match | Non-Cash Match | Total Match |
      | Action menu | BOCES Purchased Services                     | 49                   | $0             | $0                                | $0               | $200                            | $200                   | $50        | $50            | $100        |
      |             | Focus Area : Automation Permanent Focus Area |                      | $1,000         | $0                                | $1,000           | $200                            | $200                   | $50        | $50            | $100        |
      |             | Total                                        |                      | $1,000         | $0                                | $1,000           | $200                            | $200                   | $50        | $50            | $100        |
      |             | Grand Total                                  |                      | $1,000         | $0                                | $1,000           | $200                            | $200                   | $50        | $50            | $100        |
    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8224 @NYSED-8225 @NYSED-8226 @NYSED-Sprint-32 @US-NYSED-3002 @M07
  Scenario Outline:Verify that Grantee User can see the 'View/Add Line Item Details'. inline action on the Reimbursement Payment Request layout -> Financials tab -> Payment Request Budget section -> Budget Categories table.
  |Verify that the Grantee User can create/update/delete details under the budget category - 'Purchased Services' when the Reimbursement Payment Request is in the Created OR Send back to Subrecipient state.|
  |Verify that Grantee Users, apart from Submit and Certify & Create and Edit roles, cannot create/update/delete details under the budget category - 'Purchased Services'|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "DGFS10PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-8224
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    Then I see only the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
    #NYSED-8225
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item/Service | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | 100        | 100            |
    Then I softly see "Saved Successfully!" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item/Service | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $500        | $100       | $100           | $200        |
    Then I softly can see row level action button "Edit" against "Description of Item/Service" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item/Service" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost     | Check or Journal Entry (No ACH)     | Expenditure | Cash Match | Non-Cash Match |
      | 5/8/2026         | Description of Item         | Yes             | New Provider    | New Calculation of Cost | New Check or Journal Entry (No ACH) | 500         | 50         | 50             |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost     | Check or Journal Entry (No ACH)     | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | Yes             | New Provider    | New Calculation of Cost | New Check or Journal Entry (No ACH) | $500        | $50        | $50            | $100        |
    And I click on "Delete" icon for "Description of Item" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    #NYSED-8226
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8227 @NYSED-8228 @NYSED-Sprint-32 @US-NYSED-3002 @M07
  Scenario Outline: Verify that the Grantee user sees Purchased Services, Budget Categories modal, having a 'Encumbrance Date' column (Editable, Blank for new row, Date Field and Required)
  |Verify that the Grantee user sees Purchased Services, Budget Categories modal, having a 'Description of Item/Service' column (Editable, Blank for new row, Short text 255 Character and Required)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "DGFS10PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-8227
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      |                  | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | 100        | 100            |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Encumbrance Date |
      | Description of Item         | May 10, 2026     |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/10/2026        | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $500        | $100       | $100           | $200        |
    And I click on "Delete" icon for "Description of Item" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-8228
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      |                             | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | ---AUTOEnvData:-:Char256--- | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | 100        | 100            |
    And I wait for "3" seconds
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Description of Item/Service" against the value "Provider" inside table "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Encumbrance Date | Description of Item/Service |
      | 5/8/2026         | Description of Item         |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $500        | $100       | $100           | $200        |
    And I click on "Delete" icon for "Description of Item" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8229 @NYSED-8230 @NYSED-8231 @NYSED-Sprint-32 @US-NYSED-3002 @M07
  Scenario Outline: Verify that the Grantee user sees Purchased Services, Budget Categories modal, having a 'Is Subcontract?' column (Editable, Picklist: Yes/No and Required)
  |Verify that the Grantee user sees Purchased Services, Budget Categories modal, having a 'Provider/Vendor' column (Editable, Blank for new row, Short text 255 Character and Required)|
  |Verify that the Grantee user sees Purchased Services, Budget Categories modal, having a 'Calculation of Cost' column (Editable, Blank for new row, Short text 255 Character and Required)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "DGFS10PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I wait for "2" seconds
    #NYSED-8229
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         |                 | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | Yes             | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | 100        | 100            |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | Yes             | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $500        | $100       | $100           | $200        |
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Is Subcontract? |
      | Description of Item         | No              |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $500        | $100       | $100           | $200        |
    And I click on "Delete" icon for "Description of Item" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I wait for "2" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-8230
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              |                 | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor             | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | ---AUTOEnvData:-:Char256--- | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | 100        | 100            |
    And I wait for "3" seconds
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Provider/Vendor" against the value "Description of Item" inside table "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Provider/Vendor |
      | Description of Item         | Provider        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $500        | $100       | $100           | $200        |
    And I click on "Delete" icon for "Description of Item" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-8231
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        |                     | Check or Journal Entry (No ACH) | 500         | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost         | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | ---AUTOEnvData:-:Char256--- | Check or Journal Entry (No ACH) | 500         | 100        | 100            |
    And I wait for "3" seconds
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Calculation of Cost" against the value "Description of Item" inside table "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost |
      | Description of Item         | Calculation of Cost |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $500        | $100       | $100           | $200        |
    And I click on "Delete" icon for "Description of Item" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8232 @NYSED-8233 @NYSED-8234 @NYSED-Sprint-32 @US-NYSED-3002 @M07
  Scenario Outline: Verify that the Grantee user sees Purchased Services, Budget Categories modal, having a 'Check or Journal Entry (No ACH)' column (Editable, Blank for new row, Short text 255 Character and Required)
  |Verify that the Grantee user sees Purchased Services, Budget Categories modal, having a 'Expenditure' column (Editable, Required, Currency Field without decimals, cannot be negative cannot be 0 and Blank for new row)|
  |Verify that the Grantee user sees Purchased Services, Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns (Editable, Optional, Currency Field without decimal places, negative not allowed, and $0 for new row)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "DGFS10PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I wait for "2" seconds
    #NYSED-8232
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost |                                 | 500         | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | ---AUTOEnvData:-:Char256---     | 500         | 100        | 100            |
    And I wait for "3" seconds
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Check or Journal Entry (No ACH)" against the value "Description of Item" inside table "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Check or Journal Entry (No ACH) |
      | Description of Item         | Check or Journal Entry (No ACH) |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $500        | $100       | $100           | $200        |
    And I click on "Delete" icon for "Description of Item" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-8233
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) |             | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | @ee#mm      | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | -100        | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Expenditure cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 50.50       | 100        | 100            |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $5,050      | $100       | $100           | $200        |
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Expenditure |
      | Description of Item         | 400         |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $400        | $100       | $100           | $200        |
    And I click on "Delete" icon for "Description of Item" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-8234-Cash Match
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $500        | $0         | $0             | $0          |
    And I click on "Delete" icon for "Description of Item" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | @ee#mm     | 100            |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click on "Delete" icon for "Description of Item" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | -100       | 100            |
    Then I softly see the following messages in the page details contains:
      | Cash Match cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | 10.20      | 100            |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $500        | $1,020     | $100           | $1,120      |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Cash Match |
      | Description of Item         | 100        |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $500        | $100       | $100           | $200        |
    And I click on "Delete" icon for "Description of Item" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-8234-Non-Cash Match
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | 100        | @ee#mm         |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click on "Delete" icon for "Description of Item" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | 100        | -100           |
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         | 100        | 10.20          |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $500        | $100       | $1,020         | $1,120      |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Non-Cash Match |
      | Description of Item         | 100            |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $500        | $100       | $100           | $200        |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8235 @NYSED-Sprint-32 @US-NYSED-3002 @M07
  Scenario Outline: Verify that the Grantee User can add/update/delete details under budget category 'Purchased Services', then the following roll-up sum takes place.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "DGFS10PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 100         | 20         | 20             |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost  | Check or Journal Entry (No ACH)  | Expenditure | Cash Match | Non-Cash Match |
      | May 9, 2026      | Description of Item1        | No              | Provider1       | Calculation of Cost1 | Check or Journal Entry (No ACH)1 | 100         | 40         | 40             |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost  | Check or Journal Entry (No ACH)  | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/8/2026         | Description of Item         | No              | Provider        | Calculation of Cost  | Check or Journal Entry (No ACH)  | $100        | $20        | $20            | $40         |
      | Action menu | 5/9/2026         | Description of Item1        | No              | Provider1       | Calculation of Cost1 | Check or Journal Entry (No ACH)1 | $100        | $40        | $40            | $80         |
      |             |                  |                             |                 |                 |                      |                                  | $200        | $60        | $60            | $120        |
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Cash Match | Non-Cash Match |
      | Description of Item         | 30         | 30             |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost  | Check or Journal Entry (No ACH)  | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/9/2026         | Description of Item1        | No              | Provider1       | Calculation of Cost1 | Check or Journal Entry (No ACH)1 | 100         | 40         | 40             | $80         |
      | Action menu | 5/8/2026         | Description of Item         | No              | Provider        | Calculation of Cost  | Check or Journal Entry (No ACH)  | 100         | 30         | 30             | $60         |
      |             |                  |                             |                 |                 |                      |                                  | $200        | $70        | $70            | $140        |
    And I click on "Delete" icon for "Description of Item" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost  | Check or Journal Entry (No ACH)  | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | 5/9/2026         | Description of Item1        | No              | Provider1       | Calculation of Cost1 | Check or Journal Entry (No ACH)1 | 100         | 40         | 40             | $80         |
      |             |                  |                             |                 |                 |                      |                                  | $100        | $40        | $40            | $80         |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentRequestBudgetTableId---" :
      | Actions     | Budget Category                              | Budget Category Code | Awarded Budget | Subaward Expenditure Paid to Date | Subaward Balance | Cumulative Expenditures to Date | Net Expenditure Change | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Purchased Services                           | 40                   | $0             | $0                                | $0               | $100                            | $100                   | $40        | $40            | $80         |
      |             | Focus Area : Automation Permanent Focus Area |                      | $1,000         | $0                                | $1,000           | $100                            | $100                   | $40        | $40            | $80         |
      |             | Total                                        |                      | $1,000         | $0                                | $1,000           | $100                            | $100                   | $40        | $40            | $80         |
      |             | Grand Total                                  |                      | $1,000         | $0                                | $1,000           | $100                            | $100                   | $40        | $40            | $80         |
    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8236 @NYSED-8237 @NYSED-Sprint-32 @US-NYSED-3002 @M07
  Scenario Outline: Verify that the Grantee User cannot create/update/delete details under the budget category - 'Purchased Services' when the Reimbursement Payment Request is not in the Created OR Send back to Subrecipient state.
  |Verify that the Internal User can see the 'View/Add Line Item Details' inline action and cannot add/update/delete the added budget under the budget category 'Purchased Services'.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "DGFS10PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure | Cash Match | Non-Cash Match |
      | May 8, 2026      | Description of Item         | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 100         | 20         | 20             |
    And I click modal button "Close"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    #NYSED-8236
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    #NYSED-8237
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |

  @NYSED-8238 @NYSED-Sprint-32 @US-NYSED-3002 @M07
  Scenario Outline: Verify that users (Internal and Grantee) cannot see Cash Match and Non-Cash Match columns if Subrecipient Match is set as No on the announcement: 'Purchased Services'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT_MATCH_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "DGFS10PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "AwardID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PM           |

  @NYSED-8766 @NYSED-Sprint-32 @US-NYSED-3002 @M07
  Scenario Outline: Verify that the Grantee User can create/update/delete details under the budget category - 'Purchased Services' when the Reimbursement Payment Request is in the Send back to Subrecipient state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT_MATCH_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "DGFS10PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service  | Is Subcontract? | Provider/Vendor | Calculation of Cost  | Check or Journal Entry (No ACH) | Expenditure |
      | May 9, 2026      | Description of Item/Service1 | No              | Provider1       | Calculation of Cost1 | Check or Journal Entry (No ACH) | 500         |
    And I click modal button "Close"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I click on "Send Back to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | May 8, 2026      | Description of Item/Service | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | 500         |
    Then I softly see "Saved Successfully!" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Check or Journal Entry (No ACH) | Expenditure |
      | Action menu | 5/8/2026         | Description of Item/Service | No              | Provider        | Calculation of Cost | Check or Journal Entry (No ACH) | $500        |
    Then I softly can see row level action button "Edit" against "Description of Item/Service" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item/Service" in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost     | Check or Journal Entry (No ACH)     | Expenditure |
      | Description of Item/Service | Yes             | New Provider    | New Calculation of Cost | New Check or Journal Entry (No ACH) | 500         |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" :
      | Actions     | Encumbrance Date | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost     | Check or Journal Entry (No ACH)     | Expenditure |
      | Action menu | 5/8/2026         | Description of Item/Service | Yes             | New Provider    | New Calculation of Cost | New Check or Journal Entry (No ACH) | $500        |
    And I click on "Delete" icon for "Description of Item/Service" inside flex table with id "---paymentRequest:-:PRPurchasedServicesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |

  @NYSED-9121 @NYSED-Sprint-33 @US-NYSED-2896 @M06
    @NYSED-9134 @NYSED-Sprint-33 @US-NYSED-2895 @M06
  Scenario Outline:Verify that External user (All Profile) sees Payment Request Amount for Reimbursement Type Shows "Reimbursed amount" from the Reimbursement Payment Request
  |Verify that Internal user (All Profile) sees Payment Request Amount for Reimbursement Type Shows "Reimbursed amount" from the Reimbursement Payment Request|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT_MATCH_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary |
      | Name of Staff        | Title                   | 12  | 100                    | Beginning                      | 100                                                | 400    |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Reimbursed Amount" as "$400"
    And I navigate to "Home" tab
    And I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "3" seconds
    And I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" panel
    #NYSED-9121
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:SubreceipentPaymentRequestsTableId---" :
      | Actions     | EGMS ID                      | Type          | Subaward ID               | Payment Request Amount | Status  |
      | Action menu | {SavedValue:ReimbursementID} | Reimbursement | {SavedValue:AWARD_EGMSID} | $400                   | Created |
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    And I click toggle button to select "Subrecipients Organization - All"
    And I perform quick search for "{AUTOEnvData:SubrecipientOrg}" in "---home:-:subrecipientActiveAccountId---" panel
    And I click on "View" icon for "{AUTOEnvData:SubrecipientOrg}" inside flex table with id "---home:-:subrecipientActiveAccountId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:PaymentRequestsTableId---" panel
    #NYSED-9134
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PaymentRequestsTableId---" :
      | Actions     | EGMS ID                      | Type          | Subaward ID               | Payment Request Amount | Status  |
      | Action menu | {SavedValue:ReimbursementID} | Reimbursement | {SavedValue:AWARD_EGMSID} | $400                   | Created |
    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |

  @NYSED-9183 @NYSED-Sprint-33 @US-NYSED-2981 @M05
  Scenario Outline: Verify that the Grantee user can see that on the Monitoring Phase -> Payments module -> Advances left menu, List filter columns are updated.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I wait for "3" seconds
    Then I see only the following headers in table with id "---paymentRequest:-:subrecipientPaymentrequestAdvancesTableId---" :
      | Actions | EGMS ID | Subaward ID | Project ID | Reporting Period | Payment Request Amount | Status |

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |
#      | GRANTEE_CE   |

  @NYSED-9287 @NYSED-9288 @NYSED-9290 @NYSED-9299 @NYSED-Sprint-33 @US-NYSED-6714 @M06
  Scenario Outline:Verify that Internal Profile and External Profile user see below Instructional Text is Displayed on Reimbursement Payment Request → Financials Tab → Payment Request Budget Section
  |Verify that Internal Profile user see a new field ‘Announcement Message’ is added after the ‘Subrecipient Organization Message’ field on the Reimbursement Payment Request layout → Messages tab → Related messages section|
  |Verify that Internal Profile user see Funding Account column of Subaward Funding Account Information Section is renamed to 'Funding Account EGMS ID' on Reimbursement Payment Request layout → Financials tab|
  |Verify that Internal Profile and External Profile user see 'Fund Year' field is removed from Reimbursement Payment Request → Overview Tab → General Information Section|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT_MATCH_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    #NYSED-9287-External User
    Then I softly see the text containing :
      | Budget Instructions:                                                                                                                                |
      | Equipment Budget:                                                                                                                                   |
      | Each line item under the Equipment category must have a minimum value of $10,000. Please ensure your entries meet this threshold before submission. |
      | Employee Benefits:                                                                                                                                  |
      | This category is not allowed unless staff salaries have been added. To include benefits, first enter corresponding salary details.                  |
    #NYSED-9299-External user
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly cannot see field "Fund Year" inside page block
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    #NYSED-9290
    Then I see the following headers in table with id "---paymentRequest:-:fundingAccountTableId---" :
      | Actions | Funding Account EGMS ID | Funding Account Title | Funding Account Message | Fund Year | Outstanding Encumbrance | Payment Split | Revised Payment Split | Withheld Amount |
    #NYSED-9287-internal user
    Then I softly see the text containing :
      | Budget Instructions:                                                                                                                                |
      | Equipment Budget:                                                                                                                                   |
      | Each line item under the Equipment category must have a minimum value of $10,000. Please ensure your entries meet this threshold before submission. |
      | Employee Benefits:                                                                                                                                  |
      | This category is not allowed unless staff salaries have been added. To include benefits, first enter corresponding salary details.                  |
    #NYSED-9288
    And I navigate to "Messages" sub tab
    And I wait for "2" seconds
    Then I softly see field "Announcement Message" is not editable
    Then I softly see field "Announcement Message" as "Automation Message" in "Related Messages" pageblock
    #NYSED-9299-Internal user
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly cannot see field "Fund Year" inside page block

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |

  @NYSED-9297 @NYSED-9296 @NYSED-Sprint-33 @US-NYSED-6714 @M06
  Scenario Outline: Verify that Internal Profile user see below validations not fired on Submit for Approval or Mark as Approved button of Reimbursement Payment Request
  |Verify that Internal Profile user see Payment Funding Account column of 'Document Details' modal is renamed to 'Payment Funding Account EGMS ID' Reimbursement Payment Request layout → Financials tab → Document History section|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT_MATCH_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary |
      | Name of Staff        | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 100    |
    And I click modal button "Close"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I click on "Mark as Approved" in the page details
    And I wait for "2" seconds
    #NYSED-9297
    Then I softly see field "Status" as "Approved"
    Then I softly cannot see the following messages in the page details :
      | Financial Tab - Total of Net Spent This Action for funding accounts should match Net Spent This Action.                  |
      | Financials Tab - Reimbursed Amount This Action cannot be greater than the Reimbursement Balance. Apply advance if any.   |
      | Financial Tab - Total of Advances Applied This Action for the funding accounts should match Advance Applied This Action. |
      | Financial Tab - Advance Requested should match total of Advance Requested This Action of associated Funding accounts.    |
      | Financials Tab - Advance Requested cannot be greater than the Advance Request Balance.                                   |
    #NYSED-9296
    When I navigate to "Financials" sub tab
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    Then I see the following headers in table with id "---paymentRequest:-:TransactionsTableId---" :
      | Actions | Payment Funding Account EGMS ID | Funding Account Name | Fund Year | Blanket Voucher Cut% | Payment Split | Revised Payment Split | Withheld Amount |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |

  @NYSED-9136 @NYSED-9145 @NYSED-9146 @NYSED-Sprint-33 @US-NYSED-3562 @Bug-NYSED-9302 @M06
  Scenario Outline: Verify that Internal user (All Profile) sees updated filter names when navigating to Monitoring phase → Reimbursements module → Reimbursements list filter
  |Verify that Internal user (All Profile) sees updated List View filter column names when navigating to Monitoring phase → Reimbursements module → Reimbursements list filter|
  |Verify that Internal User (All Profile) sees Payment Request Amount column shows value from Financials tab → Payment Request Summary section → Reimbursed Amount on Payments module → Reimbursements left menu --> Reimbursement List View Filter|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I wait for "5" seconds
    #NYSED-9136
    Then I softly see toggle option "Reimbursements - All" inside flex table id "---paymentRequest:-:paymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Created" inside flex table id "---paymentRequest:-:paymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Submitted" inside flex table id "---paymentRequest:-:paymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Approved" inside flex table id "---paymentRequest:-:paymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Rejected" inside flex table id "---paymentRequest:-:paymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Payment In Progress" inside flex table id "---paymentRequest:-:paymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Processed" inside flex table id "---paymentRequest:-:paymentrequestReimbursementTableId---"
    #NYSED-9145 #NYSED-9146
    And I refresh the page
    And I wait for "10" seconds
    And I click toggle button to select "Reimbursements - All"
    And I wait for "2" seconds
    Then I see the following headers in table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" :
      | Actions | EGMS ID | Subaward ID | Project ID | Institution ID | SED Code | Organization Name | Reimbursement Template | Reporting Period | Payment Request Amount | Status |

    Examples:
      | UserType |
      | FD       |
#      | PO       |
#      | PM       |
#      | PO       |

  @NYSED-9143 @NYSED-Sprint-33 @US-NYSED-3562 @M06
  Scenario Outline: Verify that Internal user (All Profile) sees the list of all available Created statuses of payment requests shown under 'Reimbursements - Created' filter
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - Created"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---paymentRequest:-:paymentrequestReimbursementTableId---"
    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |

  @NYSED-9138 @NYSED-9139 @NYSED-Sprint-33 @US-NYSED-3562 @M06
  Scenario Outline: Verify that Internal user (All Profile) sees the list of all available Submitted to Grantor statuses of payment requests shown under 'Reimbursements - Submitted' filter
  |Verify that Internal user (All Profile) sees the list of all available 'Approved' statuses of payment requests shown under 'Reimbursements - Approved' filter|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff        | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    #NYSED-9138
    And I click toggle button to select "Reimbursements - Submitted"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "---paymentRequest:-:paymentrequestReimbursementTableId---"
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Mark as Approved" in the page details
    Then I softly see field "Status" as "Approved"
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    #NYSED-9139
    And I click toggle button to select "Reimbursements - Approved"
    And I wait for "5" seconds
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    Then I softly see value "Approved" for title "Status" inside table "---paymentRequest:-:paymentrequestReimbursementTableId---"
    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |

  @NYSED-9140 @NYSED-Sprint-33 @US-NYSED-3562 @M06
  Scenario Outline: Verify that Internal user (All Profile) sees the list of all available 'Rejected' statuses of payment requests shown under 'Reimbursements - Rejected' filter
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff        | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FD Username} | Step 1        |
    When I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    And I "Reject" in the approval decision
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - Rejected"
    And I wait for "5" seconds
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---paymentRequest:-:paymentrequestReimbursementTableId---"
    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |

  @NYSED-9153 @NYSED-Sprint-33 @US-NYSED-6887 @M07
  Scenario Outline:Verify that (Internal and Grantee) users cannot see the 'View/Add Line Item Details' inline action on the Reimbursement Request ->Financials tab->Payment Request Budget section, if the 'Reimbursement Template' is selected as FS-10F for the Lump sum budget
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "LUMPSUM_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Lump Sum" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Lump Sum        | 200                             | 100        | 100            |
    Then I softly see value "$200" for title "Cumulative Expenditures to Date" inside table "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly see value "$100" for title "Cash Match" inside table "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Lump Sum" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Lump Sum" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | GrantName                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_SC   | FD           |

  @NYSED-9155 @NYSED-Sprint-33 @US-NYSED-6887 @M07
  Scenario Outline:Verify that (Internal and Grantee) users cannot see the 'View/Add Line Item Details' inline action on the Reimbursement Request ->Financials tab->Payment Request Budget section, if the 'Reimbursement Template' is selected as FS-25 for the Lump sum budget
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "LUMPSUM_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
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
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Lump Sum" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Lump Sum        | 200                             | 100        | 100            |
    Then I softly see value "$200" for title "Cumulative Expenditures to Date" inside table "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly see value "$100" for title "Cash Match" inside table "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Lump Sum" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Lump Sum" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | GrantName                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_SC   | FD           |
