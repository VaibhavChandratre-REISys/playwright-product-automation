@paymentRequestNysed @ReimbursementPaymentRequestFromStandardGrant
Feature: Validate all scenarios in  Reimbursement Payment Request from Standard Grant

  @NYSED-8332 @NYSED-8331 @NYSED-Sprint-32 @US-NYSED-2986 @M07
  Scenario Outline:Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a 'Specific Position/Title' column (Editable, Blank for new row, Short text 255 Character and Required)
  |Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a 'Name of Staff Member' column (Editable, Blank for new row, Short text 255 Character and Required)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
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
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8331
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff2       | Title                   | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Specific Position/Title | Name of Staff Member |
      | Name of Staff2          | {SavedValue:Char256} |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | {SavedValue:Char255} | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    And I click on "Delete" icon for "Title" inside flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" without waiting for record
    #NYSED-8332
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff2       | Title                   | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Specific Position/Title |
      | Name of Staff2       | {SavedValue:Char256}    |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | {SavedValue:Char255}    | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |

    Examples:
      | GrantName                                 | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_CE   |

  @NYSED-8241 @NYSED-8253 @NYSED-8242 @NYSED-8252 @NYSED-Sprint-32 @US-NYSED-3006 @M07
  Scenario Outline:Verify that the Grantee User can create/update/delete details under the budget category - 'Indirect Cost' when the Reimbursement Payment Request is in the Created OR Send back to Subrecipient state.|
  |Verify that the Internal User can see the 'View/Add Line Item Details' inline action and cannot add/update/delete the added budget under the budget category 'Indirect Cost'.|
  |Verify that Grantee Users, apart from Submit and Certify & Create and Edit roles, cannot create/update/delete details under the budget category - 'Indirect Cost'.|
  |Verify that the Grantee User cannot create/update/delete details under the budget category - 'Indirect Cost' when the Reimbursement Payment Request is not in the Created OR Send back to Subrecipient state.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
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
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "New" :
      | Description    | Expenditure | Cash Match | Non-Cash Match |
      | Name of Staff2 | 100         | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions     | Description    | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2 | $100        | $100       | $100           | $200        |
      |             | Total          | $100        | $100       | $100           | $200        |
    #NYSED-8241
    Then I softly can see row level action button "Edit" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Description    | Expenditure |
      | Name of Staff2 | 200         |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions     | Description    | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2 | $200        | $100       | $100           | $200        |
      |             | Total          | $200        | $100       | $100           | $200        |
    And I click on "Delete" icon for "Name of Staff2" inside flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    When I enter the following values into flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "New" :
      | Description    | Expenditure | Cash Match | Non-Cash Match |
      | Name of Staff2 | 100         | 100        | 100            |
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8242
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8242
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8253
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8252
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---"

    Examples:
      | GrantName                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_CE   | PO           |
