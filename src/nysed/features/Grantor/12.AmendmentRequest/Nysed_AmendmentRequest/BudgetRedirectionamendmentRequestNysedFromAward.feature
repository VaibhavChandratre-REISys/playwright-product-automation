@amendmentRequestsNysed @BudgetRedirectionamendmentRequestsNysed
Feature: Validate all scenarios in the Budget Redirection Amendment Request.

  @NYSED-9504 @NYSED-9505 @NYSED-9492 @NYSED-Sprint-33 @US-NYSED-7990 @M06
  Scenario Outline:Verify that the Grantee User cannot create/update/delete details under the budget category - 'Support Staff Salaries' when the Amendment Request is not in the Created OR Send back to Subrecipient.
  |Verify that the Internal User can see the 'View/Add Line Item Details' inline action and cannot add/update/delete the added budget under the budget category 'Support Staff Salaries'.|
  |Verify that the Grantee User can create/update/delete details under the budget category - 'Support Staff Salaries' when the Amendment Request is sent back to the Subrecipient.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10SUPPORTSTAFFSALARIES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title         | Projected Salary | Cash Match | Non-Cash Match |
      | Support Staff Salaries - Item 1 | 1000             | 50         | 50             |
    And I click modal button "Close"
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9504
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Support Staff Salaries - Item 1" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Support Staff Salaries - Item 1" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:grantorBudgetChangeTableId---"
    #NYSED-9505
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Support Staff Salaries - Item 1" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Support Staff Salaries - Item 1" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    And I click modal button "Close"
    When I click on "Send Back to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Support Staff Salaries - Item 1" inside flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title3         | 32             | 12.34 | 300                    | 300                                                | 300              | 300        | 300            |
    #NYSED-9492
    Then I softly can see row level action button "Edit" against "Position Title3" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Position Title3" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title3         | 32             | 12.34 | $300                   | $300                                               | $300             | $300       | $300           | $600        | $900               |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title3         | 400              | 400        | 400            |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title3         | 32             | 12.34 | $300                   | $300                                               | $400             | $400       | $400           | $800        | $1,200             |
    When I click on "Delete" icon for "Position Title3" inside flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9549 @NYSED-9554 @NYSED-9548 @NYSED-9546 @NYSED-9553 @NYSED-Sprint-33 @US-NYSED-7994 @M06
  Scenario Outline:Verify that the Grantee User can create/update/delete details under the budget category - 'Employee Benefits' when the Amendment Request is in the Created state. (This access is only available in case of budget redirection amendment).
  |Verify that the Grantee User can add/update/delete details under budget category 'Employeed Benefits', then the following roll-up sum takes place.|
  |Verify that the Grantee User can see the 'Original Budget Details'. inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table|
  |Verify that the Grantee User can see the 'View/Add Line Item Details'. inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table when 'Is a Detailed Budget Required on the Subaward?' is set to Yes|
  |Verify that Grantee Users, apart from Submit and Certify & Create and Edit roles, cannot create/update/delete details under the budget category - 'Employees Benefits' when the Amendment Req is in the Created OR Send back to Subrecipient.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10EMPLOYEEBENEFITS_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9546
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I see only the following headers in table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" :
      | Actions | Benefit | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
    When I click on "Delete" icon for "Employee Benefits - Item 1" inside flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "New" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits1 | 1000                 | 100        | 100            |
    #NYSED-9549
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Automation Benefits1 | $1,000               | $100       | $100           | $200        | $1,200             |
    Then I softly can see row level action button "Edit" against "Automation Benefits1" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Automation Benefits1" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "Edit" :
      | Benefit              | Proposed Expenditure |
      | Automation Benefits1 | 2000                 |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Automation Benefits1 | $2,000               | $100       | $100           | $200        | $2,200             |
    When I click on "Delete" icon for "Automation Benefits1" inside flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    When I enter the following values into flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "New" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits1 | 100                  | 100        | 100            |
    When I enter the following values into flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "New" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits2 | 200                  | 200        | 200            |
    When I enter the following values into flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "New" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits3 | 300                  | 300        | 300            |
    #NYSED-9554
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" :
      | Actions     | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Automation Benefits1 | $100                 | $100       | $100           | $200        | $300               |
      | Action menu | Automation Benefits2 | $200                 | $200       | $200           | $400        | $600               |
      | Action menu | Automation Benefits3 | $300                 | $300       | $300           | $600        | $900               |
      |             | Total                | $600                 | $600       | $600           | $1,200      | $1,800             |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount | Spent | Advance Balance | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Support Staff Salaries      | 16                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Purchased Services          | 40                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Supplies and Materials      | 45                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Travel Expenses             | 46                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Employee Benefits           | 80                   | $1,000.00    | $0    | $0              | $1,000           | $600.00              | ($400.00)  | $600.00    | $600.00        | $1,200.00   | $1,800.00          |
      | Action menu | Indirect Cost               | 90                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | BOCES Purchased Services    | 49                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Minor Remodeling            | 30                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Equipment                   | 20                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      |             | Total                       |                      | $1,000.00    |       |                 |                  | $600.00              | ($400.00)  | $600.00    | $600.00        | $1,200.00   | $1,800.00          |
      |             | Grand Total                 |                      | $1,000.00    |       |                 |                  | $600.00              | ($400.00)  | $600.00    | $600.00        | $1,200.00   | $1,800.00          |
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "Edit" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits3 | 400                  | 400        | 400            |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" :
      | Actions     | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Automation Benefits1 | $100                 | $100       | $100           | $200        | $300               |
      | Action menu | Automation Benefits2 | $200                 | $200       | $200           | $400        | $600               |
      | Action menu | Automation Benefits3 | $400                 | $400       | $400           | $800        | $1,200             |
      |             | Total                | $700                 | $700       | $700           | $1,400      | $2,100             |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount | Spent | Advance Balance | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Support Staff Salaries      | 16                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Purchased Services          | 40                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Supplies and Materials      | 45                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Travel Expenses             | 46                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Employee Benefits           | 80                   | $1,000.00    | $0    | $0              | $1,000           | $700.00              | ($300.00)  | $700.00    | $700.00        | $1,400.00   | $2,100.00          |
      | Action menu | Indirect Cost               | 90                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | BOCES Purchased Services    | 49                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Minor Remodeling            | 30                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Equipment                   | 20                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      |             | Total                       |                      | $1,000.00    |       |                 |                  | $700.00              | ($300.00)  | $700.00    | $700.00        | $1,400.00   | $2,100.00          |
      |             | Grand Total                 |                      | $1,000.00    |       |                 |                  | $700.00              | ($300.00)  | $700.00    | $700.00        | $1,400.00   | $2,100.00          |
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "Delete" icon for "Automation Benefits3" inside flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" :
      | Actions     | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Automation Benefits1 | $100                 | $100       | $100           | $200        | $300               |
      | Action menu | Automation Benefits2 | $200                 | $200       | $200           | $400        | $600               |
      |             | Total                | $300                 | $300       | $300           | $600        | $900               |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount | Spent | Advance Balance | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Support Staff Salaries      | 16                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Purchased Services          | 40                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Supplies and Materials      | 45                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Travel Expenses             | 46                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Employee Benefits           | 80                   | $1,000.00    | $0    | $0              | $1,000           | $300.00              | ($700.00)  | $300.00    | $300.00        | $600.00     | $900.00            |
      | Action menu | Indirect Cost               | 90                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | BOCES Purchased Services    | 49                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Minor Remodeling            | 30                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Equipment                   | 20                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      |             | Total                       |                      | $1,000.00    |       |                 |                  | $300.00              | ($700.00)  | $300.00    | $300.00        | $600.00     | $900.00            |
      |             | Grand Total                 |                      | $1,000.00    |       |                 |                  | $300.00              | ($700.00)  | $300.00    | $300.00        | $600.00     | $900.00            |
    #NYSED-9548
    Then I softly can see row level action button "Original Budget Details" against "Employee Benefits" in flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "Original Budget Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Edit" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Delete" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9494
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Benefits1" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefits1" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9494
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Benefits1" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefits1" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9559 @NYSED-9558 @NYSED-Sprint-33 @US-NYSED-7994 @M06
  Scenario Outline:Verify that the Grantee user sees Employee Benefits, Budget Categories modal, having a 'Proposed Expenditure' column (Editable, Blank for new row, Can not be negative, Currency Field without decimals and Required)
  |Verify that the Grantee user sees Employee Benefits, Budget Categories modal, having a 'Benefit' column (Editable, Blank for new row, Short text 255 Character and Required)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10EMPLOYEEBENEFITS_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "Delete" icon for "Employee Benefits - Item 1" inside flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "New" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits1 | 1000                 | 100        | 100            |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "Edit" :
      | Benefit              | Proposed Expenditure |
      | Automation Benefits1 |                      |
    #NYSED-9559
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "Edit" :
      | Benefit              | Proposed Expenditure |
      | Automation Benefits1 | eee                  |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "Edit" :
      | Benefit              | Proposed Expenditure |
      | Automation Benefits1 | -34                  |
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "Edit" :
      | Benefit              | Proposed Expenditure |
      | Automation Benefits1 | 88.988               |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Automation Benefits1 | $88,988              | $100       | $100           | $200        | $89,188            |
    When I click on "Delete" icon for "Automation Benefits1" inside flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "New" :
      | Benefit | Proposed Expenditure | Cash Match | Non-Cash Match |
      |         | 1000                 | 100        | 100            |
    #NYSED-9558
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "New" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match |
      | {SavedValue:Char256} | 1000                 | 100        | 100            |
    Then I softly see value "{SavedValue:Char255}" for title "Benefit" against the value "$100" inside table "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "Edit" :
      | Cash Match | Benefit              |
      | $100       | Automation Benefits2 |
    Then I softly see value "Automation Benefits2" for title "Benefit" against the value "$100" inside table "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9556 @NYSED-9555 @NYSED-9550 @NYSED-Sprint-33 @US-NYSED-7994 @M06
  Scenario Outline:Verify that the Internal User can see the 'View/Add Line Item Details' inline action and cannot add/update/delete the added budget under the budget category 'Employee Benefits'.
  |Verify that the Grantee User cannot create/update/delete details under the budget category - 'Employee Benefits' when the Amendment Request is not in the Created OR Send back to Subrecipient.|
  |Verify that the Grantee User can create/update/delete details under the budget category - 'Employee Benefits' when the Amendment Request is sent back to the Subrecipient.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10EMPLOYEEBENEFITS_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "Edit" :
      | Benefit                    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Employee Benefits - Item 1 | 1000                 | 50         | 50             |
    And I click modal button "Close"
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9555
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Employee Benefits - Item 1" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Employee Benefits - Item 1" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:grantorBudgetChangeTableId---"
    #NYSED-9556
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Employee Benefits - Item 1" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Employee Benefits - Item 1" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    And I click modal button "Close"
    When I click on "Send Back to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "New" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits1 | 1000                 | 100        | 100            |
    #NYSED-9550
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Automation Benefits1 | $1,000               | $100       | $100           | $200        | $1,200             |
    Then I softly can see row level action button "Edit" against "Automation Benefits1" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Automation Benefits1" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "Edit" :
      | Benefit              | Proposed Expenditure |
      | Automation Benefits1 | 2000                 |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Automation Benefits1 | $2,000               | $100       | $100           | $200        | $2,200             |
    When I click on "Delete" icon for "Automation Benefits1" inside flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9487 @NYSED-Sprint-33 @US-NYSED-7990 @M06
    @NYSED-9547 @NYSED-Sprint-33 @US-NYSED-7994 @M06
  Scenario Outline:Verify that the Grantee User cannot see the 'View/Add Line Item Details'. inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table when 'Is a Detailed Budget Required on the Subaward?' is set to No.
  |Verify that the Grantee User cannot see the 'View/Add Line Item Details'. inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table when 'Is a Detailed Budget Required on the Subaward?' is set to No.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    #NYSED-9487
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly can see row level action button "Edit" against "Support Staff Salaries" in flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:BudgetChangeTableId---" by clicking "Edit" :
      | Budget Category        | Revised Award Amount |
      | Support Staff Salaries | 100                  |
    Then I softly see value "$100.00" for title "Revised Award Amount" against the value "Support Staff Salaries" inside table "---amendment:-:BudgetChangeTableId---"
    #NYSED-9547
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly can see row level action button "Edit" against "Employee Benefits" in flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:BudgetChangeTableId---" by clicking "Edit" :
      | Budget Category   | Revised Award Amount |
      | Employee Benefits | 100                  |
    Then I softly see value "$100.00" for title "Revised Award Amount" against the value "Employee Benefits" inside table "---amendment:-:BudgetChangeTableId---"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9165 @NYSED-9169 @NYSED-Sprint-33 @US-NYSED-6872 @M06
  Scenario Outline:Verify that Grantee Profile User (Submit and Certify Role and Create and Edit Role) sees New button is available under 'Amendments' Section of Management Tab on Subaward
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I wait for "2" seconds
    #NYSED-9165
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on hyperlink containing value "{SavedValue:awardName}"
    Given I navigate to "Management" sub tab
    #NYSED-9169
    Then I softly can see row level action button "Edit" against "{SavedValue:BUDGETREDIRECTIONID}" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:BUDGETREDIRECTIONID}" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    And I click on "Edit" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9169
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on hyperlink containing value "{SavedValue:awardName}"
    Given I navigate to "Management" sub tab
    And I click on "Delete" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-9863 @NYSED-9855 @NYSED-9860 @NYSED-9859 @NYSED-Sprint-35 @US-NYSED-9662 @M06
    @NYSED-10234 @NYSED-Sprint-35 @US-NYSED-9663 @M06
  Scenario Outline:Verify that Internal Profile User see 'Send to Grant Finance' button is not visible when Amendment Classification field is set to 'Minor' and status of amendment is 'Approved By Program Office'
  |Verify that Internal Profile User see 'Amend Subaward' button is visible when Amendment Classification field is set to 'Minor' and status of amendment is 'Approved By Program Office'|
  |Verify that Internal Profile User see clicking 'Amend Subaward' button creates a new version of the award in 'Pending Activation' state|
  |Verify that Internal Profile User see 'Amend Subaward' button is not visible when Amendment Classification field is set to 'Minor' and status of amendment is other than 'Approved By Program Office'|
  |Verify that the NYSED internal PM/PO user sees the Final Entry Date field captures the activation date when the subaward is activated on Amendment Layout > Subawards > Overview > Subaward Information|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see field "Amendment Classification" as "Minor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see top right button "Amend Subaward" in page detail
    #NYSED-9859
    Then I softly can see top right button "Submit for PO Approval" in page detail
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9859
    Then I softly cannot see top right button "Amend Subaward" in page detail
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    #NYSED-9863
    Then I softly see field "Amendment Classification" as "Minor"
    Then I softly see field "Status" as "Approved By Program Office"
    Then I softly see status in Progress-bar is "Approved By Program Office" and is "dark blue"
    Then I softly cannot see top right button "Send to Grant Finance" in page detail
    #NYSED-9855
    Then I softly can see top right button "Amend Subaward" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    #NYSED-9863
    Then I softly see field "Amendment Classification" as "Minor"
    Then I softly see field "Status" as "Approved By Program Office"
    Then I softly see status in Progress-bar is "Approved By Program Office" and is "dark blue"
    Then I softly cannot see top right button "Send to Grant Finance" in page detail
    #NYSED-9855
    Then I softly can see top right button "Amend Subaward" in page detail
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    #NYSED-9860
    Then I softly see field "Status" as "Pending Activation"
    And I click on "Activate" in the page details
    And I wait for "5" seconds
    #NYSED-10234
    Then I softly see field "Status" as "Activated"
    Given I navigate to "Overview" sub tab
    Then I softly see field "Version Number" as "2"
    Then I softly see field "Final Entry Date" as "{Date:M/d/uuuu}"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10236 @NYSED-Sprint-35 @US-NYSED-9663 @M06
  Scenario Outline:Verify that the NYSED internal PM/PO user sees the 'Delete' button and can delete the subaward when the subaward is in the 'Pending Activation' state on Amendment Layout > Subawards > Overview > Subaward Information
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see field "Amendment Classification" as "Minor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    Then I softly see field "Amendment Classification" as "Minor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    #NYSED-9662
    Then I softly see field "Status" as "Pending Activation"
    And I click on "Delete" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "Are you sure you want to delete this subaward?" is displayed
    And I wait for "2" seconds
    And I click "OK" on modal confirmation box
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see field "Amendment Classification" as "Minor"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10433 @NYSED-Sprint-36 @US-NYSED-9233 @M06
  Scenario Outline:Verify that the 'Submit and Certify' user sees a validation message after clicking the Submit to Grantor button when the Equipment budget category amount is less than $10,000 at the category level when 'Is Detailed Budget Required on the Subaward?' is No
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount |
      | Equipment       | 9999                 |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #NYSED-10433
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Budget entries under the Equipment category must not be less than $10,000. |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount |
      | Equipment       | 10000                |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #NYSED-10433
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Budget entries under the Equipment category must not be less than $10,000. |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-10434 @NYSED-Sprint-36 @US-NYSED-9233 @M06
  Scenario Outline:Verify that the 'Submit and Certify' user sees a validation message after clicking the Save button when the budget entered for each line item under the Equipment budget category is less than $10,000, 'Is Detailed Budget Required on the Subaward?' is Yes
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DETAILBUDGET_YES_FORMULA_BA"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentEquipmentLineItemsTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 9999                 | 100        | 100            |
    #NYSED-10434
    Then I softly see the following messages in the page details contains:
      | Budget entries under the Equipment category must not be less than $10,000 per line item. |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentEquipmentLineItemsTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    #NYSED-10434
    Then I softly cannot see the following messages in the page details contains:
      | Budget entries under the Equipment category must not be less than $10,000 per line item. |
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---amendment:-:AmendmentEquipmentLineItemsTableId---"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-10435 @NYSED-Sprint-36 @US-NYSED-9233 @M06
  Scenario Outline: Verify that the 'Submit and Certify' user sees a validation message after clicking the Submit to Grantor button when the Focus Area is set to 'No' and the budget is not entered for Professional Staff Salaries or Support Staff Salaries.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10SUPPLIESANDMATERIALS_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "New" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits1 | 1000                 | 100        | 100            |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Employee Benefits are not allowed as the staff salaries are not added. |
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 32             | 12.34 | 100                    | 100                                                | 100              | 100        | 100            |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    #NYSED-10435
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Employee Benefits are not allowed as the staff salaries are not added. |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-10551 @NYSED-10552 @NYSED-10553 @NYSED-Sprint-36 @US-NYSED-9935 @M06
  Scenario Outline:Verify the task is moving to the completed task table once the award is activated, 'Task Type: Process Approved Amendment.'
  |Verify that the task is not generated for users other than the Submit and Certify role user when the PM/PO user clicks on ‘Send Back to Subrecipient' in the Submit to Grantor status on the Amendment Request layout.|
  |Verify that the 'Send Back Amendment Request' task moves to the Completed Task section when the Submit and Certify user clicks on the 'Submit to Grantor' or ‘Acknowledge’ action on the Amendment Request layout|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see field "Amendment Classification" as "Minor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Send Back to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Under Revision"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10552
    Then I softly do not see value "Send Back Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly do not see value "Send Back Amendment Request #{SavedValue:BUDGETREDIRECTIONID}" for title "Subject" inside table "---amendment:-:pendingTaskTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10552
    Then I softly do not see value "Send Back Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly do not see value "Send Back Amendment Request #{SavedValue:BUDGETREDIRECTIONID}" for title "Subject" inside table "---amendment:-:pendingTaskTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10552
    Then I softly do not see value "Send Back Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly do not see value "Send Back Amendment Request #{SavedValue:BUDGETREDIRECTIONID}" for title "Subject" inside table "---amendment:-:pendingTaskTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10551
    Then I see the following rows under the following headers in table with id "---amendment:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                          | Task Type                   | Subject                                                       | Assigned By   | Due Date Only        | Status      |
      | Action menu | {SavedValue:BUDGETREDIRECTIONID} | Send Back Amendment Request | Send Back Amendment Request #{SavedValue:BUDGETREDIRECTIONID} | Automation PO | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10553
    Then I softly do not see value "Send Back Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly do not see value "Send Back Amendment Request #{SavedValue:BUDGETREDIRECTIONID}" for title "Subject" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---paymentRequest:-:completedTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:completedTaskTableId---" :
      | Actions     | EGMS ID                          | Task Type                   | Subject                                                       | Due Date             | Completed Date  | Status    |
      | Action menu | {SavedValue:BUDGETREDIRECTIONID} | Send Back Amendment Request | Send Back Amendment Request #{SavedValue:BUDGETREDIRECTIONID} | {Date:M/d/yyyy::d+7} | {Date:M/d/uuuu} | Completed |

    Examples:
      | GrantName                                                 | ExternalUser | GFStaffQueue |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FO           |

  @NYSED-10646 @NYSED-10658 @NYSED-10650 @NYSED-10651 @NYSED-10672 @NYSED-10660 @NYSED-10659 @NYSED-Sprint-36 @US-NYSED-9609 @M06
    @NYSED-10505 @NYSED-10672 @NYSED-10671 @NYSED-10670 @NYSED-10669 @NYSED-10675 @NYSED-Sprint-36 @US-NYSED-9256 @M06
  Scenario Outline:Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new amendment when another Grantee-initiated amendment is in the Submit to Grantor state on the Subaward → Management tab → Amendment Request section
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new reimbursement when another Grantee-initiated amendment is in the create state on the Subaward|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new amendment when another amendment is in the Pending Activation state on the Subaward → Management tab → Amendment Request section - Minor Type|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles can create a new amendment when another amendment is in the Activation state on the Subaward → Management tab → Amendment Request section - Minor Type|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new reimbursement when another Grantee-initiated amendment is in the create state on the Subaward →|
  |Verify that the Grantee user cannot see a validation message on the ‘Budget Redirection’ amendment request layout when clicking ‘Submit to Grantor’ after the Amendment Deadline has not passed|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles can create a new reimbursement when another amendment is in the Activation state on the Subaward - Minor Type|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles can create a new reimbursement when another amendment is in the Activation state on the Subaward - Minor Type|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new reimbursement when an amendment is in the Pending Activation state on the Subaward - Minor Type|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new reimbursement when an amendment is in the Pending Activation state on the Subaward- Minor Type|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles can create a new reimbursement when the new award is activated from the Minor type of amendment|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    Given I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly see field "Amendment Deadline" as "{Date:MM/dd/yyyy::d+140}"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on hyperlink containing value "{SavedValue:awardName}"
    Given I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-10658
    Then I softly see the following messages in the page details contains:
      | Reimbursement Payment Request cannot be created while Amendment Request {SavedValue:BUDGETREDIRECTIONID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:BUDGETREDIRECTIONID} is already in progress. |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
	#NYSED-10505
    Then I softly cannot see the following messages in the page details contains:
      | This amendment request cannot be submitted because the amendment deadline has already passed. Please delete the amendment request to ensure records remain accurate and compliant. |
    And I click on hyperlink containing value "{SavedValue:awardName}"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    #NYSED-10646
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:BUDGETREDIRECTIONID} is already in progress. |
    And I refresh the page
    And I wait for "2" seconds
    Given I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-10660
    Then I softly see the following messages in the page details contains:
      | Reimbursement Payment Request cannot be created while Amendment Request {SavedValue:BUDGETREDIRECTIONID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:BUDGETREDIRECTIONID} is already in progress. |
    And I refresh the page
    And I wait for "2" seconds
    Given I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-10660
    Then I softly see the following messages in the page details contains:
      | Reimbursement Payment Request cannot be created while Amendment Request {SavedValue:BUDGETREDIRECTIONID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved By Program Office"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:BUDGETREDIRECTIONID} is already in progress. |
    And I refresh the page
    And I wait for "2" seconds
    Given I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-10669
    Then I softly see the following messages in the page details contains:
      | Reimbursement Payment Request cannot be created while Amendment Request {SavedValue:BUDGETREDIRECTIONID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Pending Activation"
    And I save the field labeled "EGMS ID" as "AwardId"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    #NYSED-10650
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:BUDGETREDIRECTIONID} is already in progress. |
    And I refresh the page
    And I wait for "2" seconds
    Given I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-10671 #NYSED-10670
    Then I softly see the following messages in the page details contains:
      | Reimbursement Payment Request cannot be created while Amendment Request {SavedValue:BUDGETREDIRECTIONID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AwardId}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Activate" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Activated"
    Given I navigate to "Overview" sub tab
    Then I softly see field "Version Number" as "2"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
   #NYSED-10672 #NYSED-10675
    Then I softly cannot see the following messages in the page details contains:
      | Reimbursement Payment Request cannot be created while Amendment Request {SavedValue:BUDGETREDIRECTIONID} is in progress. |
    When I enter value "<GrantName>" into field "Title__c"
    When I enter value "FS-10F" into field "NYSED_ReimbursementTemplate__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I navigate to "Financials" sub tab
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-10528 @NYSED-Sprint-36 @US-NYSED-9936 @M06 @Bug-Ticket-NYSED-11034
    @NYSED-11033 @NYSED-Sprint-37 @US-NYSED-10421 @M06
  Scenario Outline:Verify the task is moving to the completed task table once the award is activated, 'Task Type: Process Approved Amendment.'
  |Verify that the Internal User can see that the fields below are removed from the Budget Redirection amendment.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    #NYSED-11033
    Then I softly cannot see field "Justification for Budget Redirection Change" inside page block
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see field "Amendment Classification" as "Minor"
    #NYSED-11033
    Then I softly cannot see field "Justification for Budget Redirection Change" inside page block
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    Then I softly see field "Amendment Classification" as "Minor"
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Pending Activation"
    And I click on "Activate" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Activated"
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10528
    Then I softly do not see value "Process Approved Amendment" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly do not see value "Process Approved Amendment Request for Subaward #{SavedValue:awardName} for {SavedValue:SubrecipientOrg}" for title "Subject" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---paymentRequest:-:completedTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:completedTaskTableId---" :
      | Actions     | EGMS ID                          | Task Type                  | Subject                                                                                                  | Due Date             | Completed Date  | Status    |
      | Action menu | {SavedValue:BUDGETREDIRECTIONID} | Process Approved Amendment | Process Approved Amendment Request for Subaward #{SavedValue:awardName} for {SavedValue:SubrecipientOrg} | {Date:M/d/yyyy::d+7} | {Date:M/d/uuuu} | Completed |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-9528 @NYSED-9532 @NYSED-Sprint-33 @US-NYSED-7992 @M06
  Scenario Outline: Verify that the Grantee User can create/update/delete details under the budget category - 'Supplies and Materials' when the Amendment Request is in the Created state. (This access is only available in case of budget redirection amendment).
  |Verify that the Grantee User can add/update/delete details under the budget category 'Supplies and Materials', then the following roll-up sum takes place.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly can see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly see the text containing "Budget Category : Supplies and Materials"
    Then I softly can see "45 - Supplies and Materials" sub tab at view detail page
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 10       | 5         | 50              | 100                  | 100        | 100            |
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description1                | Calculation of Cost1                                     | 10       | 5         | 50              | 100                  | 100        | 100            |
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description2                | Calculation of Cost2                                     | 10       | 5         | 50              | 100                  | 100        | 100            |
    Then I softly see value "Description" for title "Description of Item/Service" against the value "Calculation of Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Description1" for title "Description of Item/Service" against the value "Calculation of Cost1" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Description2" for title "Description of Item/Service" against the value "Calculation of Cost2" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation of Cost" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation of Cost1" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description1" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation of Cost2" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description2" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "10.00" for title "Quantity" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "10.00" for title "Quantity" against the value "Description1" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "10.00" for title "Quantity" against the value "Description2" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "30.00" for title "Quantity" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$5" for title "Unit Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$5" for title "Unit Cost" against the value "Description1" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$5" for title "Unit Cost" against the value "Description2" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$15" for title "Unit Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$50" for title "Additional Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$50" for title "Additional Cost" against the value "Description1" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$50" for title "Additional Cost" against the value "Description2" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$150" for title "Additional Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Calculated Proposed Expenditure" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Calculated Proposed Expenditure" against the value "Description1" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Calculated Proposed Expenditure" against the value "Description2" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Proposed Expenditure" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Proposed Expenditure" against the value "Description1" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Proposed Expenditure" against the value "Description2" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description1" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description2" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description1" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description2" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description1" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description2" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$600" for title "Total Match" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$300" for title "Total Project Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$300" for title "Total Project Cost" against the value "Description1" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$300" for title "Total Project Cost" against the value "Description2" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$900" for title "Total Project Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Description" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Description" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | 400                  | 200        | 200            |
    Then I softly see value "$400" for title "Proposed Expenditure" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Cash Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Non-Cash Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$400" for title "Total Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$800" for title "Total Project Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$600" for title "Proposed Expenditure" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$1,400" for title "Total Project Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount | Expenditure Paid to Date | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0           | $0                       | $0               | $600                 | $600       | $400       | $400           | $800        | $1,400             |
      | Action menu | Travel Expenses             | 46                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Employee Benefits           | 80                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | BOCES Purchased Services    | 49                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Equipment                   | 20                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      |             | Total                       |                      | $0           |                          |                  | $600                 | $600       | $400       | $400           | $800        | $1,400             |
      |             | Grand Total                 |                      | $0           |                          |                  | $600                 | $600       | $400       | $400           | $800        | $1,400             |
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "Delete" icon for "Description2" inside flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see value "Description1" for title "Description of Item/Service" against the value "Calculation of Cost1" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Description" for title "Description of Item/Service" against the value "Calculation of Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "20.00" for title "Quantity" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$10" for title "Unit Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$500" for title "Proposed Expenditure" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$600" for title "Total Match" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$1,100" for title "Total Project Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount | Expenditure Paid to Date | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0           | $0                       | $0               | $500                 | $500       | $300       | $300           | $600        | $1,100             |
      | Action menu | Travel Expenses             | 46                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Employee Benefits           | 80                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | BOCES Purchased Services    | 49                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Equipment                   | 20                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      |             | Total                       |                      | $0           |                          |                  | $500                 | $500       | $300       | $300           | $600        | $1,100             |
      |             | Grand Total                 |                      | $0           |                          |                  | $500                 | $500       | $300       | $300           | $600        | $1,100             |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9179 @NYSED-Sprint-33 @US-NYSED-6872 @M06 @APITask-NYSED-9735
  Scenario Outline:Verify that Grantee Profile User (Submit and Certify and Create and Edit) sees Validation on Save and Continue button of 'Create Amendment Request' modal when Amendment Deadline date mentioned on Subaward is passed
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO_AMENDMENTDEADLINE_PAST"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-9179
    Then I softly see the following messages in the page details contains:
      | Amendment Request cannot be created because the Amendment Submission Deadline for this Subaward has passed. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |