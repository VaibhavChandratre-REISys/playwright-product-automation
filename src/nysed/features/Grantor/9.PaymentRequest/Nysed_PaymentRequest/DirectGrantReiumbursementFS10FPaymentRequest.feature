@paymentRequestNysed @ReimbursementPaymentRequestFromDirectGrant
Feature: Validate all scenarios in  Reimbursement Payment Request from Direct Grant

  @NYSED-8328 @NYSED-8344 @NYSED-Sprint-32 @US-NYSED-2986 @M07
    @NYSED-8254 @NYSED-Sprint-32 @US-NYSED-3006 @M07
    @NYSED-8372 @NYSED-8352 @NYSED-Sprint-32 @US-NYSED-2986 @M07
    @NYSED-8206 @NYSED-Sprint-32 @US-NYSED-2985 @M07
  Scenario Outline:Verify that Grantee User can see the 'View/Add Line Item Details'. inline action on the Reimbursement Payment Request layout -> Financials tab -> Payment Request Budget section -> Budget Categories table for 'Support Staff Salaries' category
  |Verify that users (Internal and Grantee) cannot see Cash Match and Non-Cash Match columns if Subrecipient Match is set as No on the announcement: Support Staff Salaries|
  |Verify that users (Internal and Grantee) cannot see Cash Match and Non-Cash Match columns if Subrecipient Match is set as No on the announcement: 'Indirect Cost'.|
  |Verify that users (Internal and Grantee) cannot see Cash Match and Non-Cash Match columns if Subrecipient Match is set as No on the announcement: Supplies and Materials|
  |Verify that Grantee User can see the 'View/Add Line Item Details'. inline action on the Reimbursement Payment Request layout -> Financials tab -> Payment Request Budget section -> Budget Categories table for 'Supplies and Materials' category|
  |Verify that users (Internal and Grantee) cannot see Cash Match and Non-Cash Match columns if Subrecipient Match is set as No on the announcement: Professional Staff Salaries|
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
    #NYSED-8344 #NYSED-8254 #NYSED-8206
    Then I softly do not see "Cash Match" in flex table header "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---paymentRequest:-:paymentRequestBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8328 #NYSED-8344
    Then I see only the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary |
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary |
      | Name of Staff        | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 100    |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary |
      | Action menu | Name of Staff        | Position Title          | 12.00 | $100                   | Beginning                      | $100                                               | $100   |
    Then I softly do not see "Cash Match" in flex table header "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Then I softly do not see "Total Match" in flex table header "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8254
    Then I see only the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions | Description | Expenditure |
    Then I softly do not see "Cash Match" in flex table header "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8372 #NYSED-8352
    Then I softly see "Actions" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Purchase Order Date" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Purchase Order #" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Description of Item/Service" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Provider/Vendor" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Quantity" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Unit Cost" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Calculation of Cost (if other than Quantity * Unit Cost)" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Check or Journal Entry (No ACH)" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Additional Cost" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Calculated Expenditure" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Expenditure" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly do not see "Cash Match" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8206
    Then I see only the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary |
    Then I softly do not see "Cash Match" in flex table header "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    #NYSED-8344
    Then I softly do not see "Cash Match" in flex table header "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---paymentRequest:-:paymentRequestBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8344
    Then I see only the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary |
    Then I softly do not see "Cash Match" in flex table header "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Then I softly do not see "Total Match" in flex table header "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8254
    Then I see only the following headers in table with id "---paymentRequest:-:PRIndirectCostLineItemsTableId---" :
      | Actions | Description | Expenditure |
    Then I softly do not see "Cash Match" in flex table header "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---paymentRequest:-:PRIndirectCostLineItemsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8372 #NYSED-8352
    Then I softly see "Actions" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Purchase Order Date" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Purchase Order #" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Description of Item/Service" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Provider/Vendor" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Quantity" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Unit Cost" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Calculation of Cost (if other than Quantity * Unit Cost)" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Check or Journal Entry (No ACH)" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Additional Cost" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Calculated Expenditure" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see "Expenditure" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly do not see "Cash Match" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8206
    Then I see only the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary |
    Then I softly do not see "Cash Match" in flex table header "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | FO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |

  @NYSED-8329 @NYSED-8330 @NYSED-8342 @NYSED-8343 @NYSED-8376 @NYSED-Sprint-32 @US-NYSED-2986 @M07
  Scenario Outline:Verify that the Grantee User can create/update/delete details under the budget category - 'Support Staff Salaries' when the Reimbursement Payment Request is in the Created state.
  |Verify that Grantee Users, apart from Submit and Certify & Create and Edit roles, cannot create/update/delete details under the budget category - 'Support Staff Salaries'.|
  |Verify that the Grantee User cannot create/update/delete details under the budget category - 'Support Staff Salaries' when the Reimbursement Payment Request is not in the Created OR Send back to Subrecipient state.|
  |Verify that the Internal User can see the 'View/Add Line Item Details' inline action and cannot add/update/delete the added budget under the budget category 'Support Staff Salaries'.|
  |Verify that the Grantee User can create/update/delete details under the budget category - 'Support Staff Salaries' when the Reimbursement Payment Request is in the Send Back to Subrecipeint state.|
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
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8328
    Then I see only the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff        | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff        | Position Title          | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
    Then I softly can see row level action button "Edit" against "Name of Staff" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Then I softly can see row level action button "Delete" against "Name of Staff" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Specific Position/Title |
      | Name of Staff        | Title                   |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff        | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
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
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8330
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8330
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I click on "Delete" icon for "Name of Staff" inside flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" without waiting for record
    #NYSED-8329
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff        | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 1000   | 100        | 100            |
    And I click modal button "Close"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8342
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
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
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8343
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    And I click modal button "Close"
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
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8376
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff1       | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Position Title          | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
    Then I softly can see row level action button "Edit" against "Name of Staff1" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Then I softly can see row level action button "Delete" against "Name of Staff1" in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Specific Position/Title |
      | Name of Staff1       | Title                   |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
    And I click on "Delete" icon for "Name of Staff" inside flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" without waiting for record
    #NYSED-8376
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click on "Delete" icon for "Name of Staff1" inside flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---"

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | FO           |

  @NYSED-8345 @NYSED-Sprint-32 @US-NYSED-2986 @M07
    @NYSED-8256 @NYSED-Sprint-32 @US-NYSED-3006 @M07
    @NYSED-8373 @NYSED-Sprint-32 @US-NYSED-2986 @M07
    @NYSED-8207 @NYSED-Sprint-32 @US-NYSED-2985 @M07
  Scenario Outline:Verify that users (Internal and Grantee) cannot see the 'View/Add Line Item Details'. inline action on the Reimbursement Payment Request layout -> Budget Categories table, if the 'Reimbursement Template' is selected as FS-25
  |Verify that users (Internal and Grantee) cannot see the 'View/Add Line Item Details'. inline action on the Reimbursement Payment Request layout -> Budget Categories table, if the 'Reimbursement Template' is selected as FS-25: 'Indirect Cost'.|
  |Verify that users (Internal and Grantee) cannot see the 'View/Add Line Item Details'. inline action on the Reimbursement Payment Request layout -> Budget Categories table, if the 'Reimbursement Template' is selected as FS-25|
  |Verify that users (Internal and Grantee) cannot see the 'View/Add Line Item Details'. inline action on the Reimbursement Payment Request layout -> Budget Categories table, if the 'Reimbursement Template' is selected as FS-25|
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
    #NYSED-8345
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    #NYSED-8256
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    #NYSED-8373
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    #NYSED-8207
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
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
    #NYSED-8345
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    #NYSED-8256
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    #NYSED-8373
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    #NYSED-8207
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | FO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | PO           |

  @NYSED-8341 @NYSED-Sprint-32 @US-NYSED-2986 @M07
  Scenario Outline:Verify that the Grantee User can add/update/delete details under budget category 'Support Staff Salaries', then the following roll-up sum takes place.
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
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8341
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff1       | Title                   | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff2       | Title                   | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 24.00 | $200                   |                                | $200                                               | $200   | $200       | $200           | $400        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Salary | Cash Match | Non-Cash Match |
      | Name of Staff2       | 200    | 200        | 200            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $200   | $200       | $200           | $400        |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 24.00 | $200                   |                                | $200                                               | $300   | $300       | $300           | $600        |
    And I click on "Delete" icon for "Name of Staff2" inside flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentRequestBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Awarded Budget | Subaward Expenditure Paid to Date | Subaward Balance | Cumulative Expenditures to Date | Net Expenditure Change | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Professional Staff Salaries | 15                   | $1,000         | $0                                | $1,000           | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Support Staff Salaries      | 16                   | $0             | $0                                | $0               | $100                            | $100                   | $100       | $100           | $200        |
      | Action menu | Purchased Services          | 40                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Supplies and Materials      | 45                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Travel Expenses             | 46                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Employee Benefits           | 80                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Indirect Cost               | 90                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | BOCES Purchased Services    | 49                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Minor Remodeling            | 30                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Equipment                   | 20                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      |             | Total                       |                      | $1,000         | $0                                | $1,000           | $100                            | $100                   | $100       | $100           | $200        |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8340 @NYSED-Sprint-32 @US-NYSED-2986 @M07
  Scenario Outline:Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a 'Cash Match' and 'Non-Cash Match' columns (Editable, Optional, Currency Field without decimal places, negative not allowed, and $0 for new row)
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
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8340
    Then I see only the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff1       | Title                   | 12  | 100                    | Beginning                      | 100                                                | 100    |            |                |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   |            |                | $0          |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $0         | $0             | $0          |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Cash Match | Non-Cash Match |
      | Name of Staff1       | eee        | eee            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   |            |                | $0          |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $0         | $0             | $0          |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Cash Match | Non-Cash Match |
      | Name of Staff1       | -100       | -100           |
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
      | Cash Match cannot be negative.     |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Cash Match | Non-Cash Match |
      | Name of Staff1       | 88.988     | 88.988         |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $88,988    | $88,988        | $177,976    |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $88,988    | $88,988        | $177,976    |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Cash Match | Non-Cash Match |
      | Name of Staff1       | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    And I click on "Delete" icon for "Name of Staff1" inside flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" without waiting for record

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8339 @NYSED-8337 @NYSED-8336 @NYSED-Sprint-32 @US-NYSED-2986 @M07
  Scenario Outline:Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a 'Salary' column (Editable, Required, Currency Field without decimals, cannot be negative and Blank for new row)
  |Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a 'Additional Cost (e.g., Per Diem, Teacher Stipends)' column (Editable, Optional, Currency Field without decimals, cannot be negative and Blank for new row)|
  |Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a 'Beginning and End Dates Worked' column (Editable, Blank for new row, Short text 255 Character and Required)|
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
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8339
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff1       | Title                   | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Salary |
      | Name of Staff1       |        |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Salary |
      | Name of Staff1       | eee    |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Salary |
      | Name of Staff1       | -100   |
    Then I softly see the following messages in the page details contains:
      | Salary cannot be negative. |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Salary |
      | Name of Staff1       | 88.988 |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary  | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $88,988 | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $88,988 | $100       | $100           | $200        |
    And I click on "Delete" icon for "Name of Staff1" inside flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" without waiting for record
    #NYSED-8337
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff2       | Title                   | 12  | 100                    | Beginning                      |                                                    | 100    | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $100                   | Beginning                      |                                                    | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $0                                                 | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Additional Cost (e.g., Per Diem, Teacher Stipends) |
      | Name of Staff2       | eee                                                |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $100                   | Beginning                      |                                                    | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $0                                                 | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Additional Cost (e.g., Per Diem, Teacher Stipends) |
      | Name of Staff2       | -100                                               |
    Then I softly see the following messages in the page details contains:
      | Additional Cost cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Additional Cost (e.g., Per Diem, Teacher Stipends) |
      | Name of Staff2       | 88.988                                             |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $100                   | Beginning                      | $88,988                                            | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $88,988                                            | $100   | $100       | $100           | $200        |
    And I click on "Delete" icon for "Name of Staff2" inside flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff3       | Title                   | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    #NYSED-8336
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff3       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Beginning and End Dates Worked |
      | Name of Staff3       |                                |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Beginning and End Dates Worked |
      | Name of Staff3       | {SavedValue:Char256}           |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff3       | Title                   | 12.00 | $100                   | {SavedValue:Char255}           | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8334 @NYSED-8333 @NYSED-Sprint-32 @US-NYSED-2986 @M07
  Scenario Outline:Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a 'Annualized Rate of Pay' column (Editable, Optional, Currency Field without decimals, cannot be negative and Blank for new row)
  |Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a 'FTE' column (Editable, Optional, Number Field up to 2 decimal places, cannot negative and Blank for new row)|
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
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8334
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff2       | Title                   | 12  |                        | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 |                        | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $0                     |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Annualized Rate of Pay |
      | Name of Staff2       | eee                    |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 |                        | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $0                     |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Annualized Rate of Pay |
      | Name of Staff2       | -100                   |
    Then I softly see the following messages in the page details contains:
      | Annualized Rate of Pay cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | Annualized Rate of Pay |
      | Name of Staff2       | 88.988                 |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $88,988                | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $88,988                |                                | $100                                               | $100   | $100       | $100           | $200        |
    And I click on "Delete" icon for "Name of Staff2" inside flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" without waiting for record
    #NYSED-8333
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff2       | Title                   |     | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE  | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   |      | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 0.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | FTE |
      | Name of Staff2       | eee |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE  | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   |      | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 0.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | FTE  |
      | Name of Staff2       | -100 |
    Then I softly see the following messages in the page details contains:
      | FTE cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "Edit" :
      | Name of Staff Member | FTE    |
      | Name of Staff2       | 88.988 |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 88.98 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 88.98 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8353 @NYSED-8354 @NYSED-8368 @NYSED-Sprint-32 @US-NYSED-3003 @M07 @Bug-Ticket-NYSED-8845 @frameworkBug
  Scenario Outline:Verify that the Grantee User can create/update/delete details under the budget category - 'Supplies and Materials' when the Reimbursement Payment Request is in the Created state.
  |Verify that Grantee Users, apart from Submit and Certify & Create and Edit roles, cannot create/update/delete details under the budget category - 'Supplies and Materials'.|
  |Verify that the Grantee User can add/update/delete details under budget category 'Supplies and Materials', then the following roll-up sum takes place.|
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
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8353
    When I enter the following values into flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Purchase Order Date | Purchase Order # | Description of Item/Service | Provider/Vendor | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Check or Journal Entry (No ACH) | Additional Cost | Expenditure | Cash Match | Non-Cash Match |
      | 1                   | 12345            | Name of Staff2              | Provider        | 12       | 100       | Calculation                                              | Check                           | 100             | 100         | 100        | 100            |
    Then I softly see value "{Date:M/d/yyyy::d+1}" for title "Purchase Order Date" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12,345" for title "Purchase Order #" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Name of Staff2" for title "Description of Item/Service" against the value "Provider" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Provider" for title "Provider/Vendor" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12.00" for title "Quantity" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Check" for title "Check or Journal Entry (No ACH)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "1,300.00" for title "Calculated Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Provider/Vendor |
      | Name of Staff2              | Vendor          |
    Then I softly see value "{Date:M/d/yyyy::d+1}" for title "Purchase Order Date" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12,345" for title "Purchase Order #" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Name of Staff2" for title "Description of Item/Service" against the value "Vendor" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Vendor" for title "Provider/Vendor" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12.00" for title "Quantity" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Check" for title "Check or Journal Entry (No ACH)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "1,300.00" for title "Calculated Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8354
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8354
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I click on "Delete" icon for "Name of Staff2" inside flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" without waiting for record
    #NYSED-8353
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    #NYSED-8368
    When I enter the following values into flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Purchase Order Date | Purchase Order # | Description of Item/Service | Provider/Vendor | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Check or Journal Entry (No ACH) | Additional Cost | Expenditure | Cash Match | Non-Cash Match |
      | 1                   | 12345            | Name of Staff               | Provider        | 12       | 100       | Calculation                                              | Check                           | 100             | 100         | 100        | 100            |
    When I enter the following values into flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Purchase Order Date | Purchase Order # | Description of Item/Service | Provider/Vendor | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Check or Journal Entry (No ACH) | Additional Cost | Expenditure | Cash Match | Non-Cash Match |
      | 1                   | 12345            | Name of Staff1              | Provider1       | 12       | 100       | Calculation1                                             | Check                           | 100             | 100         | 100        | 100            |
    When I enter the following values into flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Purchase Order Date | Purchase Order # | Description of Item/Service | Provider/Vendor | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Check or Journal Entry (No ACH) | Additional Cost | Expenditure | Cash Match | Non-Cash Match |
      | 1                   | 12345            | Name of Staff2              | Provider2       | 12       | 100       | Calculation2                                             | Check                           | 100             | 100         | 100        | 100            |
    Then I softly see value "{Date:M/d/yyyy::d+1}" for title "Purchase Order Date" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12,345" for title "Purchase Order #" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Name of Staff2" for title "Description of Item/Service" against the value "Provider2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Provider2" for title "Provider/Vendor" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12.00" for title "Quantity" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation2" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Check" for title "Check or Journal Entry (No ACH)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "1,300.00" for title "Calculated Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "{Date:M/d/yyyy::d+1}" for title "Purchase Order Date" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12,345" for title "Purchase Order #" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Name of Staff1" for title "Description of Item/Service" against the value "Provider1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Provider1" for title "Provider/Vendor" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12.00" for title "Quantity" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation1" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Check" for title "Check or Journal Entry (No ACH)" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "1,300.00" for title "Calculated Expenditure" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Expenditure" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "{Date:M/d/yyyy::d+1}" for title "Purchase Order Date" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12,345" for title "Purchase Order #" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Name of Staff" for title "Description of Item/Service" against the value "Provider" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Provider" for title "Provider/Vendor" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12.00" for title "Quantity" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Check" for title "Check or Journal Entry (No ACH)" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "1,300.00" for title "Calculated Expenditure" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Expenditure | Cash Match | Non-Cash Match |
      | Name of Staff               | 200         | 200        | 200            |
    Then I softly see value "{Date:M/d/yyyy::d+1}" for title "Purchase Order Date" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12,345" for title "Purchase Order #" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Name of Staff2" for title "Description of Item/Service" against the value "Provider2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Provider2" for title "Provider/Vendor" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12.00" for title "Quantity" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation2" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Check" for title "Check or Journal Entry (No ACH)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "1,300.00" for title "Calculated Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "{Date:M/d/yyyy::d+1}" for title "Purchase Order Date" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12,345" for title "Purchase Order #" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Name of Staff1" for title "Description of Item/Service" against the value "Provider1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Provider1" for title "Provider/Vendor" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12.00" for title "Quantity" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation1" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Check" for title "Check or Journal Entry (No ACH)" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "1,300.00" for title "Calculated Expenditure" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Expenditure" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "{Date:M/d/yyyy::d+1}" for title "Purchase Order Date" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12,345" for title "Purchase Order #" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Name of Staff" for title "Description of Item/Service" against the value "Provider" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Provider" for title "Provider/Vendor" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12.00" for title "Quantity" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Check" for title "Check or Journal Entry (No ACH)" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "1,300.00" for title "Calculated Expenditure" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Expenditure" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Cash Match" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Non-Cash Match" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$400" for title "Total Match" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    And I click on "Delete" icon for "Name of Staff" inside flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" without waiting for record
    Then I softly see value "{Date:M/d/yyyy::d+1}" for title "Purchase Order Date" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12,345" for title "Purchase Order #" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Name of Staff2" for title "Description of Item/Service" against the value "Provider2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Provider2" for title "Provider/Vendor" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12.00" for title "Quantity" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation2" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Check" for title "Check or Journal Entry (No ACH)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "1,300.00" for title "Calculated Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "{Date:M/d/yyyy::d+1}" for title "Purchase Order Date" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12,345" for title "Purchase Order #" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Name of Staff1" for title "Description of Item/Service" against the value "Provider1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Provider1" for title "Provider/Vendor" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12.00" for title "Quantity" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation1" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Check" for title "Check or Journal Entry (No ACH)" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "1,300.00" for title "Calculated Expenditure" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Expenditure" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Name of Staff1" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    And I pause execution for "3" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentRequestBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Awarded Budget | Subaward Expenditure Paid to Date | Subaward Balance | Cumulative Expenditures to Date | Net Expenditure Change | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Professional Staff Salaries | 15                   | $1,000         | $0                                | $1,000           | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Support Staff Salaries      | 16                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Purchased Services          | 40                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Supplies and Materials      | 45                   | $0             | $0                                | $0               | $200                            | $200                   | $200       | $200           | $400        |
      | Action menu | Travel Expenses             | 46                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Employee Benefits           | 80                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Indirect Cost               | 90                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | BOCES Purchased Services    | 49                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Minor Remodeling            | 30                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Equipment                   | 20                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      |             | Total                       |                      | $1,000         | $0                                | $1,000           | $200                            | $200                   | $200       | $200           | $400        |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8367 @NYSED-8366 @NYSED-8365 @NYSED-8364 @NYSED-Sprint-32 @US-NYSED-3003 @M07
  Scenario Outline:Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Expenditure' column (Editable, Required, Currency Field without decimals, cannot be negative, cannot be 0 and blank for new row)
  |Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Calculated Expenditure' column is a formula field ((Quantity * Unit Cost) + Additional Cost) and not editable|
  |Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Additional Cost' column (Editable, Optional, Currency Field up without decimal, cannot be negative and Blank for new row)|
  |Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Check or Journal Entry (No ACH)' column (Editable, Blank for new row, Short text 255 Character and Required)|
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
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8367
    When I enter the following values into flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Purchase Order Date | Purchase Order # | Description of Item/Service | Provider/Vendor | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Check or Journal Entry (No ACH) | Additional Cost | Expenditure | Cash Match | Non-Cash Match |
      | 1                   | 12345            | Name of Staff2              | Provider        | 1.23     | 89        | Calculation                                              | Check                           | 100             | 100         | 100        | 100            |
    Then I softly see value "$100" for title "Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Expenditure |
      | Name of Staff2              |             |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Complete this field."
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Expenditure |
      | Name of Staff2              | eee         |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Expenditure |
      | Name of Staff2              | -100        |
    Then I softly see the following messages in the page details contains:
      | Expenditure cannot be negative. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Expenditure |
      | Name of Staff2              | 0           |
    Then I softly see the following messages in the page details contains:
      | Expenditure cannot be zero. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Expenditure |
      | Name of Staff2              | 88.988      |
    Then I softly see value "$88,988" for title "Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Expenditure |
      | Name of Staff2              | 889         |
    Then I softly see value "$889" for title "Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    #NYSED-8366
    Then I softly see value "209.00" for title "Calculated Expenditure" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    And I click on "Delete" icon for "Name of Staff2" inside flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Purchase Order Date | Purchase Order # | Description of Item/Service | Provider/Vendor | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Check or Journal Entry (No ACH) | Additional Cost | Expenditure | Cash Match | Non-Cash Match |
      | 1                   | 12345            | Name of Staff2              | Provider        | 12       | 100       | Calculation                                              | Check                           |                 | 100         | 100        | 100            |
    #NYSED-8365
    Then I softly see value "" for title "Additional Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Additional Cost |
      | Name of Staff2              | eee             |
    Then I softly see value "" for title "Additional Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Additional Cost |
      | Name of Staff2              | -100            |
    Then I softly see the following messages in the page details contains:
      | Additional Cost cannot be negative. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Additional Cost |
      | Name of Staff2              | 88.988          |
    Then I softly see value "$88,988" for title "Additional Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Additional Cost |
      | Name of Staff2              | 889             |
    Then I softly see value "$889" for title "Additional Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Check or Journal Entry (No ACH) |
      | Name of Staff2              |                                 |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Check or Journal Entry (No ACH) |
      | Name of Staff2              | Journal                         |
    Then I softly see value "Journal" for title "Check or Journal Entry (No ACH)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Check or Journal Entry (No ACH) |
      | Name of Staff2              | {SavedValue:Char256}            |
    Then I softly see value "{SavedValue:Char255}" for title "Check or Journal Entry (No ACH)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Check or Journal Entry (No ACH) |
      | Name of Staff2              | ACH                             |
    Then I softly see the following messages in the page details contains:
      | 'Check or Journal Entry (No ACH)’ cannot simply be entered as 'ACH'. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8369 @NYSED-8370 @NYSED-8378 @NYSED-Sprint-32 @US-NYSED-3003 @M07
  Scenario Outline:Verify that the Grantee User cannot create/update/delete details under the budget category - 'Supplies and Materials' when the Reimbursement Payment Request is not in the Created OR Send back to Subrecipient state.
  |Verify that the Internal User can see the 'View/Add Line Item Details' inline action and cannot add/update/delete the added budget under the budget category 'Supplies and Materials'.|
  |Verify that the Grantee User can create/update/delete details under the budget category - 'Supplies and Materials' when the Reimbursement Payment Request is in the Send Back to Subrecepient state.|
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
    And I wait for "2" seconds
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8359
    When I enter the following values into flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Purchase Order Date | Purchase Order # | Description of Item/Service | Provider/Vendor | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Check or Journal Entry (No ACH) | Additional Cost | Expenditure | Cash Match | Non-Cash Match |
      | 1                   | 12345            | Name of Staff2              | Provider        | 1.23     | 89        | Calculation                                              | Check                           | 100             | 100         | 100        | 100            |
    Then I softly see value "Provider" for title "Provider/Vendor" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8369
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8369
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8370
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8370
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
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
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8370
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff2" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
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
    Then I softly see field "Status" as "Created"
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8378
    When I enter the following values into flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Purchase Order Date | Purchase Order # | Description of Item/Service | Provider/Vendor | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Check or Journal Entry (No ACH) | Additional Cost | Expenditure | Cash Match | Non-Cash Match |
      | 1                   | 12345            | Name of Staff               | Provider        | 12       | 100       | Calculation                                              | Check                           | 100             | 100         | 100        | 100            |
    Then I softly see value "Name of Staff" for title "Description of Item/Service" against the value "Provider" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Name of Staff" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Name of Staff" in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Provider/Vendor |
      | Name of Staff               | Vendor          |
    Then I softly see value "Vendor" for title "Provider/Vendor" against the value "Name of Staff" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    And I click on "Delete" icon for "Name of Staff" inside flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |

  @NYSED-8362 @NYSED-8361 @NYSED-8360 @NYSED-Sprint-32 @US-NYSED-3003 @M07
  Scenario Outline:Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Calculation of Cost' column (Editable, Blank for new row, short text with 255 Character and Optional)
  |Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Unit Cost' column (Editable, Optional, Currency Field up without decimal, cannot be negative and Blank for new row)|
  |Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Quantity' column (Editable, Optional, Number Field up to 2 decimal places, cannot be negative and Blank for new row)|
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
    And I wait for "2" seconds
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8362
    When I enter the following values into flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Purchase Order Date | Purchase Order # | Description of Item/Service | Provider/Vendor | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Check or Journal Entry (No ACH) | Additional Cost | Expenditure | Cash Match | Non-Cash Match |
      | 1                   | 12345            | Name of Staff2              | Provider        | 1.23     | 89        |                                                          | Check                           | 100             | 100         | 100        | 100            |
    Then I softly see value "" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Name of Staff2              |          |           |                                                          |
    Then I softly see the following messages in the page details contains:
      | Quantity is required if Calculation of Cost is empty.                |
      | Unit Cost is required if Calculation of Cost is empty.               |
      | Calculation of Cost is required if Quantity and Unit Cost are empty. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Name of Staff2              | 1.2      |           |                                                          |
    Then I softly see the following messages in the page details contains:
      | Unit Cost is required if Calculation of Cost is empty. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Name of Staff2              |          | 23        |                                                          |
    Then I softly see the following messages in the page details contains:
      | Quantity is required if Calculation of Cost is empty. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Name of Staff2              | 1.2      | 23        | Calculation                                              |
    Then I softly cannot see the following messages in the page details contains:
      | Quantity is required if Calculation of Cost is empty.                |
      | Unit Cost is required if Calculation of Cost is empty.               |
      | Calculation of Cost is required if Quantity and Unit Cost are empty. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Name of Staff2              | {SavedValue:Char256}                                     |
    Then I softly see value "{SavedValue:Char255}" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Name of Staff2              | Cost                                                     |
    Then I softly see value "Cost" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Unit Cost |
      | Name of Staff2              |           |
    Then I softly see value "" for title "Unit Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see the following messages in the page details contains:
      | Calculation of Cost is Optional if Quantity and Unit Cost have a value. |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Name of Staff2              |           |                                                          |
    Then I softly see the following messages in the page details contains:
      | Unit Cost is required if Calculation of Cost is empty. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Name of Staff2              | 1.20      | Calculation                                              |
    Then I softly cannot see the following messages in the page details contains:
      | Unit Cost is Optional if Calculation of Cost has a value. |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Unit Cost |
      | Name of Staff2              | eee       |
    Then I softly see value "" for title "Unit Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Unit Cost |
      | Name of Staff2              | -23       |
    Then I softly see the following messages in the page details contains:
      | Unit Cost cannot be negative. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Unit Cost |
      | Name of Staff2              | 1.23      |
    Then I softly see value "$123" for title "Unit Cost" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Quantity |
      | Name of Staff2              | 1.23     |
    #NYSED-8360
    Then I softly see value "1.23" for title "Quantity" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Quantity | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Name of Staff2              |          |                                                          |
    Then I softly see the following messages in the page details contains:
      | Quantity is required if Calculation of Cost is empty. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Quantity | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Name of Staff2              | 1.23     | Calculation                                              |
    Then I softly cannot see the following messages in the page details contains:
      | Quantity is Optional if Calculation of Cost has a value. |
    Then I softly see value "1.23" for title "Quantity" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Quantity |
      | Name of Staff2              |          |
    Then I softly see value "" for title "Quantity" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Quantity |
      | Name of Staff2              | -12      |
    Then I softly see the following messages in the page details contains:
      | Quantity cannot be negative. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Quantity |
      | Name of Staff2              | 88.988   |
    Then I softly see value "88.98" for title "Quantity" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8359 @NYSED-8398 @NYSED-8358 @NYSED-8357 @NYSED-8356 @NYSED-Sprint-32 @US-NYSED-3003 @M07
  Scenario Outline:Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Provider/Vendor' column (Editable, Blank for new row, short text with 255 Character and Required)
  |Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Cash Match' and 'Non-Cash Match' columns (Editable, Optional, Currency Field without decimal places, negative not allowed, and $0 for new row)|
  |Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Description of Item/Service' column (Editable, Blank for new row, short text with 255 Character and Required)|
  |Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Purchase Order #' column (Editable, Required, Number Field, blank for new row)|
  |Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Purchase Order Date' column (Editable, Blank for new row, Date Field and Required)|
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
    And I wait for "2" seconds
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8359
    When I enter the following values into flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Purchase Order Date | Purchase Order # | Description of Item/Service | Provider/Vendor | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Check or Journal Entry (No ACH) | Additional Cost | Expenditure | Cash Match | Non-Cash Match |
      | 1                   | 12345            | Name of Staff2              | Provider        | 1.23     | 89        | Calculation                                              | Check                           | 100             | 100         | 100        | 100            |
    Then I softly see value "Provider" for title "Provider/Vendor" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Provider/Vendor |
      | Name of Staff2              |                 |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Provider/Vendor      |
      | Name of Staff2              | {SavedValue:Char256} |
    Then I softly see value "{SavedValue:Char255}" for title "Provider/Vendor" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    #NYSED-8398
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Cash Match | Non-Cash Match |
      | Name of Staff2       |            |                |
    Then I softly see value "" for title "Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "" for title "Non-Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$0" for title "Total Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Cash Match | Non-Cash Match |
      | Name of Staff2       | eee        | eee            |
    Then I softly see value "" for title "Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "" for title "Non-Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$0" for title "Total Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Cash Match | Non-Cash Match |
      | Name of Staff2       | 88.988     | 88.988         |
    Then I softly see value "$88,988" for title "Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$88,988" for title "Non-Cash Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$177,976" for title "Total Match" against the value "Name of Staff2" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Cash Match | Non-Cash Match |
      | Name of Staff2       | -100       | -100           |
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
      | Cash Match cannot be negative.     |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8358
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Calculation of Cost (if other than Quantity * Unit Cost) | Description of Item/Service |
      | Calculation                                              |                             |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Calculation of Cost (if other than Quantity * Unit Cost) | Description of Item/Service |
      | Calculation                                              | {SavedValue:Char256}        |
    Then I softly see value "{SavedValue:Char255}" for title "Description of Item/Service" against the value "Calculation" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    #NYSED-8357
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Purchase Order # |
      | {SavedValue:Char255} |                  |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Purchase Order # |
      | {SavedValue:Char255} | eee              |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Purchase Order # |
      | {SavedValue:Char255} | -10              |
    Then I softly see the following messages in the page details contains:
      | Purchase Order # cannot be negative. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Purchase Order # |
      | {SavedValue:Char255} | 88.988           |
    Then I softly see value "88,988" for title "Purchase Order #" against the value "Calculation" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"
    #NYSED-8356
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Purchase Order Date |
      | {SavedValue:Char255} |                     |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Purchase Order Date |
      | {SavedValue:Char255} | 2                   |
    Then I softly see value "{Date:M/d/yyyy::d+2}" for title "Purchase Order Date" against the value "{SavedValue:Char255}" inside table "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8148 @NYSED-8202 @NYSED-8204 @NYSED-8169 @NYSED-8149 @NYSED-8350 @NYSED-Sprint-32 @US-NYSED-2985 @M07
  Scenario Outline:Verify that Grantee User can see the 'View/Add Line Item Details'. inline action on the Reimbursement Payment Request layout -> Financials tab -> Payment Request Budget section -> Budget Categories table.
  |Verify that the Grantee User cannot create/update/delete details under the budget category - 'Professional Staff Salaries' when the Reimbursement Payment Request is not in the Created OR Send back to Subrecipient state.|
  |Verify that the Internal User can see the 'View/Add Line Item Details' inline action and cannot add/update/delete the added budget under the budget category 'Professional Staff Salaries'.|
  |Verify that Grantee Users, apart from Submit and Certify & Create and Edit roles, cannot create/update/delete details under the budget category - 'Professional Staff Salaries'.|
  |Verify that the Grantee User can create/update/delete details under the budget category - 'Professional Staff Salaries' when the Reimbursement Payment Request is in the Created state.|
  |Verify that the Grantee User can create/update/delete details under the budget category - 'Professional Staff Salaries' when the Reimbursement Payment Request is in the Send back to Subrecipient state.|
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
    And I wait for "2" seconds
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8206
    Then I see only the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