#      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_SC   | FO           |
#      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_CE   | FD           |

  @NYSED-8246 @NYSED-Sprint-32 @US-NYSED-3006 @M07
  Scenario Outline:Verify that the Grantee User can add/update/delete details under budget category 'Indirect Cost', then the following roll-up sum takes place.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
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
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "New" :
      | Description   | Expenditure | Cash Match | Non-Cash Match |
      | Name of Staff | 100         | 100        | 100            |
    When I enter the following values into flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "New" :
      | Description    | Expenditure | Cash Match | Non-Cash Match |
      | Name of Staff1 | 100         | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions     | Description    | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff  | $100        | $100       | $100           | $200        |
      | Action menu | Name of Staff1 | $100        | $100       | $100           | $200        |
      |             | Total          | $200        | $200       | $200           | $400        |
    When I enter the following values into flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "New" :
      | Description    | Expenditure | Cash Match | Non-Cash Match |
      | Name of Staff2 | 100         | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions     | Description    | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff  | $100        | $100       | $100           | $200        |
      | Action menu | Name of Staff1 | $100        | $100       | $100           | $200        |
      | Action menu | Name of Staff2 | $100        | $100       | $100           | $200        |
      |             | Total          | $300        | $300       | $300           | $600        |
    And I click on "Delete" icon for "Name of Staff2" inside flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" without waiting for record
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions     | Description    | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff  | $100        | $100       | $100           | $200        |
      | Action menu | Name of Staff1 | $100        | $100       | $100           | $200        |
      |             | Total          | $200        | $200       | $200           | $400        |
    And I click modal button "Close"
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentRequestBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Awarded Budget | Subaward Expenditure Paid to Date | Subaward Balance | Cumulative Expenditures to Date | Net Expenditure Change | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Professional Staff Salaries | 15                   | $1,000         | $0                                | $1,000           | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Support Staff Salaries      | 16                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Purchased Services          | 40                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Supplies and Materials      | 45                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Travel Expenses             | 46                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Employee Benefits           | 80                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Indirect Cost               | 90                   | $0             | $0                                | $0               | $200                            | $200                   | $200       | $200           | $400        |
      | Action menu | BOCES Purchased Services    | 49                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Minor Remodeling            | 30                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Equipment                   | 20                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      |             | Total                       |                      | $1,000         | $0                                | $1,000           | $200                            | $200                   | $200       | $200           | $400        |

    Examples:
      | GrantName                                 | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_CE   |

  @NYSED-8245 @NYSED-8240 @NYSED-8244 @NYSED-8243 @NYSED-Sprint-32 @US-NYSED-3006 @M07 @Bug-Ticket-NYSED-8840
  Scenario Outline:Verify that the Grantee user sees Indirect Cost, Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns (Editable, Optional, Currency Field without decimal places, negative not allowed, and $0 for new row)
  |Verify that Grantee User can see the 'View/Add Line Item Details'. inline action on the Reimbursement Payment Request layout -> Financials tab -> Payment Request Budget section -> Budget Categories table.|
  |Verify that the Grantee user sees Indirect Cost, Budget Categories modal, having a 'Expenditure' column (Editable, Required, Currency Field without decimals, cannot be negative cannot be 0 and Blank for new row)|
  |Verify that the Grantee user sees Indirect cost, Budget Categories modal, having a 'Description' column (Editable, Blank for new row, Short text 255 Character and Required)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
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
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8240
    Then I see only the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions | Description | Expenditure | Cash Match | Non-Cash Match | Total Match |
    When I enter the following values into flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "New" :
      | Description    | Expenditure | Cash Match | Non-Cash Match |
      | Name of Staff2 | 100         |            |                |
    #NYSED-8245
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions     | Description    | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2 | $100        |            |                | $0          |
      |             | Total          | $100        | $0         | $0             | $0          |
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Description    | Cash Match | Non-Cash Match |
      | Name of Staff2 | eee        | eee            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions     | Description    | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2 | $100        |            |                | $0          |
      |             | Total          | $100        | $0         | $0             | $0          |
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Description    | Cash Match | Non-Cash Match |
      | Name of Staff2 | 88.988     | 88.988         |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions     | Description    | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2 | $100        | $88,988    | $88,988        | $177,976    |
      |             | Total          | $100        | $88,988    | $88,988        | $177,976    |
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Description    | Cash Match | Non-Cash Match |
      | Name of Staff2 | -100       | -100           |
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
      | Cash Match cannot be negative.     |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I click on "Delete" icon for "Name of Staff2" inside flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" without waiting for record
    #NYSED-8244
    When I enter the following values into flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "New" :
      | Description    | Expenditure | Cash Match | Non-Cash Match |
      | Name of Staff2 | 100         | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions     | Description    | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2 | $100        | $100       | $100           | $200        |
      |             | Total          | $100        | $100       | $100           | $200        |
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Description    | Expenditure |
      | Name of Staff2 |             |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Complete this field."
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Description    | Expenditure |
      | Name of Staff2 | eee         |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Description    | Expenditure |
      | Name of Staff2 | -100        |
    Then I softly see the following messages in the page details contains:
      | Expenditure cannot be negative. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Description    | Expenditure |
      | Name of Staff2 | 0           |
    Then I softly see the following messages in the page details contains:
      | Expenditure cannot be zero. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Description    | Expenditure |
      | Name of Staff2 | 88.988      |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions     | Description    | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2 | $88,988     | $100       | $100           | $200        |
      |             | Total          | $88,988     | $100       | $100           | $200        |
    And I click on "Delete" icon for "Name of Staff2" inside flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" without waiting for record
    #NYSED-8243
    When I enter the following values into flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "New" :
      | Description | Expenditure | Cash Match | Non-Cash Match |
      |             | 100         | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "New" :
      | Description    | Expenditure | Cash Match | Non-Cash Match |
      | Name of Staff2 | 100         | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions     | Description    | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2 | $100        | $100       | $100           | $200        |
      |             | Total          | $100        | $100       | $100           | $200        |
    And I edit the following rows inline in flex table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Expenditure | Description          |
      | $100        | {SavedValue:Char256} |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions     | Description          | Expenditure | Cash Match | Non-Cash Match | Total Match |
      | Action menu | {SavedValue:Char255} | $100        | $100       | $100           | $200        |
      |             | Total                | $100        | $100       | $100           | $200        |

    Examples:
      | GrantName                                 | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_CE   |

  @NYSED-8173 @NYSED-8172 @NYSED-Sprint-32 @US-NYSED-2986 @M07
  Scenario Outline:Verify that the Grantee user sees Professional Staff Salaries, Budget Categories modal, having a 'Specific Position/Title' column (Editable, Blank for new row, Short text 255 Character and Required)
  |Verify that the Grantee user sees Professional Staff Salaries, Budget Categories modal, having a 'Name of Staff Member' column (Editable, Blank for new row, Short text 255 Character and Required)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
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
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8172
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff2       | Title                   | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Name of Staff Member |
      | Title                   |                      |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Name of Staff Member |
      | Title                   | {SavedValue:Char256} |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | {SavedValue:Char255} | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    And I click on "Delete" icon for "Title" inside flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" without waiting for record
    #NYSED-8173
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff2       | Title                   | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Specific Position/Title |
      | Name of Staff2       |                         |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Specific Position/Title |
      | Name of Staff2       | {SavedValue:Char256}    |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | {SavedValue:Char255}    | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |

    Examples:
      | GrantName                                 | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_CE   |

  @NYSED-9110 @NYSED-9350 @NYSED-Sprint-33 @US-NYSED-3529 @M05
  Scenario Outline:Verify that the Subrecipient user with the Submit and Certify role receives a validation message when cumulative expenditures exceed 90% of the awarded budget on the Reimbursement Payment Request layout - Lump Sum
  |Verify that the Subrecipient user with the Submit and Certify role can submit FS-25 when cumulative expenditures are within 90% of the awarded budget on the Reimbursement Payment Request layout - Lump Sum type|
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
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Lump Sum        | 901                             | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    #NYSED-9098
    Then I softly see the following messages in the page details contains:
      | Financials Tab - FS‑25 cumulative expenditures cannot exceed 90% of the awarded budget. Adjust the amount before submitting. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Lump Sum        | 899                             | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    #NYSED-9350
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly cannot see the following messages in the page details contains:
      | Financials Tab - FS‑25 cumulative expenditures cannot exceed 90% of the awarded budget. Adjust the amount before submitting. |

    Examples:
      | GrantName                                 | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_SC   |

  @NYSED-9051 @NYSED-9042 @NYSED-9052 @NYSED-Sprint-33 @US-NYSED-3556
  Scenario Outline:Verify that External user (LEA Admin OR View Only Profile) do not see the inline edit and delete action under 'Reimbursements - Created' filter
  |Verify that External user (All Profile) sees updated filter names when navigating to Monitoring phase → Reimbursements module → Reimbursements list filter|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
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
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - Created"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    #NYSED-9052
    Then I softly can see row level action button "Edit" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    #NYSED-9042
    Then I softly see toggle option "Reimbursements - All" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Created" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Submitted" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Approved" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Rejected" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Payment In Progress" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Processed" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - Created"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    #NYSED-9052
    Then I softly can see row level action button "Edit" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    #NYSED-9042
    Then I softly see toggle option "Reimbursements - All" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Created" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Submitted" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Approved" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Rejected" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Payment In Progress" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Processed" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - Created"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    #NYSED-9051
    Then I softly cannot see row level action button "Edit" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    #NYSED-9042
    Then I softly see toggle option "Reimbursements - All" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Created" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Submitted" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Approved" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Rejected" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Payment In Progress" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Processed" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - Created"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    #NYSED-9051
    Then I softly cannot see row level action button "Edit" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    #NYSED-9042
    Then I softly see toggle option "Reimbursements - All" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Created" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Submitted" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Approved" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Rejected" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Payment In Progress" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Processed" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"

    Examples:
      | GrantName                                 | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_SC   |