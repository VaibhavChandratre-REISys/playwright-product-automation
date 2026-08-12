@amendmentRequestsNysed @FundingChangeamendmentRequestsNysed
Feature: Validate all scenarios in the Funding Change Amendment Request.

  @NYSED-9503 @NYSED-9495 @NYSED-9497 @NYSED-9499 @NYSED-9491 @NYSED-9493 @NYSED-Sprint-33 @US-NYSED-7990 @M06
  Scenario Outline:Verify that the Grantee User can add/update/delete details under budget category 'Support Staff Salaries', then the following roll-up sum takes place.
  |Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a 'Specific Position/Title' column (Editable, Blank for new row, Short text 255 Character and Required)|
  |Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a '# of Positions' column (Editable, Blank for new row, Number field without decimals, Required and cannot be negative)|
  |Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a 'Annualized Rate of Pay' column (Editable, Optional, Currency Field without decimals, cannot be negative and Blank for new row)|
  |Verify that the Grantee User can create/update/delete details under the budget category - 'Support Staff Salaries' when the Amendment Request is in the Created state. (This access is only available in case of budget redirection amendment).|
  |Verify that the Grantee User can create/update/delete details under the budget category - 'Support Staff Salaries' when the Amendment Request is in the Send to Subrecipient state.(This is for funding change and periodic renewal type of amendment)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    #NYSED-9503
    Then I softly can see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    When I enter the following values into flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 32             | 12.34 | 100                    | 100                                                | 100              | 100        | 100            |
    When I enter the following values into flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title1         | 32             | 12.35 | 200                    | 200                                                | 200              | 200        | 200            |
    When I enter the following values into flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title2         | 32             | 12.36 | 300                    | 300                                                | 300              | 300        | 300            |
   #NYSED-9503 #NYSED-9491 #NYSED-9493
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 32             | 12.34 | $100                   | $100                                               | $100             | $100       | $100           | $200        | $300               |
      | Action menu | Position Title1         | 32             | 12.35 | $200                   | $200                                               | $200             | $200       | $200           | $400        | $600               |
      | Action menu | Position Title2         | 32             | 12.36 | $300                   | $300                                               | $300             | $300       | $300           | $600        | $900               |
      |             | Total                   |                | 37.05 | $600                   | $600                                               | $600             | $600       | $600           | $1,200      | $1,800             |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title2         | 400              | 400        | 400            |
    #NYSED-9503 #NYSED-9491 #NYSED-9493
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 32             | 12.34 | $100                   | $100                                               | $100             | $100       | $100           | $200        | $300               |
      | Action menu | Position Title1         | 32             | 12.35 | $200                   | $200                                               | $200             | $200       | $200           | $400        | $600               |
      | Action menu | Position Title2         | 32             | 12.36 | $300                   | $300                                               | $400             | $400       | $400           | $800        | $1,200             |
      |             | Total                   |                | 37.05 | $600                   | $600                                               | $700             | $700       | $700           | $1,400      | $2,100             |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount | Spent | Advance Balance | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $1,000.00    | $0    | $0              | $1,000           | $1,000.00            | $0.00      | $100.00    | $100.00        | $200.00     | $1,200.00          |
      | Action menu | Support Staff Salaries      | 16                   | $0.00        | $0    | $0              | $0               | $700.00              | $700.00    | $700.00    | $700.00        | $1,400.00   | $2,100.00          |
      | Action menu | Purchased Services          | 40                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Supplies and Materials      | 45                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Travel Expenses             | 46                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Employee Benefits           | 80                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Indirect Cost               | 90                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | BOCES Purchased Services    | 49                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Minor Remodeling            | 30                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Equipment                   | 20                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      |             | Total                       |                      | $1,000.00    |       |                 |                  | $1,700.00            | $700.00    | $800.00    | $800.00        | $1,600.00   | $3,300.00          |
      |             | Grand Total                 |                      | $1,000.00    |       |                 |                  | $1,700.00            | $700.00    | $800.00    | $800.00        | $1,600.00   | $3,300.00          |
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "Delete" icon for "Position Title2" inside flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    #NYSED-9503 #NYSED-9491 #NYSED-9493
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 32             | 12.34 | $100                   | $100                                               | $100             | $100       | $100           | $200        | $300               |
      | Action menu | Position Title1         | 32             | 12.35 | $200                   | $200                                               | $200             | $200       | $200           | $400        | $600               |
      |             | Total                   |                | 24.69 | $300                   | $300                                               | $300             | $300       | $300           | $600        | $900               |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount | Spent | Advance Balance | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $1,000.00    | $0    | $0              | $1,000           | $1,000.00            | $0.00      | $100.00    | $100.00        | $200.00     | $1,200.00          |
      | Action menu | Support Staff Salaries      | 16                   | $0.00        | $0    | $0              | $0               | $300.00              | $300.00    | $300.00    | $300.00        | $600.00     | $900.00            |
      | Action menu | Purchased Services          | 40                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Supplies and Materials      | 45                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Travel Expenses             | 46                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Employee Benefits           | 80                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Indirect Cost               | 90                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | BOCES Purchased Services    | 49                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Minor Remodeling            | 30                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      | Action menu | Equipment                   | 20                   | $0.00        | $0    | $0              | $0               | $0.00                | $0.00      | $0.00      | $0.00          | $0.00       | $0.00              |
      |             | Total                       |                      | $1,000.00    |       |                 |                  | $1,300.00            | $300.00    | $400.00    | $400.00        | $800.00     | $2,100.00          |
      |             | Grand Total                 |                      | $1,000.00    |       |                 |                  | $1,300.00            | $300.00    | $400.00    | $400.00        | $800.00     | $2,100.00          |
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "Delete" icon for "Position Title1" inside flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | # of Positions | Specific Position/Title |
      | 32             |                         |
    #NYSED-9495
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | # of Positions | Specific Position/Title |
      | 32             | {SavedValue:Char256}    |
    Then I softly see value "{SavedValue:Char255}" for title "Specific Position/Title" against the value "32" inside table "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | # of Positions | Specific Position/Title |
      | 32             | Position Title          |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | # of Positions |
      | Position Title          |                |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | # of Positions |
      | Position Title          | eee            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | # of Positions |
      | Position Title          | -34            |
    Then I softly see the following messages in the page details contains:
      | # of Positions cannot be negative. |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | # of Positions |
      | Position Title          | 88.988         |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 88,988         | 12.34 | $100                   | $100                                               | $100             | $100       | $100           | $200        | $300               |
      |             | Total                   |                | 12.34 | $100                   | $100                                               | $100             | $100       | $100           | $200        | $300               |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Annualized Rate of Pay |
      | Position Title          |                        |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 88,988         | 12.34 |                        | $100                                               | $100             | $100       | $100           | $200        | $300               |
      |             | Total                   |                | 12.34 | $0                     | $100                                               | $100             | $100       | $100           | $200        | $300               |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Annualized Rate of Pay |
      | Position Title          | eee                    |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 88,988         | 12.34 |                        | $100                                               | $100             | $100       | $100           | $200        | $300               |
      |             | Total                   |                | 12.34 | $0                     | $100                                               | $100             | $100       | $100           | $200        | $300               |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Annualized Rate of Pay |
      | Position Title          | -34                    |
    Then I softly see the following messages in the page details contains:
      | Annualized Rate of Pay cannot be negative. |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Annualized Rate of Pay |
      | Position Title          | eee                    |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 88,988         | 12.34 |                        | $100                                               | $100             | $100       | $100           | $200        | $300               |
      |             | Total                   |                | 12.34 | $0                     | $100                                               | $100             | $100       | $100           | $200        | $300               |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9498 @NYSED-9500 @NYSED-9501 @NYSED-9502 @NYSED-9494 @NYSED-Sprint-33 @US-NYSED-7990 @M06
  Scenario Outline:Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a 'FTE' column (Editable, Blank for new row, Number field with decimals, Optional and cannot be negative)
  |Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a 'Additional Cost (e.g., Per Diem, Teacher Stipends)' column (Editable, Optional, Currency Field without decimals, cannot be negative and Blank for new row)|
  |Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a 'Projected Salary' column (Editable, Required, Currency Field without decimals, cannot be negative and Blank for new row)|
  |Verify that the Grantee user sees Support Staff Salaries, Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns (Editable, Optional, Currency Field without decimal places, negative not allowed, and $0 for new row)|
  |Verify that Grantee Users, apart from Submit and Certify & Create and Edit roles, cannot create/update/delete details under the budget category - 'Support Staff Salaries' when the Amendment Req is in the Created OR Send back to Subrecipient.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 32             |     | 100                    | 100                                                | 100              | 100        | 100            |
    #NYSED-9498
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE  | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 32             |      | $100                   | $100                                               | $100             | $100       | $100           | $200        | $300               |
      |             | Total                   |                | 0.00 | $100                   | $100                                               | $100             | $100       | $100           | $200        | $300               |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | FTE |
      | Position Title          | eee |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE  | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 32             |      | $100                   | $100                                               | $100             | $100       | $100           | $200        | $300               |
      |             | Total                   |                | 0.00 | $100                   | $100                                               | $100             | $100       | $100           | $200        | $300               |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | FTE |
      | Position Title          | -34 |
    Then I softly see the following messages in the page details contains:
      | FTE cannot be negative. |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | FTE    |
      | Position Title          | 88.988 |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 32             | 88.98 | $100                   | $100                                               | $100             | $100       | $100           | $200        | $300               |
      |             | Total                   |                | 88.98 | $100                   | $100                                               | $100             | $100       | $100           | $200        | $300               |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | FTE |
      | Position Title          | 88  |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 32             | 88.00 | $100                   | $100                                               | $100             | $100       | $100           | $200        | $300               |
      |             | Total                   |                | 88.00 | $100                   | $100                                               | $100             | $100       | $100           | $200        | $300               |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Additional Cost (e.g., Per Diem, Teacher Stipends) |
      | Position Title          |                                                    |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 32             | 88.00 | $100                   |                                                    | $100             | $100       | $100           | $200        | $300               |
      |             | Total                   |                | 88.00 | $100                   | $0                                                 | $100             | $100       | $100           | $200        | $300               |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Additional Cost (e.g., Per Diem, Teacher Stipends) |
      | Position Title          | eee                                                |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 32             | 88.00 | $100                   |                                                    | $100             | $100       | $100           | $200        | $300               |
      |             | Total                   |                | 88.00 | $100                   | $0                                                 | $100             | $100       | $100           | $200        | $300               |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Additional Cost (e.g., Per Diem, Teacher Stipends) |
      | Position Title          | 88.988                                             |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 32             | 88.00 | $100                   | $88,988                                            | $100             | $100       | $100           | $200        | $300               |
      |             | Total                   |                | 88.00 | $100                   | $88,988                                            | $100             | $100       | $100           | $200        | $300               |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Additional Cost (e.g., Per Diem, Teacher Stipends) |
      | Position Title          | -34                                                |
    Then I softly see the following messages in the page details contains:
      | Additional Cost cannot be negative. |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Projected Salary |
      | Position Title          |                  |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Projected Salary |
      | Position Title          | -34              |
    Then I softly see the following messages in the page details contains:
      | Projected Salary cannot be negative. |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Projected Salary |
      | Position Title          | eee              |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Projected Salary |
      | Position Title          | 88.988           |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 32             | 88.00 | $100                   | $88,988                                            | $88,988          | $100       | $100           | $200        | $89,188            |
      |             | Total                   |                | 88.00 | $100                   | $88,988                                            | $88,988          | $100       | $100           | $200        | $89,188            |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Cash Match | Non-Cash Match |
      | Position Title          |            |                |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 32             | 88.00 | $100                   | $88,988                                            | $88,988          |            |                | $0          | $88,988            |
      |             | Total                   |                | 88.00 | $100                   | $88,988                                            | $88,988          | $0         | $0             | $0          | $88,988            |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Cash Match | Non-Cash Match |
      | Position Title          | eee        | eee            |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 32             | 88.00 | $100                   | $88,988                                            | $88,988          |            |                | $0          | $88,988            |
      |             | Total                   |                | 88.00 | $100                   | $88,988                                            | $88,988          | $0         | $0             | $0          | $88,988            |
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Cash Match | Non-Cash Match |
      | Position Title          | -100       | -100           |
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
      | Cash Match cannot be negative.     |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title | Cash Match | Non-Cash Match |
      | Position Title          | 88.988     | 88.988         |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 32             | 88.00 | $100                   | $88,988                                            | $88,988          | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total                   |                | 88.00 | $100                   | $88,988                                            | $88,988          | $88,988    | $88,988        | $177,976    | $266,964           |
    And I click modal button "Close"
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9494
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9494
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9506 @NYSED-Sprint-33 @US-NYSED-7990 @M06
    @NYSED-9557 @NYSED-9551 @NYSED-Sprint-33 @US-NYSED-7994 @M06
  Scenario Outline:Verify that users (Internal and Grantee) cannot see Cash Match and Non-Cash Match columns if Subrecipient Match is set as No on the announcement: Support Staff Salaries
  |Verify that users (Internal and Grantee) cannot see Cash Match and Non-Cash Match columns if Subrecipient Match is set as No on the announcement: Equipment Benefits|
  |Verify that the Grantee User can create/update/delete details under the budget category - 'Employees Benefits' when the Amendment Request is in the Send to Subrecipient state.(This is for funding change and periodic renewal type of amendment)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I navigate to "Overview" sub tab
    #NYSED-9506 #NYSED-9557
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:grantorBudgetChangeTableId---"
    #NYSED-9506
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:grantorBudgetChangeTableId---"
    #NYSED-9557
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    #NYSED-9506 #NYSED-9557
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:BudgetChangeTableId---"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---"
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9557
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "New" :
      | Benefit              | Proposed Expenditure |
      | Automation Benefits1 | 1000                 |
    #NYSED-9551
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" :
      | Benefit              | Proposed Expenditure |
      | Automation Benefits1 | $1,000               |
    Then I softly can see row level action button "Edit" against "Automation Benefits1" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Automation Benefits1" in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" by clicking "Edit" :
      | Benefit              | Proposed Expenditure |
      | Automation Benefits1 | 2000                 |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---" :
      | Benefit              | Proposed Expenditure |
      | Automation Benefits1 | $2,000               |
    When I click on "Delete" icon for "Automation Benefits1" inside flex table with id "---amendment:-:AmendmentEmployeeBenefitsLineItemsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9489 @NYSED-9486 @NYSED-Sprint-33 @US-NYSED-7990 @M06
  Scenario Outline:Verify that the Grantee User can see the 'Original Budget Details'. inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table
  |Verify that the Grantee User can see the 'View/Add Line Item Details'. inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table when 'Is a Detailed Budget Required on the Subaward?' is set to Yes|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10SUPPORTSTAFFSALARIES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    #NYSED-9489
    Then I softly can see row level action button "Original Budget Details" against "Support Staff Salaries" in flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "Original Budget Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Edit" against "Support Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Delete" against "Support Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9486
    Then I see only the following headers in table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" :
      | Actions | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9525 @NYSED-9527 @NYSEDSprint-33 @US-NYSED-7992 @M06
  Scenario Outline: Verify that the Grantee User can see the 'View/Add Line Item Details'. inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table when 'Is a Detailed Budget Required on the Subaward?' is set to Yes
  |Verify that the Grantee User can see the 'Original Budget Details'. inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10SUPPLIESANDMATERIALS_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    #NYSED-9527
    Then I softly can see row level action button "Original Budget Details" against "Supplies and Materials" in flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "Original Budget Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials - Item 1" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly cannot see row level action button "Delete" against "Supplies and Materials - Item 1" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9525
    Then I softly see column header "Actions" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see column header "Description of Item/Service" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see column header "Quantity" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see column header "Unit Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see column header "Additional Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see column header "Calculated Proposed Expenditure" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see column header "Cash Match" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see column header "Non-Cash Match" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see column header "Total Match" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see column header "Total Project Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9526 @NYSEDSprint-33 @US-NYSED-7992 @M06
  Scenario Outline: Verify that the Grantee User cannot see the 'View/Add Line Item Details'. inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table when 'Is a Detailed Budget Required on the Subaward?' is set to No.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly can see row level action button "Edit" against "Supplies and Materials" in flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:BudgetChangeTableId---" by clicking "Edit" :
      | Budget Category        | Revised Award Amount |
      | Supplies and Materials | 200                  |
    Then I softly see value "$200" for title "Revised Award Amount" against the value "Supplies and Materials" inside table "---amendment:-:BudgetChangeTableId---"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9535 @US-NYSED-7992 @NYSED-Sprint-33 @M06
  Scenario Outline:Verify that users (Internal and Grantee) cannot see Cash Match and Non-Cash Match columns if Subrecipient Match is set as No on the announcement: Supplies and Materials
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:BudgetChangeTableId---"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9530 @NYSED-Sprint-33 @US-NYSED-7992 @M06
  Scenario Outline:Verify that the Grantee User can create/update/delete details under the budget category - 'Supplies and Materials' when the Amendment Request is in the Send to Subrecipient state.(This is for funding change and periodic renewal type of amendment)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly see the text containing "Budget Category : Supplies and Materials"
    Then I softly can see "45 - Supplies and Materials" sub tab at view detail page
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 10       | 5         | 50              | 100                  | 100        | 100            |
    And I wait for "2" seconds
    Then I softly see value "Description" for title "Description of Item/Service" against the value "Calculation of Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation of Cost" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "10.00" for title "Quantity" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$5" for title "Unit Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$50" for title "Additional Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Calculated Proposed Expenditure" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Proposed Expenditure" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$300" for title "Total Project Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Description" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Description" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | 400                  | 200        | 200            |
    And I wait for "2" seconds
    Then I softly see value "$400" for title "Proposed Expenditure" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Cash Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Non-Cash Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$400" for title "Total Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$800" for title "Total Project Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I click on "Delete" icon for "Description" inside flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9534 @NYSED-9533 @NYSED-9529 @NYSED-Sprint-33 @US-NYSED-7992 @M06
  Scenario Outline:Verify that the Internal User can see the 'View/Add Line Item Details' inline action and cannot add/update/delete the added budget under the budget category 'Supplies and Materials'.
  |Verify that the Grantee User cannot create/update/delete details under the budget category - 'Supplies and Materials' when the Amendment Request is not in the Created OR Send back to Subrecipient.|
  |Verify that the Grantee User can create/update/delete details under the budget category - 'Supplies and Materials' when the Amendment Request is sent back to the Subrecipient.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10SUPPLIESANDMATERIALS_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service     | Proposed Expenditure | Cash Match |
      | Supplies and Materials - Item 1 | 3000                 | 200        |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9533
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials - Item 1" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Supplies and Materials - Item 1" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:grantorBudgetChangeTableId---"
    #NYSED-9534
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials - Item 1" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Supplies and Materials - Item 1" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    When I click on "Send Back to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    #NYSED-9529
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 10       | 5         | 50              | 100                  | 100        | 100            |
    And I wait for "2" seconds
    Then I softly see value "Description" for title "Description of Item/Service" against the value "Calculation of Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation of Cost" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "10.00" for title "Quantity" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$5" for title "Unit Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$50" for title "Additional Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Calculated Proposed Expenditure" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Proposed Expenditure" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$300" for title "Total Project Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Description" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Description" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | 400                  | 200        | 200            |
    And I wait for "2" seconds
    Then I softly see value "$400" for title "Proposed Expenditure" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Cash Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Non-Cash Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$400" for title "Total Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$800" for title "Total Project Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I click on "Delete" icon for "Description" inside flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9531 @NYSED-Sprint-33 @US-NYSED-7992 @M06
  Scenario Outline:Verify that Grantee Users, apart from Submit and Certify & Create and Edit roles, cannot create/update/delete details under the budget category - 'Supplies and Materials' when the Amendment Req is in the Created OR Send back to Subrecipient.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly see the text containing "Budget Category : Supplies and Materials"
    Then I softly can see "45 - Supplies and Materials" sub tab at view detail page
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 10       | 5         | 50              | 100                  | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Description" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Description" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Description" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Description" in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9536 @NYSED-9537 @NYSED-Sprint-33 @US-NYSED-7992 @M06
  Scenario Outline: Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Description of Item/Service' column (Editable, Blank for new row, short text with 255 Character and Required)
  |Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Calculation of Cost (if other than Quantity * Unit Cost)' column|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9536
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      |                             | Calculation of Cost                                      | 10       | 5         | 50              | 100                  | 100        | 100            |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | {SavedValue:Char256}        | Calculation of Cost                                      | 10       | 5         | 50              | 100                  | 100        | 100            |
    Then I softly see value "{SavedValue:Char255}" for title "Description of Item/Service" against the value "Calculation of Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Calculation of Cost (if other than Quantity * Unit Cost) | Description of Item/Service |
      | Calculation of Cost                                      | New Description             |
    Then I softly see value "New Description" for title "Description of Item/Service" against the value "Calculation of Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I click on "Delete" icon for "New Description" inside flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" without waiting for record
    And I wait for "3" seconds
    #NYSED-9537
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 |                                                          | 10       | 5         | 50              | 100                  | 100        | 100            |
    And I wait for "2" seconds
    Then I softly see value "" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I click on "Delete" icon for "Description" inside flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" without waiting for record
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | {SavedValue:Char256}                                     | 10       | 5         | 50              | 100                  | 100        | 100            |
    Then I softly see value "{SavedValue:Char255}" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Description                 | New Calculation of Cost                                  |
    Then I softly see value "New Calculation of Cost" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9538 @NYSED-9539 @NYSED-Sprint-33 @US-NYSED-7992 @M06
  Scenario Outline: Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, with a 'Quantity' column (Number Field up to 2 decimal places, Blank for new row, Editable, Required and Can not be negative)
  |Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Unit Cost' column (Required, Currency Field up without decimal, cannot be negative, and Blank for new row)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9538
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      |          | 5         | 50              | 100                  | 100        | 100            |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | eee@@$   | 5         | 50              | 100                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | -12      | 5         | 50              | 100                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Quantity cannot be negative. |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 15.4444  | 5         | 50              | 100                  | 100        | 100            |
    And I wait for "2" seconds
    Then I softly see value "15.44" for title "Quantity" against the value "Calculation of Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Quantity |
      | Description                 | 11       |
    Then I softly see value "11.00" for title "Quantity" against the value "Calculation of Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I click on "Delete" icon for "Description" inside flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" without waiting for record
    And I wait for "3" seconds
    #NYSED-9539
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 12       |           | 50              | 100                  | 100        | 100            |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 12       | eee@@$    | 50              | 100                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 12       | -5        | 50              | 100                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Unit Cost cannot be negative. |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 12       | 5.55      | 50              | 100                  | 100        | 100            |
    And I wait for "2" seconds
    Then I softly see value "$555" for title "Unit Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Unit Cost |
      | Description                 | 5         |
    Then I softly see value "$5" for title "Unit Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9541 @NYSED-9543 @NYSED-9544 @NYSED-Sprint-33 @US-NYSED-7992 @M06
  Scenario Outline: Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Additional Cost' column (Editable, Optional, Currency Field up without decimal, cannot be negative and Blank for new row)
  |Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Calculated Proposed Expenditure' column is a formula field ((Quantity * Unit Cost) + Additional Cost) and not editable|
  |Verify that the Grantee user sees Supplies and Materials, Budget Categories modal, having a 'Proposed Expenditure' column (Editable, Required, Currency Field without decimals, cannot be negative and blank for new row)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9541 NYSED-9543
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 12       | 5         |                 | 100                  | 100        | 100            |
    And I wait for "2" seconds
    Then I softly see value "Description" for title "Description of Item/Service" against the value "Calculation of Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "Calculation of Cost" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "12.00" for title "Quantity" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$5" for title "Unit Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "" for title "Additional Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$60" for title "Calculated Proposed Expenditure" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Proposed Expenditure" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$300" for title "Total Project Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I click on "Delete" icon for "Description" inside flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" without waiting for record
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 12       | 5         | eee@@$          | 100                  | 100        | 100            |
    Then I softly see the text containing "Enter a valid numeric value."
    Then I softly see value "" for title "Additional Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I click on "Delete" icon for "Description" inside flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" without waiting for record
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 12       | 5         | -50             | 100                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Additional Cost cannot be negative. |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 12       | 5         | 55.24           | 100                  | 100        | 100            |
    And I wait for "2" seconds
    Then I softly see value "$5,524" for title "Additional Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$5,584" for title "Calculated Proposed Expenditure" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Additional Cost |
      | Description                 | 100             |
    Then I softly see value "$100" for title "Additional Cost" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    Then I softly see value "$160" for title "Calculated Proposed Expenditure" against the value "Description" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I click on "Delete" icon for "Description" inside flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" without waiting for record
    And I wait for "3" seconds
    #NYSED-9544
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 10       | 5         | 50              |                      | 100        | 100            |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 10       | 5         | 50              | eee@@$               | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 10       | 5         | 50              | -100                 | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | Calculation of Cost                                      | 10       | 5         | 50              | 55.55                | 100        | 100            |
    And I wait for "2" seconds
    Then I softly see value "$5,555" for title "Proposed Expenditure" against the value "Calculation of Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Proposed Expenditure |
      | Description                 | 100                  |
    Then I softly see value "$100" for title "Proposed Expenditure" against the value "Calculation of Cost" inside table "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |


  @NYSED-10260 @NYSED-10242 @NYSED-10238 @NYSED-10259 @NYSED-Sprint-35 @US-NYSED-9667 @M06
  Scenario Outline:Verify that on the Amendment Request in ‘Submitted to Grant Finance’ status, ‘Mark as Approved’ and "Submit for Approval" are not visible to the Non GF Staff Queue Users
  |Verify that on the Amendment Request in ‘Submitted to Grant Finance’ status, a new page-level action ‘Mark as Approved’ is added.|
  |Verify that on the Amendment Request layout when in ‘Submitted to Grant Finance’ status, Overview tab → Funding Change - Funding Accounts section, below mentioned actions are visible only to GF staff queue members|
  |Verify that on the Amendment Request layout, when in ‘Submitted to Grant Finance’ status, Overview tab → Funding Change - Funding Accounts section, the below-mentioned actions are not only for Non-GF staff queue members|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10SUPPLIESANDMATERIALS_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service     | Proposed Expenditure | Cash Match |
      | Supplies and Materials - Item 1 | 3000                 | 200        |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved By Program Office"
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #NYSED-10260
    Then I softly cannot see top right button "Mark as Approved" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    #NYSED-10259
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #NYSED-10260
    Then I softly cannot see top right button "Mark as Approved" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    #NYSED-10259
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #NYSED-10260
    Then I softly cannot see top right button "Mark as Approved" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    #NYSED-10259
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #NYSED-10242
    Then I softly can see top right button "Mark as Approved" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    #NYSED-10238
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    #NYSED-10242
    Then I softly can see top right button "Mark as Approved" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    #NYSED-10238
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    When I click on "Mark as Approved" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "This action will mark the amendment request as ‘Approved’. Are you sure want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    Then I softly see field "Status" as "Approved"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10243 @NYSED-Sprint-35 @US-NYSED-9667 @M06 @Bug-Ticket-NYSED-10342
  Scenario Outline:Verify that on the Amendment Request in ‘Submit for Approval’ status, a new page-level action ‘Mark as Approved’ is added.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10SUPPLIESANDMATERIALS_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentSuppliesAndMaterialsLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service     | Proposed Expenditure | Cash Match |
      | Supplies and Materials - Item 1 | 3000                 | 200        |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved By Program Office"
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    #NYSED-10243
    Then I softly can see top right button "Mark as Approved" in page detail
    When I click on "Mark as Approved" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "This action will mark the amendment request as ‘Approved’. Are you sure want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    Then I softly see field "Status" as "Approved"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-9864 @NYSED-9862 @NYSED-9869 @NYSED-10277 @NYSED-10255 @NYSED-Sprint-35 @US-NYSED-9662 @M06 @Bug-Ticket-NYSED-10342
  Scenario Outline:Verify that Internal Profile User see clicking 'Send to Grant Finance' button on Amendment moves the amendment to 'Sent to Grant Finance' status
  |Verify that Internal Profile User see 'Send to Grant Finance' button is visible when Amendment Classification field is set to 'Major' and status of amendment is 'Approved By Program Office’ state|
  |Verify that Internal Profile User (All GF Staff Queue Members) see a Task is created for all GF Staff queue members with below Task Type and Task Subject when status of amendment changed to 'Submitted to Grant Finance'|
  |Verify that Internal Profile User (Non GF Staff Queue Members) cannot see a Task is created when status of amendment changed to 'Submitted to Grant Finance'|
  |Verify that Internal Users see that a Fiscal Review Amendment Task is moved to the completed task section when one of the GF Staff queue member clicks on ‘Mark as Approved’ or ‘Submit for Approval’ action then the task for others should get closed.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary | Cash Match |
      | Professional Staff Salaries - Item 1 | 3000             | 200        |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved By Program Office"
    #NYSED-9864 #NYSED-9862
    Then I softly can see top right button "Send to Grant Finance" in page detail
    Then I softly see field "Amendment Classification" as "Major"
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---paymentRequest:-:pendingTaskTableId---" panel
    #NYSED-9869
    Then I softly see value "Fiscal Review Amendment" for title "Task Type" against the value "{SavedValue:FundingID}" inside table "---paymentRequest:-:pendingTaskTableId---"
    Then I softly see value "Fiscal Review Amendment #{SavedValue:FundingID} and Add Budget Splits" for title "Subject" against the value "{SavedValue:FundingID}" inside table "---paymentRequest:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---paymentRequest:-:pendingTaskTableId---" panel
    #NYSED-9869
    Then I softly see value "Fiscal Review Amendment" for title "Task Type" against the value "{SavedValue:FundingID}" inside table "---paymentRequest:-:pendingTaskTableId---"
    Then I softly see value "Fiscal Review Amendment #{SavedValue:FundingID} and Add Budget Splits" for title "Subject" against the value "{SavedValue:FundingID}" inside table "---paymentRequest:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---paymentRequest:-:pendingTaskTableId---" panel
    #NYSED-10277
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---paymentRequest:-:pendingTaskTableId---" panel
    #NYSED-10277
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---paymentRequest:-:pendingTaskTableId---" panel
    #NYSED-10277
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Mark as Approved" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---paymentRequest:-:pendingTaskTableId---" panel
    #NYSED-10255
    Then I softly do not see value "Fiscal Review Amendment" for title "Task Type" inside table "---paymentRequest:-:completedTaskTableId---"
    Then I softly do not see value "Fiscal Review Amendment #{SavedValue:FundingID} and Add Budget Splits" for title "Subject" inside table "---paymentRequest:-:completedTaskTableId---"
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---paymentRequest:-:completedTaskTableId---" panel
    #NYSED-10255
    Then I softly see value "Fiscal Review Amendment" for title "Task Type" against the value "{SavedValue:FundingID}" inside table "---paymentRequest:-:completedTaskTableId---"
    Then I softly see value "Fiscal Review Amendment #{SavedValue:FundingID} and Add Budget Splits" for title "Subject" against the value "{SavedValue:FundingID}" inside table "---paymentRequest:-:completedTaskTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---paymentRequest:-:pendingTaskTableId---" panel
    #NYSED-10255
    Then I softly do not see value "Fiscal Review Amendment" for title "Task Type" inside table "---paymentRequest:-:completedTaskTableId---"
    Then I softly do not see value "Fiscal Review Amendment #{SavedValue:FundingID} and Add Budget Splits" for title "Subject" inside table "---paymentRequest:-:completedTaskTableId---"
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---paymentRequest:-:completedTaskTableId---" panel
    #NYSED-10255
    Then I softly see value "Fiscal Review Amendment" for title "Task Type" against the value "{SavedValue:FundingID}" inside table "---paymentRequest:-:completedTaskTableId---"
    Then I softly see value "Fiscal Review Amendment #{SavedValue:FundingID} and Add Budget Splits" for title "Subject" against the value "{SavedValue:FundingID}" inside table "---paymentRequest:-:completedTaskTableId---"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-10244 @NYSED-10245 @NYSED-10247 @NYSED-10248 @NYSED-Sprint-35 @US-NYSED-9667 @M06
  Scenario Outline:Verify that when the user clicks on the ‘Submit for Approval’ button, and the Revised Obligation is not equal to the Revised Enc Life user, then the user should see validation
  |Verify that when the user clicks on the ‘Mark as Approved’ button, and the Revised Obligation is not equal to the Revised Enc Life user, then the user should see validation|
  |Verify that when the user clicks on the ‘Submit for Approval’ button, and the Revised Enc Life is zero for a newly associated funding account, i.e., ENC life is also null or zero, then the user should see validation|
  |Verify that when the user clicks on the ‘Mark as Approved’ button, and the Revised Enc Life is zero for a newly associated funding account, i.e., ENC life is also null or zero, then the user should see validation|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 3000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved By Program Office"
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 1000             |
    And I click on "Submit for Approval" in the page details
    #NYSED-10244
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Revised Obligation ($3000) must be equal to the total of Revised Enc. Life in the Funding Account ($1000.00) |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Mark as Approved" in the page details
    #NYSED-10245
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Revised Obligation ($3000) must be equal to the total of Revised Enc. Life in the Funding Account ($1000.00) |
    And I refresh the page
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I perform quick search for "{SavedValue:fundingAccount1}" in "---amendment:-:AmendmentFundingAccountTableId---" panel
    When I click "Add" after selection of "{SavedValue:fundingAccount1}" by showing entries "All" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I click modal button "Close"
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID      | Revised Enc Life |
      | {SavedValue:fundingAccount1} | 0                |
    And I click on "Submit for Approval" in the page details
    #NYSED-10247
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Funding Account {SavedValue:fundingAccount1} cannot be added because Revised Enc Life is zero. |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Mark as Approved" in the page details
    #NYSED-10248
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Funding Account {SavedValue:fundingAccount1} cannot be added because Revised Enc Life is zero. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10241 @NYSED-Sprint-35 @US-NYSED-9667 @M06
  Scenario Outline:Verify that the user should not be able to edit the Revised enc life below than the Payment split - Reimbursement is Release
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary | Cash Match |
      | Professional Staff Salaries - Item 1 | 3000             | 200        |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved By Program Office"
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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
    And I click on "Schedule Document Release" icon for "Entered" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter in modal value "50" into field "ReleaseDate__c"
    When I click modal button "Save"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Ready for Release"
    And I click on "Release Voucher" icon for "Ready for Release" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Released"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID                    | Revised Enc Life |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 111              |
    #NYSED-10241
    Then I softly see the following messages in the page details contains:
      | Revised Enc Life cannot be updated to a value less than the Expenditure Paid to Date amount for Funding Account {SavedValue:NewFundingAccountAbleToPayYes}. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10469 @NYSED-10465 @NYSED-10449 @NYSED-10450 @NYSED-Sprint-36 @US-NYSED-10296 @M06
  Scenario Outline:Verify system behavior when no approvers are added before 'Submit for PO Approval' in the 'Program Office Approvers' section
  |Verify that PM/PO users see New, Edit, and Remove buttons, on the Program Office Approvers section, when the Amendment Request is in the Submitted to Grantor state|
  |Verify that PM/PO users see the validation message 'You cannot specify the same user for multiple steps for Amendment Request' when the same user is added twice in the Program Office Approvers section|
  |Verify that PM/PO users see the validation message 'You cannot specify the same user for multiple steps for Amendment Request' when the same user is added twice in the Program Office Approvers section|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary | Cash Match |
      | Professional Staff Salaries - Item 1 | 3000             | 200        |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    #NYSED-10469
    Then I softly see the following messages in the page details contains:
      | Responsibilities Tab - At least one approver is required. |
    And I wait for "2" seconds
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    #NYSED-10465 #NYSED-10449 #NYSED-10450
    Then I softly can see top right button "New" in flex table with id "---amendment:-:POApproversTableId---"
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    Then I softly can see row level action button "Edit" against "{SavedValue:PM Username}" in flex table with id "---amendment:-:POApproversTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:PM Username}" in flex table with id "---amendment:-:POApproversTableId---"
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 2            |
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same user for multiple steps for Amendment Request. |
    And I refresh the page
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 1            |
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same step for multiple users for Amendment Request. |
    And I refresh the page
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 2            |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I edit the following rows inline in flex table with id "---amendment:-:POApproversTableId---" by clicking "Edit" :
      | Amendment Request | Name                      |
      | Step 2            | {SavedValue:EXE Username} |
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" against the value "Step 2" inside table "---amendment:-:POApproversTableId---"
    And I click on "Remove" icon for "{SavedValue:EXE Username}" inside flex table with id "---amendment:-:POApproversTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "{SavedValue:EXE Username}" for title "Name" inside table "---amendment:-:POApproversTableId---"

    Examples:
      | GrantName                                        | ExternalUser | GFStaffQueue | InternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   | FO           | PM           |

  @NYSED-10455 @NYSED-10460 @NYSED-Sprint-36 @US-NYSED-10296 @M06
  Scenario Outline: Verify that PM/PO users can add up to 4 approver steps in the Program Office Approvers section
  |Verify that PM/PO users can add up to 4 approver steps in the Fund Management Approvers section|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary | Cash Match |
      | Professional Staff Salaries - Item 1 | 3000             | 200        |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation FD | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PO | Step 4            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    #NYSED-10455
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    #NYSED-10455
    Then I softly see field "Status" as "Approved By Program Office"
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<GFStaffQueue>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID                    | Revised Enc Life |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation FD | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PO | Step 4            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    #NYSED-10460
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    #NYSED-10460
    Then I softly see field "Status" as "Approved"

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser | GFStaffQueue |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           | FO           |

  @NYSED-10521 @NYSED-10522 @NYSED-10524 @NYSED-10523 @NYSED-10525 @NYSED-10526 @NYSED-10527 @NYSED-10540 @NYSED-Sprint-36 @US-NYSED-9936 @M06
    @NYSED-10890 @NYSED-Sprint-29 @US-NYSED-10421 @M06
  Scenario Outline: Verify the task details when PM/PO user clicks on 'Submit for PO Approval' action
  |Verify the task details when the user clicks on the forward action, when the record is in the 'Submitted for PO Approval' state|
  |Verify the task details when the previous approver clicks on the approve action - Submitted for PO Approval State|
  |Verify the task detail once all approvers of the first approval flow approve the amendment, when the record is in the 'Submitted for PO Approval' state|
  |Verify the task details when the GF Staff queue member clicks on ‘Submit for Approval.’|
  |Verify the task details when the user clicks on the forward action, when the record is in the 'Submit for Approval' state|
  |Verify the task details when the previous approver clicks on the approve action - Submit for Approval State|
  |Verify the task is moving to the completed task table once the award is submitted to Grance finance, 'Task Type: Process Approved Amendment.'|
  |Verify the task is moving to the completed task table once the award is activated, 'Task Type: Process Approved Amendment.'|
  |Verify that the PM and PO users cannot see the page-level edit button when the amendment request is in the Approved by Program office, OR Submitted to Grant Finance state.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 3000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation FD | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 2            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10521
    Then I see the following rows under the following headers in table with id "---amendment:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                 | Subject                                                                                         | Due Date Only        | Status      |
      | Action menu | {SavedValue:FundingID} | Approve Amendment Request | Approve Amendment Request for Subaward #{SavedValue:awardName} for {SavedValue:SubrecipientOrg} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:PO Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10522
    Then I see the following rows under the following headers in table with id "---amendment:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                 | Subject                                                                                         | Due Date Only        | Status      |
      | Action menu | {SavedValue:FundingID} | Approve Amendment Request | Approve Amendment Request for Subaward #{SavedValue:awardName} for {SavedValue:SubrecipientOrg} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10524
    Then I see the following rows under the following headers in table with id "---amendment:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                 | Subject                                                                                         | Due Date Only        | Status      |
      | Action menu | {SavedValue:FundingID} | Approve Amendment Request | Approve Amendment Request for Subaward #{SavedValue:awardName} for {SavedValue:SubrecipientOrg} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved By Program Office"
    #NYSED-10890
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10523
    Then I see the following rows under the following headers in table with id "---amendment:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                  | Subject                                                                                                  | Due Date Only        | Status      |
      | Action menu | {SavedValue:FundingID} | Process Approved Amendment | Process Approved Amendment Request for Subaward #{SavedValue:awardName} for {SavedValue:SubrecipientOrg} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    #NYSED-10890
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10540
    Then I softly do not see value "Process Approved Amendment" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly do not see value "Process Approved Amendment Request for Subaward #{SavedValue:awardName} for {SavedValue:SubrecipientOrg}" for title "Subject" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---paymentRequest:-:completedTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:completedTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                  | Subject                                                                                                  | Due Date             | Status    |
      | Action menu | {SavedValue:FundingID} | Process Approved Amendment | Process Approved Amendment Request for Subaward #{SavedValue:awardName} for {SavedValue:SubrecipientOrg} | {Date:M/d/yyyy::d+7} | Completed |
    When I re-login to "As a Grantor" app as "<GFStaffQueue>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID                    | Revised Enc Life |
      | {SavedValue:NewFundingAccountAbleToPayYes} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 2            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10525
    Then I see the following rows under the following headers in table with id "---amendment:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                 | Subject                                                                                         | Due Date Only        | Status      |
      | Action menu | {SavedValue:FundingID} | Approve Amendment Request | Approve Amendment Request for Subaward #{SavedValue:awardName} for {SavedValue:SubrecipientOrg} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:PO Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10526
    Then I see the following rows under the following headers in table with id "---amendment:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                 | Subject                                                                                         | Due Date Only        | Status      |
      | Action menu | {SavedValue:FundingID} | Approve Amendment Request | Approve Amendment Request for Subaward #{SavedValue:awardName} for {SavedValue:SubrecipientOrg} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10527
    Then I see the following rows under the following headers in table with id "---amendment:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                 | Subject                                                                                         | Due Date Only        | Status      |
      | Action menu | {SavedValue:FundingID} | Approve Amendment Request | Approve Amendment Request for Subaward #{SavedValue:awardName} for {SavedValue:SubrecipientOrg} | {Date:M/d/yyyy::d+7} | Not Started |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser | GFStaffQueue |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           | FO           |

  @NYSED-10556 @NYSED-10557 @NYSED-10560 @NYSED-10561 @NYSED-10564 @NYSED-Sprint-36 @US-NYSED-9198 @M06
  Scenario Outline:Verify task details for the Subrecipient Submit and Certify role users when an amended Subaward is in ‘Sent to Subrecipient after Approval’ status
  |Verify task details are not received by roles other than the Submit and Certify role when the GF staff queue member clicks on ‘Send to Subrecipient’ in ‘Pending Activation’ status on the Subaward layout|
  |Verify that on the Subaward layout, when it is in ‘Sent to Subrecipient after Approval’ status, page-level buttons ‘Accept after Approval’ and ‘Reject’ are added and visible to Submit and Certify users|
  |Verify that on the Subaward layout, when it is in ‘Sent to Subrecipient after Approval’ status, page-level buttons ‘Accept after Approval’ and ‘Reject’ are not visible to users other than Submit and Certify users|
  |Verify rejection of the Subaward when it is in ‘Sent to Subrecipient after Approval’ status|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary | Cash Match |
      | Professional Staff Salaries - Item 1 | 3000             | 200        |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Amendment Classification" as "Major"
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Pending Activation"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Generate GAN using 'Generate GAN' button before sending subaward to subrecipient for final acceptance. |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Generate GAN" in the page details
    And I wait for "4" seconds
    Then I softly see the text containing "The request for generating the Grant Award Notice has been submitted. Once the document is generated, it will be added to the Subaward Files section under the Files tab. Please refresh the page."
    And I refresh the page
    And I wait for "3" seconds
    And I navigate to "Files" sub tab
    Then I softly see value "Grant Award Notice" for title "Classification" inside table "---subAwardStandAlone:-:addFilesTableId---"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I save the field labeled "EGMS ID" as "AwardId"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10557
    Then I softly do not see value "Review Subaward and Accept GAN" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly do not see value "Review Subaward #{SavedValue:AwardId} and GAN" for title "Subject" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-10561
    Then I softly cannot see top right button "Accept after Approval" in page detail
    Then I softly cannot see top right button "Reject" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10557
    Then I softly do not see value "Review Subaward and Accept GAN" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly do not see value "Review Subaward #{SavedValue:AwardId} and GAN" for title "Subject" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-10561
    Then I softly cannot see top right button "Accept after Approval" in page detail
    Then I softly cannot see top right button "Reject" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10557
    Then I softly do not see value "Review Subaward and Accept GAN" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly do not see value "Review Subaward #{SavedValue:AwardId} and GAN" for title "Subject" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-10561
    Then I softly cannot see top right button "Accept after Approval" in page detail
    Then I softly cannot see top right button "Reject" in page detail
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10556
    Then I see the following rows under the following headers in table with id "---amendment:-:pendingTaskTableId---" :
      | Actions     | EGMS ID              | Task Type                      | Subject                                       | Due Date Only        | Status      |
      | Action menu | {SavedValue:AwardId} | Review Subaward and Accept GAN | Review Subaward #{SavedValue:AwardId} and GAN | {Date:M/d/yyyy::d+2} | Not Started |
    When I click on "Start" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-10560
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    Then I softly can see top right button "Accept after Approval" in page detail
    Then I softly can see top right button "Reject" in page detail
    When I click on "Accept after Approval" in the page details without processing
    Then I softly see confirmation box with body "This action will activate the new version of subaward. Are you sure you want to proceed?" is displayed
    When I click alert button "Cancel"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I wait for "4" seconds
    When I click on "Reject" in the page details without processing
    #NYSED-10564
    Then I softly see confirmation box with body "Are you sure you want to reject this subaward? The grantor will be notified of the rejection." is displayed
    When I click alert button "Cancel"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I click on "Reject" in the page details without processing
    When I click alert button "OK"
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Rejected"
    And I save the field labeled "Grant ID" as "GrantID"
    And I navigate to "Grants" tab
    When I perform quick search for "{SavedValue:GrantID}" in "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantID}" inside flex table with id "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-10562 @NYSED-10563 @NYSED-Sprint-36 @US-NYSED-9198 @M06
  Scenario Outline:Verify that once Submit and Certify users activate the award, the Final Entry Date field captures the activation date
  |Verify that once Submit and Certify users activate the award, the Final Entry Date field captures the activation date|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary | Cash Match |
      | Professional Staff Salaries - Item 1 | 3000             | 200        |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Amendment Classification" as "Major"
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    And I click on "Generate GAN" in the page details
    And I wait for "4" seconds
    Then I softly see the text containing "The request for generating the Grant Award Notice has been submitted. Once the document is generated, it will be added to the Subaward Files section under the Files tab. Please refresh the page."
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I save the field labeled "EGMS ID" as "AwardId"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Accept after Approval" in the page details without processing
    When I click alert button "OK"
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    Given I navigate to "Overview" sub tab
    #NYSED-10562
    Then I softly see field "Version Number" as "2"
    Then I softly see field "Final Entry Date" as "{Date:M/d/uuuu}"
    And I save the field labeled "EGMS ID" as "AwardId"
    And I save the field labeled "Grant ID" as "GrantID"
    And I navigate to "Grants" tab
    When I perform quick search for "{SavedValue:GrantID}" in "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantID}" inside flex table with id "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Subawards" sub tab
    #NYSED-10563
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:awardName}" inside table "---amendment:-:recipientAwardsTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardId}" inside table "---amendment:-:recipientAwardsTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I perform quick search for "{SavedValue:GrantID}" in "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantID}" inside flex table with id "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Subawards" sub tab
    #NYSED-10563
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:awardName}" inside table "---amendment:-:recipientAwardsTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardId}" inside table "---amendment:-:recipientAwardsTableId---"
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    #NYSED-10562
    Then I softly see field "Version Number" as "2"
    Then I softly see field "Final Entry Date" as "{Date:M/d/uuuu}"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I perform quick search for "{SavedValue:GrantID}" in "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantID}" inside flex table with id "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Subawards" sub tab
    #NYSED-10563
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:awardName}" inside table "---amendment:-:recipientAwardsTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardId}" inside table "---amendment:-:recipientAwardsTableId---"
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    #NYSED-10562
    Then I softly see field "Version Number" as "2"
    Then I softly see field "Final Entry Date" as "{Date:M/d/uuuu}"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I perform quick search for "{SavedValue:GrantID}" in "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantID}" inside flex table with id "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Subawards" sub tab
    #NYSED-10563
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:awardName}" inside table "---amendment:-:recipientAwardsTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardId}" inside table "---amendment:-:recipientAwardsTableId---"
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    #NYSED-10562
    Then I softly see field "Version Number" as "2"
    Then I softly see field "Final Entry Date" as "{Date:M/d/uuuu}"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:GrantID}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantID}" inside flex table with id "---paymentRequest:-:grantorGrantsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Subawards" sub tab
        #NYSED-10563
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:awardName}" inside table "---amendment:-:internalRelatedAwards1---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardId}" inside table "---amendment:-:internalRelatedAwards1---"
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:internalRelatedAwards1---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    #NYSED-10562
    Then I softly see field "Version Number" as "2"
    Then I softly see field "Final Entry Date" as "{Date:M/d/uuuu}"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:GrantID}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantID}" inside flex table with id "---paymentRequest:-:grantorGrantsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Subawards" sub tab
        #NYSED-10563
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:awardName}" inside table "---amendment:-:internalRelatedAwards1---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardId}" inside table "---amendment:-:internalRelatedAwards1---"
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:internalRelatedAwards1---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    #NYSED-10562
    Then I softly see field "Version Number" as "2"
    Then I softly see field "Final Entry Date" as "{Date:M/d/uuuu}"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:GrantID}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantID}" inside flex table with id "---paymentRequest:-:grantorGrantsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Subawards" sub tab
        #NYSED-10563
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:awardName}" inside table "---amendment:-:internalRelatedAwards1---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardId}" inside table "---amendment:-:internalRelatedAwards1---"
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:internalRelatedAwards1---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    #NYSED-10562
    Then I softly see field "Version Number" as "2"
    Then I softly see field "Final Entry Date" as "{Date:M/d/uuuu}"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:GrantID}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantID}" inside flex table with id "---paymentRequest:-:grantorGrantsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Subawards" sub tab
        #NYSED-10563
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:awardName}" inside table "---amendment:-:internalRelatedAwards1---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardId}" inside table "---amendment:-:internalRelatedAwards1---"
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:internalRelatedAwards1---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    #NYSED-10562
    Then I softly see field "Version Number" as "2"
    Then I softly see field "Final Entry Date" as "{Date:M/d/uuuu}"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:GrantID}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantID}" inside flex table with id "---paymentRequest:-:grantorGrantsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Subawards" sub tab
        #NYSED-10563
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:awardName}" inside table "---amendment:-:internalRelatedAwards1---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardId}" inside table "---amendment:-:internalRelatedAwards1---"
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:internalRelatedAwards1---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    #NYSED-10562
    Then I softly see field "Version Number" as "2"
    Then I softly see field "Final Entry Date" as "{Date:M/d/uuuu}"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-10547 @NYSED-10546 @NYSED-10548 @NYSED-Sprint-36 @US-NYSED-9935 @M06
    @NYSED-10569-DG @NYSED-Sprint-36 @US-NYSED-9592 @M06
  Scenario Outline:Verify task details are not received by roles other than the Submit and Certify role when the GF staff queue member clicks on ‘Send to Subrecipient’ in ‘Pending Activation’ status on the Subaward layout
  |Verify task details are received by the Submit and Certify role when the GF staff queue member clicks on ‘Send to Subrecipient’ in ‘Pending Activation’ status on the Subaward layout|
  |Verify that the 'Review Subaward and Accept GAN' task moves to the Completed Task section when the Submit and Certify user clicks on the ‘Accept after Approval’ action on the Subaward layout.|
  |Verify that the Internal user cannot see the warning message on the amendment request layout where the ‘Contractual?’ is set to No on the related grant when the amendment is in progress.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 3000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Amendment Classification" as "Major"
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    And I click on "Generate GAN" in the page details
    And I wait for "4" seconds
    Then I softly see the text containing "The request for generating the Grant Award Notice has been submitted. Once the document is generated, it will be added to the Subaward Files section under the Files tab. Please refresh the page."
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I save the field labeled "EGMS ID" as "AwardId"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10547
    Then I softly do not see value "Review Subaward and Accept GAN" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly do not see value "Review Subaward #{SavedValue:AwardId} and GAN" for title "Subject" inside table "---amendment:-:pendingTaskTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10547
    Then I softly do not see value "Review Subaward and Accept GAN" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly do not see value "Review Subaward #{SavedValue:AwardId} and GAN" for title "Subject" inside table "---amendment:-:pendingTaskTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10547
    Then I softly do not see value "Review Subaward and Accept GAN" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly do not see value "Review Subaward #{SavedValue:AwardId} and GAN" for title "Subject" inside table "---amendment:-:pendingTaskTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10546
    Then I see the following rows under the following headers in table with id "---amendment:-:pendingTaskTableId---" :
      | Actions     | EGMS ID              | Task Type                      | Subject                                       | Due Date Only        | Status      |
      | Action menu | {SavedValue:AwardId} | Review Subaward and Accept GAN | Review Subaward #{SavedValue:AwardId} and GAN | {Date:M/d/yyyy::d+2} | Not Started |
    When I click on "Start" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Accept after Approval" in the page details without processing
    When I click alert button "OK"
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-10548
    Then I softly do not see value "Review Subaward and Accept GAN" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly do not see value "Review Subaward #{SavedValue:AwardId} and GAN" for title "Subject" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---subAwardStandAlone:-:completeTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:completeTaskTableId---" :
      | Actions     | EGMS ID              | Task Type                      | Subject                                       | Due Date             | Completed Date  | Status    |
      | Action menu | {SavedValue:AwardId} | Review Subaward and Accept GAN | Review Subaward #{SavedValue:AwardId} and GAN | {Date:M/d/yyyy::d+2} | {Date:M/d/uuuu} | Completed |
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |

    Examples:
      | GrantName                                                 | ExternalUser | GFStaffQueue |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | FO           |

  @NYSED-10568 @NYSED-Sprint-36 @US-NYSED-9592 @M06
  Scenario Outline:Verify that the Internal user can see the Warning message on the Amendment Request layout where the ‘Contractual?’ is set to Yes on related Grant. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "CONTRACTUAL_YES"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    #NYSED-10568
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    #NYSED-10568
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 3000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-10568
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    #NYSED-10568
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Amendment Classification" as "Major"
    Then I softly see field "Status" as "Approved by Program Office"
    #NYSED-10568
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    #NYSED-10568
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    #NYSED-10568
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    And I refresh the page
    And I wait for "5" seconds
    #NYSED-10568
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    And I click on "Generate GAN" in the page details
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I save the field labeled "EGMS ID" as "AwardId"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Accept after Approval" in the page details without processing
    When I click alert button "OK"
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10567 @NYSED-Sprint-36 @US-NYSED-9592 @M06
  Scenario Outline:Verify that the Internal user can see the Warning message on the Amendment Request layout where the ‘Contractual?’ is set to Yes on related Grant. - Award via FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}" with properties "FDM_GRANT_CONTRACTUAL_YES"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Grant}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    #NYSED-10567
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    #NYSED-10567
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 3000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
     #NYSED-10567
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    #NYSED-10567
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Amendment Classification" as "Major"
    Then I softly see field "Status" as "Approved by Program Office"
    #NYSED-10567
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    #NYSED-10567
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    #NYSED-10567
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    And I refresh the page
    And I wait for "5" seconds
    #NYSED-10567
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    And I click on "Generate GAN" in the page details
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I save the field labeled "EGMS ID" as "AwardId"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Accept after Approval" in the page details without processing
    When I click alert button "OK"
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-10649 @NYSED-10648 @NYSED-10652 @NYSED-10653 @NYSED-10654 @NYSED-10655 @NYSED-10656 @NYSED-Sprint-36 @US-NYSED-9609 @M06
  Scenario Outline:Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new amendment when another amendment is in the Approved by Program Office state on the Subaward → Management tab → Amendment Request section
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new amendment when another amendment is in the Submitted for PO Approval state on the Subaward → Management tab → Amendment Request section|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new amendment when another amendment is in the Submitted to Grant Finance state on the Subaward Major Type|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new amendment when another amendment is in the Submitted for Approval state on the Subaward → Management tab → Amendment Request section - Major Type|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new amendment when another amendment is in the Approved state on the Subaward → Management tab → Amendment Request section - Major Type|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new amendment when another amendment is in the Pending Activation state on the Subaward → Management tab → Amendment Request section - Major Type|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles can create a new amendment when another amendment is in the Active state on the Subaward - Major Type|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 3000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
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
    #NYSED-10648
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:FundingID} is already in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Amendment Classification" as "Major"
    Then I softly see field "Status" as "Approved by Program Office"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    #NYSED-10649
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:FundingID} is already in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    #NYSED-10652
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:FundingID} is already in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    #NYSED-10653
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:FundingID} is already in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    #NYSED-10654
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:FundingID} is already in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Pending Activation"
    And I save the field labeled "EGMS ID" as "AWARDID2"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    #NYSED-10655
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:FundingID} is already in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARDID2}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARDID2}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Generate GAN" in the page details
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I save the field labeled "EGMS ID" as "AwardId"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Accept after Approval" in the page details without processing
    When I click alert button "OK"
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    Given I navigate to "Overview" sub tab
    Then I softly see field "Version Number" as "2"
    And I click on hyperlink containing value "{SavedValue:AwardId}"
    And I wait for "2" seconds
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-10656
    Then I softly cannot see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:FundingID} is already in progress. |
    And I wait for "2" seconds
    And I click on "Save" in the page details
    #NYSED-10656
    Then I softly see field "Amendment Type(s)" as "Budget Redirection"

    Examples:
      | GrantName                                 | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_CE   |

  @NYSED-10633 @NYSED-10673 @NYSED-10681 @NYSED-10680 @NYSED-10678 @NYSED-10677 @NYSED-10682 @NYSED-Sprint-36 @US-NYSED-9609 @M06
    @NYSED-10569-FDM @NYSED-Sprint-36 @US-NYSED-9592 @M06
  Scenario Outline:Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new amendment when another Grantor-initiated amendment is in the create state on the Subaward → Management tab → Amendment Request section
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new reimbursement when another amendment is in the Submitted to Grant Finance state on the Subaward Major Type|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new amendment when another amendment is in the Pending Activation state on the Subaward - Major Type|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new reimbursement when another amendment is in the Approved state on the Subaward - Major Type|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new reimbursement when an amendment is in the Submitted for Approval state on the Subaward - Major Type|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new reimbursement when another amendment is in the Submitted to Grant Finance state on the Subaward Major Type|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    #NYSED-10633
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:FundingID} is already in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 3000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I softly see the following messages in the page details contains:
      | Reimbursement Payment Request cannot be created while Amendment Request {SavedValue:FundingID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Amendment Classification" as "Major"
    Then I softly see field "Status" as "Approved by Program Office"
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I softly see the following messages in the page details contains:
      | Reimbursement Payment Request cannot be created while Amendment Request {SavedValue:FundingID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-10673 #NYSED-10677
    Then I softly see the following messages in the page details contains:
      | Reimbursement Payment Request cannot be created while Amendment Request {SavedValue:FundingID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-10678
    Then I softly see the following messages in the page details contains:
      | Reimbursement Payment Request cannot be created while Amendment Request {SavedValue:FundingID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-10680
    Then I softly see the following messages in the page details contains:
      | Reimbursement Payment Request cannot be created while Amendment Request {SavedValue:FundingID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Pending Activation"
    And I save the field labeled "EGMS ID" as "AWARDID2"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-10681
    Then I softly see the following messages in the page details contains:
      | Reimbursement Payment Request cannot be created while Amendment Request {SavedValue:FundingID} is in progress. |
    And I refresh the page
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:AWARDID2}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARDID2}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Generate GAN" in the page details
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I save the field labeled "EGMS ID" as "AwardId"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Accept after Approval" in the page details without processing
    When I click alert button "OK"
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    Given I navigate to "Overview" sub tab
    Then I softly see field "Version Number" as "2"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-10569
    Then I softly cannot see the following messages in the page details contains:
      | This Amendment Request belongs to the Contractual Grants. |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:AwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-10682
    Then I softly cannot see the following messages in the page details contains:
      | Reimbursement Payment Request cannot be created while Amendment Request {SavedValue:FundingID} is in progress. |
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
      | GrantName                                 | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_CE   |

  @NYSED-10684 @NYSED-Sprint-36 @US-NYSED-9609 @M06
  Scenario Outline:Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new amendment when FS-10F is in released state on the Subaward →
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
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
    When I navigate to "Financials" sub tab
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Subaward" as "AWARD_EGMSID"
    And I save the field labeled "EGMS ID" as "ReimbursementID"
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" without waiting for record
    When I enter the following values into flex table with id "---paymentRequest:-:PRProfessionalSalariesLineItemsTableId---" by clicking "New" :
      | Name of Staff Member | Specific Position/Title | FTE | Annualized Rate of Pay | Beginning and End Dates Worked | Additional Cost (e.g., Per Diem, Teacher Stipends) | Salary |
      | Name of Staff        | Position Title          | 12  | 100                    | Beginning                      | 100                                                | 126    |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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
    And I click on "Schedule Document Release" icon for "Entered" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    When I enter in modal value "50" into field "ReleaseDate__c"
    When I click modal button "Save"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Ready for Release"
    And I click on "Release Voucher" icon for "Ready for Release" inside flex table with id "---paymentRequest:-:DocumentHistoryTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see field "Status" as "Released"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    #NYSED-10684
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as FS-10F {SavedValue:ReimbursementID} has been submitted for this subaward. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10674 @NYSED-10657 @NYSED-10683 @NYSED-10647 @NYSED-Sprint-36 @US-NYSED-9592 @M06 @Bug-Ticket-NYSED-10728
    @NYSED-11030 @NYSED-Sprint-29 @US-NYSED-10421 @M06
  Scenario Outline:Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new reimbursement when another amendment is in the send to subrecipient state on the Subaward Major Type
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new reimbursement when another amendment is in the send to subrecipeint after approval state on the Subaward →|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new reimbursement when another Grantor-initiated amendment is in the Send to subrecipient state on the Subaward →|
  |Verify that the Subrecipient user with the Create and Edit and Submit and Certify roles cannot create a new amendment when another amendment is in the send to subrecipient state on the Subaward → Management tab → Amendment Request section|
  |Verify that the Internal User can see that the fields below are removed from the Funding Change amendment.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    #NYSED-11030
    Then I softly cannot see field "Justification for Funding Change" inside page block
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 3000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved by Program Office"
    And I wait for "2" seconds
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Pending Activation"
    And I save the field labeled "EGMS ID" as "AWARDID2"
    And I wait for "2" seconds
    And I click on "Generate GAN" in the page details
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #NYSED-10674
    Then I softly see the following messages in the page details contains:
      | Reimbursement Payment Request cannot be created while Amendment Request {SavedValue:FundingID} is in progress. |
    And I refresh the page
    And I wait for "3" seconds
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    #NYSED-10657
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:FundingID} is already in progress. |

    Examples:
      | GrantName                                 | ExternalUser |
      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Grant} | GRANTEE_CE   |