#    And I click on "Delete" icon for "name" inside flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff        | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    #NYSED-8149
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff        | Position Title          | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
    Then I softly can see row level action button "Edit" against "Name of Staff" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Name of Staff" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Specific Position/Title |
      | Name of Staff        | Title                   |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff        | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
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
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8169
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8169
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    And I click on "Delete" icon for "Name of Staff" inside flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" without waiting for record
    #NYSED-8149
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff        | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 1000   | 100        | 100            |
    And I click modal button "Close"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8202
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
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
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8204
    Then I softly cannot see top right button "New" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Name of Staff" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Name of Staff" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    And I click modal button "Close"
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
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    #NYSED-8350
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff1       | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Position Title          | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
    Then I softly can see row level action button "Edit" against "Name of Staff1" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Name of Staff1" in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Specific Position/Title |
      | Name of Staff1       | Title                   |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
    And I click on "Delete" icon for "Name of Staff" inside flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" without waiting for record
    #NYSED-8350
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click on "Delete" icon for "Name of Staff1" inside flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | P0           |

  @NYSED-8201 @NYSED-Sprint-32 @US-NYSED-2985 @M07
  Scenario Outline:Verify that the Grantee User can add/update/delete details under budget category 'Professional Staff Salaries', then the following roll-up sum takes place.
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
    #NYSED-8201
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff1       | Title                   | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff2       | Title                   | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 24.00 | $200                   |                                | $200                                               | $200   | $200       | $200           | $400        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Salary | Cash Match | Non-Cash Match |
      | Name of Staff2       | 200    | 200        | 200            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $200   | $200       | $200           | $400        |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 24.00 | $200                   |                                | $200                                               | $300   | $300       | $300           | $600        |
    And I click on "Delete" icon for "Name of Staff2" inside flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentRequestBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Awarded Budget | Subaward Expenditure Paid to Date | Subaward Balance | Cumulative Expenditures to Date | Net Expenditure Change | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Professional Staff Salaries | 15                   | $1,000         | $0                                | $1,000           | $100                            | $100                   | $100       | $100           | $200        |
      | Action menu | Support Staff Salaries      | 16                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Purchased Services          | 40                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Supplies and Materials      | 45                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Travel Expenses             | 46                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Employee Benefits           | 80                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Indirect Cost               | 90                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | BOCES Purchased Services    | 49                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Minor Remodeling            | 30                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      | Action menu | Equipment                   | 20                   | $0             | $0                                | $0               | $0                              | $0                     | $0         | $0             | $0          |
      |             | Total                       |                      | $1,000         | $0                                | $1,000           | $100                            | $100                   | $100       | $100           | $200        |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8200 @NYSED-Sprint-32 @US-NYSED-2985 @M07
  Scenario Outline:Verify that the Grantee user sees Professional Staff Salaries, Budget Categories modal, having a 'Cash Match' and 'Non-Cash Match' columns (Editable, Optional, Currency Field without decimal places, negative not allowed, and $0 for new row)
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
    #NYSED-8200
    Then I see only the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff1       | Title                   | 12  | 100                    | Beginning                      | 100                                                | 100    |            |                |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   |            |                | $0          |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $0         | $0             | $0          |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Cash Match | Non-Cash Match |
      | Name of Staff1       | eee        | eee            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   |            |                | $0          |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $0         | $0             | $0          |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Cash Match | Non-Cash Match |
      | Name of Staff1       | -100       | -100           |
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
      | Cash Match cannot be negative.     |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Cash Match | Non-Cash Match |
      | Name of Staff1       | 88.988     | 88.988         |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $88,988    | $88,988        | $177,976    |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $88,988    | $88,988        | $177,976    |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Cash Match | Non-Cash Match |
      | Name of Staff1       | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    And I click on "Delete" icon for "Name of Staff1" inside flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" without waiting for record

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8188 @NYSED-8182 @NYSED-8193 @NYSED-Sprint-32 @US-NYSED-2986 @M07
  Scenario Outline:Verify that the Grantee user sees Professional Staff Salaries, Budget Categories modal, having a 'Salary' column (Editable, Required, Currency Field without decimals, cannot be negative and Blank for new row)
  |Verify that the Grantee user sees Professional Staff Salaries, Budget Categories modal, having a 'Additional Cost (e.g., Per Diem, Teacher Stipends)' column (Editable, Optional, Currency Field without decimals, cannot be negative and Blank for new row)|
  |Verify that the Grantee user sees Professional Staff Salaries, Budget Categories modal, having a 'Beginning and End Dates Worked' column (Editable, Blank for new row, Short text 255 Character and Required)|
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
    #NYSED-8193
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff1       | Title                   | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Salary |
      | Name of Staff1       |        |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Salary |
      | Name of Staff1       | eee    |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Salary |
      | Name of Staff1       | -100   |
    Then I softly see the following messages in the page details contains:
      | Salary cannot be negative. |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Salary |
      | Name of Staff1       | 88.988 |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary  | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff1       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $88,988 | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $88,988 | $100       | $100           | $200        |
    And I click on "Delete" icon for "Name of Staff1" inside flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" without waiting for record
    #NYSED-8188
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff2       | Title                   | 12  | 100                    | Beginning                      |                                                    | 100    | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $100                   | Beginning                      |                                                    | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $0                                                 | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Additional Cost (e.g., Per Diem, Teacher Stipends) |
      | Name of Staff2       | eee                                                |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $100                   | Beginning                      |                                                    | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $0                                                 | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Additional Cost (e.g., Per Diem, Teacher Stipends) |
      | Name of Staff2       | -100                                               |
    Then I softly see the following messages in the page details contains:
      | Additional Cost cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Additional Cost (e.g., Per Diem, Teacher Stipends) |
      | Name of Staff2       | 88.988                                             |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $100                   | Beginning                      | $88,988                                            | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $88,988                                            | $100   | $100       | $100           | $200        |
    And I click on "Delete" icon for "Name of Staff2" inside flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff3       | Title                   | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    #NYSED-8182
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff3       | Title                   | 12.00 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Beginning and End Dates Worked |
      | Name of Staff3       |                                |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Beginning and End Dates Worked |
      | Name of Staff3       | {SavedValue:Char256}           |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff3       | Title                   | 12.00 | $100                   | {SavedValue:Char255}           | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-8175 @NYSED-8174 @NYSED-Sprint-32 @US-NYSED-2985 @M07
  Scenario Outline:Verify that the Grantee user sees Professional Staff Salaries, Budget Categories modal, having a 'Annualized Rate of Pay' column (Editable, Optional, Currency Field without decimals, cannot be negative and Blank for new row)
  |Verify that the Grantee user sees Professional Staff Salaries, Budget Categories modal, having a 'FTE' column (Editable, Optional, Number Field up to 2 decimal places, cannot negative and Blank for new row)|
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
    #NYSED-8175
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff2       | Title                   | 12  |                        | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 |                        | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $0                     |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Annualized Rate of Pay |
      | Name of Staff2       | eee                    |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 |                        | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $0                     |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Annualized Rate of Pay |
      | Name of Staff2       | -100                   |
    Then I softly see the following messages in the page details contains:
      | Annualized Rate of Pay cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | Annualized Rate of Pay |
      | Name of Staff2       | 88.988                 |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 12.00 | $88,988                | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 12.00 | $88,988                |                                | $100                                               | $100   | $100       | $100           | $200        |
    And I click on "Delete" icon for "Name of Staff2" inside flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" without waiting for record
    #NYSED-8174
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff2       | Title                   |     | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE  | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   |      | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 0.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | FTE |
      | Name of Staff2       | eee |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE  | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   |      | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 0.00 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | FTE  |
      | Name of Staff2       | -100 |
    Then I softly see the following messages in the page details contains:
      | FTE cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Name of Staff Member | FTE    |
      | Name of Staff2       | 88.988 |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" :
      | Actions     | Name of Staff Member | Specific Position/Title | FTE   | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Name of Staff2       | Title                   | 88.98 | $100                   | Beginning                      | $100                                               | $100   | $100       | $100           | $200        |
      |             | Total                |                         | 88.98 | $100                   |                                | $100                                               | $100   | $100       | $100           | $200        |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9161 @NYSED-9360 @NYSED-9361 @NYSED-9363 @NYSED-9364 @NYSEDSprint-33 @US-NYSED-5798 @M05 @santosh
  Scenario Outline:Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist other than in ‘Created’, ‘Rejected’ or ‘Processed’ status on the same subaward|
  |Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist in 'Approved' status on the same subaward|
  |Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist in 'Entered' status on the same subaward|
  |Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist in 'Ready for Release' status on the same subaward|
  |Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist in 'Released' status on the same subaward|
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
    When I navigate to "Financials" sub tab
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
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9161
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |
    And I click modal button "Close"
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Mark as Approved" in the page details
    Then I softly see field "Status" as "Approved"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9360
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |
    And I click modal button "Close"
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 100           |
    And I click modal button "Close"
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Entered"
    And I save the value from row "1" for column name "Document Number" as "DocumentNumber" from flex table "---paymentRequest:-:DocumentHistoryTableId---"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9361
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |
    And I click modal button "Close"
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
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
    #NYSED-9363
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |
    And I click modal button "Close"
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Release Voucher" icon for "Ready for Release" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Released"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9364
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |

  @NYSED-9162 @NYSEDSprint-33 @US-NYSED-5798 @M05 @santosh
    @NYSED-9177 @NYSED-Sprint-33 @US-NYSED-6872 @M06
  Scenario Outline:Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist with FS-10F Reimbursement Template Selected and in ‘Processed’ status on the same subaward
  |Verify that Grantee User (Submit and Certify and Create and Edit) sees Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement request exist with FS-10F Reimbursement Template and in ‘Processed’ status|
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
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I click on "Mark as Approved" in the page details
    And I wait for "2" seconds
    And I click on "Mark as Processed" in the page details
    Then I softly see field "Status" as "Processed"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9162
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created because FS-10F is already Processed. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9177
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created because FS-10F is already Processed. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9177
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created because FS-10F is already Processed. |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |

  @NYSED-9102 @NYSED-Sprint-33 @US-NYSED-3529 @M05 @santosh
  Scenario Outline:Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist with FS-10F Reimbursement Template Selected and in ‘Processed’ status on the same subaward
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
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff        | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    #NYSED-9102
    Then I softly see the following messages in the page details contains:
      | Expenditures are not allowed for budget categories with a zero awarded budget during Payment Request submission. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-9098 @NYSED-9104 @NYSED-Sprint-33 @US-NYSED-3529 @M05 @santosh
  Scenario Outline:Verify that the Subrecipient user with the Submit and Certify role cannot add expenditures for budget categories with zero awarded budget on the FS-25 template during Payment Request submission
  |Verify that the Subrecipient user with the Submit and Certify role can complete the end-to-end workflow of submitting FS-10F with non-zero awarded budget|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "DGFS10SUPPORTSTAFF_SUPPLYANDMATERIAL_BUDGETCATEGORY"
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
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Equipment       | 126                             | 100        | 100            |
    #NYSED-9098
    Then I softly see the following messages in the page details contains:
      | Expenditures are not allowed for budget categories with a zero awarded budget during Payment Request submission. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category  | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Minor Remodeling | 126                             | 100        | 100            |
    #NYSED-9098
    Then I softly see the following messages in the page details contains:
      | Expenditures are not allowed for budget categories with a zero awarded budget during Payment Request submission. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category          | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | BOCES Purchased Services | 126                             | 100        | 100            |
    #NYSED-9098
    Then I softly see the following messages in the page details contains:
      | Expenditures are not allowed for budget categories with a zero awarded budget during Payment Request submission. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Indirect Cost   | 126                             | 100        | 100            |
    #NYSED-9098
    Then I softly see the following messages in the page details contains:
      | Expenditures are not allowed for budget categories with a zero awarded budget during Payment Request submission. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category   | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Employee Benefits | 126                             | 100        | 100            |
    #NYSED-9098
    Then I softly see the following messages in the page details contains:
      | Expenditures are not allowed for budget categories with a zero awarded budget during Payment Request submission. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Travel Expenses | 126                             | 100        | 100            |
    #NYSED-9098
    Then I softly see the following messages in the page details contains:
      | Expenditures are not allowed for budget categories with a zero awarded budget during Payment Request submission. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category    | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Purchased Services | 126                             | 100        | 100            |
    #NYSED-9098
    Then I softly see the following messages in the page details contains:
      | Expenditures are not allowed for budget categories with a zero awarded budget during Payment Request submission. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category             | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 126                             | 100        | 100            |
    #NYSED-9098
    Then I softly see the following messages in the page details contains:
      | Expenditures are not allowed for budget categories with a zero awarded budget during Payment Request submission. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category        | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Supplies and Materials | 450                             | 100        | 100            |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category        | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Support Staff Salaries | 450                             | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly cannot see the following messages in the page details contains:
      | Expenditures are not allowed for budget categories with a zero awarded budget during Payment Request submission. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-9097 @NYSED-Sprint-33 @US-NYSED-3529 @M05 @santosh
  Scenario Outline:Verify that the Subrecipient user with the Submit and Certify role receives a validation message when FS-25 cumulative expenditures exceed 90% of the awarded budget on the Reimbursement Payment Request layout- FS-25
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "DGFS10SUPPORTSTAFF_SUPPLYANDMATERIAL_BUDGETCATEGORY"
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
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category        | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Support Staff Salaries | 475                             | 100        | 100            |
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category        | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Supplies and Materials | 475                             | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    #NYSED-9097
    Then I softly see the following messages in the page details contains:
      | Financials Tab - FS‑25 cumulative expenditures cannot exceed 90% of the awarded budget. Adjust the amount before submitting. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-9102 @NYSED-9104 @NYSED-Sprint-33 @US-NYSED-3529 @M05 @santosh
  Scenario Outline:Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist with FS-10F Reimbursement Template Selected and in ‘Processed’ status on the same subaward
  |Verify that the Subrecipient user with the Submit and Certify role can complete the end-to-end workflow of submitting FS-10F with non-zero awarded budget|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "DGFS10SUPPORTSTAFF_SUPPLYANDMATERIAL_BUDGETCATEGORY"
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
    #NYSED-9102
    Then I softly see the following messages in the page details contains:
      | Expenditures are not allowed for budget categories with a zero awarded budget during Payment Request submission. |
    And I click modal button "Close"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff        | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 450    | 100        | 100            |
    And I click modal button "Close"
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Purchase Order Date | Purchase Order # | Description of Item/Service | Provider/Vendor | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Check or Journal Entry (No ACH) | Additional Cost | Expenditure | Cash Match | Non-Cash Match |
      | 1                   | 12345            | Name of Staff2              | Provider        | 1.23     | 89        | Calculation                                              | Check                           | 100             | 450         | 100        | 100            |
    And I click modal button "Close"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    #NYSED-9104
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly cannot see the following messages in the page details contains:
      | Expenditures are not allowed for budget categories with a zero awarded budget during Payment Request submission. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-9354 @NYSED-Sprint-33 @US-NYSED-3529 @M05
  Scenario Outline:Verify that the Subrecipient user with the Submit and Certify role can complete the end-to-end workflow of submitting FS-10F with non-zero awarded budget - Lump Sum
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "DGFS10_LUMPSUM_BUDGETCATEGORY"
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
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Lump Sum        | 500                             | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    #NYSED-9354
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly cannot see the following messages in the page details contains:
      | Financials Tab - FS‑25 cumulative expenditures cannot exceed 90% of the awarded budget. Adjust the amount before submitting. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-9359 @NYSED-9362 @NYSEDSprint-33 @US-NYSED-5798 @M05 @santosh
  Scenario Outline:Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist in 'Submitted for Approval' status on the same subaward
  |Verify that Internal Profile User see Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist in 'On Hold' status on the same subaward|
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
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FD Username} | Step 1        |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9359
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |
    And I click modal button "Close"
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I "Approve" in the approval decision
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
      | {SavedValue:NewFundingAccountAbleToPayYes} | 100           |
    And I click modal button "Close"
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    And I click on "Place On Hold" icon for "Entered" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "On Hold"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9362
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           |

  @NYSED-9055 @NYSED-9054 @NYSED-Sprint-33 @US-NYSED-3556 @M05 @santosh
  Scenario Outline:Verify that External User (All Profile) sees Payment Request Amount column shows value from Financials tab → Payment Request Summary section → Reimbursed Amount on Payments module → Reimbursements left menu --> Reimbursement List View Filter
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
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FD Username} | Step 1        |
    When I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
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
      | {SavedValue:NewFundingAccountAbleToPayYes} | 100           |
    And I click modal button "Close"
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Entered"
    And I save the field labeled "Reimbursed Amount" as "ReimbursedAmount"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    #NYSED-9055
    Then I softly see value "{SavedValue:ReimbursedAmount}" for title "Payment Request Amount" inside table "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    #NYSED-9054
    Then I see only the following headers in table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" :
      | Actions | EGMS ID | Subaward ID | Project ID | Reimbursement Template | Reporting Period | Payment Request Amount | Status |
    When I re-login to "Grants Portal" app as "<subrecipientUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    #NYSED-9055
    Then I softly see value "{SavedValue:ReimbursedAmount}" for title "Payment Request Amount" inside table "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    #NYSED-9054
    Then I see only the following headers in table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" :
      | Actions | EGMS ID | Subaward ID | Project ID | Reimbursement Template | Reporting Period | Payment Request Amount | Status |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser | subrecipientUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           | GRANTEE_CE       |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           | GRANTEE_VO       |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           | GRANTEE_LEA      |

  @NYSED-9053 @NYSED-9052 @NYSED-Sprint-33 @US-NYSED-3556 @M05 @santosh
  Scenario Outline:Verify that External user (LEA Admin OR View Only Profile) do not see the inline edit and delete action under 'Reimbursements - All' filter for the reimbursements whose status is created
  |Verify that External user (Submit and Certify OR Create and Edit Profile) sees the inline edit and delete action under 'Reimbursements - All' filter for those reimbursements whose status is created|
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
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    #NYSED-9052
    Then I softly can see row level action button "Edit" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    #NYSED-9052
    Then I softly can see row level action button "Edit" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    #NYSED-9053
    Then I softly cannot see row level action button "Edit" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    #NYSED-9053
    Then I softly cannot see row level action button "Edit" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:ReimbursementID}" in flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-9044 @NYSED-9048 @NYSED-Sprint-33 @US-NYSED-3556 @santosh
  Scenario Outline:Verify that External user (All Profile) sees the list of all available Submitted to Grantor statuses of payment requests shown under 'Reimbursements - Submitted' filter
  |Verify that External user (All Profile) sees the list of all available 'Processed' statuses of payment requests shown under 'Reimbursements - Processed' filter|
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
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - Submitted"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    #NYSED-9044
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    When I re-login to "Grants Portal" app as "<subrecipientUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - Submitted"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    #NYSED-9044
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I click on "Mark as Approved" in the page details
    And I wait for "2" seconds
    And I click on "Mark as Processed" in the page details
    Then I softly see field "Status" as "Processed"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - Processed"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    #NYSED-9048
    Then I softly see value "Processed" for title "Status" inside table "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    When I re-login to "Grants Portal" app as "<subrecipientUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - Processed"
    And I perform quick search for "{SavedValue:ReimbursementID}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    #NYSED-9048
    Then I softly see value "Processed" for title "Status" inside table "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser | subrecipientUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           | GRANTEE_CE       |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           | GRANTEE_VO       |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FD           | GRANTEE_LEA      |

  @NYSED-9577 @NYSED-9576 @NYSED-9578 @NYSED-9579 @NYSED-9580 @NYSED-9581 @NYSED-Sprint-33 @US-NYSED-6872 @M06
  Scenario Outline:Verify that Grantee Profile User (Submit and Certify and Create and Edit) sees Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist in ‘Submitted to Grantor’ status on Award
  |Verify that Grantee Profile User (Submit and Certify and Create and Edit) sees Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist in ‘Created’ status on Award|
  |Verify that Grantee Profile User (Submit and Certify and Create and Edit) sees Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist in ‘Approved’ status on Award|
  |Verify that Grantee Profile User (Submit and Certify and Create and Edit) sees Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist in ‘Entered’ status on Award|
  |Verify that Grantee Profile User (Submit and Certify and Create and Edit) sees Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist in ‘Ready for Release’ status on Award|
  |Verify that Grantee Profile User (Submit and Certify and Create and Edit) sees Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist in ‘Released' status on Award|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
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
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
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
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9576
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
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
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
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
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9577
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Mark as Approved" in the page details
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9578
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 100           |
    And I click modal button "Close"
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Entered"
    And I save the value from row "1" for column name "Document Number" as "DocumentNumber" from flex table "---paymentRequest:-:DocumentHistoryTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9579
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
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
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9580
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Release Voucher" icon for "Ready for Release" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Released"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9581
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |

    Examples:
      | GrantName                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_SC   | FD           |
#      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_CE   | FD           |

  @NYSED-9582 @NYSED-Sprint-33 @US-NYSED-6872 @M06
  Scenario Outline:Verify that Grantee Profile User (Submit and Certify and Create and Edit) sees Validation on Save and Continue button of 'Create Amendment Request' modal when any reimbursement payment request exist in ‘On Hold’ status on Award
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
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff        | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    And I click modal button "Close"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FD Username} | Step 1        |
    When I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
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
      | {SavedValue:NewFundingAccountAbleToPayYes} | 100           |
    And I click modal button "Close"
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    And I click on "Place On Hold" icon for "Entered" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "On Hold"
    When I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9582
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9582
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created while Reimbursement Payment Request {SavedValue:ReimbursementID} is in progress. |

    Examples:
      | Announcement Name                         | InternalUser | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | FD           | GRANTEE_SC   |

  @NYSED-9722 @NYSED-9713 @NYSED-9715 @NYSED-9711 @NYSED-Sprint-34 @US-NYSED-3528 @M06 @ExecutionRDueToNeedsToUpdateSomeTestCaseByManualQA
  Scenario Outline:Verify that Grantee User (Submit and Certify and Create and Edit Role) sees validation message on click of 'Reimbursement Request' button when Reimbursement Payment Request of any type is in Entered State
  |Verify that Internal FD User sees validation message on click of 'Release Initial Payment' action when Reimbursement Payment Request of any type is in Ready for Release State|
  |Verify that Internal FD User sees validation message on click of 'Release Initial Payment' action when Reimbursement Payment Request of any type is in Released State|
  |Verify that Internal FD User sees validation message on click of 'Release Initial Payment' action when Reimbursement Payment Request of any type is in Approved State|
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
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary | Cash Match | Non-Cash Match |
      | Name of Staff        | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 100    | 100        | 100            |
    And I click modal button "Close"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FO Username} | Step 1        |
    When I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "5" seconds
    When I click on "Release Initial Payment" in the page details
    #NYSED-9711
    Then I softly see the following messages in the page details contains:
      | An Initial Payment cannot be released because a Reimbursement Payment Request {SavedValue:ReimbursementID} is currently in progress. |
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID            | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 100           |
    And I click modal button "Close"
    And I click on "Generate Document" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Entered"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-9722 #ThrowingValidationMessageOnReimbursementRequestButton
    Then I softly see the following messages in the page details contains:
      | A Reimbursement Payment Request {SavedValue:ReimbursementID} is already in progress. You cannot initiate another reimbursement request until the existing request is Processed or Rejected. |
    And I refresh the page
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I save the value from row "1" for column name "Document Number" as "DocumentNumber" from flex table "---paymentRequest:-:DocumentHistoryTableId---"
    And I click on "Schedule Document Release" icon for "Entered" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter in modal value "50" into field "ReleaseDate__c"
    When I click modal button "Save"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Ready for Release"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "5" seconds
    When I click on "Release Initial Payment" in the page details
    #NYSED-9713
    Then I softly see the following messages in the page details contains:
      | An Initial Payment cannot be released because a Reimbursement Payment Request {SavedValue:ReimbursementID} is currently in progress. |
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Release Voucher" icon for "Ready for Release" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "7" seconds
    Then I softly see field "Status" as "Released"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "5" seconds
    When I click on "Release Initial Payment" in the page details
    #NYSED-9715
    Then I softly see the following messages in the page details contains:
      | An Initial Payment cannot be released because a Reimbursement Payment Request {SavedValue:ReimbursementID} is currently in progress. |

    Examples:
      | Announcement Name                         | InternalUser | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | FO           | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Grant} | FO           | GRANTEE_CE   |

  @NYSED-9719 @NYSED-9720 @NYSED-9721 @NYSED-9712 @NYSED-9702 @NYSED-9725 @NYSED-9723 @NYSED-9716 @NYSED-Sprint-34 @US-NYSED-3528 @M06 @ExecutionRDueToNeedsToUpdateSomeTestCaseByManualQA
  Scenario Outline:Verify that Grantee User (Submit and Certify and Create and Edit Role) sees validation message on click of 'Reimbursement Request' button when Reimbursement Payment Request of any type is in Created State
  |Verify that Grantee User (Submit and Certify and Create and Edit Role) sees validation message on click of 'Reimbursement Request' button when Reimbursement Payment Request of any type is in Submitted to Grantor State|
  |Verify that Grantee User (Submit and Certify and Create and Edit Role) sees validation message on click of 'Reimbursement Request' button when Reimbursement Payment Request of any type is in Approved State|
  |Verify that Internal FD User sees validation message on click of 'Release Initial Payment' action when Reimbursement Payment Request of any type is in Entered State|
  |Verify that Internal FD User sees validation message on click of 'Release Initial Payment' action when Reimbursement Payment Request of any type is in Submitted to Grantor State|
  |Verify that Grantee User (Submit and Certify and Create and Edit Role) sees validation message on click of 'Reimbursement Request' button when Reimbursement Payment Request of any type is in Released State|
  |Verify that Grantee User (Submit and Certify and Create and Edit Role) sees validation message on click of 'Reimbursement Request' button when Reimbursement Payment Request of any type is in Ready for Release State|
  |Verify that Internal FD User sees validation message on click of 'Release Initial Payment' action when Reimbursement Payment Request of any type is in Void State|
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
    And I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
   #NYSED-9719 #ThrowingValidationMessageOnReimbursementRequestButton
    Then I softly see the following messages in the page details contains:
      | A Reimbursement Payment Request {SavedValue:ReimbursementID} is already in progress. You cannot initiate another reimbursement request until the existing request is Processed or Rejected. |
    And I refresh the page
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category             | Cumulative Expenditures to Date | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 126                             | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I click on hyperlink containing value "{SavedValue:AWARD_EGMSID}"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
   #NYSED-9720
    Then I softly see the following messages in the page details contains:
      | A Reimbursement Payment Request {SavedValue:ReimbursementID} is already in progress. You cannot initiate another reimbursement request until the existing request is Processed or Rejected. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Release Initial Payment" in the page details
    #NYSED-9702
    Then I softly see the following messages in the page details contains:
      | An Initial Payment cannot be released because a Reimbursement Payment Request {SavedValue:ReimbursementID} is currently in progress. |
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FO Username} | Step 1        |
    When I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
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
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "5" seconds
    When I click on "Release Initial Payment" in the page details
    #NYSED-9712
    Then I softly see the following messages in the page details contains:
      | An Initial Payment cannot be released because a Reimbursement Payment Request {SavedValue:ReimbursementID} is currently in progress. |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-9721
    Then I softly see the following messages in the page details contains:
      | A Reimbursement Payment Request {SavedValue:ReimbursementID} is already in progress. You cannot initiate another reimbursement request until the existing request is Processed or Rejected. |
    And I refresh the page
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I save the value from row "1" for column name "Document Number" as "DocumentNumber" from flex table "---paymentRequest:-:DocumentHistoryTableId---"
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
    #NYSED-9723
    Then I softly see the following messages in the page details contains:
      | A Reimbursement Payment Request {SavedValue:ReimbursementID} is already in progress. You cannot initiate another reimbursement request until the existing request is Processed or Rejected. |
    And I refresh the page
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Release Voucher" icon for "Ready for Release" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Released"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-9725
    Then I softly see the following messages in the page details contains:
      | A Reimbursement Payment Request {SavedValue:ReimbursementID} is already in progress. You cannot initiate another reimbursement request until the existing request is Processed or Rejected. |
    And I refresh the page
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Void" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Void"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "5" seconds
    When I click on "Release Initial Payment" in the page details
    #NYSED-9716
    Then I softly see the following messages in the page details contains:
      | An Initial Payment cannot be released because a Reimbursement Payment Request {SavedValue:ReimbursementID} is currently in progress. |

    Examples:
      | Announcement Name                         | InternalUser | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | FO           | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Grant} | FO           | GRANTEE_CE   |

  @NYSED-9714 @NYSED-Sprint-34 @US-NYSED-3528 @M06 @ExecutionRDueToNeedsToUpdateSomeTestCaseByManualQA
  Scenario Outline:Verify that Internal FD User sees validation message on click of 'Release Initial Payment' action when Reimbursement Payment Request of any type is in on Hold State
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
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FO Username} | Step 1        |
    When I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:ReimbursementID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I wait for "2" seconds
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
    And I click on "Place On Hold" icon for "Entered" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "On Hold"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARD_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARD_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "5" seconds
    When I click on "Release Initial Payment" in the page details
    #NYSED-9714
    Then I softly see the following messages in the page details contains:
      | An Initial Payment cannot be released because a Reimbursement Payment Request {SavedValue:ReimbursementID} is currently in progress. |

    Examples:
      | Announcement Name                         | InternalUser | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | FO           | GRANTEE_SC   |

  @NYSED-10313 @NYSED-Sprint-35 @US-NYSED-9600 @M06 @APIdeletionIssueTicket-NYSED-10444
  Scenario Outline:Verify that the GF Staff queue members can only see a new page-level drop-down action ‘Mark as Rejected’ is added on the Reimbursement Payment Request layout when it is in ‘Submitted to Grantor’ state. - FS-10F
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
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRSupportStaffSalariesTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary |
      | Name of Staff        | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 1000   |
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
    And I wait for "2" seconds
    #NYSED-10313
    Then I softly can see top right dropdown button "Mark as Rejected" in page detail
    When I click on "Mark as Rejected" in the page details without processing
    Then I softly see confirmation box with body "This action will mark the Payment Request as Rejected. Are you sure want to Proceed?" is displayed
    When I click alert button "Cancel"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Mark as Rejected" in the page details without processing
    When I click alert button "OK"
    When I enter "Rejected Reiumbursement PR" in rich text prompt input
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "red"

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   | EXE           |

  @NYSED-10210 @NYSED-Sprint-35 @US-NYSED-10008 @M06
  Scenario Outline:Verify that the FD user sees Cst Cntr fields remain locked in active and closed states when Expenditure Paid to Date is more than $0 on the Funding Account layout -> Overview tab -> Chart of Accounts section - Active State Funding Account
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
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:AutomationPermanentNewStateFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentNewStateFundingAccount}" inside table
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    #NYSED-10210
    Then I softly see that "Cst Cntr" rendered in view mode only
    Then I softly see that "Cst Cntr Variable" rendered in view mode only
    Then I softly see that "Cst Cntr Year" rendered in view mode only

    Examples:
      | GrantName                                                 | GFStaffQue |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO         |

  @NYSED-10213 @NYSED-Sprint-35 @US-NYSED-10008 @M06
  Scenario Outline:Verify that the FD user sees Cst Cntr fields remain locked in active and closed states when Expenditure Paid to Date is more than $0 on the Funding Account layout -> Overview tab -> Chart of Accounts section - Active Federal Funding Account
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "FEDERAL_FA_DIRECTGRANT_YES_FEDERALFUNDINGACCUNT_BYAPPLICANT"
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
    And I click on top right button "New Document" in flex table with id "---paymentRequest:-:DocumentHistoryTableId---"
    When I enter in modal value "Voucher" into field "Type__c"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I click on "View" icon for "Voucher" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:TransactionsTableId---" by clicking "New" :
      | Payment Funding Account EGMS ID                   | Payment Split |
      | {SavedValue:NewFundingAccountAbleToPayYesFederal} | 126           |
    And I click modal button "Close"
    And I wait for "5" seconds
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
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:NewFundingAccountAbleToPayYesFederal}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:NewFundingAccountAbleToPayYesFederal}" inside table
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    #NYSED-10213
    Then I softly see that "Cst Cntr" rendered in view mode only
    Then I softly see that "Cst Cntr Variable" rendered in view mode only
    Then I softly see that "Cst Cntr Year" rendered in view mode only

    Examples:
      | GrantName                                                 | GFStaffQue |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO         |